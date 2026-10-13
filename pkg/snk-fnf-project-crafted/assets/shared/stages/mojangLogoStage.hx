import backend.CoolUtil;
import backend.Mods;
import flixel.util.FlxTimer;
import openfl.filters.ShaderFilter;
import psychlua.LuaUtils;
var path:String = "stages/mojangLogo/";
var mojangLogo:FlxSprite;
var shadow:FlxSprite;

var backBox:FlxSprite;
var back:FlxSprite;
var front:FlxSprite;

var lowQuality:Bool = ClientPrefs.data.lowQuality;
var more3d:Bool = false; 

var colorShaderGf;

function onCreate()
{	
    more3d = getModSetting("more3d");

    //no 17bucks
    camGame.bgColor = FlxColor.BLACK;

    
	mojangLogo = new FlxSprite(-518, -340).loadGraphic(Paths.image(path + "mojangLogo"));
	mojangLogo.scrollFactor.set(0.2, 0.2);
	mojangLogo.scale.set(1.2, 1.2);
	mojangLogo.antialiasing = ClientPrefs.data.antialiasing;
	mojangLogo.updateHitbox();
	game.addBehindGF(mojangLogo);

    //gf.scale.set(0.9, 0.9);
    //gf.color = 0xFF929292;
    gfGroup.scrollFactor.set(0.65, 0.65);
    colorShaderGf = game.createRuntimeShader('adjustColor');
	colorShaderGf.setFloat('brightness', -20);
	colorShaderGf.setFloat('contrast', -80);
	colorShaderGf.setFloat('saturation', 0);
	colorShaderGf.setFloat('hue', 0);
    gf.shader = colorShaderGf;

    if (!lowQuality) {
        // fixes mojang logo being visible under the background amoguses in some parts of the song
        backBox = new FlxSprite(80, 550).makeGraphic(820, 200, FlxColor.BLACK);
        backBox.scrollFactor.set(0.8, 0.8);
        backBox.updateHitbox();
        game.addBehindGF(backBox);

        back = new FlxSprite(-230, 230);
        back.frames = Paths.getSparrowAtlas(path + "back");
        back.animation.addByPrefix("idle", "back", 24, false);
        back.scrollFactor.set(0.8, 0.8);
        back.antialiasing = ClientPrefs.data.antialiasing;
        back.updateHitbox();
        //back.scale.set(0.75, 0.75);
        game.addBehindDad(back);
    }

    shadow = new FlxSprite(-900, -710).loadGraphic(Paths.image(path + "shadow"));
	shadow.scrollFactor.set(0.925, 0.925);
	shadow.scale.set(1.5, 1.5);
	shadow.antialiasing = ClientPrefs.data.antialiasing;
	shadow.updateHitbox();
	game.addBehindGF(shadow);
    shadow.flipX = true;

    if (!lowQuality) {
        front = new FlxSprite(-560 + 120, 320);
        front.frames = Paths.getSparrowAtlas(path + "front");
        front.animation.addByPrefix("idle", "front", 24, false);
        front.scrollFactor.set(1.25, 1.25);
        front.antialiasing = ClientPrefs.data.antialiasing;
        front.updateHitbox();
        front.origin.y -= 200;
        game.add(front);

        setVar("front", front);

        backBox.visible = back.visible = front.visible = false;
    }


    
    
    if (!lowQuality) {
        initHScript("mods/" + Mods.currentModDirectory + "/scripts/modules/darknessBrightnessEvents.hx");
        triggerEvent("setDarknessBrightnessColors", "0x000000", "0xffffff");
    }
}

function onCreatePost() { 
    addCharacterToList("gf-crafted-concerned", 2);
    gfMap.get("gf-crafted-concerned").shader = colorShaderGf;
}

/*
function onCountdownTick(tick:Countdown, counter:Int){
    switch(tick)
    {
        case Countdown.ONE:
            bgBump();
    }
}

function onSongStart() {
    bgBump();
}
*/

var beatSpeed:Int = 2;
function onBeatHit() {
    if (curBeat % beatSpeed == 0)
        bgBump();
}

function bgBump() {
    if (!lowQuality && back.visible) {
        back.animation.play("idle");
        front.animation.play("idle");
    }
}

function onUpdatePost() {
    if (!lowQuality && more3d) {
        var zoom:Float = camGame.zoom;//game.getLuaObject("nczg").x;
        var zoomMojangLogo:Float = 1.2 / Math.sqrt(zoom / 0.5);
        
        mojangLogo.scale.set(zoomMojangLogo, zoomMojangLogo);
        if (front.visible) front.scale.set(zoom / 0.75, zoom / 0.75);
    }
}

function onEvent(ev:String, v1:String, v2:String, time:Float){
    switch ev {
        case "bgSet":
            mojangLogo.y = Std.parseFloat(v1);
        case "bgTwn":
            FlxTween.tween(mojangLogo, { y: -340 }, v1, { ease: FlxEase.quadInOut });
        case "Set GF Speed":
            beatSpeed = 2 * Std.parseInt(v1);
        case "spawn":
            triggerEvent("Change Character", "gf", "gf-crafted-concerned");
            if (back != null && front != null) {
                backBox.visible = back.visible = front.visible = true;
            }
    }
}