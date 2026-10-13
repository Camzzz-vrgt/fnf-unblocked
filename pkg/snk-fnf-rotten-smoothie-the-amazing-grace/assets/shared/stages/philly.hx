var phillyLightsColors:Array<FlxColor>;
var phillyWindow:BGSprite;
var phillyStreet:BGSprite;
var blammedLightsBlack:FlxSprite;
var trainSound:FlxSound;
var blacky:FlxSprite;
var lowquality = newShader('lowquality');

var cut:PsychVideoSprite;

function onLoad(){
    game.skipCountdown = true;

    if(!ClientPrefs.lowQuality) {
        var bg:BGSprite = new BGSprite('backgrounds/philly/sky', -100, 0, 0.1, 0.1);
        bg.scale.set(1.45, 1.45);
        add(bg);
    }

    var city:BGSprite = new BGSprite('backgrounds/philly/city', -10, 0, 0.3, 0.3);
    city.setGraphicSize(Std.int(city.width * 0.85));
    city.updateHitbox();
    city.scale.set(1.1, 1.1);
    add(city);

    phillyLightsColors = [0xFF31A2FD, 0xFF31FD8C, 0xFFFB33F5, 0xFFFD4531, 0xFFFBA633];
    phillyWindow = new BGSprite('backgrounds/philly/window', city.x, city.y, 0.3, 0.3);
    phillyWindow.setGraphicSize(Std.int(phillyWindow.width * 0.85));
    phillyWindow.updateHitbox();
    phillyWindow.scale.set(1.1, 1.1);
    add(phillyWindow);
    phillyWindow.alpha = 0;

    blacky = new FlxSprite().makeGraphic(2820, 2420, FlxColor.BLACK);
    blacky.screenCenter();
    blacky.cameras = [game.camOther];
    //blacky.alpha = 0.001;
    add(blacky);

    if(!ClientPrefs.lowQuality) {
        var streetBehind:BGSprite = new BGSprite('backgrounds/philly/behindTrain', -40, 50);
        streetBehind.scale.set(1.1, 1.1);
        add(streetBehind);
    }

    phillyStreet = new BGSprite('backgrounds/philly/street', -40, 50);
    phillyStreet.scale.set(1.4, 1.15);
    add(phillyStreet);   

    cut = new PsychVideoSprite();
    cut.load(Paths.video('annoying cutscene hi tinny'), [PsychVideoSprite.muted]);
    cut.scrollFactor.set();
    add(cut);
    cut.antialiasing = true;
    cut.cameras = [game.camCutscene];
    foreground.add(cut);
    cut.addCallback('onFormat',()->{
        cut.cameras = [game.camCutscene];
        cut.setGraphicSize(FlxG.width, FlxG.height);
        cut.screenCenter();
    });

}

function onCreatePost(){  
    modManager.setValue('miniX', 0.16);
    modManager.setValue('miniY', 0.16);

    modManager.setValue("transform0X", 55, 0);
    modManager.setValue("transform1X", 55, 0);
    modManager.setValue("transform2X", 55, 0);
    modManager.setValue("transform3X", 55, 0);

    modManager.setValue("transform0X", -55, 1);
    modManager.setValue("transform1X", -55, 1);
    modManager.setValue("transform2X", -55, 1);
    modManager.setValue("transform3X", -55, 1);

    modManager.setValue("transform0Y", -30, 0);
    modManager.setValue("transform1Y", -30, 0);
    modManager.setValue("transform2Y", -30, 0);
    modManager.setValue("transform3Y", -30, 0);

    modManager.setValue("transform0Y", -30, 1);
    modManager.setValue("transform1Y", -30, 1);
    modManager.setValue("transform2Y", -30, 1);
    modManager.setValue("transform3Y", -30, 1);

    game.timeBar.visible = false;
    game.timeBarBG.visible = false;
    game.timeTxt.visible = false;

    game.comboOffsetCustom = [830, 450, 800, 600];

    game.cameraSpeed = 1.5;
	game.isCameraOnForcedPos = true;
    game.snapCamFollowToPos(700, 200);

    game.healthBar.scale.set(1.05,1.6);
}

var time:Float = 0;
function onUpdate(elapsed){
    phillyWindow.alpha = FlxMath.lerp(phillyWindow.alpha, 0, CoolUtil.boundTo(elapsed * 3.2, 0, 1));
    // game.boyfriend.angle += 5;
}

var curLight:Int = -1;

function randomizeLights(){
    curLight = FlxG.random.int(0, phillyLightsColors.length - 1, [curLight]);
    phillyWindow.color = phillyLightsColors[curLight];
    phillyWindow.alpha = 1;
}

function onBeatHit(){
    if (game.curBeat % 4 == 0)
    {
        randomizeLights();
    }
}

function deathAnimStart(volume){
    GameOverSubstate.instance.playingDeathSound = true;
}

