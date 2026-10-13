#pragma header

uniform float iTime;
uniform float iFireflyCount;
uniform float iFarFireflyCount;
uniform float uFireflySize;
uniform float uGlowRange;

#define MAX_FIREFLIES 24.0
#define MAX_FAR_FIREFLIES 24.0

const vec3 warmColor = vec3(0.9255, 0.7137, 0.5137);
const vec3 coolColor = vec3(0.9137, 0.9020, 0.6667);

float N21(vec2 p)
{
    vec3 a = fract(vec3(p.xyx) * vec3(213.897, 653.453, 253.098));
    a += dot(a, a.yzx + 79.76);
    return fract((a.x + a.y) * a.z);
}

vec2 N22(vec2 p)
{
    float n = N21(p);
    return vec2(n, N21(n + p));
}

float glowFalloffSq(float d2)
{
    float r2 = uGlowRange * uGlowRange;
    if (d2 >= r2) return 0.0;
    float glow = uFireflySize * inversesqrt(max(d2, 0.00001));
    float t = d2 / r2;
    return min(glow * (1.0 - t * t), 1.0);
}

void main()
{
    vec2 uv = openfl_TextureCoordv * 2.0 - 1.0;
    float intensity = 0.0;
    float alpha = 0.0;

    for (float i = 0.0; i < MAX_FIREFLIES; i++)
    {
        if (i >= iFireflyCount) break;
        vec2 rnd = N22(vec2(i, i * 2.0));
        float angle = iTime * rnd.x + i;
        vec2 rndMod = N22(vec2(i + 0.5, i * 3.0 + 0.1));
        float radius = 2.0 * (0.1 + 0.9 * rndMod.x * rndMod.x);
        vec2 center = 0.1 * vec2(sin(iTime * 0.4 + i), cos(iTime * 0.4 + i * 1.7));
        vec2 diff = uv - (vec2(cos(angle) * radius, sin(angle)) + center);
        float glow = glowFalloffSq(dot(diff, diff));
        glow *= 0.35 + 0.65 * (0.5 + 0.5 * sin(angle * 1.35));
        intensity += glow;
        alpha += glow;
    }

    for (float i = 0.0; i < MAX_FAR_FIREFLIES; i++)
    {
        if (i >= iFarFireflyCount) break;
        float idx = i + 60.0;
        vec2 rnd = N22(vec2(idx, idx + 2.0));
        float angle = iTime * rnd.x + idx;
        vec2 rndMod = N22(vec2(idx + 0.5, idx * 3.0 + 0.1));
        float radius = 1.5 * (0.1 + 0.9 * rndMod.x * rndMod.x);
        vec2 center = 0.08 * vec2(cos(iTime * 0.35 + idx), sin(iTime * 0.35 + idx * 1.4));
        vec2 diff = uv - (vec2(cos(angle) * radius, sin(angle)) + center);
        float glow = glowFalloffSq(dot(diff, diff));
        glow *= 0.25 + 0.55 * (0.5 + 0.5 * sin(angle * 1.15));
        intensity += glow;
        alpha += glow;
    }

    alpha = clamp(alpha, 0.0, 1.0);
    gl_FragColor = vec4(mix(coolColor, warmColor, alpha) * intensity, alpha);
}
