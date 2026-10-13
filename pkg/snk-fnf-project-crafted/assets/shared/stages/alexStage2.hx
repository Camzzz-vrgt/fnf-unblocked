import backend.Mods;
import flixel.util.FlxTimer;
import openfl.filters.ShaderFilter;
import psychlua.LuaUtils;
import psychlua.HScript;

var path:String = "stages/alex/";
var bg:FlxSprite;
var bg3d:FlxSprite;

var brightness:FlxSprite;
var darkness:FlxSprite;



var colorShader;

var dadOriginalPos = [0, 0];
var gfOriginalPos = [0, 0];
var bfOriginalPos = [0, 0];

function onCreate()
{
	bg = new FlxSprite(-960, -500).loadGraphic(Paths.image(path + "bg"));
	bg.scrollFactor.set(0.9,0.9);
	bg.scale.set(0.9, 0.9);
	bg.updateHitbox();
	addBehindGF(bg);
	bg.antialiasing = ClientPrefs.data.antialiasing;

    bg3d = new FlxSprite(0, 0).loadGraphic(Paths.image(path + "bg3d"));
	bg3d.scrollFactor.set(1, 1);
	bg3d.scale.set(1, 1);
	bg3d.updateHitbox();
	addBehindGF(bg3d);
	bg3d.antialiasing = false;
    bg3d.alpha = 0;

    //darkness brightness
    initHScript("mods/" + Mods.currentModDirectory + "/scripts/modules/darknessBrightnessEvents.hx");
    triggerEvent("setDarknessBrightnessColors", "0x240b11", "0xfaf9de");
    //var darknessBrightnessEvents:HScript = new HScript(null, "mods/" + Mods.currentModDirectory + "/scripts/modules/darknessBrightnessEvents.hx");
    //var darknessBrightnessEvents.call("setAdjustColorShader", [remap("objs", 0), remap("objs", 1), remap("objs", 2), remap("objs", 3)]);
	
	colorShader = game.createRuntimeShader('adjustColor');
	colorShader.setFloat('brightness', 0);
	colorShader.setFloat('contrast', 0);
	colorShader.setFloat('saturation', 0);
	colorShader.setFloat('hue', 0);
	boyfriend.shader = gf.shader = dad.shader = colorShader;
}

function onCreatePost()
{
    addCharacterToList("alex3d", 1);
    addCharacterToList("gf3d", 2);
    addCharacterToList("bf3d", 0);
    
    dadOriginalPos[0] = dadGroup.x;
    dadOriginalPos[1] = dadGroup.y;
    gfOriginalPos[0] = gfGroup.x;
    gfOriginalPos[1] = gfGroup.y;
    bfOriginalPos[0] = boyfriendGroup.x;
    bfOriginalPos[1] = boyfriendGroup.y;

    
    //setOnScripts("changeStageTo3d", function() {changeStageTo3dFunc();});
    //setOnScripts("changeStageTo2d", function() {changeStageTo2dFunc();});
    /*
    setOnScripts("doDarknessTwn", function(amount:Float, duration:Float, easeType:FlxEase) {doDarknessTwnFunc(amount, duration, easeType);});
    */
    //setOnScripts("doBrightnessTwn", function(amount:Float, duration:Float, easeType:FlxEase) {doBrightnessTwnFunc(amount, duration, easeType);});
}


function changeStageTo3d()
{
    bg3d.alpha = 1;
    triggerEvent("Change Character", "dad", "alex3d");
    triggerEvent("Change Character", "gf", "gf3d");
    triggerEvent("Change Character", "bf", "bf3d");
    
    dadGroup.x = 230;
    dadGroup.y = -205;
    gfGroup.x = 125;
    gfGroup.y = -200;
    gfGroup.scrollFactor.set(1, 1);
    boyfriendGroup.x = 630;
    boyfriendGroup.y = -220;
    
    //nc_reloadTargets();
    triggerEvent("nc_reload_targets", "", "");

    //fixes incorrect opponent camera offsets
    //nc_reloadTargets() doesn't work properly for some reason
    nc_set_target("opp", 500, 370); 

    //neoCam camera follow on note change
    game.setOnLuas("offset_radius", 8/2.5);
}

function changeStageTo2d()
{
    bg3d.alpha = 0;
    triggerEvent("Change Character", "dad", PlayState.SONG.player2);
    triggerEvent("Change Character", "gf", PlayState.SONG.gfVersion);
    triggerEvent("Change Character", "bf", PlayState.SONG.player1);
    
    dadGroup.x = dadOriginalPos[0];
    dadGroup.y = dadOriginalPos[1];
    gfGroup.x = gfOriginalPos[0];
    gfGroup.y = gfOriginalPos[1];
    gfGroup.scrollFactor.set(0.95, 0.95);
    boyfriendGroup.x = bfOriginalPos[0];
    boyfriendGroup.y = bfOriginalPos[1];

    //nc_reloadTargets();
    triggerEvent("nc_reload_targets", "", "");

    //neoCam camera follow on note change
    game.setOnLuas("offset_radius", 8);
}



function onEvent(ev:String, v1:String, v2:String, time:Float){
    switch ev {
        case "changeStageTo3d":
            changeStageTo3d();
        case "changeStageTo2d":
            changeStageTo2d();
    }
}