#pragma header

uniform vec4 uFrameBounds;

uniform float ang;
uniform float dist;
uniform float str;
uniform float thr;

uniform bool blend;
uniform bool cancelRimMix;

uniform float angOffset;

uniform vec3 rimBlur;

uniform sampler2D altMask;
uniform bool useMask;
uniform float thr2;

uniform mat4 matrix;
uniform vec4 offsets;
uniform mat4 rimMatrix;
uniform vec4 rimOffsets;

uniform mat3 hueMatrix;
uniform mat3 saturationMatrix;
uniform float brightness;
uniform float contrast;

uniform float AA_STAGES;

uniform float zoom;
uniform bool pixelPerfect;
uniform bool flipX;
uniform bool flipY;

uniform bool transAfter;

vec4 applyBaseMatrix(vec3 color, float originalAlpha)
{
	float mask = originalAlpha;
	vec4 c = vec4(color, originalAlpha);
	vec4 result = matrix * c + offsets * mask;
	result.rgb = clamp(result.rgb, 0.0, 1.0);
	result.a = step(0.001, result.a) * result.a;
	return result;
}

vec3 applyRimMatrix(vec3 color)
{
	vec4 c = vec4(color, 1.0);
	vec4 result = rimMatrix * c + rimOffsets;
	return clamp(result.rgb, 0.0, 1.0);
}

vec3 applyHSBCEffect(vec3 color)
{
	vec3 bh = (brightness + color) * hueMatrix;
	vec3 c = (bh - 0.25) * contrast + 0.25;
	vec3 s = c * saturationMatrix;

	return s;
}

vec4 applyColorTransform(vec4 color) {
    if (color.a == 0.)
        return vec4(0.);
    if (!hasTransform)
        return color;
    if (!hasColorTransform)
        return color * openfl_Alphav;
    
    color = vec4(color.rgb / color.a, color.a);
    color = clamp(openfl_ColorOffsetv + color * openfl_ColorMultiplierv, 0., 1.);

    if (color.a > 0.)
        return vec4(color.rgb * color.a * openfl_Alphav, color.a * openfl_Alphav);
    return vec4(0.);
}

vec2 hash22(vec2 p)
{
	vec3 p3 = fract(vec3(p.xyx) * vec3(.1031, .1030, .0973));
	p3 += dot(p3, p3.yzx + 33.33);
	return fract((p3.xx + p3.yz) * p3.zy);
}

float intensityPass(vec2 uv)
{
	vec4 col = texture2D(bitmap, uv);
	if (col.a == 0.0) return 0.0;

	float intensity = dot(col.rgb, vec3(0.3098, 0.6078, 0.0823));

	if (useMask)
	{
		float maskIntensity = texture2D(altMask, uv).b;
		return float(maskIntensity > 0.0 ? intensity > thr2 : intensity > thr);
	}

	return float(intensity > thr);
}

float antialias(vec2 uv)
{
	const int MAX_AA = 8;
	const float AA_JITTER = 0.5;

	float total = intensityPass(uv);
	float passes = AA_STAGES * AA_STAGES + 1.0;

	for (int i = 0; i < MAX_AA * MAX_AA; i++)
	{
		int x = i / MAX_AA;
		int y = i - (MAX_AA * int(i / MAX_AA));

		if (float(x) >= AA_STAGES || float(y) >= AA_STAGES)
			continue;

		vec2 offset = AA_JITTER * (2.0 * hash22(vec2(float(x), float(y))) - 1.0) / openfl_TextureSize.xy;
		total += intensityPass(uv + offset);
	}

	return total / passes;
}

vec4 applyRimEffect(vec3 baseCol, vec3 originalCol, float baseAlpha)
{
	float intensity = antialias(openfl_TextureCoordv);

	vec2 imageRatio = 1.0 / openfl_TextureSize.xy;
	vec2 offset = vec2(
		(dist * zoom) * cos(ang + angOffset),
		-(dist * zoom) * sin(ang + angOffset)
	);

	if (flipX) offset.x = -offset.x;
	if (flipY) offset.y = -offset.y;

	if (pixelPerfect)
		offset = floor(offset + 0.5);

	vec2 rimBlurOffset = vec2(rimBlur.x, rimBlur.y) * imageRatio;
	float rimBlurQuality = max(1.0, rimBlur.z);
	int samples = int(rimBlurQuality * 4.0) + 1;
	
	float aShiftSum = 0.0;
	float weightSum = 0.0;
	
	for (int i = -8; i <= 8; i++)
	{
		if (i > samples / 2) break;
		
		float angle = float(i) * 6.28318 / float(samples);
		vec2 rimBlurSample = vec2(cos(angle), sin(angle)) * rimBlurOffset;
		vec2 rimBlurredPixel = openfl_TextureCoordv + (offset * imageRatio) + rimBlurSample;
		
		float weight = 1.0 - abs(float(i)) / float(samples);
		aShiftSum += texture2D(bitmap, rimBlurredPixel).a * weight;
		weightSum += weight;
	}
	
	float aShift = aShiftSum / weightSum;

	float rimMask = (1.0 - aShift) * intensity;
	float t = clamp(str, 0.0, 1.0) * rimMask;

	vec3 rimInput = cancelRimMix ? originalCol : baseCol;
	vec3 rimCol = applyRimMatrix(rimInput);

	vec3 finalColor;
	if (blend)
		finalColor = clamp(baseCol + rimCol * t, 0.0, 1.0);
	else
		finalColor = mix(baseCol, rimCol, t);

	float rimAlpha = t;
	
	return vec4(finalColor, max(baseAlpha, rimAlpha));
}

vec4 colorTransformAdapt(vec4 color, bool transpost) {
    if (transpost) {
        return applyColorTransform(color);
    }
    return color;
}

void main()
{
	vec4 col = flixel_texture2D(bitmap, openfl_TextureCoordv);

	vec3 unpremultipliedColor = col.a > 0.0 ? col.rgb / col.a : col.rgb;

	unpremultipliedColor = applyHSBCEffect(unpremultipliedColor);

	vec4 baseResult = applyBaseMatrix(unpremultipliedColor, col.a);
	vec4 rimResult = applyRimEffect(baseResult.rgb, unpremultipliedColor, baseResult.a);

	gl_FragColor = colorTransformAdapt(vec4(rimResult.rgb * rimResult.a, rimResult.a), transAfter);
}