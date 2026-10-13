import substates.GameOverSubstate;

function onGameOverStart()
{
    FlxG.camera.followLerp = 1000;
    FlxG.camera.zoom = 0.9;
    GameOverSubstate.instance.camFollow.x += 80;
    GameOverSubstate.instance.camFollow.y -= 100;
}