function deathAnimStartPost(volume){
    trace('script');
    FlxG.sound.music.volume = 0.2;
    var exclude:Array<Int> = [];

    FlxG.sound.play(Paths.sound('annoy/AnnoyingGameOver' + FlxG.random.int(1, 6)), 1, false, null, true, function() {
        if(!GameOverSubstate.instance.isEnding)
        {
            FlxG.sound.music.fadeIn(0.2, 1, 6);
        }
    });
}

function popUpLaugh():Void
    {
        trace("HA!");
        var xlaugh:Float;
        var ylaugh:Float;

        xlaugh = FlxG.random.float(dad.x-75, dad.x + 355);
        ylaugh = FlxG.random.float(dad.y - 100, dad.y + 75);

        var laughtext:FlxSprite = new FlxSprite(xlaugh, ylaugh).loadGraphic(Paths.image('laugh'));
		laughtext.acceleration.y = FlxG.random.int(200, 300);
		laughtext.velocity.y -= FlxG.random.int(140, 160);
		laughtext.velocity.x = FlxG.random.float(-5, 5);
        laughtext.cameras = [game.camGame];
        foreground.add(laughtext);

        laughtext.updateHitbox();

        FlxTween.tween(laughtext, {alpha: 0}, 0.2, {
            onComplete: function(tween:FlxTween)
            {
                laughtext.destroy();
            },
            startDelay: Conductor.crotchet * 0.002
        });
    }

var canBop:Bool = false;

