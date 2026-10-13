// function update(elapsed)
// {
//     camFollow.setPosition(dad.getMidpoint().x + 150, dad.getMidpoint().y - 100);
//     camFollow.x += dad.cameraPosition[0] + opponentCameraOffset[0];
//     camFollow.y += dad.cameraPosition[1] + opponentCameraOffset[1];
// }

import flixel.tween.FlxTween;

var blackBG:FlxSprite;
var centerMode:Bool;
var hideHud:Bool;
var hideOpponentNotes:Bool;
var healthBarAlpha:Float;

function onCreate()
{
    centerMode = ClientPrefs.data.middleScroll;
    ClientPrefs.data.middleScroll = true;

    hideHud = ClientPrefs.data.hideHud;
    ClientPrefs.data.hideHud = true;

    hideOpponentNotes = ClientPrefs.data.opponentStrums;
    ClientPrefs.data.opponentStrums = false;
}

function onCreatePost()
{
    blackBG = new FlxSprite().makeGraphic(10000,10000,FlxColor.WHITE);
    blackBG.color = FlxColor.BLACK;
    blackBG.screenCenter();
    add(blackBG);

    camGame.zoom = 2;

    camGame.angle = -3;
    FlxTween.tween(camGame, {angle: 3}, 5, {ease: FlxEase.sineInOut, type: 4});

    if(ClientPrefs.data.downScroll)
    {
        for(opponent in opponentStrums)
        {
            opponent.y -= 50;
        }
        for(player in playerStrums)
        {
            player.y -= 50;
        }

        botplayTxt.y -= 50;
    }
    else
    {
        for(opponent in opponentStrums)
        {
            opponent.y += 50;
        }
        for(player in playerStrums)
        {
            player.y += 50;
        }

        botplayTxt.y += 50;
    }

    camHUD.alpha = 0;

}

function onSongStart()
{
    FlxTween.tween(blackBG, {alpha: 0}, 10, {startDelay: 1, ease: FlxEase.sineInOut});
    FlxTween.tween(camGame, {zoom: 0.75}, 10, {ease: FlxEase.sineInOut});
    FlxTween.tween(camHUD, {alpha: 1}, 2, {startDelay: 5, ease: FlxEase.sineInOut});
}

function onStepHit()
{
    switch(curStep)
    {
        case 112:
            FlxTween.tween(camGame, {zoom: 1.75}, 2, {ease: FlxEase.sineInOut});
        case 384:
            FlxTween.tween(blackBG, {alpha: 1}, 1, {ease: FlxEase.sineInOut});
        case 400:
            if(hideOpponentNotes)
                for(opponent in opponentStrums)
                {
                    opponent.alpha = 0.35;
                }
            blackBG.alpha = 0;
        case 907:
            blackBG.alpha = 1;
        case 912:
            blackBG.alpha = 0;
        case 1552:
            blackBG.alpha = 1;
        case 1560:
            FlxTween.tween(blackBG, {alpha: 0}, 5, {ease: FlxEase.sineInOut});
        case 1936:
            blackBG.alpha = 1;
        case 1944:
            blackBG.color = FlxColor.RED;
        case 1952:
            blackBG.color = FlxColor.BLACK;
            blackBG.alpha = 0;
            dad.color = FlxColor.fromString("#ff7a7a");
        case 2464:
            dad.color = FlxColor.fromString("#ffffff");
        case 2481:
            blackBG.alpha = 1;
            FlxTween.tween(camHUD, {alpha: 0}, 3, {ease: FlxEase.sineInOut});
            FlxTween.tween(scoreTxt, {alpha: 0}, 3, {ease: FlxEase.sineInOut});
    }
}

function onDestroy()
{
    ClientPrefs.data.middleScroll = centerMode;
    ClientPrefs.data.hideHud = hideHud;
    ClientPrefs.data.opponentStrums = hideOpponentNotes;
}