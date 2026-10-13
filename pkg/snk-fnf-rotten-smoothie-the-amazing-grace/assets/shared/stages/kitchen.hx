var bg1:FlxSprite;
var bg2:FlxSprite;
var bg3:FlxSprite;
var bg4:FlxSprite;
var bg5:FlxSprite;
var bg6:FlxSprite;
var overlay:FlxSprite;

var hand1:FlxSprite;
var hand2:FlxSprite;
var hand3:FlxSprite;
var hand4:FlxSprite;
var hand5:FlxSprite;

var fruit1:FlxSprite;
var fruit2:FlxSprite;
var fruit3:FlxSprite;
var fruit4:FlxSprite;

var jumpSpeed:Float = -150; 
var gravity:Float = 355; 

var isJumping1:Bool = false;
var isJumping2:Bool = false;
var isJumping3:Bool = false;
var isJumping4:Bool = false;

var chromeOffset:Float = 0.00200;

var speedrope:Float = 20;

var colocum:FlxSprite;
var amazingGraceTxt:FlxText;

var titleTxt:FlxText;

var healthBarP1:FlxSprite;

var cut:PsychVideoSprite;

var fireParticleArray:Array<FlxEmitter> = [];
var glowGradient1:FlxSprite;
var glowGradient2:FlxSprite;

function onLoad() {
    game.skipCountdown = true;

    // 1

    bg1 = new FlxSprite(-940, -350).loadGraphic(Paths.image('backgrounds/kitchen/bg'));
    bg1.scrollFactor.set(1, 1);
    bg1.scale.set(1.5, 1.5);
    bg1.antialiasing = true;
    add(bg1);

    // 2

    bg2 = new FlxSprite(-940, -350).loadGraphic(Paths.image('backgrounds/kitchen/bg3'));
    bg2.scrollFactor.set(1, 1);
    bg2.scale.set(1.6, 1.6);
    bg2.antialiasing = true;
    bg2.alpha = 0.00000001;
    add(bg2);

    bg3 = new FlxSprite(-940, -350).loadGraphic(Paths.image('backgrounds/kitchen/bg4'));
    bg3.scrollFactor.set(1, 1);
    bg3.scale.set(1.6, 1.6);
    bg3.antialiasing = true;
    bg3.alpha = 0.00000001;
    add(bg3);

    /*bg6 = new FlxSprite(-940, -150).loadGraphic(Paths.image('backgrounds/kitchen/bg5'));
    bg6.scrollFactor.set(1, 1);
    bg6.scale.set(1.6, 1.6);
    bg6.antialiasing = true;
    bg6.alpha = 0.00000001;
    add(bg6);*/

    bg6 = new FlxSprite(0, 1175);
    bg6.frames = Paths.getSparrowAtlas('backgrounds/kitchen/fireShit');
    bg6.scrollFactor.set(1, 1);
    bg6.animation.addByPrefix('idle', 'idleReal', 24, true);
    bg6.animation.play('idle');
    bg6.antialiasing = true;
    bg6.alpha = 0.00000001;
    add(bg6);

    bg4 = new FlxSprite(-940, -350).loadGraphic(Paths.image('backgrounds/kitchen/bg1'));
    bg4.scrollFactor.set(1, 1);
    bg4.scale.set(1.6, 1.6);
    bg4.antialiasing = true;
    bg4.alpha = 0.00000001;
    add(bg4);

    bg5 = new FlxSprite(-940, -350).loadGraphic(Paths.image('backgrounds/kitchen/bg2'));
    bg5.scrollFactor.set(1, 1);
    bg5.scale.set(1.6, 1.6);
    bg5.antialiasing = true;
    bg5.alpha = 0.00000001;
    add(bg5);
}