function onStepHit()
{
    switch (curStep) {
        case 64:
            FlxTween.tween(blacky, {alpha: 0.0001}, 5.25, {startDelay: 2.25});
            FlxTween.tween(FlxG.camera, {zoom: 0.69},7, {ease: FlxEase.cubeInOut});
            FlxTween.tween(game.camFollow, {x: 700, y: 480}, 6.5, {ease: FlxEase.smootherStepInOut});
        case 128:
            canBop = true;
            FlxTween.tween(FlxG.camera, {zoom: 0.85}, 0.5, {
            onComplete: function(tween:FlxTween)
                {
                    game.isCameraOnForcedPos = false;
                    FlxG.camera.zoom = 0.85;
                    game.defaultCamZoom = 0.85; 
                },
                ease: FlxEase.linear
             });
            FlxTween.tween(game.camFollow, {x: 450, y: 500}, 0.5, {ease: FlxEase.smootherStepInOut});
        case 184:
            popUpLaugh();
            game.isCameraOnForcedPos = true;
            FlxTween.tween(game.camFollow, {x: 450, y: 500}, 0.1, {ease: FlxEase.smootherStepInOut});
        case 185:
            popUpLaugh();
        case 186:
            popUpLaugh();
        case 187:
            popUpLaugh();
        case 188:
            popUpLaugh();
        case 194:
            game.isCameraOnForcedPos = false;
        case 224:
            game.isCameraOnForcedPos = true;
            FlxTween.tween(game.camFollow, {x: 950, y: 500}, 3, {ease: FlxEase.smootherStepInOut});
        case 244:
            game.isCameraOnForcedPos = false;
        case 304:
            game.cameraSpeed = 1.5;
        case 380:
            popUpLaugh();
        case 381:
            popUpLaugh();
        case 382:
            popUpLaugh();
        case 476:
            game.isCameraOnForcedPos = true;
            FlxG.camera.zoom = 1.0;
            game.defaultCamZoom = 1.0; 
            game.snapCamFollowToPos(450, 500);
        case 480:
            game.snapCamFollowToPos(950, 500);
        case 484:
            game.snapCamFollowToPos(450, 500);
        case 487:
            game.snapCamFollowToPos(950, 500);
        case 492:
            game.snapCamFollowToPos(450, 500);
        case 497:
            game.isCameraOnForcedPos = false;
            game.snapCamFollowToPos(950, 500);
            FlxTween.tween(FlxG.camera, {zoom: 0.95}, 2.5, {
            onComplete: function(tween:FlxTween)
                {
                    FlxG.camera.zoom = 0.95;
                    game.defaultCamZoom = 0.95; 
                },
                ease: FlxEase.linear
             });
        case 528:
            game.cameraSpeed = 1.9;
            FlxG.camera.zoom = 0.85;
            game.defaultCamZoom = 0.85; 
        case 530:
            popUpLaugh();
        case 532:
            popUpLaugh();
        case 534:
            popUpLaugh();
        case 536:
            popUpLaugh();
        case 538:
            popUpLaugh();
        case 540:
            popUpLaugh();
        case 542:
            popUpLaugh();
        case 568:
            popUpLaugh();
            game.isCameraOnForcedPos = true;
            FlxG.camera.zoom = 1.0;
            game.defaultCamZoom = 1.0; 
            game.snapCamFollowToPos(450, 500);
        case 569:
            popUpLaugh();
        case 571:
            game.snapCamFollowToPos(950, 500);
        case 572:
            popUpLaugh();
        case 574:
            popUpLaugh();
            game.snapCamFollowToPos(450, 500);
        case 575:
            popUpLaugh();
        case 578:
            FlxG.camera.zoom = 0.85;
            game.isCameraOnForcedPos = false;
            game.snapCamFollowToPos(950, 500);
        case 616:
            game.isCameraOnForcedPos = true;
            game.snapCamFollowToPos(450, 500);
        case 620:
            popUpLaugh();
        case 621:
            popUpLaugh();
        case 622:
            popUpLaugh();
        case 623:
            popUpLaugh();
        case 625:
            game.isCameraOnForcedPos = false;
            FlxG.camera.zoom = 0.85;
            game.snapCamFollowToPos(950, 500);
        case 633:
            FlxTween.tween(FlxG.camera, {zoom: 1.3}, 0.9, {ease: FlxEase.expoInOut});
        case 636:
            FlxTween.tween(blacky, {alpha: 1}, 0.2);
        case 637:
            cut.restart([PsychVideoSprite.muted]);
            cut.visible = true;
            cut.addCallback('onEnd',()->{
                cut.kill();
                game.camGame.alpha = 1;
                game.healthBarBG.alpha = 1;
                game.healthBarBGG.alpha = 1;
                game.healthBar.alpha = 1;
                game.iconP1.alpha = 1;
                game.iconP2.alpha = 1;
                game.scoreTxt.alpha = 1;
                game.scoreImage.alpha = 1;
            });
            game.camHUD.zoom = 1;
            game.vocals.volume = 1;       
        case 640:
            canBop = false;
            game.camZoomingMult = 0;
            modManager.setValue("transform0X", -1555, 0);
            modManager.setValue("transform1X", -1555, 0);
            modManager.setValue("transform2X", -1555, 0);
            modManager.setValue("transform3X", -1555, 0);
            FlxTween.tween(blacky, {alpha: 0.01}, 0.0001);
            modManager.setValue("transform0X", 655, 1);
            modManager.setValue("transform1X", 655, 1);
            modManager.setValue("transform2X", 655, 1);
            modManager.setValue("transform3X", 655, 1);
            ExUtils.addShader(lowquality, game.camHUD);
            game.healthBarBG.alpha = 0;
            game.healthBar.alpha = 0;
            game.healthBarBGG.alpha = 0;
            game.iconP1.alpha = 0;
            game.iconP2.alpha = 0;
            game.scoreTxt.alpha = 0;   
            game.scoreImage.alpha = 0;
        case 882:
            FlxTween.tween(game.camHUD, {alpha: 0}, 0.65);
        case 895:
            blacky.alpha = 1;
            blacky.y += 1899;
            blacky.height *= 6;
            blacky.cameras = [game.camOther];
            FlxTween.tween(blacky, {y: -3499}, 0.8, {
            onComplete: function(tween:FlxTween)
                {
                    blacky.kill();
                },
             });
        case 896:
            canBop = true;
            game.camZoomingMult = 1;
            FlxTween.tween(FlxG.camera, {zoom: 0.85}, 1.3, {ease: FlxEase.expoOut});
            ExUtils.removeShader(lowquality, game.camHUD);
            FlxG.camera.zoom = 0.85;
            game.defaultCamZoom = 0.85; 
            modManager.setValue("transform0X", 55, 0);
            modManager.setValue("transform1X", 55, 0);
            modManager.setValue("transform2X", 55, 0);
            modManager.setValue("transform3X", 55, 0);

            modManager.setValue("transform0X", -55, 1);
            modManager.setValue("transform1X", -55, 1);
            modManager.setValue("transform2X", -55, 1);
            modManager.setValue("transform3X", -55, 1);
        case 898:
            game.camHUD.alpha = 1;
        case 952:
            popUpLaugh();
            game.isCameraOnForcedPos = true;
            FlxTween.tween(game.camFollow, {x: 450, y: 500}, 0.1, {ease: FlxEase.smootherStepInOut});
        case 953:
            popUpLaugh();
        case 954:
            popUpLaugh();
        case 955:
            popUpLaugh();
        case 956:
            popUpLaugh();
        case 957:
            popUpLaugh();
        case 958:
            popUpLaugh();
        case 962:
            game.isCameraOnForcedPos = false;
        case 1009:
            game.isCameraOnForcedPos = true;
            FlxTween.tween(FlxG.camera, {zoom: 0.95}, 0.1, {ease: FlxEase.expoOut});
            FlxTween.tween(game.camFollow, {x: 320, y: 500}, 0.1, {ease: FlxEase.smootherStepInOut});
        case 1024:
            game.snapCamFollowToPos(950, 500);
        case 1034:
            popUpLaugh();
            FlxTween.tween(game.camFollow, {x: 450, y: 500}, 0.1, {ease: FlxEase.smootherStepInOut});
        case 1035:
            popUpLaugh();
        case 1036:
            popUpLaugh();
        case 1037:
            popUpLaugh();
        case 1038:
            popUpLaugh();
        case 1039:
            popUpLaugh();  
        case 1040:
            popUpLaugh(); 
        case 1040:
            popUpLaugh();          
    }
}

function onBeatHit(){
    if (canBop) {
        if (game.curBeat % 1 == 0)
        {
            game.triggerEventNote("Add Camera Zoom", "", "");
        }
    }
}