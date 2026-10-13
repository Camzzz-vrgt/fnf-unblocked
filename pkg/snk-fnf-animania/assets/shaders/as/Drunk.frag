//https://www.shadertoy.com/view/Xl2BDW
void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
    
    float magnitude = 0.01;
    
    vec3 color = texture(iChannel0, uv).rgb;
    color += texture(iChannel0, uv+vec2(sin(iTime*2.0)*magnitude - cos(iTime)*magnitude, 0.)).rgb;
    
    
    color /= 2.0;
    fragColor = vec4(color, 1.0);
}