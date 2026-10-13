#pragma header
// https://www.shadertoy.com/view/llfyz4
uniform float u_strength;
uniform float u_quality;

vec3 rgb2ycbcr(vec3 c)
{
    return vec3(
        dot(c, vec3(0.299, 0.587, 0.114)),
        dot(c, vec3(-0.168736, -0.331264, 0.5)) + 0.5,
        dot(c, vec3(0.5, -0.418688, -0.081312)) + 0.5
    );
}

vec3 ycbcr2rgb(vec3 c)
{
    float y = c.x;
    float cb = c.y - 0.5;
    float cr = c.z - 0.5;

    return vec3(
        y + 1.402 * cr,
        y - 0.344136 * cb - 0.714136 * cr,
        y + 1.772 * cb
    );
}

float hash(vec2 p)
{
    p = fract(p * vec2(123.34, 345.45));
    p += dot(p, p + 34.345);
    return fract(p.x * p.y);
}

void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec2 texSize = vec2(openfl_TextureSize);

    vec4 original = flixel_texture2D(bitmap, uv);

    float strength = u_strength;
    float quality = u_quality;
    float q = mix(0.20, 0.005, quality / 100.0);

    // blocks
    vec2 pixel = uv * texSize;

    vec2 block = floor(pixel / 8.0);
    vec2 blockUV = (block * 8.0 + 4.0) / texSize;

    vec2 chromaPixel = floor(pixel / 2.0) * 2.0 + 1.0;
    vec2 chromaUV = chromaPixel / texSize;

    vec3 base = flixel_texture2D(bitmap, uv).rgb;
    vec3 chroma = flixel_texture2D(bitmap, chromaUV).rgb;

    vec3 ycc = rgb2ycbcr(base);
    vec3 chromaYCC = rgb2ycbcr(chroma);
    ycc.yz = mix(ycc.yz, chromaYCC.yz, strength);

    vec3 center = flixel_texture2D(bitmap, blockUV).rgb;
    vec3 centerYCC = rgb2ycbcr(center);
    float blockInfluence = strength * (1.0 - quality / 100.0);

    ycc.x = mix(ycc.x,mix(ycc.x, centerYCC.x, 0.35),blockInfluence);
    
    float lumaStep = q * 0.35;
    float chromaStep = q * 0.8;
    float quantStrength = strength * (1.0 - quality / 100.0);
    float yQuant = max(lumaStep, 0.001) * mix(1.0, 5.0, quantStrength);
    float cQuant = max(chromaStep, 0.001) * mix(1.0, 4.0, quantStrength);

    // ycc.x = floor(ycc.x / yQuant + 0.5) * yQuant;
    // ycc.y = floor(ycc.y / cQuant + 0.5) * cQuant;
    // ycc.z = floor(ycc.z / cQuant + 0.5) * cQuant;

    float quantY = floor(ycc.x / yQuant + 0.5) * yQuant;

    ycc.x = mix(ycc.x, quantY, quantStrength * 0.35);
    ycc.y = mix(ycc.y, ycc.y, quantStrength * 0.05);
    ycc.z = mix(ycc.z, ycc.z, quantStrength * 0.05);


    // noise
    vec2 blockPixel = mod(pixel, 8.0);
    float edgeX = min(blockPixel.x, 7.0 - blockPixel.x);
    float edgeY = min(blockPixel.y, 7.0 - blockPixel.y);
    float blockEdge = 1.0 - clamp(min(edgeX, edgeY) / 2.0, 0.0, 1.0);
    float noise = hash(floor(pixel)) - 0.5;
    float mosquito = noise * blockEdge * quantStrength * 0.025;
    
    ycc.x += mosquito;
    vec3 result = ycbcr2rgb(ycc);
    result = clamp(result, 0.0, 1.0);
    result = mix(base, result, strength);
    gl_FragColor = vec4(result, original.a);
}