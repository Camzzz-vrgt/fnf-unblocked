#pragma header

uniform vec3 color;
uniform float amount;
uniform float strength;

void main() {
    vec2 uv = openfl_TextureCoordv;
    vec4 flixelColor = flixel_texture2D(bitmap, uv);

    float safeStrength = max(strength, 0.0001);
    vec3 col = pow(max(flixelColor.rgb, vec3(0.0)), vec3(1.0 / safeStrength));

    float vignette = mix(1.0, 1.0 - amount, distance(uv, vec2(0.5)));
    col = pow(max(mix(col * color, col, vignette), vec3(0.0)), vec3(safeStrength));

    gl_FragColor = vec4(col, flixelColor.a);
}
