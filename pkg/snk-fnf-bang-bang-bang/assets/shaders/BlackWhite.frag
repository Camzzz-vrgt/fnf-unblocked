#pragma header

uniform float u_intensity;

void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec4 color = flixel_texture2D(bitmap, uv);

    float intensity = clamp(u_intensity, 0.0, 1.0);

    float luma = dot(color.rgb, vec3(0.299, 0.587, 0.114));
    vec3 bw = vec3(luma);
    vec3 finalColor = mix(color.rgb, bw, intensity);

    gl_FragColor = vec4(finalColor, color.a);
}