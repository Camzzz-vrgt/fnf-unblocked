#pragma header

uniform float iTime;
uniform float iDepth;
uniform float iWidth;
uniform float iSpeed;

const vec2 EFFECT_SCALE = vec2(6.0, 4.0);

float snowing(in vec2 uv)
{
    const mat3 p = mat3(13.323122, 23.5112, 21.71123,
                        21.1212, 28.7312, 11.9312,
                        21.8112, 14.7212, 61.3934);
    uv.y = 1.0 - uv.y;
    float depth = iDepth;
    float width = iWidth;
    float speed = iSpeed;
    float acc = 0.0;
    float dof = 5.0 * sin(iTime * 0.1);

    float angle = iTime * 2.0;
    float s = sin(angle);
    float c = cos(angle);
    const float cos1 = 0.5403023058681398;
    const float sin1 = 0.8414709848078965;

    // WebGL 1 requires a compile-time loop bound. Legacy always sets
    // `iLayers` to 30, so this preserves the authored visual exactly.
    for (int fi = 0; fi < 30; fi++)
    {
        float fi_f = float(fi);
        vec2 q = uv * (1.0 + fi_f * depth);
        float w = width * fract(fi_f * 7.238917) - width * 0.1 * s;
        q += vec2(q.y * w, speed * iTime / (1.0 + fi_f * depth * 0.03));

        vec3 n = vec3(floor(q), 31.189 + fi_f);
        vec3 m = floor(n) * 0.00001 + fract(n);
        vec3 pm = vec3(dot(p[0], m), dot(p[1], m), dot(p[2], m));
        vec3 r = fract((31415.9 + m) / fract(pm));

        vec2 s_xy = abs(mod(q, 1.0) - 0.5 + 0.9 * r.xy - 0.45);
        s_xy += 0.01 * abs(2.0 * fract(10.0 * q.yx) - 1.0);
        float d = 0.6 * max(s_xy.x - s_xy.y, s_xy.x + s_xy.y) + max(s_xy.x, s_xy.y) - 0.01;
        float edge = 0.05 + 0.05 * min(0.5 * abs(fi_f - 5.0 - dof), 1.0);
        acc += smoothstep(edge, -edge, d) * (r.x / (1.0 + 0.02 * fi_f * depth));

        float new_s = s * cos1 + c * sin1;
        float new_c = c * cos1 - s * sin1;
        s = new_s;
        c = new_c;
    }
    return (acc + acc * acc) / 1.75;
}

void main()
{
    vec4 texColor = flixel_texture2D(bitmap, openfl_TextureCoordv);
    float alpha = snowing(openfl_TextureCoordv.xy * EFFECT_SCALE) * 1.25;
    vec3 flakeColor = texColor.rgb;
    gl_FragColor = vec4(flakeColor * alpha, alpha * texColor.a);
}
