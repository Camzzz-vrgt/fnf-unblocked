var curSection = 0;
var stepDev = 0;
var stepTime = 0;

function onSongStart()
{
	addCamZoom(0.020, 0.04);

	PlayState.songLength = 165 * 1000; // Fake Time JIJIJIJA

	stepTime = (60 / bpm) / 4;
}

function onCreate()
{
	PlayState.camZooming = true;
	PlayState.camModulo = 99999999999999999999;

	PlayState.followChars = false;

	PlayState.defaultCamZoom -= 0.15;

	PlayState.triggerEventNote("Camera Follow Pos", "1000", "600");
}

function onStepHit()
{
	switch (curStep)
	{
		case 123:
			PlayState.followChars = true;

			PlayState.defaultCamZoom += 0.15;
		case 174:
			PlayState.followChars = false;

			PlayState.defaultCamZoom -= 0.15;
		case 192:
			PlayState.followChars = true;

			PlayState.defaultCamZoom += 0.15;
		case 784:
			PlayState.followChars = false;

			PlayState.defaultCamZoom -= 0.15;
		case 838:
			PlayState.followChars = true;

			PlayState.defaultCamZoom += 0.15;
		case 854:
			PlayState.followChars = false;

			PlayState.defaultCamZoom -= 0.15;
		case 912:
			PlayState.followChars = true;

			PlayState.defaultCamZoom += 0.15;
		case 960:
			PlayState.followChars = false;

			PlayState.defaultCamZoom -= 0.15;
		case 976:
			PlayState.followChars = true;

			PlayState.defaultCamZoom += 0.15;
		case 1312:
			PlayState.followChars = false;

			PlayState.defaultCamZoom -= 0.15;
		case 331:
			PlayState.addCinematicBars(1);
		case 656:
			PlayState.removeCinematicBars(1);
		case 1051:
			PlayState.addCinematicBars(1);
		case 1184:
			PlayState.removeCinematicBars(1);
		case 1339:
			PlayState.addCinematicBars(1);
		case 1600:
			PlayState.removeCinematicBars(1);
			FlxTween.tween(PlayState.blackFuck, {alpha: 1}, 2);
		case 1712:
			PlayState.followChars = true;
			FlxTween.tween(PlayState.blackFuck, {alpha: 0}, 0.5);
			PlayState.defaultCamZoom += 0.35;
		case 1723:
			PlayState.followChars = false;
			PlayState.camOther.flash();
		case 1728:
			PlayState.defaultCamZoom -= 0.35;
			FlxTween.tween(PlayState, {songLength: FlxG.sound.music.length}, 5, {ease: FlxEase.circInOut});
			PlayState.addCinematicBars(1);
		case 2050:
			FlxTween.tween(FlxG.camera, {zoom: 1.2}, 2);
			FlxTween.tween(PlayState.blackFuck, {alpha: 1}, 2);
	}
}

function fadeDadStrum(alph, time)
{
	PlayState.opponentStrums.forEach(function(spr)
	{
		FlxTween.tween(spr, {alpha: alph}, time);
	});
}

function fadeBfStrum(alph, time)
{
	PlayState.playerStrums.forEach(function(spr)
	{
		FlxTween.tween(spr, {alpha: alph}, time);
	});
}

function addCamZoom(game, hud)
{
	PlayState.camGame.zoom += game;
	PlayState.camHUD.zoom += hud;
}
