// Automatically converted with https://github.com/TheLeerName/ShadertoyToFlixel

#pragma header

#define round(a) floor(a + 0.5)
#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
uniform sampler2D iChannel1;
uniform sampler2D iChannel2;
uniform sampler2D iChannel3;
#define texture flixel_texture2D

// third argument fix
vec4 flixel_texture2D(sampler2D bitmap, vec2 coord, float bias) {
	vec4 color = texture2D(bitmap, coord, bias);
	if (!hasTransform)
	{
		return color;
	}
	if (color.a == 0.0)
	{
		return vec4(0.0, 0.0, 0.0, 0.0);
	}
	if (!hasColorTransform)
	{
		return color * openfl_Alphav;
	}
	color = vec4(color.rgb / color.a, color.a);
	mat4 colorMultiplier = mat4(0);
	colorMultiplier[0][0] = openfl_ColorMultiplierv.x;
	colorMultiplier[1][1] = openfl_ColorMultiplierv.y;
	colorMultiplier[2][2] = openfl_ColorMultiplierv.z;
	colorMultiplier[3][3] = openfl_ColorMultiplierv.w;
	color = clamp(openfl_ColorOffsetv + (color * colorMultiplier), 0.0, 1.0);
	if (color.a > 0.0)
	{
		return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
	}
	return vec4(0.0, 0.0, 0.0, 0.0);
}

// variables which is empty, they need just to avoid crashing shader
uniform float iTimeDelta;
uniform float iFrameRate;
uniform int iFrame;
#define iChannelTime float[4](iTime, 0., 0., 0.)
#define iChannelResolution vec3[4](iResolution, vec3(0.), vec3(0.), vec3(0.))
uniform vec4 iMouse;
uniform vec4 iDate;

/*
 *	Based on this tutorial: https://www.youtube.com/watch?v=LnAoD7hgDxw
 */


void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Convert gametime to a rotating value between 0 and 1
    float time = mod(iTime * 2.0, 5.0) / 5.0;
    // Calculate the UV coordinates
	vec2 uv = fragCoord.xy / iResolution.xy;
    
    // Get the rgba value at the current UV coordinate
    // of the transition texture
    vec4 transit = texture( iChannel0, uv );
    
    // If the b value of the transition texture at the
    // current UV coordinate is less than the current
    // 0-1 time value display the pixel as the transition color
    if (transit.b < time) {
        // Set the current pixel to the transition color
        // In this case black
        fragColor = vec4(0, 0, 0, texture(iChannel0, uv).a);
    } else {
        // Otherwise show the base pixel color
        //fragColor = vec4(uv,0.5+0.5*sin(iTime),texture(iChannel0, uv).a); // <- The animated shadertoy rgba default image
        fragColor = texture( iChannel0, uv ); // <- Use the transition texture if it's a color image for an interesting transition effect.
    }
            
}

void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}