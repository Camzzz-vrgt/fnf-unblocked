import backend.Mods;
import openfl.filters.ShaderFilter;

var path:String = "stages/steve/";
//minimum zoom = 0.5
var sky:FlxSprite;
var clouds:FlxSprite;
var clouds2:FlxSprite;
var under:FlxSprite;
var back:FlxSprite;
var front:FlxSprite;
var add:FlxSprite;

var colorShader;
var colorShaderSky;


var loadingObjs = [];

var lowQuality:Bool = ClientPrefs.data.lowQuality;
var more3d:Bool = false; 

function onCreate()
{
	more3d = getModSetting("more3d");

	sky = new FlxSprite(-900, -240).loadGraphic(Paths.image(path + "sky"));
	sky.scrollFactor.set(0, 0);
	sky.scale.set(0.8, 0.8);
	sky.updateHitbox();
	game.addBehindGF(sky);
	sky.antialiasing = ClientPrefs.data.antialiasing;
	
	
	clouds = new FlxSprite(-680, -280).loadGraphic(Paths.image(path + "clouds"));
	clouds.scrollFactor.set(0.1, 0.1);
	clouds.scale.set(0.8, 0.8);
	clouds.velocity.set(30, 0);
	clouds.updateHitbox();
	game.addBehindGF(clouds);
	loadingObjs.push(clouds);
	clouds.antialiasing = ClientPrefs.data.antialiasing;
	clouds2 = new FlxSprite(-680 - 2200, -280).loadGraphic(Paths.image(path + "clouds"));
	clouds2.scrollFactor.set(0.1, 0.1);
	clouds2.scale.set(0.8, 0.8);
	clouds2.velocity.set(30, 0);
	clouds2.updateHitbox();
	game.addBehindGF(clouds2);
	clouds2.antialiasing = ClientPrefs.data.antialiasing;
	loadingObjs.push(clouds2);
	
	under = new FlxSprite(-700, -400).loadGraphic(Paths.image(path + "under"));
	under.scrollFactor.set(0.2,0.2);
	under.scale.set(0.8, 0.8);
	under.updateHitbox();
	game.addBehindGF(under);
	under.antialiasing = ClientPrefs.data.antialiasing;
	loadingObjs.push(under);
	
	back = new FlxSprite(-880, -400).loadGraphic(Paths.image(path + "back"));
	back.scrollFactor.set(0.35,0.35);
	back.scale.set(0.9, 0.9);
	back.updateHitbox();
	game.addBehindGF(back);
	back.antialiasing = ClientPrefs.data.antialiasing;
	loadingObjs.push(back);
	
	front = new FlxSprite(-1000, -600).loadGraphic(Paths.image(path + "front"));
	front.scrollFactor.set(0.95,0.95);
	front.scale.set(1, 1);
	front.updateHitbox();
	game.addBehindGF(front);
	front.antialiasing = ClientPrefs.data.antialiasing;
	loadingObjs.push(front);

	initHScript("mods/" + Mods.currentModDirectory + "/scripts/modules/darknessBrightnessEvents.hx");
    triggerEvent("setDarknessBrightnessColors", "0x532c08", "0xfffdd1");

	
	add = new FlxSprite(0, 0).loadGraphic(Paths.image(path + "add"));
	add.scrollFactor.set(0, 0);
	add.scale.set(2/3, 2/3);
	add.blend = "add";
	add.cameras = [camHUD];
	add.updateHitbox();
	add(add);

	/*
	loadingObjs.push(boyfriendGroup);
	loadingObjs.push(gfGroup);
	loadingObjs.push(dadGroup);
	*/
	loadingObjs.push(boyfriend);
	loadingObjs.push(gf);
	loadingObjs.push(dad);
	
	if (!PlayState.chartingMode)
	for (i in loadingObjs) {
	    i.alpha = 0;
	}

	colorShader = game.createRuntimeShader('adjustColor');
	colorShader.setFloat('brightness', 0);
	colorShader.setFloat('contrast', 0);
	colorShader.setFloat('saturation', 0);
	colorShader.setFloat('hue', 0);
	for (i in loadingObjs) {
		i.shader = colorShader;
	}

	colorShaderSky = game.createRuntimeShader('adjustColor');
	colorShaderSky.setFloat('brightness', 0);
	colorShaderSky.setFloat('contrast', 0);
	colorShaderSky.setFloat('saturation', 0);
	colorShaderSky.setFloat('hue', 0);
	sky.shader = colorShaderSky;
}

var chartingMode:Bool = false;
function onCreatePost() {
	chartingMode = PlayState.chartingMode;
}

var loaded:Bool = false;
var loadTime:Float = 0.7;
var elapsedTime:Float = 0;
function onUpdate(elapsed:Float)
{
	if (!loaded && !chartingMode) {
		if (elapsedTime > loadTime) loaded = true;

		elapsedTime += elapsed;
		for (i in 0...loadingObjs.length)
			if (loadingObjs[loadingObjs.length - 1 - i].alpha != 1 && elapsedTime > loadTime * (i + 1) / loadingObjs.length)
				loadingObjs[loadingObjs.length - 1 - i].alpha = 1;
	}
}

function onUpdatePost() {
	if (more3d && !lowQuality) {
		var zoomPercent:Float = camGame.zoom / 0.6;

		var valSky:Float = Math.pow(zoomPercent, -0.95);
		var valClouds:Float = Math.pow(zoomPercent, -0.9);
		var valUnder:Float = Math.pow(zoomPercent, -0.85);
		var valBack:Float = Math.pow(zoomPercent, -0.8);

		clouds.origin.x = sky.origin.x -680 - clouds.x;
		clouds2.origin.x = sky.origin.x -680 - clouds2.x;

		sky.scale.set(valSky, valSky);
		clouds.scale.set(valClouds, valClouds);
		clouds2.scale.set(valClouds, valClouds);
		under.scale.set(valUnder, valUnder);
		back.scale.set(valBack, valBack);

	}
}

function onBeatHit()
{
	if (clouds.x > -680 + 2200)   clouds.x -= 2200 * 2;
	if (clouds2.x > -680 + 2200) clouds2.x -= 2200 * 2;
}

function onEvent(ev:String, v1:String, v2:String, time:Float){
    switch ev {
        case "setColorShaderDramatic":
            colorShader.setFloat('brightness', -63);
			colorShader.setFloat('contrast', -26);
			colorShader.setFloat('saturation', -36);
			colorShader.setFloat('hue', -47);

			colorShaderSky.setFloat('brightness', -100);
			colorShaderSky.setFloat('contrast', -83);
			colorShaderSky.setFloat('saturation', 32);
			colorShaderSky.setFloat('hue', 171);
        case "setColorShaderNormal":
            colorShader.setFloat('brightness', 0);
			colorShader.setFloat('contrast', 0);
			colorShader.setFloat('saturation', 0);
			colorShader.setFloat('hue', 0);

			colorShaderSky.setFloat('brightness', 0);
			colorShaderSky.setFloat('contrast', 0);
			colorShaderSky.setFloat('saturation', 0);
			colorShaderSky.setFloat('hue', 0);
    }
}