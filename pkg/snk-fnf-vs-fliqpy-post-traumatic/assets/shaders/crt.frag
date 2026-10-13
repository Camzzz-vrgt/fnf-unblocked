uniform float iCRT;

float crt_hash(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

vec2 crt_barrel(vec2 uv, float strength) {
    vec2 c = uv - 0.5;
    float r2 = dot(c, c);
    c *= 1.0 + strength * r2 * 2.2;
    return c + 0.5;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = openfl_TextureCoordv;

    vec2 warpUV = mix(uv, crt_barrel(uv, 0.18), iCRT);

    vec2  edge    = abs(warpUV - 0.5);
    float outside = step(0.5, max(edge.x, edge.y));

    float aberration = 0.006 * iCRT;
    vec2  aberDir    = normalize(warpUV - 0.5) * aberration;

    float r = flixel_texture2D(iChannel0, warpUV + aberDir).r;
    float g = flixel_texture2D(iChannel0, warpUV).g;
    float b = flixel_texture2D(iChannel0, warpUV - aberDir).b;
    float a = flixel_texture2D(iChannel0, warpUV).a;
    vec3  col = vec3(r, g, b);

    float scanLine = sin(warpUV.y * 240.0 * 3.14159) * 0.5 + 0.5;
    float scanMult = mix(1.0, 0.72 + scanLine * 0.28, iCRT);
    col *= scanMult;

    float noise = crt_hash(warpUV + fract(iTime * 37.0));
    col = mix(col, col + (noise - 0.5) * 0.12, iCRT * 0.6);

    float vig = 1.0 - dot(warpUV - 0.5, warpUV - 0.5) * 2.2;
    vig  = clamp(vig, 0.0, 1.0);
    col *= mix(1.0, vig, iCRT * 0.85);

    col *= (1.0 - outside);

    fragColor = vec4(col, a);
}