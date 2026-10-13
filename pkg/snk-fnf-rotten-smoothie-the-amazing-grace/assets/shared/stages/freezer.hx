// var bgBlack:FlxSprite;
var bgWhite:FlxSprite;
var frozenFruits:Array<FlxSprite> = [];
var bgP1:FlxSprite;
var lightP1:FlxSprite;
var fg1P1:FlxSprite;
var fg2P1:FlxSprite;
var overlayP1:FlxSprite;
var bgP2:FlxSprite;
var overlayLightP2:FlxSprite;
var overlayNegativeSpace:FlxSprite;
var overlayDarkP2:FlxSprite;
var snowstormEffect:FlxSprite;
var snowing:Bool = false;
var snowOverride:Bool = true;
var snowCooldown:Int = FlxG.random.int(-4, 0);
var blackCover:FlxSprite;

function onLoad()
{
	// add(bgBlack = new FlxSprite(-500, -300).makeGraphic(1200, 1400, FlxColor.RED));
	add(bgWhite = new FlxSprite(700, -300).makeGraphic(1200, 1400, FlxColor.WHITE));

	var fruitAnimNames:Array<String> = ['lil apple', 'orange', 'pear'];
	var fruitOffsetXThing:Array<Int> = [0, -50, 0];
	for (i in 0...3)
	{
		fruit = new FlxSprite();
		fruit.frames = Paths.getSparrowAtlas('backgrounds/freezer/FruitsBnW_Assets');
		fruit.antialiasing = ClientPrefs.globalAntialiasing;
		fruit.animation.addByPrefix('idle', fruitAnimNames[i] + '0', 24, true);
		fruit.animation.addByPrefix('frozen', fruitAnimNames[i] + ' corrosed0', 24, true);
		fruit.animation.play('idle');
		fruit.setPosition((bgWhite.x - (fruit.width / 2)) + fruitOffsetXThing[i], bgWhite.y + bgWhite.height);
		add(fruit);
		frozenFruits.push(fruit);
	}

	bgP1 = new FlxSprite(-900, -600).loadGraphic(Paths.image('backgrounds/freezer/bg-p1'));
	bgP1.antialiasing = ClientPrefs.globalAntialiasing;
	bgP1.scrollFactor.set(1, 1);
	add(bgP1);
	lightP1 = new FlxSprite(200, -550).loadGraphic(Paths.image('backgrounds/freezer/light-p1'));
	lightP1.antialiasing = ClientPrefs.globalAntialiasing;
	lightP1.scrollFactor.set(0.3, 1);
	foreground.add(lightP1);
	fg1P1 = new FlxSprite(-900, -600).loadGraphic(Paths.image('backgrounds/freezer/fg1-p1'));
	fg1P1.antialiasing = ClientPrefs.globalAntialiasing;
	fg1P1.scrollFactor.set(1.2, 1.2);
	foreground.add(fg1P1);
	fg2P1 = new FlxSprite(-400, 600).loadGraphic(Paths.image('backgrounds/freezer/fg2-p1'));
	fg2P1.antialiasing = ClientPrefs.globalAntialiasing;
	fg2P1.scrollFactor.set(1.6, 1.6);
	foreground.add(fg2P1);
	overlayP1 = new FlxSprite(-900, -600).loadGraphic(Paths.image('backgrounds/freezer/overlay-p1'));
	overlayP1.antialiasing = ClientPrefs.globalAntialiasing;
	overlayP1.scrollFactor.set(0.3, 1);
	overlayP1.origin.x = overlayP1.width / 2;
	foreground.add(overlayP1);

	bgP2 = new FlxSprite(-900, -600).loadGraphic(Paths.image('backgrounds/freezer/bg-p2'));
	bgP2.antialiasing = ClientPrefs.globalAntialiasing;
	bgP2.scrollFactor.set(1, 1);
	bgP2.setGraphicSize(Std.int(bgP2.width * 1.25));
	bgP2.updateHitbox();
	add(bgP2);
	overlayDarkP2 = new FlxSprite(-1100, -600).loadGraphic(Paths.image('backgrounds/freezer/overlay-dark-multiply-new-p2'));
	overlayDarkP2.antialiasing = ClientPrefs.globalAntialiasing;
	overlayDarkP2.scrollFactor.set(0.3, 1);
	overlayDarkP2.blend = MULTIPLY;
	overlayDarkP2.setGraphicSize(Std.int(overlayDarkP2.width * 1.25));
	overlayDarkP2.updateHitbox();
	foreground.add(overlayDarkP2);

	overlayLightP2 = new FlxSprite(-610, -485).loadGraphic(Paths.image('backgrounds/freezer/overlay-light-p2'));
	overlayLightP2.antialiasing = ClientPrefs.globalAntialiasing;
	overlayLightP2.scrollFactor.set(0, 1);
	// overlayLightP2.blend = 0;
	overlayLightP2.setGraphicSize(Std.int(overlayLightP2.width * 1.25));
	overlayLightP2.updateHitbox();
	// foreground.add(overlayLightP2);

	overlayNegativeSpace = new FlxSprite(-1100, -600).loadGraphic(Paths.image('backgrounds/freezer/overlay-negative-space-p2'));
	overlayNegativeSpace.antialiasing = ClientPrefs.globalAntialiasing;
	overlayNegativeSpace.scrollFactor.set(0.3, 1);
	// overlayNegativeSpace.blend = 0;
	overlayNegativeSpace.setGraphicSize(Std.int(overlayNegativeSpace.width * 1.25));
	overlayNegativeSpace.updateHitbox();
	foreground.add(overlayNegativeSpace);

	bgP2.alpha = overlayDarkP2.alpha = overlayLightP2.alpha = overlayNegativeSpace.alpha = 0.00001;

	snowstormEffect = new FlxSprite(-1000, -600);
	snowstormEffect.frames = Paths.getSparrowAtlas('backgrounds/freezer/SnowWind_Overlay');
	snowstormEffect.antialiasing = ClientPrefs.globalAntialiasing;
	snowstormEffect.animation.addByPrefix('idle', 'idle', 24, true);
	snowstormEffect.animation.play('idle');
	snowstormEffect.setGraphicSize(Std.int(snowstormEffect.width * 2));
	snowstormEffect.updateHitbox();
	snowstormEffect.alpha = 0.00001;
	foreground.add(snowstormEffect);

	foreground.add(blackCover = new FlxSprite(bgP2.x, bgP2.y).makeGraphic(bgP2.width, bgP2.height, FlxColor.BLACK));
}

