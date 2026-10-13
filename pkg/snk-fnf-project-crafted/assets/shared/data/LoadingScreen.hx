//thx flain from Psych Engine Discord server
import flixel.addons.transition.FlxTransitionableState;
import flixel.addons.display.FlxBackdrop;
import flixel.text.FlxText;
import states.LoadingState;

var barWidthReal:Int = 300;

function onCreate()
{
	//game.stateChangeDelay = 2.14; //Force loading screen to stay for atleast 3 seconds, remove this once you're done working on your loading screen unless you're using it for something else.
	
	//barGroup.alpha = 0;
	FlxG.sound.music.stop();

	FlxTransitionableState.skipNextTransIn = true;
    FlxTransitionableState.skipNextTransOut = true;

	/*
	funkay = new FlxSprite(0, 0).loadGraphic(Paths.image('ui/loading/Progress_bar'));
	funkay.antialiasing = ClientPrefs.data.antialiasing;
	funkay.setGraphicSize(0, FlxG.height);
	funkay.updateHitbox();
	addBehindBar(funkay);
	*/
	
	var dirt = new FlxBackdrop(Paths.image('ui/loading/dirt'));
	dirt.antialiasing = false;
	dirt.scale.set(3, 3);
	dirt.updateHitbox();
	addBehindBar(dirt);
	

	function makeShadow(spr:FlxText){
		var shadow = new FlxText(spr.x + spr.size / 10, spr.y + spr.size / 10, spr.width, spr.text, spr.size);
		shadow.setFormat(spr.font, spr.size, FlxColor = 0xFF3e3e3e, spr.alignment);
		shadow.updateHitbox();
		return shadow;
	}

	var loadingText = new FlxText(0, 290, FlxG.width, "Loading", 30);
	loadingText.setFormat(Paths.font("MinecraftRegular.ttf"), 30, FlxColor = 0xFFFFFFFF, "center");
	loadingText.updateHitbox();
	addBehindBar(makeShadow(loadingText));
	addBehindBar(loadingText);

	var initText = new FlxText(0, 360, FlxG.width, "Initializing assets", 30);
	initText.setFormat(Paths.font("MinecraftRegular.ttf"), 30, FlxColor = 0xFFFFFFFF, "center");
	initText.updateHitbox();
	addBehindBar(makeShadow(initText));
	addBehindBar(initText);

	barGroup.y -= 257;
	bar.color = 0xFF80FF80;
	bar.scale.y = 6;
	bar.scale.x = barWidthReal;
	bar.updateHitbox();
	bar.screenCenter(0x01);
	
	//use barGroup.members[0] or barBack instead of barBackground
	barBack.setColorTransform(1.0, 1.0, 1.0, 1.0, 128, 128, 128, 0.0);
	barBack.scale.y = 6;
	barBack.y += 5;
	barBack.scale.x = barWidthReal;
	barBack.updateHitbox();
	barBack.screenCenter(0x01);
	//barBack.alpha = 0;
	

}

function onUpdate(elapsed:Float)
{
	//do something here every frame
	bar.scale.x = barWidthReal * curPercent;
	bar.updateHitbox();
}