//https://www.shadertoy.com/view/3s3BD7
vec4 overlay(vec4 target, vec4 blend) {
    float gray = dot(target.xyz, vec3(0.21, 0.71, 0.07));
    
	return (gray > 0.5) ? (1. - (1.-2.*(gray-0.5)) * (1.-blend))
	: ((2.*gray) * blend);    
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord/iResolution.xy;

    float t = cos(iTime) * 5.0 + 0.;
    
    // Time varying pixel color
    vec4 col = vec4(0.5 + 0.5*cos(iTime * 5.+uv.xyx+vec3(0,2,4)), 1.0);
	vec4 text = texture(iChannel0, uv);
    
    vec4 target = text;
    vec4 blend = col;
                      
    // Output to screen
    fragColor = overlay(target, blend);
}