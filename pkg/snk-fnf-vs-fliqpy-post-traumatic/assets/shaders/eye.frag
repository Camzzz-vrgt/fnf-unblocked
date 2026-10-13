uniform float iEye;

float eyeCurveTop(float x, float open) {
    float arch = max(1.0 - (x - 0.5) * (x - 0.5) * 3.2, 0.0);
    return 0.5 - arch * 0.52 * open;
}
float eyeCurveBot(float x, float open) {
    float arch = max(1.0 - (x - 0.5) * (x - 0.5) * 3.8, 0.0);
    return 0.5 + arch * 0.32 * open;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = openfl_TextureCoordv;
    vec4 game = flixel_texture2D(iChannel0, uv);

    float lidPhase = clamp(iEye / 0.5, 0.0, 1.0);
    float fullPhase = clamp((iEye - 0.5) / 0.5, 0.0, 1.0);

    float topOpen = clamp(lidPhase * 1.15, 0.0, 1.0);
    float botOpen = clamp(lidPhase * 0.90, 0.0, 1.0);

    float topEdge = eyeCurveTop(uv.x, topOpen);
    float botEdge = eyeCurveBot(uv.x, botOpen);

    topEdge = mix(topEdge, -0.1, fullPhase);
    botEdge = mix(botEdge,  1.1, fullPhase);

    float softness = mix(0.045, 0.12, fullPhase);
    float topMask = smoothstep(topEdge, topEdge + softness, uv.y);
    float botMask = smoothstep(botEdge, botEdge - softness, uv.y);
    float eyeMask = topMask * botMask;

    vec3  lidCol = vec3(0.04, 0.03, 0.04);
    float topBlend = smoothstep(topEdge + softness, topEdge + softness * 3.5, uv.y);
    float botBlend = smoothstep(botEdge - softness, botEdge - softness * 3.5, uv.y);
    vec3  skinTint = vec3(0.18, 0.10, 0.08) * (1.0 - topBlend) * topOpen + vec3(0.18, 0.10, 0.08) * (1.0 - botBlend) * botOpen;

    vec3 col = mix(lidCol + skinTint, game.rgb, eyeMask);

    float closed = 1.0 - clamp(iEye * 8.0, 0.0, 1.0);
    col = mix(col, vec3(0.0), closed);

    fragColor = vec4(col, game.a);
}