function onCreatePost()
{
	game.camHUD.alpha = 0.00001;
}

function onSongStart()
{
	FlxTween.tween(blackCover, {alpha: 0.00001}, 6.8);
	camGame.zoom = 2;
	game.defaultCamZoom = 1;
	FlxTween.tween(camGame, {zoom: 1}, 8, {ease: FlxEase.quadIn});
	game.cameraSpeed = 100;
}

function onUpdate(elapsed)
{
	if (snowstormEffect.alpha > 0 && game.health > 0.25)
		game.health -= (0.0025 * snowstormEffect.alpha);
}

function onBeatHit()
{
	switch (curBeat)
	{
		case 13:
			game.cameraSpeed = 1;
			FlxTween.tween(game.camFollow, {x: game.getCharacterCameraPos(dad).x, y: game.getCharacterCameraPos(dad).y}, 1.55,
				{ease: FlxEase.smootherStepInOut});
		case 130:
			bgP1.alpha = lightP1.alpha = fg1P1.alpha = fg2P1.alpha = overlayP1.alpha = 0.00001;
			bgP2.alpha = overlayNegativeSpace.alpha = 1;
			overlayDarkP2.alpha = 1;
			overlayLightP2.alpha = 1;
		case 172:
			FlxTween.tween(blackCover, {alpha: 1}, 1);
			FlxTween.tween(game.camGame, {zoom: 2}, 1);
			game.defaultCamZoom = 2;
		case 176:
			FlxTween.tween(blackCover, {alpha: 0}, 2);
			FlxTween.tween(game.camGame, {zoom: 1}, 2);
			game.defaultCamZoom = 1;
		case 188:
			FlxTween.tween(blackCover, {alpha: 1}, 2);
		case 192:
			game.cameraSpeed = 100;
			FlxTween.cancelTweensOf(snowstormEffect);
			snowOverride = true;
			game.defaultCamZoom = camGame.zoom = 0.55;
			snowstormEffect.alpha = 0.00001;
			blackCover.alpha = bgP2.alpha = overlayNegativeSpace.alpha = overlayDarkP2.alpha = overlayLightP2.alpha = 0.00001;
		case 228:
			game.cameraSpeed = 1;
			FlxTween.tween(snowstormEffect, {alpha: 1}, 16.25);
		case 244:
			frozenFruitEvent(0, true);
		case 246:
			frozenFruitEvent(0, false);
		case 248:
			frozenFruitEvent(1, true);
		case 250:
			frozenFruitEvent(1, false);
		case 252:
			frozenFruitEvent(2, true);
		case 254:
			frozenFruitEvent(2, false);
		case 260:
			bgP2.alpha = overlayNegativeSpace.alpha = 1;
			overlayDarkP2.alpha = 1;
			overlayLightP2.alpha = 0.5;
			blackCover.alpha = 1;
		case 264:
			blackCover.alpha = 0.00001;
		case 334:
			game.camGame.fade(FlxColor.WHITE, 0.75, true, null, true);
		case 340:
			FlxTween.tween(blackCover, {alpha: 1}, 5);
	}

	// might have just copy pasted philly train code lol!
	if (!snowOverride)
	{
		snowCooldown += 1;
		if (curBeat % 4 == 0 && FlxG.random.bool(50) && snowCooldown > 8)
			doSnowstorm();
	}
}

