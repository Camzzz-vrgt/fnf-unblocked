import backend.Mods;
import flixel.util.FlxTimer;
import openfl.filters.ShaderFilter;
var path:String = "stages/minecraftMovie/";
var sky:FlxSprite;
var back:FlxSprite;
var middle:FlxSprite;
var front:FlxSprite;

var lowQuality:Bool = ClientPrefs.data.lowQuality;
var more3d:Bool = false; 

function onCreate()
{
	more3d = getModSetting("more3d");

	var stageX:Float = -1150;
	var stageY:Float = -820;

	sky = new FlxSprite(stageX + 100, stageY + 140).loadGraphic(Paths.image(path + "sky"));
	sky.scrollFactor.set(0.05,0.05);
	sky.scale.set(1, 1);
	sky.updateHitbox();
	addBehindGF(sky);
	sky.antialiasing = ClientPrefs.data.antialiasing;

	if (!lowQuality) {
		back = new FlxSprite(stageX + 80, stageY + 100).loadGraphic(Paths.image(path + "back"));
		back.scrollFactor.set(0.15,0.15);
		back.scale.set(1, 1);
		back.updateHitbox();
		addBehindGF(back);
		back.antialiasing = ClientPrefs.data.antialiasing;
	
		middle = new FlxSprite(stageX + 60, stageY + 80).loadGraphic(Paths.image(path + "middle"));
		middle.scrollFactor.set(0.4,0.4);
		middle.scale.set(1, 1);
		middle.updateHitbox();
		addBehindGF(middle);
		middle.antialiasing = ClientPrefs.data.antialiasing;
	}

	front = new FlxSprite(stageX, stageY).loadGraphic(Paths.image(path + "front"));
	front.scrollFactor.set(0.9,0.9);
	front.scale.set(1, 1);
	front.updateHitbox();
	addBehindGF(front);
	front.antialiasing = ClientPrefs.data.antialiasing;
	setVar("front", front);

	if (!lowQuality) {
		initHScript("mods/" + Mods.currentModDirectory + "/scripts/modules/darknessBrightnessEvents.hx");
		triggerEvent("setDarknessBrightnessColors", "0x0b0c2f", "0xa8ebff");
	}
}

function onUpdatePost() {
	if (more3d && !lowQuality) {
		var zoomPercent:Float = camGame.zoom / 0.5;
		var valBack:Float = Math.pow(zoomPercent, -0.9);
		var valMiddle:Float = 1 / Math.sqrt(zoomPercent);
		sky.scale.set(1 / zoomPercent, 1 / zoomPercent);
		back.scale.set(valBack, valBack);
		middle.scale.set(valMiddle, valMiddle);
	}
}