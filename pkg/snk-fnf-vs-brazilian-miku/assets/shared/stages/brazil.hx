// normal bg

var sky:FlxSprite;
var sea:FlxSprite;
var floor:FlxSprite;
var fg:FlxSprite;
var whitebg:FlxSprite;

// FP bg

var fpSky:FlxSprite;
var fpCity:FlxSprite;
var fpTrees:FlxSprite;
var fpFloor:FlxSprite;

// hud

var countDayo:FlxSprite;
var white:FlxSprite;

function onCreate()
{
	// normal bg

	game.gf.scrollFactor.set(1, 1);
	game.skipCountdown = true;

	game.gf.alpha = 0;
	game.boyfriend.alpha = 0;
	game.dad.alpha = 0;
	game.camHUD.alpha = 0;

	sky = new FlxSprite(-650, -300).loadGraphic(Paths.image('brazil/sky'));
	sky.scrollFactor.set(0.4, 0.6);
	game.addBehindGF(sky);
	sky.antialiasing = true;
	sky.alpha = 1;
	setVar('sky', sky);

	sea = new FlxSprite(-650, -300);
	sea.frames = Paths.getSparrowAtlas('brazil/Beach');
	sea.animation.addByPrefix('idle', 'idle', 3, true);
	sea.animation.play('idle');
	sea.scrollFactor.set(0.6, 0.8);
	game.addBehindGF(sea);
	sea.antialiasing = true;
	sea.alpha = 1;
	setVar('sea', sea);

	floor = new FlxSprite(-550, -350).loadGraphic(Paths.image('brazil/floor'));
	game.addBehindGF(floor);
	floor.antialiasing = true;
	floor.alpha = 0;
	setVar('floor', floor);

	fg = new FlxSprite(-550, -350).loadGraphic(Paths.image('brazil/fg'));
	fg.scrollFactor.set(1, 1);
	game.add(fg);
	fg.antialiasing = true;
	fg.alpha = 0;
	setVar('fg', fg);

	whitebg = new FlxSprite().makeGraphic(1280, 720, FlxColor.WHITE);
	whitebg.scrollFactor.set(0, 0);
	whitebg.scale.set(1.5, 1.5);
	game.addBehindGF(whitebg);
	whitebg.alpha = 0;
	setVar('whitebg', whitebg);

	// FP bg

	fpSky = new FlxSprite(-350, -150).loadGraphic(Paths.image('brazil/FP/sky'));
	fpSky.scrollFactor.set(0.4, 0.6);
	fpSky.scale.set(1, 1);
	game.addBehindGF(fpSky);
	fpSky.antialiasing = true;
	fpSky.alpha = 0;

	fpCity = new FlxSprite(-350, -150).loadGraphic(Paths.image('brazil/FP/city'));
	fpCity.scrollFactor.set(0.6, 0.8);
	fpCity.scale.set(1, 1);
	game.addBehindGF(fpCity);
	fpCity.antialiasing = true;
	fpCity.alpha = 0;

	fpTrees = new FlxSprite(-350, -150).loadGraphic(Paths.image('brazil/FP/trees'));
	fpTrees.scrollFactor.set(0.8, 1);
	fpTrees.scale.set(1, 1);
	game.addBehindGF(fpTrees);
	fpTrees.antialiasing = true;
	fpTrees.alpha = 0;

	fpFloor = new FlxSprite(-435, -100).loadGraphic(Paths.image('brazil/FP/floor'));
	game.addBehindGF(fpFloor);
	fpFloor.antialiasing = true;
	fpFloor.alpha = 0;

	// hud

	countDayo = new FlxSprite(-200, 80);
	countDayo.frames = Paths.getSparrowAtlas('brazil/Countdowndayo');
	countDayo.animation.addByPrefix('idle', 'Symbol 1 instance', 24, false);
	countDayo.animation.play('idle');
	countDayo.cameras = [game.camOther];
	game.addBehindGF(countDayo);
	countDayo.scale.set(0.7, 0.7);
	countDayo.antialiasing = true;
	countDayo.alpha = 0;
	setVar('countDayo', countDayo);

	white = new FlxSprite().makeGraphic(1280, 720, FlxColor.WHITE);
	white.cameras = [game.camHUD];
	game.add(white);
	white.alpha = 0;
	setVar('white', white);
}

function onUpdate()
{
	switch (curStep)
	{
		case 636:
			FlxTween.tween(whitebg, {alpha: 1}, 0.4, {ease: FlxEase.cubeOut});
			FlxTween.tween(fg, {alpha: 0}, 0.4, {ease: FlxEase.cubeOut});

		case 640:
			game.boyfriend.alpha = 0;
			game.gf.alpha = 0;

			sky.alpha = 0;
			sea.alpha = 0;
			floor.alpha = 0;
			fg.alpha = 0;

			fpSky.alpha = 1;
			fpCity.alpha = 1;
			fpTrees.alpha = 1;
			fpFloor.alpha = 1;

		case 896:
			game.boyfriend.alpha = 1;
			game.gf.alpha = 1;

			sky.alpha = 1;
			sea.alpha = 1;
			floor.alpha = 1;
			fg.alpha = 1;

			fpSky.alpha = 0;
			fpCity.alpha = 0;
			fpTrees.alpha = 0;
			fpFloor.alpha = 0;
	}
}
