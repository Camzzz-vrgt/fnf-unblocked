function onLoad()
{
	var bg = new FlxSprite(0, 0, Paths.image("backgrounds/pants/pants bg"));
	bg.antialiasing = ClientPrefs.data.antialiasing;
	bg.scale.set(1.5, 1.5);

	add(bg);
}

var anim:FlxSprite;

function onCreatePost()
{
	gf.scale.set(1.5, 1.5);
	gf.idleSuffix = "-right";

	for (m in [boyfriendGroup, dadGroup])
	{
		for (f in m.members)
		{
			f.camDisplacement = 0;
		}
	}

	pants_camera = new FlxCamera();
	pants_camera.visible = false;

	anim = new FlxSprite(0, 0);
	anim.antialiasing = ClientPrefs.data.antialiasing;
	anim.frames = Paths.getSparrowAtlas("backgrounds/pants/pantsAnim");
	anim.animation.addByPrefix("thing", "anim", 24, false);
	anim.scale.set(2.1, 2.1);
	anim.visible = false;
	anim.screenCenter();
	anim.cameras = [pants_camera];
	add(anim);

	insertFlxCamera(FlxG.cameras.list.indexOf(camGame) + 1, pants_camera, false);
}

function insertFlxCamera(idx:Int, cam:FlxCamera, defDraw:Bool)
{
	var cameras = [
		for (i in FlxG.cameras.list)
			{
				cam: i,
				defaultDraw: FlxG.cameras.defaults.contains(i)
			}
	];

	for (i in cameras)
		FlxG.cameras.remove(i.cam, false);

	cameras.insert(idx, {cam: cam, defaultDraw: defDraw});

	for (i in cameras)
		FlxG.cameras.add(i.cam, i.defaultDraw);
}

function onStepHit()
{
	if (curStep == 379)
	{
		camZooming = false;
		cameraSpeed = .5;
		FlxTween.tween(FlxG.camera, {zoom: 2}, 2);
	}

	if (curStep == 384)
	{
		camHUD.alpha = 0;
		pants_camera.visible = true;
		anim.animation.play("thing");
		anim.visible = true;
	}
	if (curStep == 431)
	{
		anim.visible = false;
		cameraSpeed = 1;
		pants_camera.visible = false;
		camZooming = true;
		anim.destroy();
	}
}

function onBeatHit()
{
	switch (curBeat)
	{
		case 106:
			FlxTween.tween(camHUD, {alpha: 1}, 0.4);
	}
}

function onSectionHit()
{
	if (!mustHitSection)
		gf.idleSuffix = "-left";
	else
		gf.idleSuffix = "-right";

	gf.dance();
}
