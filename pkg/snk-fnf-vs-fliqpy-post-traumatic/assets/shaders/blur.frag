#define EDGE_SOFTNESS 0.5
#define MAX_BLUR 14.0

#define SAMPLES 24

uniform float iFocusRadius;

vec2 poissonDisk(int i) {
    if (i == 0) return vec2(-0.326, -0.406);
    if (i == 1) return vec2(-0.840, -0.074);
    if (i == 2) return vec2(-0.696,  0.457);
    if (i == 3) return vec2(-0.203,  0.621);
    if (i == 4) return vec2( 0.962, -0.195);
    if (i == 5) return vec2( 0.473, -0.480);
    if (i == 6) return vec2( 0.519,  0.767);
    if (i == 7) return vec2( 0.185, -0.893);
    if (i == 8) return vec2( 0.507,  0.064);
    if (i == 9) return vec2( 0.896,  0.412);
    if (i == 10) return vec2(-0.322, -0.933);
    if (i == 11) return vec2(-0.792,  0.598);
    if (i == 12) return vec2( 0.124,  0.321);
    if (i == 13) return vec2(-0.551,  0.819);
    if (i == 14) return vec2( 0.734, -0.678);
    if (i == 15) return vec2(-0.145,  0.926);
    if (i == 16) return vec2( 0.271, -0.659);
    if (i == 17) return vec2(-0.623, -0.671);
    if (i == 18) return vec2( 0.647,  0.478);
    if (i == 19) return vec2(-0.941,  0.314);
    if (i == 20) return vec2( 0.342,  0.897);
    if (i == 21) return vec2(-0.489, -0.218);
    if (i == 22) return vec2( 0.812, -0.421);
    return vec2(-0.078, -0.712);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec2 texel = 1.0 / iResolution.xy;

    float aspect = iResolution.x / iResolution.y;

    vec2 delta = (uv - 0.5) * vec2(aspect, 1.0);
    float dist = length(delta);

    float blurMask = smoothstep(
        iFocusRadius - EDGE_SOFTNESS,
        iFocusRadius + EDGE_SOFTNESS,
        dist
    );

    vec3 col;

    if (blurMask < 0.001) {
        col = flixel_texture2D(iChannel0, uv).rgb;
    } else {
        float blurRadius = blurMask * MAX_BLUR;

        vec3 acc = vec3(0.0);
        for (int i = 0; i < SAMPLES; i++) {
            vec2 offset = poissonDisk(i) * blurRadius * texel;
            acc += flixel_texture2D(iChannel0, uv + offset).rgb;
        }
        vec3 blurred = acc / float(SAMPLES);

        vec3 sharp = flixel_texture2D(iChannel0, uv).rgb;
        col = mix(sharp, blurred, blurMask);
    }

    vec2 v = uv - 0.5;
    col *= 1.0 - dot(v, v) * 0.25;

    fragColor = vec4(clamp(col, 0.0, 1.0), 1.0);
}