function onCreatePost(){
    gf.visible = false;

    game.comboOffsetCustom = [2050, 700, 2050, 845];

    overlay = new FlxSprite().loadGraphic(Paths.image('backgrounds/kitchen/overlay'));
    overlay.screenCenter();
    overlay.cameras = [camOther];
    if (ClientPrefs.isHardMode)
        overlay.alpha = 0.3;
    else
        overlay.alpha = 0.00000001;
    add(overlay);

    hand1 = new FlxSprite(-1412, 2619);
    hand1.frames = Paths.getSparrowAtlas('backgrounds/kitchen/hand1');
    hand1.scrollFactor.set(0.8, 0.8);
    hand1.animation.addByPrefix('idle', 'hand1 idle', 6, true);
    hand1.animation.play('idle');
    hand1.updateHitbox();
    hand1.flipX = true;
    hand1.scale.set(2.5, 2.5);
    //hand1.alpha = 0.00000001;

    hand2 = new FlxSprite(373, 2797);
    hand2.frames = Paths.getSparrowAtlas('backgrounds/kitchen/hand2');
    hand2.scrollFactor.set(0.9, 0.9);
    hand2.animation.addByPrefix('idle', 'hand2 idle', 6, true);
    hand2.animation.play('idle');
    hand2.updateHitbox();
    hand2.scale.set(2, 2);
    //hand2.alpha = 0.00000001;

    hand3 = new FlxSprite(1560,2557);
    hand3.frames = Paths.getSparrowAtlas('backgrounds/kitchen/hand3');
    hand3.scrollFactor.set(0.9, 0.9);
    hand3.animation.addByPrefix('idle', 'hand3 idle', 6, true);
    hand3.animation.play('idle');
    hand3.scale.set(2.9, 2.9);
    hand3.updateHitbox();
    //hand3.alpha = 0.00000001;

    hand4 = new FlxSprite(-370,2557);
    hand4.frames = Paths.getSparrowAtlas('backgrounds/kitchen/hand4');
    hand4.scrollFactor.set(0.9, 0.9);
    hand4.animation.addByPrefix('idle', 'hand4 idle', 6, true);
    hand4.animation.play('idle');
    hand4.scale.set(3, 3);
    //hand4.alpha = 0.00000001;
    hand4.updateHitbox();

    hand5 = new FlxSprite(485,2557);
    hand5.frames = Paths.getSparrowAtlas('backgrounds/kitchen/hand5');
    hand5.scrollFactor.set(0.9, 0.9);
    hand5.animation.addByPrefix('idle', 'hand5 idle', 6, true);
    hand5.animation.play('idle');
    hand5.scale.set(2.5, 2.5);
    hand5.updateHitbox();
    //hand5.alpha = 0.00000001;
    add(hand5);
    add(hand4);
    foreground.add(hand3);
    foreground.add(hand1);
    add(hand2);

    fruit1 = new FlxSprite(-250, 650).loadGraphic(Paths.image('backgrounds/kitchen/fruit1'));
    fruit1.scrollFactor.set(1, 1);
    fruit1.antialiasing = true;
    fruit1.alpha = 0.00000001;
    fruit1.cameras = [game.camOverlay];
    add(fruit1);

    fruit2 = new FlxSprite(-550, -200).loadGraphic(Paths.image('backgrounds/kitchen/fruit2'));
    fruit2.scrollFactor.set(1, 1);
    fruit2.antialiasing = true;
    fruit2.alpha = 0.00000001;
    fruit2.cameras = [game.camOverlay];
    add(fruit2);

    fruit3 = new FlxSprite(615, -555).loadGraphic(Paths.image('backgrounds/kitchen/fruit3'));
    fruit3.scrollFactor.set(1, 1);
    fruit3.antialiasing = true;
    fruit3.alpha = 0.00000001;
    fruit3.cameras = [game.camOverlay];
    add(fruit3);

    fruit4 = new FlxSprite(1255, 650).loadGraphic(Paths.image('backgrounds/kitchen/fruit4'));
    fruit4.scrollFactor.set(1, 1);
    fruit4.antialiasing = true;
    fruit4.alpha = 0.00000001;
    fruit4.cameras = [game.camOverlay];
    add(fruit4);

    blacky = new FlxSprite().makeGraphic(2820, 1720, FlxColor.BLACK);
    blacky.screenCenter();
    blacky.cameras = [game.camOther];
    blacky.alpha = 0.0001;
    add(blacky);

    blacky2 = new FlxSprite().makeGraphic(2820 * 3, 1720 * 3, FlxColor.BLACK);
    blacky2.screenCenter();
    blacky2.alpha = 0.0001;
    add(blacky2);

    glowGradient1 = new FlxSprite(bg1.x - 1150, bg1.y + 250).loadGraphic(Paths.image('backgrounds/philly/gradient'));
    glowGradient1.setGraphicSize(bg1.width + 2100, bg1.height + 270);
    glowGradient1.updateHitbox();
    glowGradient1.color = 0xffff0000;
    glowGradient1.scrollFactor.set(0.6, 0.6);
    foreground.add(glowGradient1);
    createParticles();

    glowGradient2 = new FlxSprite(bg1.x - 1150, bg1.y + 250).loadGraphic(Paths.image('backgrounds/philly/gradient'));
    glowGradient2.setGraphicSize(bg1.width + 2100, bg1.height + 270);
    glowGradient2.updateHitbox();
    glowGradient2.color = 0xFFff6900;
    glowGradient2.scrollFactor.set(1.2, 1.2);
    foreground.add(glowGradient2);
    createParticles();

    glowGradient2.alpha = glowGradient1.alpha = 0.00001;

    amazingGraceTxt = new FlxText(0, 0, FlxG.width, "amazing  grace", 64);
    amazingGraceTxt.setFormat(Paths.font("Domine-Regular.ttf"), 50, FlxColor.WHITE, FlxTextAlign.CENTER);
    amazingGraceTxt.scrollFactor.set();
    amazingGraceTxt.screenCenter();
    amazingGraceTxt.alpha = 0.00000001;
    amazingGraceTxt.cameras = [game.camOther];
    add(amazingGraceTxt);

    titleTxt = new FlxText(0, 0, FlxG.width, "ANNOYINGORANGE.COM", 64);
    titleTxt.setFormat(Paths.font("CREABBRG.ttf"), 54, FlxColor.WHITE, FlxTextAlign.LEFT);
    titleTxt.scrollFactor.set();
    titleTxt.borderSize = 1.30;
    titleTxt.x = FlxG.width - 590;
    titleTxt.y = FlxG.height - 50;
    titleTxt.alpha = 0.5;
    titleTxt.cameras = [game.camOther];
    add(titleTxt);

    healthBarP1 = new FlxSprite(0, 0).loadGraphic(Paths.image('health'));
    healthBarP1.antialiasing = true;
    healthBarP1.cameras = [game.camHUD];
    healthBarP1.x = game.healthBar.x - 105;
    healthBarP1.y = game.healthBar.y - 69;
    add(healthBarP1);

    game.cameraSpeed = 2.7;
	game.isCameraOnForcedPos = true;
    FlxG.camera.zoom = 0.3;
    game.snapCamFollowToPos(680, 650);
  
    game.camGame.alpha = 0;
    game.camHUD.alpha = 0;

    // SHADERS

    var lowquality = newShader('lowquality');
    //ExUtils.addShader(lowquality, game.camHUD);
    //ExUtils.addShader(lowquality, game.camGame);

    game.healthBarBGG.alpha = 0.00001;

    cut = new PsychVideoSprite();
    cut.load(Paths.video('rottensmoothielyrics'), [PsychVideoSprite.muted]);
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

    // stuff
        if (ClientPrefs.isHardMode) {
            trace('hi');
            game.healthGain -= 0.35;
            game.healthLoss += 0.35;
        }
}

