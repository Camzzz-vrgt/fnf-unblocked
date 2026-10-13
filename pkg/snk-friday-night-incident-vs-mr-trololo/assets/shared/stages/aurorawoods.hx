function onCreatePost()
{
    game.defaultZooms = [0.475, 0.5, 0.6];

    if (game.curSong == "Aurora") {
        game.getLuaObject("vignette").alpha = 1;
        game.getLuaObject("spoopyVignette").alpha = 1;
    }
}

function onStepHit()
{
    if (game.curSong == "Aurora")
    {
        switch (curStep)
        {
            case 64:
                FlxTween.tween(game.getLuaObject("spoopyVignette"), {alpha: 0.5}, 3 / game.playbackRate);

            case 128:
                game.getLuaObject("spoopyVignette").alpha = 0.001;

            case 376:
                FlxTween.tween(game.getLuaObject("spoopyVignette"), {alpha: 0.75}, 0.5 / game.playbackRate);

            case 384, 640:
                FlxTween.tween(game.getLuaObject("spoopyVignette"), {alpha: 0.001}, 0.5 / game.playbackRate);
        }
    }
}