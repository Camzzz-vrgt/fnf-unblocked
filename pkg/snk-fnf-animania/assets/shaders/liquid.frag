#pragma header

uniform float iTime;
uniform float strength;
uniform float freq;

void main()
{
    vec2 uv = openfl_TextureCoordv;
    float t = iTime;

    float w1 = sin((uv.y * freq * 10.0) + t * 2.0) * 0.008;
    float w2 = cos((uv.x * freq * 12.0) - t * 1.7) * 0.008;
    float w3 = sin((uv.x + uv.y) * freq * 8.0 + t * 1.2) * 0.006;

    vec2 offset = vec2(w1 + w3, w2) * strength;
    vec4 color = flixel_texture2D(bitmap, uv + offset);

    gl_FragColor = clamp(color, 0.0, 1.0);
}
