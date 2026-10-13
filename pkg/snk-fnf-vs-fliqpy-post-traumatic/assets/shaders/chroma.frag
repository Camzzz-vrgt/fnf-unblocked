void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    
    vec4 col1 = texture(iChannel0, uv.st - vec2(-0.002, -0.002));
    vec4 col2 = texture(iChannel0, uv.st - vec2(0.0, 0.002));
    vec4 col3 = texture(iChannel0, uv.st - vec2(0.002, -0.002));
    vec4 toUse = texture(iChannel0, uv);
    
    toUse.r = col1.r;
    toUse.g = col2.g;
    toUse.b = col3.b;    

    fragColor = toUse;
}