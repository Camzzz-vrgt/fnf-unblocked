#pragma header

uniform float uTime;
uniform vec2 uResolution;
uniform float uDensity;
uniform float uFlakeSize;
uniform float uFallSpeed;
uniform float uWindStrength;
uniform float uTwinkle;
uniform float uOpacity;

void main()
{
    vec2 fragCoord = openfl_TextureCoordv.xy * uResolution;
    float snow = 0.0;
    float random = fract(sin(dot(fragCoord.xy, vec2(12.9898, 78.233))) * 43758.5453);

    for (int k = 0; k < 6; k++)
    {
        for (int j = 0; j < 4; j++)
        {
            int i = 1 + j * 3;
            float cellSize = 2.0 + float(i) * 3.0;
            float downSpeed = -(0.3 * uFallSpeed) - (sin(uTime * 0.4 + float(k + i * 20)) + 1.0) * 0.00008 * uFallSpeed;
            vec2 uv = fragCoord / uResolution.x + vec2(
                0.01 * uWindStrength * sin((uTime + float(k * 6185)) * 0.6 + float(i)) * (5.0 / float(i)),
                downSpeed * (uTime + float(k * 1352)) / float(i)
            );
            vec2 uvStep = ceil(uv * cellSize - vec2(0.5)) / cellSize;
            float x = fract(sin(dot(uvStep, vec2(12.9898 + float(k) * 12.0, 78.233 + float(k) * 315.156))) * 43758.5453 + float(k) * 12.0) - 0.5;
            float y = fract(sin(dot(uvStep, vec2(62.2364 + float(k) * 23.0, 94.674 + float(k) * 95.0))) * 62159.8432 + float(k) * 12.0) - 0.5;
            float randomMagnitude1 = sin(uTime * 2.5) * 0.7 * uTwinkle / cellSize;
            float randomMagnitude2 = cos(uTime * 2.5) * 0.7 * uTwinkle / cellSize;
            float d = 5.0 * distance(uvStep + vec2(x * sin(y), y) * randomMagnitude1 + vec2(y, x) * randomMagnitude2, uv);
            float omiVal = fract(sin(dot(uvStep, vec2(32.4691, 94.615))) * 31572.1684);

            if (omiVal < uDensity)
            {
                snow += (x + 1.0) * 0.4 * uFlakeSize * clamp(1.9 - d * (15.0 + x * 6.3) * (cellSize / 1.4), 0.0, 1.0);
            }
        }
    }

    vec4 texColor = flixel_texture2D(bitmap, openfl_TextureCoordv);
    float alpha = clamp(snow + random * 0.01, 0.0, 1.0) * texColor.a * uOpacity;
    gl_FragColor = vec4(texColor.rgb * alpha, alpha);
}
