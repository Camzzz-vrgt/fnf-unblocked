#pragma header
uniform vec2 blurSize;
const vec3 multColor1 = vec3(25.);
const vec4 multColor2 = vec4(250., 250., 250., 50.) / vec4(350.);
// ANGLE/WebGL requires the number of iterations and the loop increment to be
// compile-time constants. This is the old quality=2.0 kernel: 4 x 4 samples.
const int BLUR_SAMPLES = 4;
const float BLUR_STEP = 0.5;
const float BLUR_WEIGHT = 1.0 / 16.0;
void main()
{
	gl_FragColor = texture2D(bitmap, openfl_TextureCoordv.xy);
	for (int ix = 0; ix < BLUR_SAMPLES; ix++)
	{
		float x = -1.0 + float(ix) * BLUR_STEP;
		for (int iy = 0; iy < BLUR_SAMPLES; iy++)
		{
			float y = -1.0 + float(iy) * BLUR_STEP;
			vec4 color = texture2D(bitmap, openfl_TextureCoordv.xy + vec2(x, y) / openfl_TextureSize.xy * blurSize);
			color.rgb = pow(color.rgb, multColor1);
			gl_FragColor += (color.r + color.g + color.b) / 3. * BLUR_WEIGHT * multColor2 * clamp(1.0-pow(x*x+y*y, 1./5.), 0., 1.) * .5;
		}
	}
}
