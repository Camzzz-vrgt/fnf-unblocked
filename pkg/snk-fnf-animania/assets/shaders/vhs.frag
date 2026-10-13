#pragma header

uniform float iTime;
uniform float amount;
uniform float glitchSpeed;

float rand(vec2 n)
{
    return fract(sin(dot(n, vec2(12.9898, 4.1414))) * 43758.5453);
}

void main()
{
    vec2 uv = openfl_TextureCoordv;
    float t = iTime * glitchSpeed;

    float g = step(0.92, rand(vec2(floor(uv.y * 40.0), floor(t * 10.0))));
    float shift = amount * g * 0.02;

    vec4 c1 = flixel_texture2D(bitmap, uv + vec2( shift, 0.0));
    vec4 c2 = flixel_texture2D(bitmap, uv);
    vec4 c3 = flixel_texture2D(bitmap, uv - vec2( shift, 0.0));

    vec4 color = vec4(c1.r, c2.g, c3.b, c2.a);

    float noise = rand(uv * vec2(openfl_TextureSize.x, openfl_TextureSize.y) + t) - 0.5;
    color.rgb += noise * 0.05 * amount;

    gl_FragColor = clamp(color, 0.0, 1.0);
}
