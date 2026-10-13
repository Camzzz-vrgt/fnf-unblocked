import backend.Mods;
import flixel.math.FlxAngle;
import openfl.filters.ShaderFilter;
import psychlua.LuaUtils;
var path:String = "stages/zombie/";
var bg:FlxSprite, vignette:FlxSprite;

var dropShadowBf:ErrorHandledRuntimeShader, dropShadowGf:ErrorHandledRuntimeShader, dropShadowZombie:ErrorHandledRuntimeShader;
var SHADER_DIST:Float = 13;

function onCreate()
{	
	bg = new FlxSprite(-960, -500).loadGraphic(Paths.image(path + "bg"));
	bg.scrollFactor.set(0.9,0.9);
	bg.scale.set(0.9, 0.9);
	bg.updateHitbox();
	game.addBehindGF(bg);
	bg.antialiasing = ClientPrefs.data.antialiasing;

	vignette = new FlxSprite(0, 0).loadGraphic(Paths.image(path + "vignette"));
	vignette.scale.set(1280 / 256, 720 / 256);
	vignette.cameras = [camHUD];
	vignette.blend = 14;
	vignette.alpha = 0.5;
	vignette.updateHitbox();
	vignette.antialiasing = ClientPrefs.data.antialiasing;
	insert(0, vignette);

	initHScript("mods/" + Mods.currentModDirectory + "/scripts/modules/darknessBrightnessEvents.hx");
    triggerEvent("setDarknessBrightnessColors", "0x0c061d", "0xcbd3e7");
	
	/*
	colorShaderBfGf = game.createRuntimeShader('adjustColor');
	colorShaderBfGf.setFloat('brightness', -30);
	colorShaderBfGf.setFloat('contrast', -22);
	colorShaderBfGf.setFloat('saturation', -41);
	colorShaderBfGf.setFloat('hue', -23);
	boyfriend.shader = colorShaderBfGf;
    gf.shader = colorShaderBfGf;

	colorShaderZombie = game.createRuntimeShader('adjustColor');
	colorShaderZombie.setFloat('brightness', -12);
	colorShaderZombie.setFloat('contrast', 3);
	colorShaderZombie.setFloat('saturation', -46);
	colorShaderZombie.setFloat('hue', 40);
	dad.shader = colorShaderZombie;
	*/
}

var dropShadowCamera:FlxCamera;

function onCreatePost() {
	for (i in [[boyfriend, dropShadowBf], [gf, dropShadowGf]]) {

		i[1] = game.createRuntimeShader('dropShadow');
		i[0].shader = i[1];
	
		setShaderValues(i[1]);
	
		i[0].animation.callback = function(name:String, frameNumber:Int, frameIndex:Int)
		{
			if (i[0].shader != null) {
				i[0].shader.setFloatArray('uFrameBounds', [i[0].frame.uv.x, i[0].frame.uv.y, i[0].frame.uv.width, i[0].frame.uv.height]);
				i[0].shader.setFloat('angOffset', i[0].frame.angle * FlxAngle.TO_RAD);
			}
		}
	}

	/**
	 * thx Ledonic for the dropShadow code [https://gamebanana.com/members/3574043]
	 * @see Pico Mix Psych Port [https://gamebanana.com/mods/602865] 
	 * Tankman Erect stage code and Stress (Pico Mix) tankman ending cutscene code 
	 */
	dropShadowZombie = game.createRuntimeShader('dropShadowScreen');
	setShaderValues(dropShadowZombie);
	dropShadowZombie.setBool('useMask', false);
	dropShadowZombie.setFloat('zoom', 1);
	setZombieShaderDist(FlxG.stage.window.width, FlxG.stage.window.height);

	dropShadowCamera = new FlxCamera();
	dropShadowCamera.bgColor = 0x00FFFFFF;
	for (i in [camHUD, camOther]) FlxG.cameras.remove(i, false);
	FlxG.cameras.add(dropShadowCamera, false);
	for (i in [camHUD, camOther]) FlxG.cameras.add(i, false);

	dad.cameras = [dropShadowCamera];
	dropShadowCamera.filters = [new ShaderFilter(dropShadowZombie)];

	setVar('dropShadowCamera', dropShadowCamera);

	// thx riconut
	FlxG.signals.gameResized.add(function (width, height) {
		setZombieShaderDist(width, height);
   });

}

function setZombieShaderDist(width:Int, height:Int) {
	var curScale:Float = Math.min(width / FlxG.width, height / FlxG.height);
	dropShadowZombie.setFloat('dist', SHADER_DIST * curScale);
}

function setShaderValues(shader:ErrorHandledRuntimeShader) {
	shader.setFloat('brightness', -30);
	shader.setFloat('contrast', -22);
	shader.setFloat('saturation', -41);
	shader.setFloat('hue', -23);

	shader.setFloat('ang', 90 * FlxAngle.TO_RAD);
	shader.setFloat('str', 1);
	shader.setFloat('dist', SHADER_DIST);
	shader.setFloat('thr', 0.1);

	shader.setFloat('AA_STAGES', 2);
	shader.setFloatArray('dropColor', [65/255, 61/255, 87/255]);
}


function onUpdatePost() {
	if (dropShadowCamera == null) return;

	dropShadowCamera.scroll.x = camGame.scroll.x;
	dropShadowCamera.scroll.y = camGame.scroll.y;
	dropShadowCamera.zoom = camGame.zoom;
	dropShadowZombie.setFloat('zoom', dropShadowCamera.zoom);

	dropShadowCamera.visible = camGame.visible;
	dropShadowCamera.angle = camGame.angle;
}