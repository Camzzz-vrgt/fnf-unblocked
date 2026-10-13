#pragma header

uniform float u_intensity;

void main()
{
    vec2 uv = openfl_TextureCoordv;
    float intensity = clamp(u_intensity, 0.0, 1.0);
    vec4 color = flixel_texture2D(bitmap, uv);
    vec3 inverted = vec3(1.0, 1.0, 1.0) - color.rgb;
    vec3 finalColor = mix(color.rgb, inverted, intensity);
    gl_FragColor = vec4(finalColor, color.a);
}