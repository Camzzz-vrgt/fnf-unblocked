#pragma header

uniform float blurSize;

const int DIRECTIONS = 32;
const int QUALITY = 6;
const float PI_2 = 6.28318530718;

void main()
{
  vec2 uv = openfl_TextureCoordv.xy;
  vec2 radius = blurSize / openfl_TextureSize.xy;
  vec4 color = flixel_texture2D(bitmap, uv);

  for (int direction = 0; direction < DIRECTIONS; direction++)
  {
    float angle = PI_2 * float(direction) / float(DIRECTIONS);

    for (int sampleIndex = 1; sampleIndex <= QUALITY; sampleIndex++)
    {
      float sampleAmount = float(sampleIndex) / float(QUALITY);
      color += flixel_texture2D(bitmap, uv + vec2(cos(angle), sin(angle)) * radius * sampleAmount);
    }
  }

  color /= float(QUALITY * DIRECTIONS) - 15.0;
  gl_FragColor = color;
}
