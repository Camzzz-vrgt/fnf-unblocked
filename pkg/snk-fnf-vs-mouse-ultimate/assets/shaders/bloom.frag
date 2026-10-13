#pragma header

//BLOOM SHADER BY BBPANZU

uniform float dim;
uniform float Size;

const int DIRECTIONS = 16;
const int QUALITY = 8;
const float PI_2 = 6.28318530718;

void main(void)
{
  vec2 uv = openfl_TextureCoordv.xy;
  vec4 source = flixel_texture2D(bitmap, uv);
  vec3 Color = source.rgb;

  for (int direction = 0; direction < DIRECTIONS; direction++)
  {
    float angle = PI_2 * float(direction) / float(DIRECTIONS);

    for (int sampleIndex = 1; sampleIndex <= QUALITY; sampleIndex++)
    {
      float sampleAmount = float(sampleIndex) / float(QUALITY);
      vec2 offset = vec2(cos(angle), sin(angle))
        * Size
        * sampleAmount
        / openfl_TextureSize.xy;

      Color += flixel_texture2D(bitmap, uv + offset).rgb;
    }
  }

  Color /= (dim * float(QUALITY)) * float(DIRECTIONS) - 15.0;
  vec3 bloom = (source.rgb / dim) + Color;

  // Flixel expects premultiplied alpha. Keeping RGB below alpha prevents the
  // ADD blend from bleaching every sprite underneath the spotlight on WebGL.
  gl_FragColor = vec4(clamp(bloom, 0.0, source.a), source.a);
}
