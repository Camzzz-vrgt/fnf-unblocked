#pragma header

uniform float u_intensity;
uniform float iTime;

void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec2 center = vec2(0.5, 0.5);
    
    float pulse = sin(iTime * 5.0) * 0.5 + 0.5;
    float str = u_intensity * pulse;
    
    vec2 dir = uv - center;
    float dist = length(dir);
    float pull = str * 0.3;
    
    vec2 newUV = center + dir * (1.0 + pull * (1.0 - dist));
    
    float ab = str * 0.02;
    float r = flixel_texture2D(bitmap, newUV + vec2(ab, 0.0)).r;
    float g = flixel_texture2D(bitmap, newUV).g;
    float b = flixel_texture2D(bitmap, newUV - vec2(ab, 0.0)).b;
    float a = flixel_texture2D(bitmap, uv).a;
    
    vec4 color = vec4(r, g, b, a);
    
    float vignette = 1.0 - dist * str * 1.5;
    color.rgb = color.rgb * max(vignette, 0.0);
    
    gl_FragColor = color;
}