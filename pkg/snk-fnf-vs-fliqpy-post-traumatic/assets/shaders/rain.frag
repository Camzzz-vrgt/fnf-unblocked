#define PARALLAX_FAR    0.45
#define PARALLAX_MID    0.75
#define PARALLAX_NEAR   1.15

uniform float iIntensity;
uniform float iSpeed;
uniform float iAngle;
uniform vec2 iCameraPos;

uniform float iSeed;

float hash21(vec2 p) {
    p = fract((p + iSeed) * vec2(127.1, 311.7));
    p += dot(p, p.yx + 19.19);
    return fract(p.x * p.y);
}

struct RainResult {
    vec2  refract;
    float specular;
    float mask;
};

vec2 applyAngle(vec2 uv, float angleDeg) {
    float a = radians(angleDeg);

    return vec2(
        uv.x * cos(a) - uv.y * sin(a),
        uv.x * sin(a) + uv.y * cos(a)
    );
}

void dropContrib(
    vec2  uvCam,
    vec2  dropPos,
    float streakWidth,
    float streakLen,
    float refractStr,
    float specStr,
    inout vec2  refAcc,
    inout float specAcc,
    inout float maskAcc
) {
    float dx = uvCam.x - dropPos.x;
    float dy = uvCam.y - dropPos.y;

    float xMask = smoothstep(streakWidth, 0.0, abs(dx));
    if (xMask < 0.001) return;

    if (dy < 0.0 || dy > streakLen) return;
    float head = smoothstep(0.0, streakLen * 0.18, dy);
    float tail = smoothstep(streakLen, streakLen * 0.45, dy);
    float yMask = head * tail;

    float mask = xMask * yMask;
    if (mask < 0.001) return;

    float nX = -dx / (streakWidth * streakWidth + dx * dx + 1e-5);
    nX = clamp(nX * 2.0, -1.0, 1.0);

    float yCenter = streakLen * 0.35;
    float nY = (dy - yCenter) / (streakLen * 0.5 + 1e-5);
    nY = clamp(nY * 1.5, -1.0, 1.0);

    vec2 normal = vec2(nX, nY);

    refAcc += normal * refractStr * mask;

    vec2 lightDir = normalize(vec2(-0.4, -1.0));
    float spec = max(0.0, dot(normalize(normal + vec2(1e-5)), -lightDir));
    specAcc += pow(spec, 12.0) * specStr * mask;

    maskAcc = max(maskAcc, mask);
}

RainResult rainLayer(
    vec2  uv,
    vec2  camOffset,
    float time,
    float streakWidth,
    float speed,
    float density,
    float seed,
    float refractStr,
    float specStr,
    float intensity
) {
    RainResult res;
    res.refract = vec2(0.0);
    res.specular = 0.0;
    res.mask = 0.0;

    vec2 uvCam = uv + camOffset;

    float colIdx = floor(uvCam.x * density);
    float colRand = hash21(vec2(colIdx, seed * 137.3));

    float threshold = hash21(vec2(colIdx + seed * 53.1, 7.77));
    if (intensity < threshold) return res;
    float iWeight = smoothstep(threshold, threshold + 0.25, intensity);

    float cx = (colIdx + 0.5 + (hash21(vec2(colIdx * 1.3, seed * 29.7)) - 0.5) * 0.85) / density;
    float dropSpeed = speed * (0.65 + colRand * 0.7);
    float phase = hash21(vec2(colIdx * 3.1731, seed * 71.9)) * 100.0;
    float lenRand = hash21(vec2(colIdx * 7.5731, seed * 13.3));
    float streakLen = 0.06 + lenRand * 0.22;
    float dropY = fract(uvCam.y + time * dropSpeed + phase) - streakLen;

    dropContrib(
        uvCam,
        vec2(cx, dropY),
        streakWidth, streakLen,
        refractStr * iWeight,
        specStr * iWeight,
        res.refract, res.specular, res.mask
    );

    return res;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;

    float aspect = iResolution.x / iResolution.y;
    vec2 uvA = vec2(uv.x * aspect, uv.y);

    float t = iTime;

    float angleDeg = iAngle;
    float intensity = iIntensity;
    float rainSpeed = iSpeed;
    vec2 camPos = iCameraPos.xy / iResolution.xy;

    rainSpeed = max(rainSpeed, 0.01);
    intensity = clamp(intensity, 0.0, 1.0);

    vec2 uvR = applyAngle(uvA, angleDeg);

    vec2 camWorld   = vec2(camPos.x * aspect, camPos.y);
    vec2 camRotated = applyAngle(camWorld, angleDeg);

    vec2 offsetFar  = camRotated * PARALLAX_FAR;
    vec2 offsetMid  = camRotated * PARALLAX_MID;
    vec2 offsetNear = camRotated * PARALLAX_NEAR;

    vec2  totalRefract  = vec2(0.0);
    float totalSpecular = 0.0;
    float totalMask     = 0.0;

    for (int i = 0; i < 3; i++) {
        RainResult r = rainLayer(
            uvR, offsetFar, t,
            0.0015,
            1.9 * rainSpeed,
            22.0,
            float(i) * 3.7,
            0.007, 0.25,
            intensity
        );
        totalRefract  += r.refract;
        totalSpecular += r.specular;
        totalMask = max(totalMask, r.mask);
    }

    for (int i = 0; i < 3; i++) {
        RainResult r = rainLayer(
            uvR, offsetMid, t,
            0.0030,
            2.5 * rainSpeed,
            14.0,
            float(i) * 5.1 + 10.0,
            0.016, 0.50,
            intensity
        );
        totalRefract += r.refract;
        totalSpecular += r.specular;
        totalMask = max(totalMask, r.mask);
    }

    for (int i = 0; i < 2; i++) {
        RainResult r = rainLayer(
            uvR, offsetNear, t,
            0.0055,
            3.1 * rainSpeed,
            7.0,
            float(i) * 7.3 + 20.0,
            0.035, 1.00,
            intensity
        );
        totalRefract += r.refract;
        totalSpecular += r.specular;
        totalMask = max(totalMask, r.mask);
    }

    float aRad = radians(angleDeg);
    float cosA = cos(-aRad);
    float sinA = sin(-aRad);
    vec2 refractScreen = vec2(
        totalRefract.x * cosA - totalRefract.y * sinA,
        totalRefract.x * sinA + totalRefract.y * cosA
    );

    vec2 refractUV = uv + vec2(refractScreen.x / aspect, refractScreen.y);
    refractUV = clamp(refractUV, 0.001, 0.999);

    vec3 col = flixel_texture2D(iChannel0, refractUV).rgb;

    float darkening = mix(1.0, 0.68, intensity * 0.6);
    col *= mix(darkening, 1.0, totalMask);

    col += vec3(0.80, 0.92, 1.00) * totalSpecular;

    float aberStr = 0.0035 * totalMask;
    vec2  aberDir = normalize(refractScreen + vec2(1e-5));
    col.r = mix(col.r, flixel_texture2D(iChannel0, clamp(refractUV + aberDir * aberStr, 0.001, 0.999)).r, totalMask * 0.5);
    col.b = mix(col.b, flixel_texture2D(iChannel0, clamp(refractUV - aberDir * aberStr, 0.001, 0.999)).b, totalMask * 0.5);

    fragColor = vec4(col, 1.0);
}