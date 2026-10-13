import flixel.math.FlxRect;
import flixel.FlxCamera;

var strumHUD:FlxCamera;

function onCreatePost() {
    strumHUD = new FlxCamera();
    strumHUD.bgColor = 0x00000000;
    for (i in 0...8) {
        game.strumLineNotes.members[i].cameras = [strumHUD];
    }
    for (note in game.unspawnNotes) {
        note.cameras = [strumHUD];
    }
        
    strumHUD.zoom = 0.8;
    
    game.variables.set('strumHUD', strumHUD);
    FlxG.cameras.remove(game.camHUD, false);
    FlxG.cameras.remove(game.camOther, false);
    FlxG.cameras.add(strumHUD,false);
    FlxG.cameras.add(game.camHUD, false);
    FlxG.cameras.add(game.camOther, false);
    game.grpNoteSplashes.cameras = [strumHUD];
}

function onUpdate() {
    strumHUD.alpha = game.camHUD.alpha;
    strumHUD.angle = game.camHUD.angle;
}