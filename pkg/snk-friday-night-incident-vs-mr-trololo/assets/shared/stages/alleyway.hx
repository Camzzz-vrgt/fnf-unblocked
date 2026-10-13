function onCreatePost()
{
    for (i in ["leftLight", "rightLight"]) game.getLuaObject(i).blend = 0;

    game.dadGroup.color = 0xFF000000;
}

function onStepHit()
{
    switch (curStep)
    {
        case 384, 512, 1696, 2208, 2272:
            if (curStep == 1696 || curStep == 2208 || curStep == 2272) {
                game.getLuaObject("leftLight").alpha = 0.75;
                FlxTween.tween(game.getLuaObject("leftLight"), {alpha: 0.375}, 1.75 / game.playbackRate);
            }

            game.getLuaObject("rightLight").alpha = 0.75;
            FlxTween.tween(game.getLuaObject("rightLight"), {alpha: 0.375}, 1.75 / game.playbackRate);

            game.getLuaObject("gradientRight").alpha = 0.25;

        case 632, 636, 640:
            game.getLuaObject("leftLight").visible = true;
            game.dadGroup.color = 0xFFFFFFFF;
            game.getLuaObject("gradientLeft").alpha = 0.35;
            game.getLuaObject("leftLight").alpha = 0.375;

        case 634, 638:
            game.dadGroup.color = 0xFF000000;
            game.getLuaObject("gradientLeft").alpha = 1;
            game.getLuaObject("leftLight").alpha = 0.0001;
            if (curStep == 634) FlxG.sound.play(Paths.sound("carPass"), 0.75);
            if (curStep == 638) FlxTween.tween(game.getLuaObject("car"), {x: game.getLuaObject("car").x - 6500}, 0.35 / game.playbackRate, {ease: FlxEase.circOut});

        case 1184, 1216, 1248, 1280, 1312, 1344, 1376, 1408:
            game.getLuaObject("leftLight").alpha = 0.75;
            FlxTween.tween(game.getLuaObject("leftLight"), {alpha: 0.375}, 1.75 / game.playbackRate);
            game.getLuaObject("rightLight").alpha = 0.75;
            FlxTween.tween(game.getLuaObject("rightLight"), {alpha: 0.375}, 1.75 / game.playbackRate);
    
            game.getLuaObject("gradientRight").alpha = 0.25;

        case 1440:
            game.getLuaObject("gradientLeft").alpha = 0.55;
            game.getLuaObject("gradientRight").alpha = 0.55;
    }
}