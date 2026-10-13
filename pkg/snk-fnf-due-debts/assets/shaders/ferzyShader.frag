#pragma header
uniform float force;

void main() {
    vec2 uv = openfl_TextureCoordv.xy;
    float f = force / 70.0;

    vec3 col;
    col.r = texture2D(bitmap, vec2(uv.x + f, uv.y)).r;
    col.g = texture2D(bitmap, uv).g;
    col.b = texture2D(bitmap, vec2(uv.x - f, uv.y)).b;

    gl_FragColor = vec4(col, texture2D(bitmap, uv).w);
}
