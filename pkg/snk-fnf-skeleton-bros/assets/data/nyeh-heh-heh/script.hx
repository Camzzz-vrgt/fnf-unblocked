var curSection = 0;
var stepDev = 0;
var stepTime = 0;
var bounce = false;

function onStepHit()
{
	if (curStep % 16 == 0)
	{
		curSection = Math.floor(curStep / 16);
	}

	if (curSection >= 0 && curSection <= 3)
	{
		if (curStep % 8 == 0)
			addCamZoom(0.03, 0.03);
	}

	if (curSection >= 4 && curSection <= 15)
	{
		if (curStep % 4 == 0)
			addCamZoom(0.03, 0.03);
	}

	if (curSection >= 16 && curSection <= 22 || curSection >= 24 && curSection <= 38)
	{
		if (curStep % 4 == 0)
			addCamZoom(0.08, 0.04);
	}

	if (curSection >= 40 && curSection <= 51)
	{
		if (curStep % 4 == 0)
			addCamZoom(0.15, 0.08);
	}

	switch (curStep)
	{
		case 80:
			PlayState.defaultCamZoom += 0.1;
		case 112:
			PlayState.defaultCamZoom += 0.1;
		case 88:
			PlayState.defaultCamZoom -= 0.1;
		case 121:
			PlayState.defaultCamZoom -= 0.1;
		case 144:
			PlayState.defaultCamZoom += 0.1;
		case 160:
			PlayState.defaultCamZoom -= 0.1;
		case 176:
			PlayState.defaultCamZoom += 0.1;
		case 192:
			PlayState.defaultCamZoom -= 0.1;
		case 208:
			PlayState.defaultCamZoom += 0.1;
		case 224:
			PlayState.defaultCamZoom -= 0.1;
		case 240:
			PlayState.defaultCamZoom += 0.1;
		case 248:
			PlayState.defaultCamZoom += 0.1;
		case 256:
			PlayState.defaultCamZoom -= 0.3;

			PlayState.camOther.flash();

			bounce = true;
		case 368:
			FlxTween.tween(PlayState.camHUD, {alpha: 0}, 1);
			PlayState.defaultCamZoom += 0.5;

			bounce = false;

			FlxTween.tween(PlayState.camHUD, {y: 0}, stepTime * 2, {ease: FlxEase.sineIn});
		case 384:
			FlxTween.tween(PlayState.camHUD, {alpha: 1}, 1);
			PlayState.defaultCamZoom -= 0.4;

			bounce = true;
		case 512:
			PlayState.followChars = false;

			PlayState.camFollow.set(PlayState.dad.getGraphicMidpoint().x + 470, PlayState.dad.getGraphicMidpoint().y - 10);

			PlayState.defaultCamZoom -= 0.2;
		case 576:
			PlayState.followChars = true;

			PlayState.defaultCamZoom += 0.2;
		case 623:
			PlayState.cameraSpeed = 1000000;
		case 624:
			var objs = [
				PlayState.healthBar,
				PlayState.healthBarBG,
				PlayState.iconP1,
				PlayState.iconP2,
				PlayState.timeBar,
				PlayState.timeBarBG,
				PlayState.timeTxt,
				PlayState.botplayTxt
			];
			PlayState.opponentStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			for (obj in objs)
			{
				obj.visible = false;
			}

			bounce = false;
		case 625:
			PlayState.cameraSpeed = 1;

			PlayState.followChars = false;

			PlayState.camFollow.set(PlayState.dad.getGraphicMidpoint().x + 470, PlayState.dad.getGraphicMidpoint().y - 30);

			PlayState.defaultCamZoom -= 0.4;

			PlayState.addCinematicBars(1.5);
			
			PlayState.sansTrombon.animation.play('troll', false);
			PlayState.sansTrombon.visible = true;
		case 626:
			PlayState.defaultCamZoom += 0.2;

		case 640:
			var objs = [
				PlayState.healthBar,
				PlayState.healthBarBG,
				PlayState.iconP1,
				PlayState.iconP2,
				PlayState.timeBar,
				PlayState.timeBarBG,
				PlayState.timeTxt
			];
			PlayState.opponentStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			for (obj in objs)
			{
				obj.visible = true;
			}

			bounce = true;

			PlayState.papsLight.animation.play('party', true);
			PlayState.papsLight.visible = true;

			PlayState.followChars = true;

			PlayState.defaultCamZoom += 0.2;
		case 641:
			PlayState.sansTrombon.visible = false;
		case 760:
			PlayState.opponentStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			for (obj in objs)
			{
				obj.visible = false;
			}
		case 770:
			PlayState.opponentStrums.forEach(function(spr)
			{
				objs.push(spr);
			});
			for (obj in objs)
			{
				obj.visible = true;
			}
		case 832:
			PlayState.removeCinematicBars(1);
		case 892:
			bounce = false;

			PlayState.papsLight.visible = false;

			PlayState.defaultCamZoom += 0.1;

			FlxTween.tween(PlayState.camHUD, {y: 0}, stepTime * 2, {ease: FlxEase.sineIn});
	}

	if (bounce)
	{
		if (curStep % 4 == 0)
		{
			FlxTween.tween(PlayState.camHUD, {y: -20}, stepTime * 2, {ease: FlxEase.circOut});
			FlxTween.tween(PlayState.camGame.scroll, {y: -60}, stepTime * 2, {ease: FlxEase.sineIn});
		}
		if (curStep % 4 == 2)
		{
			FlxTween.tween(PlayState.camHUD, {y: 10}, stepTime * 2, {ease: FlxEase.sineIn});
			FlxTween.tween(PlayState.camGame.scroll, {y: 10}, stepTime * 2, {ease: FlxEase.sineIn});
		}
	}
}

function onCreate()
{
	PlayState.camZooming = true;
	PlayState.camModulo = 99999999999999999999; // lmao
}

function onSongStart()
{
	addCamZoom(0.03, 0.03);

	stepTime = (60 / bpm) / 4;
}

function addCamZoom(game, hud)
{
	PlayState.camGame.zoom += game;
	PlayState.camHUD.zoom += hud;
}
