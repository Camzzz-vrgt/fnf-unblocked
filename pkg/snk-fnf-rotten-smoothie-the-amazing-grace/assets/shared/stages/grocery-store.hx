var bg:FlxSprite;
var table:FlxSprite;
var box:FlxSprite;

var fireParticleArray:Array<FlxEmitter> = [];
var glowGradient1:FlxSprite;
var glowGradient2:FlxSprite;

var insideBox:FlxSprite;

var appleArray:Array<FlxSprite> = [];
var cartoonFruits:Array<FlxSprite> = [];

var blackCover:FlxSprite;
var doScaryBlackStuff:Bool = true;

var doOrangeGhosts:Bool = false;
var curGhost:Int = 0;

var tntWarning:FlxSprite;
var cobwebMechanicSprite:FlxSprite;
var webLevel:Int = -1;
var webMashTxt:FlxText;

function onLoad()
{
    // never in my life would i set a position and multiply it like this but i didnt have time kms
    bg = new FlxSprite(-400 * 1.3, -200 * 1.3).loadGraphic(Paths.image('backgrounds/groceryStore/bg'));
    bg.antialiasing = ClientPrefs.globalAntialiasing;
    bg.scrollFactor.set(0.7, 0.7);
    bg.setGraphicSize(Std.int(bg.width * 1.3));
    bg.updateHitbox();
    add(bg);
    glowGradient1 = new FlxSprite(bg.x - 1150, bg.y + 100).loadGraphic(Paths.image('backgrounds/philly/gradient'));
    glowGradient1.setGraphicSize(bg.width + 1800, bg.height + 200);
    glowGradient1.updateHitbox();
    glowGradient1.color = 0xffff0000;
    glowGradient1.scrollFactor.set(0.6, 0.6);
    add(glowGradient1);
    createParticles();

    glowGradient2 = new FlxSprite(bg.x - 1150, bg.y + 100).loadGraphic(Paths.image('backgrounds/philly/gradient'));
    glowGradient2.setGraphicSize(bg.width + 1800, bg.height + 200);
    glowGradient2.updateHitbox();
    glowGradient2.color = 0xFFff6900;
    glowGradient2.scrollFactor.set(1.2, 1.2);
    foreground.add(glowGradient2);
    createParticles();

    insideBox = new FlxSprite(-100, -300).loadGraphic(Paths.image('backgrounds/groceryStore/boxInside'));
    insideBox.antialiasing = ClientPrefs.globalAntialiasing;
    insideBox.scrollFactor.set(0.9, 0.9);
    insideBox.setGraphicSize(Std.int(insideBox.width * 0.75));
    insideBox.updateHitbox();
    add(insideBox);

    var applePos:Array<Array<Int>> = [[726, 180], [726, 180], [806, 180]];
    for (i in 0...3)
    {
        var apple:FlxSprite = new FlxSprite(applePos[i][0], applePos[i][1]).loadGraphic(Paths.image('backgrounds/groceryStore/rotted_apple' + i));
        apple.antialiasing = ClientPrefs.globalAntialiasing;
        apple.alpha = 0.00001;
        apple.cameras = [game.camOverlay];
        apple.ID = i;
        add(apple);
        appleArray.push(apple);
    }
    var fruitNames:Array<String> = ['fruit1', 'fruit5', 'fruit2', 'fruit4', 'fruit3']; //special array for layering
    var fruitPos:Array<Array<Int>> = [[15, 495], [640, 285], [230, 485], [800, 540], [545, 570]];
    for (i in 0...5)
    {
        var fruit:FlxSprite = new FlxSprite(fruitPos[i][0], fruitPos[i][1]);
        fruit.frames = Paths.getSparrowAtlas('backgrounds/groceryStore/' + fruitNames[i]);
	    fruit.animation.addByPrefix('idle', fruitNames[i] + '0', 24, true);
	    fruit.animation.play('idle');
        fruit.antialiasing = ClientPrefs.globalAntialiasing;
        fruit.scrollFactor.set(0.8 + (i * 0.05), 0.8 + (i * 0.05));
        fruit.alpha = 0.00001;
        add(fruit);
        cartoonFruits.push(fruit);
    }

    insideBox.alpha = glowGradient2.alpha = glowGradient1.alpha = 0.00001;
    foreground.add(blackCover = new FlxSprite(bg.x - 100, bg.y - 100).makeGraphic(bg.width + 100, bg.height + 100, FlxColor.BLACK));
    blackCover.blend = 9;

    game.addCharacterToList('orange-spider-1', 1);
    game.addCharacterToList('orange-spider-2', 1);
    game.addCharacterToList('pear-flipped', 0);

    tntWarning = new FlxSprite().loadGraphic(Paths.image('signTNT'));
    tntWarning.antialiasing = ClientPrefs.globalAntialiasing;
    tntWarning.screenCenter();
    tntWarning.alpha = 0.00001;
    tntWarning.cameras = [game.camHUD];
    add(tntWarning);
    cobwebMechanicSprite = new FlxSprite();
    cobwebMechanicSprite.frames = Paths.getSparrowAtlas('cobwebMechanic');
	cobwebMechanicSprite.animation.addByPrefix('appear', 'appear0', 24, false);
	cobwebMechanicSprite.animation.addByPrefix('disappear', 'disappear0', 24, false);
    cobwebMechanicSprite.animation.play('appear');
    cobwebMechanicSprite.antialiasing = ClientPrefs.globalAntialiasing;
    cobwebMechanicSprite.alpha = 0.00001;
    cobwebMechanicSprite.cameras = [game.camOverlay];
	cobwebMechanicSprite.animation.finishCallback = function(name:String) if (name == 'disappear') cobwebMechanicSprite.alpha = 0.00001;
    add(cobwebMechanicSprite);
    
    webMashTxt = new FlxText(0, 0, FlxG.width, "MASH [SPACE] TO BREAK FREE!", 64);
    webMashTxt.setFormat(Paths.font("CREABBRG.ttf"), 64, FlxColor.WHITE, FlxTextAlign.CENTER, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
    webMashTxt.borderSize = 1.30;
    webMashTxt.alpha = 0.00001;
    webMashTxt.cameras = [game.camOverlay];
    webMashTxt.screenCenter();
    add(webMashTxt);
}
function onCreatePost(){
        opponentStrums.cameras = [camGame];
    for(i in 0...opponentStrums.members.length){
		opponentStrums.members[i].scrollFactor.set(1, 1);
	}

    modManager.setValue('transformX', -135, 1);
    if(ClientPrefs.downScroll) 
        modManager.setValue('transformY', -275, 1);
    else 
        modManager.setValue('transformY', 75, 1);

    modManager.setValue('flip', -0.25, 1);
    modManager.setValue('boost', 0.8, 1);
    modManager.setValue('sudden', 0.2, 1);
    modManager.setValue('alpha', 1, 1);
    modManager.setValue('reverse', 1, 1);

    modManager.setValue("transform0Z", 0.30, 1);
    modManager.setValue("transform1Z", 0.20, 1);
    modManager.setValue("transform2Z", 0.10, 1);
    modManager.setValue("transform3Z", 0.01, 1);

    for(i in [playFields, notes]){
        remove(i);
        add(i);
    }

    table = new FlxSprite(-400 * 1.3, 438 * 1.3).loadGraphic(Paths.image('backgrounds/groceryStore/table'));
    table.antialiasing = ClientPrefs.globalAntialiasing;
    table.scrollFactor.set(1, 1);
    table.setGraphicSize(Std.int(table.width * 1.3));
    table.updateHitbox();
    add(table);
    box = new FlxSprite(371 * 1.3, 58 * 1.3).loadGraphic(Paths.image('backgrounds/groceryStore/box'));
    box.antialiasing = ClientPrefs.globalAntialiasing;
    //box.scrollFactor.set(0.95, 0.95); looks weird meh
    box.setGraphicSize(Std.int(box.width * 1.3));
    box.updateHitbox();
    add(box);

    var titleTxt:FlxText = new FlxText(0, 0, FlxG.width, "IHATEANNOYINGORANGE.COM", 64);
    titleTxt.setFormat(Paths.font("CREABBRG.ttf"), 54, FlxColor.WHITE, FlxTextAlign.LEFT);
    titleTxt.scrollFactor.set();
    titleTxt.borderSize = 1.30;
    titleTxt.x = FlxG.width - 590;
    titleTxt.y = FlxG.height - 50;
    titleTxt.x -= 125;
    titleTxt.alpha = 0.5;
    titleTxt.cameras = [game.camOther];
    add(titleTxt);

    FlxG.camera.zoom = 2.15;
    game.boyfriendCameraOffset = [0, 55];
    game.camGame.alpha = 0.00001;

    game.healthBar.scale.set(1.05,1.6);

	if(ClientPrefs.downScroll) {
        game.healthBar.y -= 155;
        game.healthBarBGG.y -= 155;
        game.iconP1.y -= 155;
        game.iconP2.y -= 155;
        game.scoreImage.y -= 155;
        game.scoreTxt.y -= 155;
    } 
    else {
        game.healthBar.y += 155;
        game.healthBarBGG.y += 155;
        game.iconP1.y += 155;
        game.iconP2.y += 155;
        game.scoreImage.y += 155;
        game.scoreTxt.y += 155;
    }

    iconP1.iconOffsets[0] = 50;
    iconP2.iconOffsets[0] = 800;
    iconP2.angle = -90;
    gf.cameras = [game.camOverlay];
    gf.alpha = 0.00001;

    modManager.queueEase(639, 644, "transformX", -650, 'backInOut', 0);

    modManager.queueEase(767, 770, "transformX", 0, 'backInOut', 0);

    modManager.queueEase(252, 256, "transformX", 0, 'backInOut', 0);
    modManager.queueEase(252, 256, "transform0X", 0, 'backInOut', 0);
    modManager.queueEase(252, 256, "transform1X", 0, 'backInOut', 0);
    modManager.queueEase(252, 256, "transform2X", 0, 'backInOut', 0);
    modManager.queueEase(252, 256, "transform3X", 0, 'backInOut', 0);

    modManager.queueEase(1280, 1284, "transformX", -315, 'quadInOut', 0);
    modManager.queueEase(1280, 1284, "transform0X", -95, 'quadInOut', 0);
    modManager.queueEase(1280, 1284, "transform1X", -95, 'quadInOut', 0);
    modManager.queueEase(1280, 1284, "transform2X", 95, 'quadInOut', 0);
    modManager.queueEase(1280, 1284, "transform3X", 95, 'quadInOut', 0);
}
function onSpawnNotePost(dunceNote){
	if(dunceNote.mustPress != true){
        dunceNote.cameras = [camGame];
		dunceNote.scrollFactor.set(1, 1);
        dunceNote.zIndex = 1;
    }
}
function onUpdate(elapsed){
    if (doScaryBlackStuff)
        blackCover.alpha = FlxMath.lerp(blackCover.alpha, 0.8, (1/30)*40*elapsed);

    if (curBeat >= 400 && curBeat < 446)
    {
        if (whosTurn == 'dad')
            game.defaultCamZoom = 1;
        else
            game.defaultCamZoom = 0.7;
    }
    if (webLevel > -1 && FlxG.keys.justPressed.SPACE) //wanted to do dodge keybind :(
        cobwebControls('cut');
}
function onBeatHit()
{
    switch (curBeat)
    {
        case 1:
            FlxTween.tween(FlxG.camera, {zoom: 1.4}, 20.5, {ease: FlxEase.linear});
            game.camGame.alpha = 1;
            game.isCameraOnForcedPos = true;
        case 64:
            doScaryBlackStuff = false;
            blackCover.alpha = 0.25;
            iconP1.angle = -45;
			FlxTween.num(50, -50, 0.75, {ease: FlxEase.elasticOut}, function(num:Float){iconP1.iconOffsets[0] = num;});
            FlxTween.num(150, -60, 0.75, {ease: FlxEase.elasticOut}, function(num:Float){iconP2.iconOffsets[0] = num;});
            FlxTween.tween(iconP1, {angle: 0}, 0.75, {ease: FlxEase.elasticOut});
            FlxTween.tween(iconP2, {angle: 0}, 0.75, {ease: FlxEase.elasticOut, onComplete:function(twn:FlxTween){FlxTween.num(-50, 0, 0.5, {ease: FlxEase.linear}, function(num:Float){iconP1.iconOffsets[0] = iconP2.iconOffsets[0] = num;});}});
            modManager.setValue('alpha', 0.4, 1);
            game.boyfriendCameraOffset = [0, 0];
                    
            if(ClientPrefs.downScroll) {
                FlxTween.tween(game.healthBar, {y: game.healthBar.y + 155}, 0.8, {ease: FlxEase.bounceOut});
                FlxTween.tween(game.healthBarBGG, {y: game.healthBarBGG.y + 155}, 0.8, {ease: FlxEase.bounceOut});
                FlxTween.tween(game.iconP1, {y: game.iconP1.y + 155}, 0.8, {ease: FlxEase.bounceOut});
                FlxTween.tween(game.iconP2, {y: game.iconP2.y + 155}, 0.8, {ease: FlxEase.bounceOut});

                FlxTween.tween(game.scoreTxt, {y: game.scoreTxt.y + 155}, 0.8, {ease: FlxEase.bounceOut, startDelay: 0.25});
                FlxTween.tween(game.scoreImage, {y: game.scoreImage.y + 155}, 0.8, {ease: FlxEase.bounceOut, startDelay: 0.25});
            } 
            else {
                FlxTween.tween(game.healthBar, {y: game.healthBar.y - 155}, 0.8, {ease: FlxEase.bounceOut});
                FlxTween.tween(game.healthBarBGG, {y: game.healthBarBGG.y - 155}, 0.8, {ease: FlxEase.bounceOut});
                FlxTween.tween(game.iconP1, {y: game.iconP1.y - 155}, 0.8, {ease: FlxEase.bounceOut});
                FlxTween.tween(game.iconP2, {y: game.iconP2.y - 155}, 0.8, {ease: FlxEase.bounceOut});

                FlxTween.tween(game.scoreTxt, {y: game.scoreTxt.y - 155}, 0.8, {ease: FlxEase.bounceOut, startDelay: 0.25});
                FlxTween.tween(game.scoreImage, {y: game.scoreImage.y - 155}, 0.8, {ease: FlxEase.bounceOut, startDelay: 0.25});
            }
            game.isCameraOnForcedPos = false;
            doScaryBlackStuff = false;
            blackCover.alpha = 0.25;
            game.cameraSpeed = 2;
            game.health = 1;
        case 80:
            FlxTween.tween(blackCover, {alpha: 1}, 0.8);
        case 82:
            blackCover.alpha = 0.25;
        case 88:
            FlxTween.tween(blackCover, {alpha: 1}, 0.8);
        case 90:
            blackCover.alpha = 0.25;
        case 112:
            FlxTween.tween(blackCover, {alpha: 1}, 0.8);
        case 114:
            blackCover.alpha = 0.25;
        case 120:
            FlxTween.tween(blackCover, {alpha: 1}, 0.8);
        case 122:
            blackCover.alpha = 0.25;
        case 124:
            FlxTween.tween(blackCover, {alpha: 0.8}, 0.75);
        case 126:
            FlxTween.tween(blackCover, {alpha: 1}, 0.75);
        case 128:
            blackCover.alpha = 0.25;
        case 132:
            game.opponentCameraOffset = [-195, 25];
        case 144:
            game.opponentCameraOffset = [0, 0];
            changeOrangePositions(1);
        case 156:
            FlxTween.tween(blackCover, {alpha: 1}, 0.8);
        case 159:
            changeOrangePositions(2);
            modManager.setValue('transformX', 995, 1);
            modManager.setValue("transform3Z", 0.30, 1);
            modManager.setValue("transform2Z", 0.20, 1);
            modManager.setValue("transform1Z", 0.10, 1);
            modManager.setValue("transform0Z", 0.01, 1);
        case 160:            
            game.opponentCameraOffset = [245, 0];
		    game.snapCamFollowToPos(game.getCharacterCameraPos(dad).x, game.getCharacterCameraPos(dad).y);
            blackCover.alpha = 0.25;
            game.defaultCamZoom = camGame.zoom = 1.25;
        case 161:
            game.defaultCamZoom = camGame.zoom = 1.5;
        case 168:
            game.defaultCamZoom = camGame.zoom = 1.25;
        case 169:
            game.defaultCamZoom = camGame.zoom = 1.5;
        case 192:
            FlxTween.tween(blackCover, {alpha: 0.5}, 0.8);
            changeOrangePositions(0);
            game.opponentCameraOffset = [-195, 0];
            modManager.setValue('transformX', -135, 1);
            modManager.setValue("transform0Z", 0.30, 1);
            modManager.setValue("transform1Z", 0.20, 1);
            modManager.setValue("transform2Z", 0.10, 1);
            modManager.setValue("transform3Z", 0.01, 1);
        case 224:
            FlxTween.tween(blackCover, {alpha: 0}, 4.5);
            isCameraOnForcedPos = true;
            FlxTween.tween(game.camFollow, {x: 550, y: 525}, 4.5, {ease: FlxEase.smootherStepInOut});
            FlxTween.tween(game.camGame, {zoom: 0.6}, 4.5, {ease: FlxEase.smootherStepInOut});
            game.defaultCamZoom = 0.6;
        case 239:
            FlxTween.tween(blackCover, {alpha: 1}, 0.4);
        case 240:
            blackCover.alpha = 0;
        case 247:
            FlxTween.tween(blackCover, {alpha: 1}, 0.4);
        case 248:
            blackCover.alpha = 0;
        case 252:
            FlxTween.tween(game.camGame, {zoom: 1}, 1.5);
            game.defaultCamZoom = 1;
            FlxTween.tween(blackCover, {alpha: 1}, 1.5);
        case 256:
            doScaryBlackStuff = true;
        case 284:
            changeOrangePositions(1);
        case 300:
            changeOrangePositions(2);
            game.opponentCameraOffset = [245, 0];
        case 308:
            changeOrangePositions(0);
            game.opponentCameraOffset = [-195, 25];
        case 313:
            doScaryBlackStuff = false;
            FlxTween.tween(game.camFollow, {x: 400, y: 525}, 1.25, {ease: FlxEase.smootherStepInOut});
            FlxTween.tween(game.camGame, {zoom: 0.8}, 1.25, {ease: FlxEase.smootherStepInOut});
            game.defaultCamZoom = 0.8;
            FlxTween.tween(blackCover, {alpha: 0.25}, 1.25, {ease: FlxEase.smootherStepInOut});
        case 318:
            FlxTween.tween(dad, {y: dad.y + 100}, 0.4);
            FlxTween.tween(game.camGame, {zoom: 1.5}, 0.2, {ease: FlxEase.smootherStepInOut});
            game.defaultCamZoom = 1.5;
            FlxTween.tween(game.camFollow, {x: 1000, y: 600}, 0.4);
        case 319:
            FlxG.cameras.shake(0.01, 0.2);
            blackCover.alpha = 1;
        case 320:
            modManager.setValue('alpha', 1, 1);
            game.snapCamFollowToPos(game.getCharacterCameraPos(boyfriend).x, game.getCharacterCameraPos(boyfriend).y);
            blackCover.alpha = 0.25;
            insideBox.alpha = 1;
            table.alpha = 0.00001;
            box.alpha = 0.00001;
            dad.alpha = 0.00001;
            dad.y -= 100;
            game.defaultCamZoom = game.camGame.zoom = 0.9;
        case 324:
            cobwebControls('appear');
            gf.alpha = 1;
        case 336:
            cobwebControls('appear');
        case 352:
            cobwebControls('appear');
        case 360:
            cobwebControls('appear');
        case 368:
            cobwebControls('appear');
        case 376:
            cobwebControls('appear');
        case 380:
            cobwebControls('appear');
        case 384:
            insideBox.alpha = 0.00001;
            modManager.setValue('alpha', 0.3, 1);
            table.alpha = 1;
            box.alpha = 1;
            doOrangeGhosts = true;
            FlxTween.tween(tntWarning, {alpha: 1}, 0.5);
            game.cameraSpeed = 3;
            gf.alpha = 0.00001;
   
            modManager.setValue('transform0X', -135, 1);
            modManager.setValue('transform1X', -135, 1);
            modManager.setValue("transform0Z", 0.30, 1);
            modManager.setValue("transform1Z", 0.20, 1);

            modManager.setValue('transform2X', 995, 1);
            modManager.setValue('transform3X', 995, 1);
            modManager.setValue("transform3Z", 0.30, 1);
            modManager.setValue("transform2Z", 0.20, 1);
        case 388:
            FlxTween.tween(tntWarning, {alpha: 0.00001}, 1.5);            
        case 416:
            for (particles in fireParticleArray) particles.start(false, 0.02, 0);
            for (gradient in [glowGradient1, glowGradient2]) FlxTween.tween(gradient, {alpha: 0.6}, 0.8);
        case 446:
            doOrangeGhosts = false;
            //fix your shit set all dads invisible
            for (i in 0...3) 
            {
                game.dadMap.get('orange-spider-' + i).alpha = 0.00001;
                game.dadMap.get('orange-spider-' + i).color = FlxColor.WHITE;
            }
            changeOrangePositions(1);
            dad.alpha = 1;
            isCameraOnForcedPos = true;
            FlxTween.tween(game.camFollow, {x: 400, y: 500}, 0.3, {ease: FlxEase.smootherStepInOut});
            FlxTween.tween(game.camGame, {zoom: 1.25}, 0.3, {ease: FlxEase.smootherStepInOut});
            game.defaultCamZoom = 1.25;
        case 448:
            game.cameraSpeed = 0.5;
            bg.alpha = table.alpha = box.alpha = boyfriend.alpha = dad.alpha = game.camHUD.alpha = iconP2.alpha = 0.00001;
            blackCover.alpha = 1;
        case 452:
            modManager.setValue('alpha', 1, 1);
            game.health = 2;
            game.healthGain = 0;
            game.healthLoss = 0;
            iconP1.iconOffsets[0] = 50; //later cause icon changes on char change
            rottedAppleStuff(0);
        case 456:
            for (gradient in [glowGradient1, glowGradient2]) 
            {
                gradient.y += 500;
                gradient.height += 600;
            }
            for (particles in fireParticleArray) 
            {
                particles.x -= 600;
                particles.width += 800;
                particles.y += 400;
            }
            rottedAppleStuff(1);
        case 460:
            rottedAppleStuff(2);
        case 462:
            FlxTween.tween(appleArray[2], {alpha: 0.00001}, 0.8);
            game.camZooming = false;
            FlxTween.tween(game, {health: 0.001}, 40);
            FlxTween.tween(game.camGame, {zoom: 0.3}, 40);
            FlxTween.tween(blackCover, {alpha: 0}, 22);
            for (i in [boyfriend, game.camHUD]) FlxTween.tween(i, {alpha: 1}, 1.8, {ease: FlxEase.quadInOut});

        case 472:
            FlxTween.tween(cartoonFruits[4], {alpha: 1}, 0.8, {ease: FlxEase.quadInOut});
        case 480:
            FlxTween.tween(cartoonFruits[2], {alpha: 1}, 0.8, {ease: FlxEase.quadInOut});
        case 488:
            FlxTween.tween(cartoonFruits[3], {alpha: 1}, 0.8, {ease: FlxEase.quadInOut});
        case 496:
            FlxTween.tween(cartoonFruits[1], {alpha: 1}, 0.8, {ease: FlxEase.quadInOut});
        case 504:
            FlxTween.tween(cartoonFruits[0], {alpha: 1}, 0.8, {ease: FlxEase.quadInOut});
        case 531:
            for (i in [boyfriend, game.camHUD, game.camGame]) FlxTween.tween(i, {alpha: 0.00001}, 8);
    }

    //events got too crowded cause of lyrics blehhhh
    if (((curBeat >= 320 && curBeat < 352) || (curBeat >= 368 && curBeat < 384)) && curBeat % 2 == 1)
        game.triggerEventNote('Add Camera Zoom', '0.03', '0.06');

    if ((curBeat >= 320 && curBeat < 384) && curBeat % 4 == 0)
        doRandomSpiderCrawl();

    if (doOrangeGhosts)
    {
        if (curBeat % 2 == 0)
        {
            curGhost = FlxG.random.int(0, 2, [curGhost]);
            changeOrangePositions(curGhost);
        }

        for (i in 0...3)
        {
            var curDad:Character = game.dadMap.get('orange-spider-' + i);
            if (curDad != dad)
            {            
                curDad.alpha = 0.75;
                curDad.color = 0xFF6B3900;
		        if (curBeat % curDad.danceEveryNumBeats == 0 && !curDad.stunned)
		    	    curDad.dance();
            }
            else
            {
                curDad.alpha = 1;
                curDad.color = FlxColor.WHITE;
            }
        }
    }
}

function onStepHit()
{
    if (webLevel > -1)
        game.health -= 0.03;

    if (((curBeat >= 320 && curBeat < 352) || (curBeat >= 368 && curBeat < 384)) && (curStep % 16 == 7 || curStep % 16 == 10 || curStep % 16 == 14))
        game.triggerEventNote('Add Camera Zoom', '', '');
}
function goodNoteHit(note)
{
    if (doScaryBlackStuff && blackCover.alpha > 0.45)
        blackCover.alpha -= 0.1;
}
function opponentNoteHit()
{
    if (doScaryBlackStuff && blackCover.alpha < 0.95)
        blackCover.alpha += 0.05;

    game.camGame.shake(0.005, 0.2);
    game.camHUD.shake(0.0025, 0.2);

    if (game.health > 0.015)
        game.health -= (0.015);
}
function createParticles()
{
    var particles:FlxEmitter = new FlxEmitter(bg.x - 50, bg.y + bg.height);
	particles.width = bg.width + 100;
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
function changeOrangePositions(posNum:Int)
{
    switch (posNum)
    {
        case 0:
            game.triggerEventNote('Change Character', 'dad', 'orange-spider-0');
            game.triggerEventNote('Change Character', 'bf', 'pear');
            //dad.setPosition(game.DAD_X + dad.positionArray[0], game.DAD_Y + dad.positionArray[1]);
            dad.angle = 0;
        case 1:
            game.triggerEventNote('Change Character', 'dad', 'orange-spider-1');
            game.triggerEventNote('Change Character', 'bf', 'pear');
            //dad.setPosition(game.DAD_X + dad.positionArray[0] + 260, game.DAD_Y + dad.positionArray[1] + 110);
            dad.angle = 0;
        case 2:            
            game.triggerEventNote('Change Character', 'dad', 'orange-spider-2');
            game.triggerEventNote('Change Character', 'bf', 'pear-flipped');
            //dad.setPosition(1200, 275);
            dad.angle = 90;
    }
}
function rottedAppleStuff(num:Int)
{
    for (apple in appleArray)
    {
        if (apple.ID == num) 
            apple.alpha = 1;
        else
            apple.alpha = 0.00001;
    }
}
function cobwebControls(func:String)
{
    if (webMashTxt.alpha == 0.00001)
        FlxTween.tween(webMashTxt, {alpha: 1}, 0.5);
    switch (func)
    {
        case 'appear':
        /*    if (webLevel > 0)
            {
                game.health = 0;
                return;
            }*/
            cobwebMechanicSprite.alpha = 1;
            cobwebMechanicSprite.animation.play('appear');
            webLevel = FlxG.random.int(1, 6);
            game.iconP1.changeIcon(boyfriend.healthIcon + '-webbed');
            if (game.cpuControlled)
            {
                new FlxTimer().start(1.5, function(tmr:FlxTimer)
			    {
                    game.health += webLevel * 0.06;
                    cobwebControls('disappear');
			    });
            }
        case 'cut':
            if (webLevel == 0)
                cobwebControls('disappear');
            FlxG.cameras.shake(0.005, 0.2);
            FlxG.sound.play(Paths.sound('cuttingCobweb'), 1);	
            game.health += 0.06;
            --webLevel;
        case 'disappear':
            cobwebMechanicSprite.animation.play('disappear');
            webLevel = -1;
            game.iconP1.changeIcon(boyfriend.healthIcon);
            if (webMashTxt.alpha == 1)
                FlxTween.tween(webMashTxt, {alpha: 0}, 1);
        case 'final':
            /*if (webLevel == 0)
            {
                game.health = 0;
                return;
            }*/
    }
}
var lastCrawledPos:Int = 3;
function doRandomSpiderCrawl()
{
    var pos1:Array<Float> = [0, 0];
    var pos2:Array<Float> = [0, 0];
    var crawlAngle:Int = 0;
    //cool idea but didnt work in practice soz
    //var flipped:Bool = FlxG.random.bool();

    var crawlInt:Int = FlxG.random.int(0, 3, [lastCrawledPos]);
    lastCrawledPos = crawlInt;
    //gf.flipX = false;
    switch (crawlInt)
    {
        case 0: //bottom
            pos1 = [FlxG.width + 50, FlxG.height - gf.height + 80];
            pos2 = [-gf.width - 50, FlxG.height - gf.height + 80];
            gf.idleSuffix = '';
            gf.recalculateDanceIdle();
            gf.dance();
            crawlAngle = 0;
        case 1: //left
            pos1 = [20, FlxG.height + 280];
            pos2 = [20, -gf.height - 280];
            gf.idleSuffix = '-alt';
            gf.recalculateDanceIdle();
            gf.dance();
            crawlAngle = 0;
        case 2: //right
            pos1 = [FlxG.width - gf.width + 100, -gf.height - 350];
            pos2 = [FlxG.width - gf.width + 100, FlxG.height + 350];
            gf.idleSuffix = '-alt';
            gf.recalculateDanceIdle();
            gf.dance();
            crawlAngle = 180;
        case 3: //top
            pos1 = [-gf.width - 50, 30];
            pos2 = [FlxG.width + 50, 30];
            gf.idleSuffix = '';
            gf.recalculateDanceIdle();
            gf.dance();
            crawlAngle = 180;
    }

    //var startPos:Array<Int> = (flipped ? pos1 : pos2);
    //var endPos:Array<Int> = (flipped ? pos2 : pos2);
    var startPos:Array<Float> = pos1;
    var endPos:Array<Float> = pos2;

    gf.setPosition(startPos[0], startPos[1]);
    FlxTween.tween(gf, {x: endPos[0], y: endPos[1]}, FlxG.random.float(0.75, 1.5));
    gf.angle = crawlAngle;
    //gf.flipX = flipped;
}