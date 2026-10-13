var gold_table:FlxSprite;

function onLoad()
{
	skipCountdown = true;
	camGame.visible = false;
	camHUD.alpha = 0;
	var bg = new FlxSprite(-230, 0, Paths.image("backgrounds/gold/goldbg"));
	bg.scrollFactor.set(0.45, 0.45);
	bg.antialiasing = ClientPrefs.data.antialiasing;
	add(bg);

	gold_table = new FlxSprite(bg.x, bg.y, Paths.image("backgrounds/gold/goldtable"));
	gold_table.scrollFactor.set(0.45, 0.45);
	gold_table.antialiasing = ClientPrefs.data.antialiasing;
	add(gold_table);
}

function onCreatePost()
{
	camZoomingMult = 1.5;
	gf.visible = false;
	remove(dadGroup, true);
	dadGroup.zIndex = 10;
	stage.add(dadGroup);

	boyfriendGroup.scrollFactor.set(.5, .5);
	onMoveCamera('boyfriend');
}

function onBeatHit()
{
	switch (curBeat)
	{
		case 1:
			camGame.visible = true;
			FlxG.camera.flash(0xFFffc600);

		case 231:
			camZooming = false;

		case 240:
			camZooming = true;
	}
}

function onStartCountdown()
{
	FlxTween.tween(camHUD, {alpha: 1}, 0.15, {ease: FlxEase.sineOut});
}

function onEvent(eventName, value1, value2)
{
	switch (eventName)
	{
		case 'Change Character':
			FlxG.camera.flash(0xFFffc600);
			gold_table.zIndex = 5;
			refreshZ(stage);
			new FlxTimer().start(0.2, function(tmr:FlxTimer)
			{
				for (b in boyfriendGroup.members)
				{
					b.canPlayAnimations = false;
				}
			});

		case 'Play Animation':
			var char:Character = dad;
			switch (value2.toLowerCase())
			{
				case 'bf' | 'boyfriend':
					char = boyfriend;
				case 'gf' | 'girlfriend':
					char = gf;
				default:
					var val2:Int = Std.parseInt(value2);
					if (Math.isNaN(val2))
						val2 = 0;

					switch (val2)
					{
						case 1: char = boyfriend;
						case 2: char = gf;
					}
			}

			if (char != null)
			{
				char.playAnimForDuration(value1, 3.3, true);
				char.specialAnim = true;
			}
	}
}

function onMoveCamera(char)
{
	switch (char)
	{
		case 'dad':
			defaultCamZoom = 0.7;
		default:
			defaultCamZoom = 0.77;
	}
}