var itime:Float = 0;
var animName:String = "";
var propsY:Float = -100;
var s:Float = 1;
var doHands:Bool = false;

function onUpdate(elapsed){
    s += elapsed;

    if(doHands){
        hand2.y = FlxMath.lerp(hand2.y, propsY + (Math.sin(s) * 30) + 700, CoolUtil.boundTo(1, 0, elapsed * 4));
        hand4.y = FlxMath.lerp(hand4.y, propsY - (Math.sin(s) * 60) - 100, CoolUtil.boundTo(1, 0, elapsed * 6));
        hand5.y = FlxMath.lerp(hand5.y, propsY - (Math.sin(s) * 90) - 150, CoolUtil.boundTo(1, 0, elapsed * 8));
    }

    if (isJumping1) {
        fruit1.velocity.y += gravity * elapsed;
        fruit1.velocity.y = jumpSpeed;
        fruit1.y += fruit1.velocity.y * elapsed;
        FlxTween.tween(fruit1, {x: 1395}, 5);

    }

    if (isJumping2) {
        FlxTween.tween(fruit2, {y: 950}, 5);
        FlxTween.tween(fruit2, {x: 1395}, 5);
    }

    if (isJumping3) {
        FlxTween.tween(fruit3, {y: 950}, 5);
        FlxTween.tween(fruit3, {x: -250}, 5);
    }

    if (isJumping4) {
        fruit4.velocity.y += gravity * elapsed;
        fruit4.velocity.y = jumpSpeed;
        fruit4.y += fruit4.velocity.y * elapsed;
        FlxTween.tween(fruit4, {x: -250}, 5);
    }
}

