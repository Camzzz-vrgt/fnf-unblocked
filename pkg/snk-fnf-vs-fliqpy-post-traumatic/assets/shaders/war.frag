uniform float iFilm;

float film_hash(float n) {
    return fract(sin(n) * 43758.5453);
}
float film_hash2(vec2 p) {
    return fract(sin(dot(p, vec2(127.1, 311.7))) * 43758.5453);
}
float film_noise(vec2 p) {
    vec2 i = floor(p); vec2 f = fract(p);
    vec2 u = f * f * (3.0 - 2.0 * f);
    return mix(
        mix(film_hash2(i),            film_hash2(i+vec2(1,0)), u.x),
        mix(film_hash2(i+vec2(0,1)), film_hash2(i+vec2(1,1)), u.x),
        u.y);
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord / iResolution.xy;
    vec4 base = texture(iChannel0, uv);
    vec3 col  = base.rgb;
    float t   = iFilm;

    float luma     = dot(col, vec3(0.299, 0.587, 0.114));
    vec3  milGreen = vec3(luma * 0.72, luma * 0.80, luma * 0.58);
    col = mix(col, milGreen, t);

    float flicker = 1.0 - film_hash(floor(iTime * 18.0)) * 0.08 * t;
    col *= flicker;

    float grain = film_hash2(uv + fract(iTime * 0.37)) - 0.5;
    col += grain * 0.20 * t;

    float scratchAlpha = 0.0;
    for (int i = 0; i < 3; i++) {
        float fi    = float(i);
        float xPos  = film_hash(fi * 3.7 + floor(iTime * 4.0) * 0.1);
        float width = 0.002 + film_hash(fi * 1.3) * 0.003;
        float speed = film_hash(fi * 2.1 + 1.0) * 0.6 + 0.2;
        float yFade = fract(uv.y * 1.3 + iTime * speed + fi * 0.37);
        float onOff = step(0.85, film_hash(fi + floor(iTime * 3.0)));
        float line  = smoothstep(width, 0.0, abs(uv.x - xPos));
        scratchAlpha += line * yFade * onOff * (0.4 + film_hash(fi * 5.1) * 0.5);
    }
    col = mix(col, col * 1.6 + vec3(0.12, 0.10, 0.06), scratchAlpha * t);

    float cornerVig = smoothstep(0.5, 2.5, length(vec2(abs(uv.x - 0.5) * 3.0, abs(uv.y - 0.5) * 3.0)));
    col *= 1.0 - cornerVig * t;

    fragColor = vec4(clamp(col, 0.0, 1.0), base.a);
}