function onStepHit()
{
	switch (curStep)
	{
		case 124:
			game.defaultCamZoom = camGame.zoom = 1.2;
		case 126:
			snowOverride = false;
			game.defaultCamZoom = camGame.zoom = 1.6;
		case 252:
			game.defaultCamZoom = camGame.zoom = 1;
		case 253:
			game.defaultCamZoom = camGame.zoom = 0.9;
		case 254:
			game.defaultCamZoom = camGame.zoom = 0.8;
		case 652:
			game.defaultCamZoom = camGame.zoom = 0.8;
		case 653:
			game.defaultCamZoom = camGame.zoom = 0.7;
		case 654:
			game.defaultCamZoom = camGame.zoom = 0.6;
		case 1180:
			game.defaultCamZoom = camGame.zoom = 0.8;
		case 1181:
			game.defaultCamZoom = camGame.zoom = 0.7;
		case 1182:
			game.defaultCamZoom = camGame.zoom = 0.6;
		case 1342:
			game.camGame.stopFX();
			FlxTween.tween(game.camGame, {zoom: 2}, 8);
			game.defaultCamZoom = 2;
	}
}

function doSnowstorm()
{
	snowing = !snowing;
	FlxTween.tween(snowstormEffect, {alpha: snowing ? 1 : 0.00001}, 2);
	if (snowing)
		snowCooldown = FlxG.random.int(0, 4);
	else
		snowCooldown = FlxG.random.int(-8, -4);
}

function frozenFruitEvent(fruitNum:Int, in:Bool)
{
	var daFruit = frozenFruits[fruitNum];
	var fruitOffsetYThing:Array<Int> = [30, 0, -100];
	FlxTween.tween(daFruit,
		{y: ( in ? (bgWhite.y + (bgWhite.height / 2) - (daFruit.height / 2))
			+ fruitOffsetYThing[fruitNum] : bgWhite.y
			- 450
			+ fruitOffsetYThing[fruitNum])},
		0.5, {
			ease: ( in ?FlxEase.backOut : FlxEase.backIn),
			onComplete: function(twn:FlxTween)
			{
				daFruit.animation.play('frozen', true);

				switch (fruitNum) // fuckin kill yall for making me do this
				{
					case 0:
						daFruit.offset.set(61, 39);
					case 1:
						daFruit.offset.set(32, 111);
					case 2:
						daFruit.offset.set(74, 0);
				}

				game.camGame.shake(0.005, 0.1);
			}
		});
}
