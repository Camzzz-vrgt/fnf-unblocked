uniform sampler2D maskTexture;
uniform float maskScale;
uniform vec2 maskSize;

uniform vec2 iCameraPos;

void mainImage(out vec4 fragColor, in vec2 fragCoord) {
    vec2 uv = fragCoord.xy / iResolution.xy;
    vec4 texColor = flixel_texture2D(iChannel0, uv);
    
    vec2 camPos = iCameraPos.xy / iResolution.xy;
    vec2 camWorld = vec2(camPos.x, camPos.y);
        
    vec2 maskUV = ((fragCoord.xy - (iResolution.xy * camWorld)) / maskSize) / maskScale + 0.5;
        
    vec4 maskColor = vec4(0.0);
        
    if(maskUV.x >= 0.0 && maskUV.x <= 1.0 && maskUV.y >= 0.0 && maskUV.y <= 1.0) {
        maskColor = flixel_texture2D(maskTexture, maskUV);
    }
    
    float alpha = maskColor.a; 
        
    fragColor = vec4(texColor.rgb, texColor.a * (1.0 - alpha));
}