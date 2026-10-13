#pragma header
// https://www.shadertoy.com/view/ddcyWj
#define iResolution vec3(openfl_TextureSize, 0.)
#define iChannel0 bitmap
#define texture flixel_texture2D

uniform float u_Quality;
uniform float u_Strength;

void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec2 pixel = uv * iResolution.xy;
    vec2 texel = 1.0 / iResolution.xy;

    // block
    vec2 local = mod(pixel, 8.0);
    vec2 block = floor(pixel / 8.0) * 8.0;

    // pixel pos
    vec2 p = local / 8.0;
    vec2 base = (block + 0.5) / iResolution.xy;
    vec3 center = texture(iChannel0, base).rgb;

    vec3 left = texture(iChannel0,base - vec2(3.0, 0.0) * texel).rgb;
    vec3 right = texture(iChannel0,base + vec2(3.0, 0.0) * texel).rgb;
    vec3 up = texture(iChannel0,base - vec2(0.0, 3.0) * texel).rgb;
    vec3 down = texture(iChannel0,base + vec2(0.0, 3.0) * texel).rgb;

    vec3 low = center * 0.40 + (left + right + up + down) * 0.15;

    float Y = 0.25 * low.r + 0.50 * low.g + 0.25 * low.b;
    float Co = 0.50 * low.r - 0.50 * low.b;
    float Cg = -0.25 * low.r + 0.50 * low.g - 0.25 * low.b;

    float q = max(u_Quality, 0.001);

    Y = floor(Y / q + 0.5) * q;

    float cq = q * 1.75;

    Co = floor(Co / cq + 0.5) * cq;
    Cg = floor(Cg / cq + 0.5) * cq;

    vec3 original = texture(iChannel0, uv).rgb;

    vec3 originalYC = vec3(0.25 * original.r + 0.50 * original.g + 0.25 * original.b, 0.50 * original.r - 0.50 * original.b, -0.25 * original.r + 0.50 * original.g - 0.25 * original.b);
    float detail = originalYC.x - Y;

    float detailAmount = clamp(1.0 - q * 12.0, 0.0, 1.0);

    Y += detail * detailAmount;

    vec3 compressed;

    compressed.r = Y + Co - Cg;
    compressed.g = Y + Cg;
    compressed.b = Y - Co - Cg;

    float bx = min(local.x, 7.0 - local.x);
    float by = min(local.y, 7.0 - local.y);

    float edge = 1.0 - smoothstep(0.0, 1.25, min(bx, by));

    compressed -= edge * q * 0.35;
    vec3 result = mix(original,compressed,clamp(u_Strength, 0.0, 1.0));
    gl_FragColor = vec4(result, texture(iChannel0, uv).a);
}