function popUpLaugh():Void
    {
        var xlaugh:Float;
        var ylaugh:Float;

        xlaugh = FlxG.random.float(dad.x + 850, dad.x + 1660);
        ylaugh = FlxG.random.float(dad.y - 250, dad.y - 100);

        var laughtext:Alphabet = new Alphabet(xlaugh, ylaugh, 'HA!', true, true, 0);
        laughtext.scrollFactor.set();
        laughtext.acceleration.y = 550;
        laughtext.velocity.y -= FlxG.random.int(140, 175);
        laughtext.velocity.x -= FlxG.random.int(0, 10);
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
        case 4:
            game.camGame.alpha = 1;
        case 7:
            FlxG.camera.zoom = 0.35;
        case 9:
            FlxG.camera.zoom = 0.4;
        case 11:
            game.camGame.alpha = 0.0001;
        case 16:
            game.camHUD.alpha = 1;
            game.camGame.alpha = 1;
            FlxG.camera.zoom = 0.45;
            game.isCameraOnForcedPos = false;
        case 272:
            FlxTween.tween(blacky2, {alpha: 0.35}, 0.25);
            game.cameraSpeed = 2.2;
            FlxG.camera.zoom = 0.45;
            game.boyfriendCameraOffset = [-250, 50];
            game.opponentCameraOffset = [0, 50];
        case 280:
            createEvilGhost('down');
        case 282:
            createEvilGhost('up');
        case 284:
            createEvilGhost('left');
        case 286:
            createEvilGhost('right');
        case 296:
            createEvilGhost('left');
        case 300:
            createEvilGhost('down');
        case 302:
            createEvilGhost('left');
        case 316:
            createEvilGhost('right');
        case 332:
            createEvilGhost('down');
        case 400:
            FlxTween.tween(blacky2, {alpha: 0.0001}, 0.25);
            game.boyfriendCameraOffset = [-200, 0];
            game.opponentCameraOffset = [210, 0];
        case 494:
            game.isCameraOnForcedPos = true;
            FlxTween.tween(blacky2, {alpha: 0.35}, 1.5);
            FlxTween.tween(game.camFollow, {x: -500, y: 750}, 1.5, {ease: FlxEase.smootherStepInOut});
        case 514:
            FlxTween.tween(FlxG.camera, {zoom: 0.65}, 0.5, {ease: FlxEase.linear});
            popUpLaugh();
        case 516:
            popUpLaugh();
        case 518:
            popUpLaugh();
        case 520:
            popUpLaugh();
        case 522:
            popUpLaugh();
        case 524:
            popUpLaugh();
        case 528:
            FlxTween.tween(blacky2, {alpha: 0.0001}, 0.25);
            game.isCameraOnForcedPos = false;
        case 774:
            game.defaultCamZoom = 0.65; 
        case 784:
            game.cameraSpeed = 1;
            healthBarP1.alpha = 0.00001;
            game.healthBarBGG.alpha = 1;
            game.healthBarBG.alpha = 0;
            game.healthBar.scale.set(1.05,1.6);
            titleTxt.text = "IHATEANNOYINGORANGE.COM";
            titleTxt.x -= 125;
            game.defaultCamZoom = 0.4; 
            bg1.kill();
            bg2.alpha = 1;
            bg3.alpha = 1;
            bg4.alpha = 1;
            bg5.alpha = 1;
            game.health == 1;
            FlxG.camera.flash(FlxColor.BLACK, 5);
        case 848:
            game.isCameraOnForcedPos = true;
            FlxTween.tween(game.camFollow, {x: 1250, y: 750}, 1.5, {ease: FlxEase.smootherStepInOut});
        case 912:
            game.isCameraOnForcedPos = true;
            FlxTween.tween(game.camFollow, {x: 570, y: 650}, 3, {ease: FlxEase.smootherStepInOut});
            game.defaultCamZoom = 0.35;
			FlxTween.tween(FlxG.camera, {zoom: 0.35}, 3, {ease: FlxEase.smootherStepInOut});
        case 1040:
            game.isCameraOnForcedPos = false;
        case 1280:
            camHUD.alpha = 0.00001;
            camGame.alpha = 0.00001;
            game.camGame.alpha = 0.00001;
            game.healthBarBG.alpha = 0.00001;
            game.healthBarBGG.alpha = 0.00001;
            game.healthBar.alpha = 0.00001;
            game.iconP1.alpha = 0.00001;
            game.iconP2.alpha = 0.00001;
            game.scoreTxt.alpha = 0.00001;
            game.scoreImage.alpha = 0.00001;
            cut.restart([PsychVideoSprite.muted]);
            cut.visible = true;
            game.camHUD.zoom = 1;
            modManager.setValue('alpha', 1, 1);
            game.vocals.volume = 1;       
        case 1551:
            FlxTween.tween(game.camHUD, {alpha: 1}, 2);
        case 1816:
            game.camHUD.alpha = 0.1;
            game.camGame.alpha = 0;
        case 1824:
            modManager.setValue('alpha', 0, 1);
            FlxTween.tween(game.lyricText2, {alpha: 0.00001}, 4.5);
            FlxTween.tween(game.lyricText, {alpha: 0.00001}, 4.5);
            cut.kill();
            game.camGame.alpha = 1;
            game.healthBarBG.alpha = 1;
            game.healthBarBGG.alpha = 1;
            game.healthBar.alpha = 1;
            game.iconP1.alpha = 1;
            game.iconP2.alpha = 1;
            game.scoreTxt.alpha = 1;
            game.scoreImage.alpha = 1;
            canBop = true;
            game.camHUD.alpha = 1;
            game.camGame.alpha = 1;
            bg6.alpha = 1;
            FlxTween.tween(overlay, {alpha: 1}, 4.5,{startDelay: 3.5});
            //FlxTween.tween(bg6, {y: -150}, 5.5, {ease: FlxEase.quadInOut, startDelay: 3.5});
            FlxTween.tween(bg5, {y: 919}, 7.5, {ease: FlxEase.quadInOut, startDelay: 2.5});
            //fireEmitter.start(false);
            game.health == 1;
            game.defaultCamZoom = 0.4; 
            game.cameraSpeed = 2.8;
        case 1898:
            for (particles in fireParticleArray) particles.start(false, 0.02, 0);
            for (gradient in [glowGradient1, glowGradient2]) FlxTween.tween(gradient, {alpha: 0.4}, 0.8);
        case 1904:
            FlxTween.tween(hand1, {y: 915}, 1.5, {ease: FlxEase.quartInOut, startDelay: 0.5});
            FlxTween.tween(hand2, {y: 700}, 1.5, {ease: FlxEase.quartInOut, startDelay: 0.7});
            FlxTween.tween(hand3, {y: 355}, 1.5, {ease: FlxEase.quartInOut, startDelay: 0.9});
            FlxTween.tween(hand4, {y:-300}, 1.5, {ease: FlxEase.quartInOut, startDelay: 1.2});
            FlxTween.tween(hand5, {y:-200}, 1.5, {ease: FlxEase.quartInOut, startDelay: 1.4});
            doHands = true;
        case 1951:
            fruit1.alpha = 1;
            isJumping1 = true;
            FlxTween.tween(fruit1, {angle: 360}, 16.5, {ease: FlxEase.linear});
        case 2080:
            blacky.alpha = 1;
            amazingGraceTxt.alpha = 1;
            canBop = false;
        case 2084:
            blacky.alpha = 0;
            amazingGraceTxt.alpha = 0;
        case 2144:
            fruit2.alpha = 1;
            isJumping2 = true;
            FlxTween.tween(fruit2, {angle: -360}, 16.5, {ease: FlxEase.linear});
        case 2208:
            blacky.alpha = 1;
            amazingGraceTxt.alpha = 1;
            amazingGraceTxt.x += 95;
            amazingGraceTxt.alignment = FlxTextAlign.LEFT;
            amazingGraceTxt.text = "how";
        case 2212:
            amazingGraceTxt.text = "how  sweet";
        case 2216:
            amazingGraceTxt.text = "how  sweet  the";
        case 2220:
            amazingGraceTxt.text = "how  sweet  the  sound.";
        case 2224:
            blacky.kill();
            amazingGraceTxt.kill();
            canBop = true;
        case 2228:
            fruit3.alpha = 1;
            isJumping3 = true;
            FlxTween.tween(fruit3, {angle: 360}, 16.5, {ease: FlxEase.linear});
        case 2288:
            fruit4.alpha = 1;
            isJumping4 = true;
            FlxTween.tween(fruit4, {angle: -360}, 16.5, {ease: FlxEase.linear});
        case 2368:
            game.camHUD.alpha = 0.1;
            game.camGame.alpha = 0;
    }
}

