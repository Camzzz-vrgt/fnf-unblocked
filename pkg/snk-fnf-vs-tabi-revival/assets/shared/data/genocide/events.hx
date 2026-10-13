var lighting:FlxSprite =  new FlxSprite(0, 0).makeSolid(FlxG.width, FlxG.height, FlxColor.RED);
var black:FunkinSprite = new FunkinSprite(-40, -40).makeSolid(FlxG.width * 1.1, FlxG.height * 1.1, FlxColor.BLACK);

function postCreate() {
    lighting.cameras = [camHUD];
    insert(0, lighting);
    lighting.blend = 0;
    lighting.alpha = 0.3;
    
    add(black);
    black.scrollFactor.set();
    black.zoomFactor = 0;
    black.alpha = 0;

    FlxG.camera.zoom = defaultCamZoom = 0.75;
    camFollow.setPosition(650, 400);
    FlxG.camera.snapToTarget();

    gameOverSong = 'tabi game over loop';
    retrySFX = 'tabi game over retry button';
}

function onSongStart(){
    FlxG.camera.zoom = defaultCamZoom = camGame.zoom = 1.5;
    black.alpha = 0;
    remove(black);
    insert(members.indexOf(dad) - 1, black);
    camHUD.fade(FlxColor.BLACK, 19, true);
    FlxTween.tween(FlxG.camera, {zoom: 0.7}, 19, {ease: FlxEase.cubeInOut, onComplete: function(){
        defaultCamZoom = 0.7;
        camZooming = true;
    }});
    camZooming = false;
}

function beatHit(curBeat:Int) {
    switch(curBeat) {
        case 60: 
            bTop.alpha = 1;
            bBot.alpha = 1;
        case 64:
            camFlash(camBars, FlxColor.RED, 2);
        case 192:
            camFlash(camGame, FlxColor.BLACK, 2);
            black.alpha = 0.8;
            if (!Options.lowMemoryMode)
                stage.getSprite('frontflameright').alpha = stage.getSprite('frontflameleft').alpha = 0.1;
        case 224:
            FlxTween.tween(black, {alpha: 0}, 9);
            if (!Options.lowMemoryMode)
                for (a in [stage.getSprite('frontflameright'), stage.getSprite('frontflameleft')])
                    FlxTween.tween(a, {alpha: 0.85}, 9);
        case 256:
            camFlash(camHUD, FlxColor.RED, 2);
        case 384:
            camFlash(camGame, FlxColor.BLACK, 2);
            black.alpha = 0.8;
            stage.getSprite('frontflameright').alpha = stage.getSprite('frontflameleft').alpha = 0.1;
            defaultCamZoom += 0.3;
        case 416:
            FlxTween.num(defaultCamZoom, defaultCamZoom - 0.3, 9, {ease: FlxEase.cubeInOut, onUpdate: (t)->{ defaultCamZoom = t.value; }});
            FlxTween.tween(black, {alpha: 0}, 9);
            for (a in [stage.getSprite('frontflameright'), stage.getSprite('frontflameleft')]){
                FlxTween.tween(a, {alpha: 0.85}, 9);
            }
        case 616:
            finishHealthbar();
            for (a in [accuracyTxt, scoreTxt, missesTxt])
                FlxTween.tween(a, {y: (!downscroll) ? FlxG.height + 200 : -200, angle: FlxG.random.float(-6, 6)}, FlxG.random.float(4, 6), {ease: FlxEase.quartIn});
            for (a in cpuStrums) FlxTween.tween(a, {y: (!downscroll) ? FlxG.height + 200 : -200, angle: FlxG.random.float(-6, 6)}, FlxG.random.float(3, 4.5), {ease: FlxEase.quartIn});
            for (a in playerStrums) FlxTween.tween(a, {y: (!downscroll) ? FlxG.height + 200 : -200, angle: FlxG.random.float(-6, 6)}, FlxG.random.float(3, 4.5), {ease: FlxEase.quartIn});
    }
}

function onDadHit(e) {
    if (health >= 0.1)
        health -= (0.03 * (health + 0.2)) * (e.note.isSustainNote ? 0.75 : 1);
}