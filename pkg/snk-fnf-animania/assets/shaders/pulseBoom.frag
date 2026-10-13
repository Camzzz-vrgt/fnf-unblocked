#pragma header

uniform float iTime;
uniform float power;
uniform float pulseSpeed;

void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec4 base = flixel_texture2D(bitmap, uv);

    float pulse = sin(iTime * pulseSpeed) * 0.5 + 0.5;
    float glow = pow(max(base.r, max(base.g, base.b)), 2.0) * power * pulse;

    base.rgb += glow;
    gl_FragColor = clamp(base, 0.0, 1.0);
}
