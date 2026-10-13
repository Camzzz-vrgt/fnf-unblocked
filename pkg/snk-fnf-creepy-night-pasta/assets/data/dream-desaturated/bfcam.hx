import flixel.FlxG.FlxCamera;
import flixel.Math.FlxPoint;

var sillyCamGame:FlxCamera;
var sillyCamGame2:FlxCamera;

function onStepHit(){
    switch(curStep){

    case 1616: //704
        sillyCamGame = new FlxCamera();
        sillyCamGame.copyFrom(game.camGame);
        sillyCamGame.x = 1280;
        sillyCamGame.y = 0;
        sillyCamGame.width = 660;
        sillyCamGame.height = 840;
        sillyCamGame.zoom = 0.9;
    
        sillyCamGame.scroll.x = game.boyfriend.getMidpoint().x - 200;
        sillyCamGame.scroll.x = sillyCamGame.scroll.x - (game.boyfriend.cameraPosition[0] - game.boyfriendCameraOffset[0]);
        sillyCamGame.scroll.y = game.boyfriend.getMidpoint().y - 380;
        sillyCamGame.scroll.y = sillyCamGame.scroll.y + (game.boyfriend.cameraPosition[1] - game.boyfriendCameraOffset[1]);
        sillyCamGame.target = null;
        FlxG.cameras.remove(game.camHUD, false);
        FlxG.cameras.add(sillyCamGame,true);
        FlxG.cameras.add(game.camHUD, false);
        FlxG.cameras.remove(game.camOther, false);    
        FlxG.cameras.add(game.camOther, false);
        FlxTween.tween(sillyCamGame, {x:640, y:0}, 2, {ease: FlxEase.quintOut});

    case 1680: //576
        sillyCamGame2 = new FlxCamera();
        sillyCamGame2.copyFrom(game.camGame);
        sillyCamGame2.x = -660;
        sillyCamGame2.y = 0;
        sillyCamGame2.width = 660;
        sillyCamGame2.height = 840;
        sillyCamGame2.zoom = 0.8;

        sillyCamGame2.scroll.x = game.boyfriend.getMidpoint().x - 1900;
        sillyCamGame2.scroll.x = sillyCamGame2.scroll.x - (game.boyfriend.cameraPosition[0] - game.boyfriendCameraOffset[0]);
        sillyCamGame2.scroll.y = game.boyfriend.getMidpoint().y - 660;
        sillyCamGame2.scroll.y = sillyCamGame2.scroll.y + (game.boyfriend.cameraPosition[1] - game.boyfriendCameraOffset[1]);
        sillyCamGame2.target = null;
        FlxG.cameras.remove(game.camHUD, false);
        FlxG.cameras.add(sillyCamGame2,true);
        FlxG.cameras.add(game.camHUD, false);
        FlxG.cameras.remove(game.camOther, false);    
        FlxG.cameras.add(game.camOther, false);

        FlxTween.tween(sillyCamGame2, {x:0, y:0}, 2, {ease: FlxEase.quintOut});

        case 2128:
            FlxTween.tween(sillyCamGame2, {x:-660, y:0}, 2, {ease: FlxEase.quintOut, onComplete:killing});
            FlxTween.tween(sillyCamGame, {x:1280, y:0}, 2, {ease: FlxEase.quintOut, onComplete:killing});
    
            case 2150:
            FlxG.cameras.remove(sillyCamGame, false);
            FlxG.cameras.remove(sillyCamGame2, false);
    }
}

function killing() {
    sillyCamGame.destroy();
    sillyCamGame2.destroy();
}