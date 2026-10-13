#pragma header
vec2 uv = openfl_TextureCoordv.xy;
vec2 fragCoord = openfl_TextureCoordv*openfl_TextureSize;
vec2 iResolution = openfl_TextureSize;
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;



void main()
{
	vec2 resolution = iResolution.xy;
    vec2 uv = fragCoord / resolution;

    vec4 texColor = texture(iChannel0, uv);

    float gray = dot(texColor.rgb, vec3(0.299, 0.587, 0.114));

    vec3 black = vec3(0.0, 0.0, 0.0);
    vec3 red = vec3(1.0, 0.0, 0.0);

    vec3 finalColor = mix(black, red, step(1.5, gray));
    fragColor = vec4(finalColor, 1.0);
}