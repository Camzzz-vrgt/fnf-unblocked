#pragma header

uniform float iTime;
uniform float camScrollX;
uniform float camScrollY;
uniform float camZoom;
uniform float intensity;
uniform float stripStrength;
uniform float depthStrength;

mat2 rot(float a)
{
    float s = sin(a);
    float c = cos(a);
    return mat2(c, -s, s, c);
}

float hash12(vec2 p)
{
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
}

float hash13(vec3 p)
{
    return fract(sin(dot(p, vec3(127.1, 311.7, 74.7))) * 43758.5453123);
}

float noise(vec2 p)
{
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);

    float a = hash12(i);
    float b = hash12(i + vec2(1.0, 0.0));
    float c = hash12(i + vec2(0.0, 1.0));
    float d = hash12(i + vec2(1.0, 1.0));

    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

float sdBox(vec3 p, vec3 b)
{
    vec3 d = abs(p) - b;
    return length(max(d, 0.0)) + min(max(d.x, max(d.y, d.z)), 0.0);
}

float mapScene(vec3 p)
{
    p.xz *= rot(iTime * 0.05 + camScrollX * 0.00002);
    p.yz *= rot(sin(iTime * 0.03) * 0.12 + camScrollY * 0.00002);

    p.x += sin(p.z * 0.22 + iTime * 0.25) * 0.10;
    p.y += cos(p.z * 0.18 - iTime * 0.18) * 0.06;

    vec3 cell = floor((p + 1.0) / 2.0);
    vec3 q = mod(p + 1.0, 2.0) - 1.0;

    float rnd = hash13(cell);

    q.xy *= rot((rnd - 0.5) * 0.7 + sin(iTime * 0.2 + rnd * 6.2831) * 0.06);
    q.xz *= rot((rnd - 0.5) * 0.25);

    vec3 boxSize = vec3(
        mix(0.10, 0.24, rnd),
        mix(0.03, 0.10, rnd),
        mix(0.10, 0.22, rnd)
    );

    float box = sdBox(q, boxSize);

    float slab = abs(q.y) - mix(0.10, 0.18, rnd);
    return min(box, slab);
}

float brokenStrips(vec2 uv)
{
    float rows = 34.0;
    float y = uv.y * rows + iTime * 0.35 + camScrollY * 0.004;
    float rowId = floor(y);
    float fy = fract(y);

    float line = 1.0 - smoothstep(0.0, 0.18, abs(fy - 0.5));

    float segSeed = noise(vec2(rowId * 0.17, floor(uv.x * 18.0 + camScrollX * 0.01)));
    float gapSeed = noise(vec2(floor(uv.x * 9.0 + camScrollX * 0.01), rowId * 0.31));

    float seg = step(0.28, segSeed);
    float gap = smoothstep(0.18, 0.85, gapSeed);

    float jitter = (noise(vec2(rowId, uv.x * 12.0 + iTime * 0.15)) - 0.5) * 0.03;
    line *= seg * gap;
    line *= 1.0 - smoothstep(0.12, 0.18, abs(fy - 0.5 + jitter));

    return line;
}

void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec2 p = uv * 2.0 - 1.0;
    p.x *= openfl_TextureSize.x / openfl_TextureSize.y;

    float camX = camScrollX * 0.00035;
    float camY = camScrollY * 0.00035;
    float zoom = max(camZoom, 0.001);

    vec3 ro = vec3(camX, -camY * 0.6, -4.2 + sin(iTime * 0.25) * 0.08);
    vec3 rd = normalize(vec3(p.x, p.y * 0.92, 1.6 / zoom));

    ro.xz *= rot(sin(iTime * 0.08) * 0.08);
    rd.xz *= rot(sin(iTime * 0.08) * 0.08);

    float density = 0.0;
    float edge = 0.0;
    float t = 0.0;

    for (int i = 0; i < 44; i++)
    {
        vec3 pos = ro + rd * t;
        float d = mapScene(pos);

        density += exp(-abs(d) * 34.0) * exp(-t * 0.16);
        edge += (1.0 - smoothstep(0.0, 0.03, abs(d))) * exp(-t * 0.12);

        t += clamp(abs(d) * 0.75, 0.03, 0.16);
    }

    float strip = brokenStrips(uv);

    vec2 vp = vec2(0.0, -0.18);
    vec2 d = p - vp;
    float perspective = 1.0 / (1.0 + max(d.y, -0.85) * 0.9);
    vec2 gridUV = vec2(d.x * perspective, d.y * perspective * 0.7);

    float gridX = 1.0 - smoothstep(0.0, 0.02, abs(fract(gridUV.x * 8.0 + camX * 1.4) - 0.5));
    float gridY = 1.0 - smoothstep(0.0, 0.02, abs(fract(gridUV.y * 8.0 + camY * 1.2) - 0.5));
    float grid = gridX * gridY * 0.4;

    vec4 src = flixel_texture2D(bitmap, uv);

    vec3 base = vec3(0.985, 0.992, 1.0);

    float vignette = 1.0 - dot(uv - 0.5, uv - 0.5) * 0.18;
    vignette = clamp(vignette, 0.92, 1.0);

    vec3 glow = vec3(0.86, 0.93, 1.0) * density * 0.020 * depthStrength;
    vec3 lines = vec3(0.75, 0.86, 1.0) * (strip * 0.030 + grid * 0.020) * stripStrength;
    vec3 contour = vec3(0.55, 0.66, 0.82) * edge * 0.010 * depthStrength;

    base = mix(base, src.rgb, 0.03);
    base += glow;
    base += lines;
    base -= contour;

    float grain = (noise(uv * vec2(220.0, 140.0) + iTime * 0.2) - 0.5) * 0.010 * intensity;
    base += grain;

    base *= vignette;

    base = clamp(base, 0.0, 1.0);
    gl_FragColor = vec4(base, 1.0);
}
