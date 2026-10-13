var bg:FlxSprite;

function onLoad()
{
	bg = new FlxSprite(-175, -150, Paths.image("backgrounds/riders/bg"));
	bg.antialiasing = ClientPrefs.data.antialiasing;
	bg.scrollFactor.set(0.5, 0.5);
	add(bg);

	var rd = new FlxSprite(0, 0, Paths.image("backgrounds/riders/road"));

	var pos = [[-50, -150], [0, -150]];

	var bull = 0;
	for (elm in ["cityL", "cityR"])
	{
		var city = new FlxSprite(pos[bull][0], pos[bull][1]);
		city.antialiasing = ClientPrefs.data.antialiasing;
		city.frames = Paths.getSparrowAtlas("backgrounds/riders/" + elm);
		city.animation.addByPrefix("city", "city", 24, true);
		city.animation.play("city", true, true);

		add(city);
		bull++;
	}

	var sign = new FlxSprite(0, -150);
	sign.antialiasing = ClientPrefs.data.antialiasing;
	sign.frames = Paths.getSparrowAtlas("backgrounds/riders/sign");
	sign.animation.addByPrefix("sign", "sign", 24, false);

	new FlxTimer().start(FlxG.random.float(3, 10), (tmr) ->
	{
		sign.animation.play("sign");
		tmr.reset(FlxG.random.float(3, 10));
	});

	var robots = new FlxSprite(0, -150);
	robots.antialiasing = ClientPrefs.data.antialiasing;
	robots.frames = Paths.getSparrowAtlas("backgrounds/riders/robots");
	robots.animation.addByPrefix("robots", "robots", 24, false);

	new FlxTimer().start(FlxG.random.float(10, 20), (tmr) ->
	{
		robots.animation.play("robots");
		tmr.reset(FlxG.random.float(15, 30));
	});

	add(sign);
	add(rd);
	add(robots);
}

function onUpdate()
{
	bg.y = -200 + 50 * songPercent;
}
