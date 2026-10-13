function onLoad()
{
	var bg = new FlxSprite(400, 0, Paths.image("backgrounds/emmet/bg"));
	bg.antialiasing = ClientPrefs.data.antialiasing;
	bg.scale.set(1.1, 1.1);
	add(bg);

	var construction = new FlxSprite(400, -100, Paths.image("backgrounds/emmet/construction"));
	construction.antialiasing = ClientPrefs.data.antialiasing;
	construction.zIndex = 1;
	construction.scale.set(1.1, 1.1);
	add(construction);

	var overlay = new FlxSprite(400, -200, Paths.image("backgrounds/emmet/overlay"));
	overlay.antialiasing = ClientPrefs.data.antialiasing;
	overlay.zIndex = 5;
	overlay.alpha = 0.2;
	overlay.scale.set(1.2, 1.3);
	add(overlay);
}

function onCreatePost()
{
	for (m in [boyfriendGroup, dadGroup])
	{
		for (f in m.members)
		{
			f.camDisplacement = 3;
		}
	}
}

function onEvent(eventName, value1, value2)
{
	switch (eventName)
	{
		case 'Change Character':
			if (value1 == 'dad')
			{
				FlxTween.tween(camHUD, {alpha: 0}, 0.6, {ease: FlxEase.quadOut});
				dad.danceEveryNumBeats = 9999999999999;
				dad.specialAnim = true;
			}
	}
}
