function onCreatePost() game.defaultZooms = [0.6, 0.7, 0.8];

function onStepHit()
{
    if (game.curSong == "Evacuate") {
        switch (curStep)
        {
            case 1536:
                FlxTween.tween(game.getLuaObject("spoopyVignette"), {alpha: 1}, 2 / game.playbackRate);

            case 1600:
                game.getLuaObject("spoopyVignette").alpha = 0.001;
                game.getLuaObject("bgEvil").alpha = 1;
                game.getLuaObject("vignette").alpha = 0.001;
                game.defaultZooms = [0.45, 0.6, 0.8];
        }
    }
}

var danced:Bool = false;
function onBeatHit() {
    if (curBeat % 4 == 0) game.getLuaObject("speakers").animation.play("idle", true);

    if (game.getLuaObject("bgEvil").alpha == 1) {
        danced = !danced;
        game.getLuaObject("bgEvil").animation.play(danced ? "danceLeft" : "danceRight", true);
    }
}