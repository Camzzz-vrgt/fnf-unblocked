#pragma header

uniform float iFactor;

float rand(out vec2 uv, float t) {
    return fract(sin(dot(uv, vec2(1225.6548, 321.8942))) * 4251.4865 + t*2.);
}
float vec3Sum(out vec3 frag) {
    return (frag.r + frag.g + frag.b) / 3.;
}
void main()
{
  gl_FragColor = texture2D(iChannel0, openfl_TextureCoordv.xy);

  if (iFactor > 0.)
  {
      vec2 center = openfl_TextureCoordv.xy - vec2(0.5);
      vec2 separate = vec2(0.03)*center;
      separate = separate * separate * iFactor * vec2(25.0);
      vec2 randOffsets = (rand(openfl_TextureCoordv.xy, iTime) - vec2(0.5));
      vec2 rgbOffsets = mix(separate*randOffsets, separate * center, 0.75) * 6.;
      gl_FragColor.rgb = vec3(
          texture2D(iChannel0, openfl_TextureCoordv.xy - rgbOffsets).r,
          texture2D(iChannel0, openfl_TextureCoordv.xy - rgbOffsets*0.55).g,
          gl_FragColor.b
      );
      separate = randOffsets * separate * separate * iFactor * vec2(50.0);

      gl_FragColor.rgb -= max((distance(openfl_TextureCoordv.xy, vec2(0.5, 0.5)) - 0.25) * 0.85 * min(iFactor, 1.), 0.0);
      gl_FragColor.rgb -= (1.-vec3Sum(gl_FragColor.rgb))*vec3(rand(openfl_TextureCoordv.xy, iTime + 1.))/6.*(length(separate) + 1.)*iFactor;
  }
}
