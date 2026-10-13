

var shader2 = new CustomShader("perspective");
var bumpThing:Bool = false;

function create() {
    gf.beatInterval = 2;
}

// an event? to change the camera zoom? how preposterous!!! guards... SEIZE HIM!!!
function stepHit(step) {
    switch (step) {
        case 65: defaultCamZoom += 0.1;
        case 96:
            defaultCamZoom += 0.1;
            boyfriend.cameraOffset.y += 100;
        case 128:
            defaultCamZoom -= 0.2;
            boyfriend.cameraOffset.y -= 100;
        case 640:
            defaultCamZoom += 0.1;
            bumpThing = true;
            if (Options.gameplayShaders)
                camGame.addShader(shader2);
        case 760:
            camZoomingInterval = 999;
            bumpThing = false;
            camGame.angle = camHUD.angle = 0;
            defaultCamZoom -= 0.1;
        case 768:
            bumpThing = true;
            defaultCamZoom += 0.1;
        case 896:
            defaultCamZoom -= 0.1;
            bumpThing = false;
        case 1152: defaultCamZoom -= 0.05;
        case 1184: defaultCamZoom += 0.15;
        case 1440: defaultCamZoom -= 0.1;
    }
}

function beatHit(beat:Int) {
    if (bumpThing) {
        thing = 2;
        camGame.angle = beat % 2 == 0 ? 1 : -1;
        camHUD.angle = beat % 2 == 0 ? -2 : 2;
        flick();
    }
}

var thing:Float = 2;
function postUpdate(elapsed:Float) {
    thing = lerp(thing, 0, 0.06);
    shader2.depth = thing;
    camGame.angle = lerp(camGame.angle, 0, 0.15);
    camHUD.angle = lerp(camHUD.angle, 0, 0.04);
}

function flick() {
    for (i => strum in cpu.members) {
        strum.y = 80;
        FlxTween.tween(strum, {y: 50}, 0.23, {ease: FlxEase.backOut, startDelay: 0.03 * i});
    }

    for (i => strum in player.members) {
        strum.y = 80;
        FlxTween.tween(strum, {y: 50}, 0.23, {ease: FlxEase.backOut, startDelay: 0.03 * (3 - i)});
    }
}