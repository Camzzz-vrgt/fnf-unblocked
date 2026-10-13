introLength = 0;

function onSongStart() {
    dad.debugMode = true;
    dad.cameraOffset.x -= 200;
    gf.beatInterval = 2;
    
    camGame.fade(0xFF000000, 10, true, null, true);
    camGame.scroll.x = -450;
    camGame.zoom = defaultCamZoom + 0.2;
    FlxTween.tween(camGame, {zoom: camGame.zoom + 0.1}, 10, {ease: FlxEase.quartOut});
}

function stepHit(s) {
    if (s == 128) {
        dad.debugMode = false;
        dad.cameraOffset.x += 200;
    }
}

var lockedIn:Bool = false;
function locktoggle() {
    lockedIn = !lockedIn;
}

function postUpdate(elapsed:Float) {
    boyfriend.cameraOffset.y = lockedIn ? -60 : -150;
    if (lockedIn && curCameraTarget == 1)
        camGame.zoom = lerp(camGame.zoom, defaultCamZoom + 0.2, 0.04);
}