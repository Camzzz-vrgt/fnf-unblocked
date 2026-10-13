void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord.xy / iResolution.xy;
    
    vec4 original = texture(iChannel0, uv);
    
    vec3 custom = vec3(0.0, 2.0, 1.0); 
    
    vec4 color = vec4(original.rgb * custom, original.a);
    
    fragColor = color;
}
