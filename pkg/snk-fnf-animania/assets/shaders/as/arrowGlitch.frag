void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    vec2 uv = fragCoord/iResolution.xy;
    vec4 color = texture(iChannel0, uv);
    
    vec2 direction = normalize( uv - vec2(0.5) );
    direction *= distance( uv, vec2(0.5) );        
    direction *= vec2(1.0)/iResolution.xy;
    direction *= 7.0;

    color.r = texture(iChannel0, uv - direction ).r;    

    fragColor = color;
}