uniform float iAshCount;
uniform float iAshSpeed;  
uniform float iSmokeAmt; 
uniform vec2 iCameraPos;
uniform float iCameraZoom;

float ash_hash(float n) {
    return fract(sin(n) * 43758.5453123);
}

float ash_hash2(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453123);
}

float ash_noise(vec2 p) {
    vec2 i = floor(p); vec2 f = fract(p);
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(
        mix(ash_hash2(i+vec2(0.,0.)), ash_hash2(i+vec2(1.,0.)), u.x),
        mix(ash_hash2(i+vec2(0.,1.)), ash_hash2(i+vec2(1.,1.)), u.x),
        u.y);
}

float ash_fbm(vec2 p) {
    float v = 0.0; float a = 0.5;
    for (int i = 0; i < 4; i++) { 
        v += a * ash_noise(p); 
        p *= 2.1; 
        a *= 0.5; 
    }
    return v;
}

float ashParticle(vec2 uv, vec2 center, float size) {
    float r = length((uv - center) * vec2(1.0, 0.6));
    return smoothstep(size, size * 0.3, r);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec4 gamePixel = texture(iChannel0, uv);
    float t = iTime;
    float aspect = iResolution.x / iResolution.y;
    
    vec2 camWorld = (iCameraPos.xy / iResolution.xy);
    
    vec2 smokeUV = (uv - 0.5) / iCameraZoom + 0.5; 
    smokeUV = smokeUV * vec2(2.0, 1.5) + vec2(t * 0.03, t * 0.02) + (camWorld * 0.2);
    
    float smoke = ash_fbm(smokeUV) * iSmokeAmt;
    smoke *= uv.y * 0.8;
    vec3 smokeCol = vec3(0.30, 0.28, 0.26) * smoke;

    vec3 ashCol = vec3(0.0);
    float ashAlpha = 0.0;
    int numAsh = int(clamp(iAshCount, 1.0, 120.0));

    for (int i = 0; i < 120; i++) {
        if (i >= numAsh) break;
        
        float fi    = float(i);
        float seed  = ash_hash(fi * 1.7);
        float seed2 = ash_hash(fi * 3.3);
        float seed3 = ash_hash(fi * 5.1);
        
        float depth = 0.2 + seed2 * 0.8; 
        
        float size = (0.002 + seed2 * 0.004) * depth * iCameraZoom;
        
        float speed = (0.04 + seed * 0.06) * iAshSpeed;
        float drift = sin(t * (0.3 + seed * 0.5) + fi) * 0.06;
        
        float px = mod(seed + drift - (camWorld.x * depth * aspect * iCameraZoom), 1.0);
        float py = mod(seed2 + t * speed - (camWorld.y * depth * iCameraZoom), 1.0);
        
        float edgeFade = smoothstep(0.0, 0.1, px) * smoothstep(1.0, 0.9, px) *
                         smoothstep(0.0, 0.1, py) * smoothstep(1.0, 0.9, py);

        float alpha = smoothstep(1.0, 0.85, py) * (0.4 + seed * 0.6) * edgeFade;
        float p = ashParticle(uv, vec2(px, py), size);
        
        vec3 col = mix(vec3(0.28, 0.26, 0.25), vec3(0.55, 0.52, 0.50), seed3);
        ashCol += col * p * alpha;
        ashAlpha += p * alpha;
    }

    vec3 ashFinal = smokeCol + ashCol;
    float a = clamp(smoke * 2.0 + ashAlpha, 0.0, 1.0);
    fragColor = vec4(mix(gamePixel.rgb, ashFinal, a), gamePixel.a);
}