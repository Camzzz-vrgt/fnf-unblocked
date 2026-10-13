import substates.GameOverSubstate;
import backend.MusicBeatState;

var panel:FlxSprite;
var canDie:Bool = true;

function onCreatePost()
{
    panel = new FlxSprite(-210, 180).loadGraphic(Paths.image("songs/bloodlust/panel"));
    panel.cameras = [game.camHUD];
    panel.scale.set(0.55, 0.55);
    game.addBehindBF(panel);

    game.boyfriendGroup.cameras = [game.camHUD];
    game.boyfriendGroup.x = -40;
    game.boyfriendGroup.y = 0;

    if (game.curSong == "Bloodlust") {
        for (i in [game.boyfriendGroup, panel]) i.x -= 500;
        canDie = false;
    }
    game.allowNoteMovement = false;
}

function onGameOver() if (!canDie) return Function_Stop;

function onGameOverStart()
{
    FlxG.camera.followLerp = 1000;
    GameOverSubstate.instance.boyfriend.cameras = [game.camHUD];
}

function onGameOverConfirm()
{
    new FlxTimer().start(0.7, function(tmr:FlxTimer)
	{
		game.camHUD.fade(0xFF000000, 2, false, null, true);
        new FlxTimer().start(2.5, function(tmr:FlxTimer)
	    {
            MusicBeatState.resetState();
        }); // failsafe for some bullshit
	});
}

function tweenPanel()
{
    FlxTween.tween(game.boyfriendGroup, {x: game.boyfriendGroup.x + 500}, 1 / game.playbackRate, {ease: FlxEase.quartOut, onComplete: function (twn) {
        canDie = true;
    }});
    FlxTween.tween(panel, {x: panel.x + 500}, 1 / game.playbackRate, {ease: FlxEase.quartOut});
}

function onUpdatePost(e)
{
    if (game.boyfriend.animation.curAnim.name == "idle" && game.boyfriend.animation.curAnim.curFrame == 0)
        game.triggerEvent("Set Character Camera Offset", "dad", "0, 0");
}

function goodNoteHit(n)
{
    if (!n.isSustainNote && n.noteType != "Bullet Note")
    {
        switch (n.noteData)
        {
            case 0: game.triggerEvent("Set Character Camera Offset", "dad", "-40, 0");
            case 1: game.triggerEvent("Set Character Camera Offset", "dad", "0, 40");
            case 2: game.triggerEvent("Set Character Camera Offset", "dad", "0, -40");
            case 3: game.triggerEvent("Set Character Camera Offset", "dad", "40, 0");
        }
    }
}