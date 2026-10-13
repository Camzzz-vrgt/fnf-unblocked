#pragma header

// This shader aims to mostly recreate how Adobe Animate/Flash handles drop shadows, but its main use here is for rim lighting.

// this shader also includes a recreation of the Animate/Flash "Adjust Color" filter,
// which was kindly provided and written by Rozebud https://github.com/ThatRozebudDude ( thank u rozebud :) )
// Adapted from Andrey-Postelzhuks shader found here: https://forum.unity.com/threads/hue-saturation-brightness-contrast-shader.260649/
// Hue rotation stuff is from here: https://www.w3.org/TR/filter-effects/#feColorMatrixElement

// equals (frame.left, frame.top, frame.right, frame.bottom)
uniform vec4 uFrameBounds;

uniform float ang;
uniform float dist;
uniform float str;

// need to account for rotated frames... oops
uniform float angOffset;

uniform vec3 dropColor;
uniform vec3 _lightColor;

vec2 hash22(vec2 p) {
    vec3 p3 = fract(vec3(p.xyx) * vec3(0.1031, 0.1030, 0.0973));
    p3 += dot(p3, p3.yzx + 33.33);
    return fract((p3.xx + p3.yz) * p3.zy);
}

const vec3 CONST_VEC3_1 = vec3(1.0);

vec4 blend(vec4 bg, vec4 src) {
    return vec4(bg.rgb * mix(CONST_VEC3_1, src.rgb, src.a), bg.a);
}

float createDropShadow() {

    // essentially a mask so that areas under the threshold dont show the rimlight (mainly the outlines)
    // float intensity = antialias(openfl_TextureCoordv);

    // the distance the dropshadow moves needs to be correctly scaled based on the texture size
    // vec2 imageRatio = vec2(1.0 / openfl_TextureSize.x, 1.0 / openfl_TextureSize.y);
    vec2 imageRatio = vec2(1.0 / 600.0); // It is necessary to somehow correct the shadow on texture atlases

    // check the pixel in the direction and distance specified
    vec2 checkedPixel = openfl_TextureCoordv.xy + vec2(dist * cos(ang + angOffset), -dist * sin(ang + angOffset)) * imageRatio;
    // checkedPixel.x *= (uFrameBounds.z - uFrameBounds.x) * imageRatio.x;
    // checkedPixel.y *= (uFrameBounds.w - uFrameBounds.y) * imageRatio.y;

    // multiplier for the intensity of the drop shadow
    float dropShadowAmount = 0.0;

    // if (checkedPixel.x > uFrameBounds.x && checkedPixel.y > uFrameBounds.y && checkedPixel.x < uFrameBounds.z && checkedPixel.y < uFrameBounds.w) {
        dropShadowAmount = texture2D(bitmap, checkedPixel).a;
    // }

    return dropShadowAmount * str;
}

void main()
{
    vec4 col = texture2D(bitmap, openfl_TextureCoordv);

    float shadowInst = createDropShadow();
    vec4 shadowColor = vec4(mix(_lightColor, dropColor, shadowInst), 1.0);

    gl_FragColor = blend(col, shadowColor);
    // shadowColor.rgb *= col.a;
    // shadowColor.a = col.a;
    // gl_FragColor = shadowColor;
}