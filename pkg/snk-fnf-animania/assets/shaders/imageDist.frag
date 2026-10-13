#pragma header

#define iResolution vec3(openfl_TextureSize, 0.)
uniform float iTime;
#define iChannel0 bitmap
#define texture flixel_texture2D

// end of ShadertoyToFlixel header

void mainImage(out vec4 fragColor, in vec2 fragCoord)
{
    vec2 texCoords = fragCoord.xy / iResolution.xy;
    float distortionAmount = 0.0005;

    float jumpInterval = 0.5;
    float jumpTime = floor(iTime / jumpInterval) * jumpInterval;

    vec2 distortedCoords = texCoords;

    if (mod(floor(iTime / jumpInterval), 2.0) == 0.0)
        distortedCoords += vec2(sin(texCoords.y * 100.0 + jumpTime) * distortionAmount, sin(texCoords.y * 60.0 + jumpTime) * distortionAmount);
    fragColor = texture(iChannel0, distortedCoords);
}


void main() {
	mainImage(gl_FragColor, openfl_TextureCoordv*openfl_TextureSize);
}
