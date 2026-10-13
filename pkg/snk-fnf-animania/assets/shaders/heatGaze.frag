#pragma header

uniform float iTime;
uniform float strength;
uniform float speed;

float rand(vec2 p)
{
    return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}

float noise(vec2 p)
{
    vec2 i = floor(p);
    vec2 f = fract(p);
    f = f * f * (3.0 - 2.0 * f);

    float a = rand(i);
    float b = rand(i + vec2(1.0, 0.0));
    float c = rand(i + vec2(0.0, 1.0));
    float d = rand(i + vec2(1.0, 1.0));

    return mix(mix(a, b, f.x), mix(c, d, f.x), f.y);
}

void main()
{
    vec2 uv = openfl_TextureCoordv;
    float t = iTime * speed;

    float n1 = noise(uv * 8.0 + vec2(t, t * 0.7));
    float n2 = noise(uv * 16.0 - vec2(t * 1.3, t * 0.9));

    vec2 offset = vec2(
        (n1 - 0.5) * 0.02,
        (n2 - 0.5) * 0.01
    ) * strength;

    vec4 color = flixel_texture2D(bitmap, uv + offset);
    color.rgb += vec3(0.02, 0.01, 0.0) * strength;

    gl_FragColor = clamp(color, 0.0, 1.0);
}
