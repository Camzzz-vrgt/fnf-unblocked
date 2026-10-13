#pragma header

uniform float u_intensity;

void main()
{
    vec2 uv = openfl_TextureCoordv;
    
    float intensity = u_intensity * 0.02;
    
    vec2 redOffset = vec2(intensity, -intensity);
    vec2 blueOffset = vec2(-intensity, intensity);
    
    float r = flixel_texture2D(bitmap, uv + redOffset).r;
    float g = flixel_texture2D(bitmap, uv).g;
    float b = flixel_texture2D(bitmap, uv + blueOffset).b;
    float a = flixel_texture2D(bitmap, uv).a;
    
    float y = uv.y * openfl_TextureSize.y;
    float lag = sin(y * 10.0 + u_intensity * 100.0) * intensity * 0.5;
    
    vec2 lagUV = uv + vec2(lag, 0.0);
    
    vec4 color;
    color.r = flixel_texture2D(bitmap, lagUV + redOffset).r;
    color.g = flixel_texture2D(bitmap, lagUV).g;
    color.b = flixel_texture2D(bitmap, lagUV + blueOffset).b;
    color.a = a;
    
    gl_FragColor = color;
}