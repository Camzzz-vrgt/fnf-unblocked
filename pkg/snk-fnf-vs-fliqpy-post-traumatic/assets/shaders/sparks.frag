
float hash11(float n) {
    return fract(sin(n) * 43758.5453123);
}

float hash21(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}

vec2 hash22(vec2 p) {
    return vec2(hash21(p), hash21(p + vec2(31.41, 59.26)));
}

struct Spark {
    vec2  pos;    
    float life;    
    float size;    
    float bright;   
    vec2  seed;   
};

Spark makeSpark(float id, float time, float aspect, vec2 camOffset) {
    Spark s;
    s.seed = vec2(id, id * 1.618);

    float duration = 1.5 + hash11(id * 3.7) * 2.0;

    float phaseOffset = hash11(id * 7.13) * duration;

    float t = mod(time + phaseOffset, duration) / duration;
    s.life = t;

    float bornX = (hash11(id * 2.31) - 0.5) * aspect;
    float bornY = (hash11(id * 5.47) - 0.5); 

    vec2 parallax = camOffset * 0.00005;

    float fallSpeed = 0.15 - hash11(id * 4.89) * 0.25;

    float wobbleAmp  = 0.005 + hash11(id * 6.11) * 0.0;
    float wobbleFreq = 4.0   + hash11(id * 8.33) * 0.0;
    float wobble     = sin(t * wobbleFreq * 6.2831) * wobbleAmp;

    s.pos = vec2(
        bornX + wobble + parallax.x,
        bornY + t * fallSpeed * duration + parallax.y
    );

    s.size   = 0.008 + hash11(id * 9.77) * 0.014;

    s.bright = 0.7 + hash11(id * 11.3) * 0.3;

    return s;
}

vec4 drawSpark(vec2 uv, Spark s) {
    vec2  d    = uv - s.pos;
    float dist = length(d);

    float core  = 1.0 - smoothstep(s.size * 0.3,  s.size * 0.5,  dist);
    float glow  = 0.5 - smoothstep(s.size * 0.5,  s.size * 1.6,  dist);
    float halo  = 1.0 - smoothstep(s.size * 1.6,  s.size * 3.5,  dist);

    float fadeIn  = smoothstep(0.0,  0.15, s.life);
    float fadeOut = 1.0 - smoothstep(0.75, 1.0, s.life);
    float fade    = fadeIn * fadeOut;

    if (glow + core < 0.001) return vec4(0.0);

    vec3 cCore    = mix(vec3(1.0, 0.95, 0.7), vec3(1.0, 1.0, 1.0), core);

    vec3 cGlow    = mix(vec3(1.0, 0.25, 0.0), vec3(1.0, 0.75, 0.1), glow * 0.8);

    vec3 cHalo    = vec3(0.9, 0.15, 0.0) * halo * 0.3;

    vec3 cOutline = vec3(0.0);

    vec3  col   = cHalo;
    float alpha = halo * 0.4;

    col   = mix(col,   cGlow,    glow);
    alpha = mix(alpha, 0.85,     glow);

    col   = mix(col,   cCore,    core);
    alpha = mix(alpha, 1.0,      core);

    alpha *= fade * s.bright;
    col   *= fade * s.bright;

    return vec4(col, alpha);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    float aspect = iResolution.x / iResolution.y;

    vec2 uv = (fragCoord - 0.5 * iResolution.xy) / iResolution.y;

    float time = iTime * 0.4;

    vec2 camPos = iMouse.xy - 0.5 * iResolution.xy;

    vec4 result = texture(iChannel0, uv);

    const int NUM_SPARKS = 20;

    for (int i = 0; i < NUM_SPARKS; i++) {
        Spark s = makeSpark(float(i), time, aspect, camPos);
        vec4  c = drawSpark(uv, s);

        result.rgb += c.rgb * c.a;
        result.a    = clamp(result.a + c.a, 0.0, 1.0);
    }

    result.a   = clamp(result.a, 0.0, 0.95);
    result.rgb = clamp(result.rgb, 0.0, 1.0);

    fragColor = result;
}
