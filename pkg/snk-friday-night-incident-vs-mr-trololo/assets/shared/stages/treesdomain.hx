function onCreatePost() {
    if (game.curSong == "Screaming Tree") game.getLuaObject('spookyDark').alpha = 1;

    game.defaultZooms = [0.375, 0.7, 1.5];
}

function onStepHit()
{
    if (game.curSong == "Screaming Tree")
    {
        switch (curStep)
        {
            case 32:
                FlxTween.tween(game.getLuaObject("spookyDark"), {alpha: 0}, 0.6 / game.playbackRate);
        }
    }
}

function onGameOverStart() {
    FlxG.camera.followLerp *= 4;
    game.defaultCamZoom = 1.5;
    FlxTween.tween(FlxG.camera, {zoom: 1.5}, 3.5, {ease: FlxEase.expoOut});
}