var curSection = 0;
var stepDev = 0;
var stepTime = 0;

function onSongStart()
{
	addCamZoom(0.03, 0.03);

	PlayState.songLength = 200 * 1000; // Fake Time JIJIJIJA

	stepTime = (60 / bpm) / 4;
}

function onCreate()
{
	PlayState.camZooming = true;
	PlayState.camModulo = 99999999999999999999; // Lmao
}

function onStepHit()
{
	if (curStep % 16 == 0)
	{
		curSection = Math.floor(curStep / 16);
	}

	if (curSection >= 0 && curSection <= 7)
	{
		if (curStep % 8 == 0)
			addCamZoom(0.03, 0.03);
	}

	if (curSection >= 8 && curSection <= 11)
	{
		if (curStep % 16 == 0)
			addCamZoom(0.03, 0.03);
	}

	if (curSection >= 12 && curSection <= 18 || curSection >= 20 && curSection <= 26 || curSection >= 28 && curSection <= 35 || curSection >= 45 && curSection <= 60 || curSection >= 62 && curSection <= 75 || curSection >= 78 && curSection <= 84 || curSection >= 112 && curSection <= 127 || curSection >= 136 && curSection <= 142 || curSection >= 152 && curSection <= 158)
	{
		if (curStep % 4 == 0)
			addCamZoom(0.08, 0.04);
	}

	if (curStep == 440 || curStep == 444 || curStep == 576 || curStep == 582 || curStep == 588 || curStep == 592 ||  curStep == 604|| curStep == 608 || curStep == 614 || curStep == 620 || curStep == 624 || curStep == 630 || curStep == 536 || curStep == 640 || curStep == 646 || curStep == 552 || curStep == 656 || curStep == 662 || curStep == 568 || curStep == 672 || curStep == 678 || curStep == 680 || curStep == 586 || curStep == 688 || curStep == 694 || curStep == 696 || curStep == 702 || curStep == 704 || curStep == 707 || curStep == 710 || curStep == 712 || curStep == 716)
		addCamZoom(0.08, 0.04);

	switch (curStep)
	{
		case 1632:
			FlxTween.tween(FlxG.camera, {zoom: 1.5}, 1, {
				ease: FlxEase.quadInOut,
				onComplete: function(tween)
				{
					PlayState.defaultCamZoom = 1.5;
				}
			});
			var objs = [
				PlayState.healthBar,
				PlayState.healthBarBG,
				PlayState.iconP1,
				PlayState.iconP2,
				PlayState.scoreTxt,
				PlayState.botplayTxt
			];
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 0}, 1);
			}
			fadeDadStrum(0, 1);
			fadeBFStrum(0, 1);
		case 1648:
			FlxTween.tween(PlayState, {songLength: FlxG.sound.music.length}, 15, {ease: FlxEase.circInOut});
			PlayState.addCinematicBars(1);
			FlxTween.tween(FlxG.camera, {zoom: 0.8}, 15, {
				ease: FlxEase.quadInOut,
				onComplete: function(tween)
				{
					PlayState.defaultCamZoom = 0.8;
				}
			});
			fadeBFStrum(1, 1);
		case 1776:
			var objs = [
				PlayState.healthBar,
				PlayState.healthBarBG,
				PlayState.iconP1,
				PlayState.iconP2,
				PlayState.scoreTxt,
				PlayState.botplayTxt
			];
			for (obj in objs)
			{
				FlxTween.tween(obj, {alpha: 1}, 1);
			}

			PlayState.removeCinematicBars(1);

			fadeDadStrum(1, 1);
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