function createParticles()
{
    var particles:FlxEmitter = new FlxEmitter(bg1.x - 50, bg1.y + bg1.height + 255);
	particles.width = bg1.width + 400;
	particles.height = 1;
	particles.launchMode = 1;
	particles.velocity.set(-100, -100, -10, -300, -100, -100, -10, -300);
	particles.acceleration.set(100, -1000, 100, -1000, 200, -2000, 200, -2000);
    particles.scale.set(0.5, 0.5, 1.5, 1.5, 0.5, 0.5, 1.25, 1.25);
	particles.alpha.set(1, 1, 0, 1);
	particles.lifespan.set(1, 5);
	particles.loadParticles(Paths.image('backgrounds/fireparticle'), 125, 0);
    fireParticleArray.push(particles);
	for (e in 0...particles.members.length) 
        particles.members[e].scrollFactor.set(FlxG.random.float(0.8, 1.2), FlxG.random.float(0.8, 1.2));

    if (fireParticleArray == [])
        add(particles);
    else
        foreground.add(particles);
}

function createEvilGhost(data:String)
{
    var spr:Character;

    spr = new Character(dad.x, dad.y, "orangetwo", false);
    spr.alpha = 0.5;
    add(spr);

    spr.playAnim('sing' + data.toUpperCase(), true);

    switch (data)
    {
        case 'left': FlxTween.tween(spr, {x: dad.x - 300}, 0.5, {ease: FlxEase.expoOut});
        case 'down':  FlxTween.tween(spr, {y: dad.y + 300}, 0.5, {ease: FlxEase.expoOut});
        case 'up':  FlxTween.tween(spr, {y: dad.y - 300}, 0.5, {ease: FlxEase.expoOut});
        case 'right': FlxTween.tween(spr, {x: dad.x + 300}, 0.5, {ease: FlxEase.expoOut});
    }
    
    FlxTween.tween(spr, {alpha: 0}, 0.5, {ease: FlxEase.sineInOut, onComplete: tw -> {
        PlayState.instance.remove(spr);
        spr.destroy();
    }});
}

function onBeatHit(){
    if (canBop) {
        if (game.curBeat % 1 == 0)
        {
            game.triggerEventNote("Add Camera Zoom", "", "");
        }
    }
}

function opponentNoteHit()
{
    if (ClientPrefs.isHardMode) {
    if (game.health > 0.015)
        game.health -= (0.010);
    }
}