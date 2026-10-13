var curSection = 0;
var stepDev = 0;

/*function onCreate () {
    PlayState.blackFuck = new FlxSprite().makeGraphic(1280 * 5, 720 * 5, fromRGB(0,0,0));
    PlayState.blackFuck.alpha = 1;
    PlayState.blackFuck.screenCenter();
    PlayState.add(PlayState.blackFuck);

    PlayState.camHUD.alpha = 0;

    PlayState.addCinematicBars(0.0000000000000000000001);
    
    PlayState.defaultCamZoom -= 0.15;

    duet(0,0);

    PlayState.camZooming = true;
}

function onStepHit()
{
    if (curStep % 16 == 0)
    {
        curSection = Math.floor(curStep / 16);
    }

    if (curSection >= 1 && curSection <= 5)
    {
        if (curStep % 8 == 0)
            addCamZoom(0.03, 0.03);
    }
    if (curSection >= 5 && curSection <= 8)
    {
        if (curStep % 4 == 0)
            addCamZoom(0.03, 0.03);
    }

    if (curSection >= 9 && curSection <= 16)
        {
            if (curStep % 4 == 0)
                addCamZoom(0.08, 0.04);
        }

    switch (curStep) {
        case 1:
            FlxTween.tween(PlayState.blackFuck, {alpha: 0}, 1.78);
            FlxTween.tween(PlayState.camHUD, {alpha: 1}, 1.78);
            FlxTween.tween(PlayState, {defaultCamZoom: PlayState.defaultCamZoom + 0.15}, 1.78);
        case 8:
            duet(-290, 0);
        case 16:
			PlayState.followChars = false;

            PlayState.defaultCamZoom += 0.2;
        case 80:
            PlayState.defaultCamZoom += 0.2;
        
        case 136:
            duet(-250,0);

            PlayState.defaultCamZoom -= 0.45;
        case 144:
			PlayState.followChars = false;

            PlayState.removeCinematicBars(0.5);

            PlayState.defaultCamZoom += 0.15;

    }
}

function duet(xOffset, yOffset) {
    PlayState.camFollow.set((PlayState.dad.getGraphicMidpoint().x + 445) + xOffset, (PlayState.dad.getGraphicMidpoint().y - 50) + yOffset);

	PlayState.followChars = false;
}

function addCamZoom(game, hud)
{
    PlayState.camGame.zoom += game;
    PlayState.camHUD.zoom += hud;
}*/