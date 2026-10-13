var followchars:Bool = true;
var cantdie:Bool = false;
var vido:Bool = true;

var phillyTrain:BGSprite;
var trainSound:FlxSound;
var ambushSound:FlxSound;
var overlay:BGSprite;
var pass:BGSprite;

var black:BGSprite;
var white:BGSprite;

var swipe:BGSprite;
var bfhurt:BGSprite;

function onLoad(){
	
	game.skipCountdown = true;
	game.precacheList.set('characters/ShadowBF', 'image');
	game.precacheList.set('p5mod ambush', 'image');
	
    var bg:BGSprite = new BGSprite('bg/jokerbgback', 700, 650);
	bg.scale.set(2.5,2.5);
    add(bg);

    phillyTrain = new BGSprite('bg/trainjoker', 7000, 1000);
	phillyTrain.scale.set(2.5,2.5);
    add(phillyTrain);
	
	var floor:BGSprite = new BGSprite('bg/jokerbgground', 700, 650);
	floor.scale.set(2.5,2.5);
    add(floor);
	
	bfhurt = new BGSprite('bg/hurtbf', 1600, 1300, 1.0, 1.0, ['huurt0']);
    bfhurt.animation.addByPrefix('idle', 'huurt', 24, true);
	bfhurt.scale.set(0.8,0.8);
	add(bfhurt);
    bfhurt.animation.play('idle');
	bfhurt.alpha = 0;

    trainSound = new FlxSound().loadEmbedded(Paths.sound('train_passes'));
    FlxG.sound.list.add(trainSound);
	ambushSound = new FlxSound().loadEmbedded(Paths.sound('ambushsfx'));
    FlxG.sound.list.add(ambushSound);

	//foreground
    overlay = new BGSprite('bg/jokerbgover', 700, 650);
	overlay.scale.set(2.5,2.5);
    overlay.alpha = 0.3;
	foreground.add(overlay);
	
	swipe = new BGSprite('bg/gY', 2070, 1350, 1.0, 1.0, ['gay0']);
    swipe.animation.addByPrefix('yoink', 'gay', 24, true);
    swipe.scale.set(2.0,2.0);
	foreground.add(swipe);
	swipe.alpha = 0;
	
	white = new BGSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
    white.cameras = [game.camOther];
	white.alpha = 0;
	add(white);	
	
    black = new BGSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
    black.cameras = [game.camOther];
	black.alpha = 0;
	add(black);
	
	pass = new BGSprite('bg/batonpass', -400, 200);
	pass.cameras = [game.camOther];
	foreground.add(pass);
    
}

function onEvent(name, v1, v2)
{
	switch(name){
		case "shithimself":
			game.triggerEventNote('Play Animation', 'miss', 'dad');
			game.triggerEventNote('Alt Idle Animation', 'dad', '-alt');
		case "camswap":
			FlxTween.tween(game.camHUD, {alpha : 0}, 0.5);
		case "shloop":
			FlxTween.tween(white, {alpha: 1}, 0.1, {
				onComplete: function(twn:FlxTween) {
					FlxTween.tween(white, {alpha : 0}, 0.3);
				}
			});
			swipe.alpha = 1;
			swipe.animation.play('yoink');	
			FlxTween.tween(swipe, {x: 2200}, 0.1, {
				onComplete: function(twn:FlxTween) {
					game.triggerEventNote('Change Character', 'dad', 'shadowbf');
					game.triggerEventNote('Change Character', 'bf', 'joker-playable');
					bfhurt.alpha = 1;
					swipe.destroy();
					game.boyfriend.x = 1000;
					game.dad.x = 2070;
				}
			});
		case "swap":
			ambushSound.play(true);
			FlxTween.tween(game.camHUD, {alpha : 1}, 0.3, {ease: FlxEase.circIn});
			FlxTween.tween(pass, {x : 0}, 1, {ease: FlxEase.elasticOut});
			new FlxTimer().start(2.5, ()->{
				FlxTween.tween(pass, {x : -400}, 1, {ease: FlxEase.elasticOut});
            });
			//to flip da healthbar, thanks fnf weekly
			game.healthBar.angle = 180;
			game.healthBarSide = 1;
			game.iconP1.flipX = true;
			game.iconP2.flipX = true;
			game.health = 0.2;
			if (!ClientPrefs.middleScroll){
				 modManager.queueEase(1066, 1070, "opponentSwap", 1.0, 'quadOut');
			}
		case "zoomers":
			game.defaultCamZoom = v1;
	}
}


//reusing philly.hx for da train
var trainMoving:Bool = false;
var trainFrameTiming:Float = 0;

var trainCars:Int = 8;
var trainFinishing:Bool = false;
var trainCooldown:Int = 0;

function trainStart():Void
{
    trainMoving = true;
    if (!trainSound.playing)
        trainSound.play(true);
}

var startedMoving:Bool = false;

function updateTrainPos():Void
{
    if (trainSound.time >= 4700)
    {
        startedMoving = true;
    }

    if (startedMoving)
    {
        phillyTrain.x -= 400;

        if (phillyTrain.x < -2000 && !trainFinishing)
        {
            phillyTrain.x = -1150;
            trainCars -= 1;

            if (trainCars <= 0)
                trainFinishing = true;
        }


        if (phillyTrain.x < -4000 && trainFinishing)
            trainReset();
    }
}

function trainReset():Void
{
    phillyTrain.x = 7000;
    trainMoving = false;
    trainCars = 8;
    trainFinishing = false;
    startedMoving = false;
}

var time:Float = 0;
function onUpdate(elapsed){
    if (trainMoving)
    {
        trainFrameTiming += elapsed;

        if (trainFrameTiming >= 1 / 24)
        {
            updateTrainPos();
            trainFrameTiming = 0;
        }

    }
}

function onBeatHit(){
    if (!trainMoving)
        trainCooldown += 1;

    if (game.curBeat % 8 == 4 && FlxG.random.bool(30) && !trainMoving && trainCooldown > 8)
    {
        trainCooldown = FlxG.random.int(-4, 0);
        trainStart();
    }

    FlxG.watch.addQuick("trainCooldown", trainCooldown);
    FlxG.watch.addQuick("trainMoving", trainMoving);
}

