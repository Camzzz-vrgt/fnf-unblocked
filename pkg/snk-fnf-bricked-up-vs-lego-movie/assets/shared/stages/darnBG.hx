var bgHeli:FlxSprite;
var badcop_darn_anims:Array<FlxSprite>;
var badcop_anim_num:Int = 0;
var lock_badcop_cam:Bool = false;
var fast_cam_bumps:Bool;

function onLoad()
{
	var bg:FlxSprite = new FlxSprite(-250, -700);
	bg.loadGraphic(Paths.image("backgrounds/darn/DarnBG"));
	bg.setGraphicSize(Std.int(bg.width * 0.8));
	bg.scrollFactor.set(0.1, 0.1);
	bg.antialiasing = ClientPrefs.data.antialiasing;
	add(bg);

	bgHeli = new FlxSprite(1450, -350);
	bgHeli.frames = Paths.getSparrowAtlas('backgrounds/darn/helicopter');
	bgHeli.animation.addByPrefix('poom', "poom", 24, false);
	bgHeli.animation.play('poom');
	bgHeli.setGraphicSize(Std.int(bgHeli.width * 1.25));
	bgHeli.zIndex = 10;
	bgHeli.antialiasing = ClientPrefs.data.antialiasing;
	add(bgHeli);

	badcop_darn_anims = [];
	for (i in 0...6)
	{
		var iplus1 = i + 1;
		var badcop_darn_anim:FlxSprite = new FlxSprite();
		badcop_darn_anim.frames = Paths.getSparrowAtlas('backgrounds/darn/part' + iplus1);
		badcop_darn_anim.animation.addByPrefix('anim', "anim", 24, false);
		badcop_darn_anim.animation.play('anim');
		badcop_darn_anim.alpha = 0.0001;
		badcop_darn_anim.antialiasing = ClientPrefs.data.antialiasing;
		add(badcop_darn_anim);
		badcop_darn_anims.push(badcop_darn_anim);
	}

	skipCountdown = true;
}

function onUpdate(elapsed)
{
	if (lock_badcop_cam)
		dad.cameraPosition = [100, 160];
	dad.scrollFactor.set(0.3, 0.3);
}

function end_darn_anim()
{
	badcop_anim_num += 1;
	var thisnewanim = badcop_darn_anims[badcop_anim_num];
	thisnewanim.alpha = 1;
	thisnewanim.animation.play('anim', true);
	thisnewanim.animation.finishCallback = function(justifiedbadcopcrashout:String)
	{
		thisnewanim.animation.finishCallback = function(justifiedbadcopcrashout:String)
		{
		}
		if (badcop_anim_num != 5)
		{
			end_darn_anim();
			thisnewanim.alpha = 0;
		}
	}
}

function onCreatePost()
{
	dadGroup.scrollFactor.set(0.3, 0.3);
	boyfriendGroup.scrollFactor.set(0.8, 1.02);
	camHUD.alpha = 0;
	camZooming = true;
	defaultCamZoom = 1.75;

	Conductor.songPosition = -600;

	bgHeli.scrollFactor.set(boyfriendGroup.scrollFactor.x, boyfriendGroup.scrollFactor.y);

	for (i in 0...badcop_darn_anims.length)
	{
		badcop_darn_anims[i].setPosition(dad.x + 245, dad.y + 145);
		badcop_darn_anims[i].scrollFactor.set(dadGroup.scrollFactor.x, dadGroup.scrollFactor.y);
	}

	badcop_bullet_flash = new FlxSprite().loadGraphic(Paths.image("backgrounds/darn/bulletFlash"));
	badcop_bullet_flash.color = FlxColor.RED;
	badcop_bullet_flash.zIndex = 2;
	badcop_bullet_flash.scrollFactor.set(0.3, 0.3);
	badcop_bullet_flash.alpha = 0.000001;
	add(badcop_bullet_flash);

	redShot = new FlxSprite().makeGraphic(1300, 720, FlxColor.RED);
	redShot.cameras = [camHUD];
	redShot.blend = BlendMode.MULTIPLY;
	redShot.alpha = 0.000001;
	add(redShot);

	redShot2 = new FlxSprite().loadGraphic(Paths.image("backgrounds/darn/redshot"));
	redShot2.cameras = [camHUD];
	redShot2.blend = BlendMode.ADD;
	redShot2.alpha = 0.000001;
	add(redShot2);

	pico_bullet_flash = new FlxSprite().loadGraphic(Paths.image("backgrounds/darn/bulletFlash"));
	pico_bullet_flash.zIndex = 10;
	pico_bullet_flash.scrollFactor.set(0.8, 1.02);
	pico_bullet_flash.setGraphicSize(Std.int(pico_bullet_flash.width * 1.2));
	add(pico_bullet_flash);

	yellowShot = new FlxSprite().makeGraphic(1300, 720, FlxColor.WHITE);
	yellowShot.cameras = [camHUD];
	yellowShot.blend = BlendMode.MULTIPLY;
	yellowShot.alpha = 0.000001;
	add(yellowShot);

	yellowShot2 = new FlxSprite().loadGraphic(Paths.image("backgrounds/darn/bulletshot"));
	yellowShot2.cameras = [camHUD];
	yellowShot2.blend = BlendMode.ADD;
	yellowShot2.alpha = 0.000001;
	add(yellowShot2);

	black_screen = new FlxSprite().makeGraphic(2000, 2000, FlxColor.BLACK);
	black_screen.scrollFactor.set(0, 0);
	add(black_screen);
}

function onStepHit()
{
	switch (curStep)
	{
		case 4:
			dad.cameraPosition = [95, 140];
			defaultCamZoom = 1.85;
		case 10:
			dad.cameraPosition = [90, 90];
			defaultCamZoom = 1.95;
	}
}

function onUpdate(elapsed)
{
	badcop_bullet_flash.alpha = FlxMath.lerp(badcop_bullet_flash.alpha, 0, FlxMath.bound(elapsed * 6, 0, 1));
	badcop_bullet_flash.angle = FlxMath.lerp(badcop_bullet_flash.angle, 359, FlxMath.bound(elapsed * 2.5, 0, 1));

	pico_bullet_flash.alpha = FlxMath.lerp(pico_bullet_flash.alpha, 0, FlxMath.bound(elapsed * 6, 0, 1));
	pico_bullet_flash.angle = FlxMath.lerp(pico_bullet_flash.angle, 359, FlxMath.bound(elapsed * 0.5, 0, 1));

	redShot.alpha = FlxMath.lerp(redShot.alpha, 0, FlxMath.bound(elapsed * 3, 0, 1));
	redShot2.alpha = FlxMath.lerp(redShot2.alpha, 0, FlxMath.bound(elapsed * 3, 0, 1));

	yellowShot.alpha = FlxMath.lerp(yellowShot.alpha, 0, FlxMath.bound(elapsed * 3, 0, 1));
	yellowShot2.alpha = FlxMath.lerp(yellowShot2.alpha, 0, FlxMath.bound(elapsed * 3, 0, 1));
}

var pico_shooting:Bool = false;
var badcop_shooting:Bool = false;

var badcop_bullet_flash_offsets:Array<Array<Int>> = [
	[480, 220], // left
	[700, 100], // down
	[720, 185], // up
	[900, 300] // right
];

function opponentNoteHitPre(note)
{
	if (note.isSustainNote != true && badcop_shooting)
	{
		badcop_bullet_flash.x = dad.x + badcop_bullet_flash_offsets[note.noteData][0];
		badcop_bullet_flash.y = dad.y + badcop_bullet_flash_offsets[note.noteData][1];
		badcop_bullet_flash.alpha = 1;
		badcop_bullet_flash.scale.set(1.2, 1.2);
		badcop_bullet_flash.angle = FlxG.random.float(-60, 0);
		FlxTween.cancelTweensOf(badcop_bullet_flash.scale);
		FlxTween.tween(badcop_bullet_flash.scale, {x: 0.2, y: 0.2}, 0.5, {ease: FlxEase.quadOut});

		redShot.alpha = 0.7;
		redShot2.alpha = 0.7;
		FlxTween.cancelTweensOf(camGame);
		camGame.shake(0.01, 0.02);
		camGame.angle = FlxG.random.float(-4, 4);
	}

	if (dad.getAnimName() == 'switch' && 13 > dad.get_animCurFrame() && difficulty == 2)
	{
		note.noAnimation = true;
	}
}

var pico_bullet_flash_offsets:Array<Array<Int>> = [
	[700, 360], // left
	[810, 230], // down
	[820, 320], // up
	[680, 620] // right
];

function goodNoteHitPre(note)
{
	if (note.isSustainNote != true && pico_shooting)
	{
		pico_bullet_flash.x = boyfriend.x + pico_bullet_flash_offsets[note.noteData][0];
		pico_bullet_flash.y = boyfriend.y + pico_bullet_flash_offsets[note.noteData][1];
		pico_bullet_flash.alpha = 0.8;
		pico_bullet_flash.scale.set(2, 2);
		pico_bullet_flash.angle = FlxG.random.float(-60, 0);
		FlxTween.cancelTweensOf(pico_bullet_flash.scale);
		FlxTween.tween(pico_bullet_flash.scale, {x: 0.4, y: 0.4}, 0.5, {ease: FlxEase.quadOut});

		yellowShot.alpha = 0.6;
		yellowShot2.alpha = 0.4;
		camGame.angle = FlxG.random.float(-3, 3);
		camGame.shake(0.04, 0.01);
		FlxTween.cancelTweensOf(camGame);
		FlxTween.tween(camGame, {angle: 0}, 0.8, {ease: FlxEase.quadOut, startDelay: 0.4});
	}
}

function onBeatHit()
{
	if (fast_cam_bumps)
	{
		triggerEventNote("Add Camera Zoom", "", "");
	}

	switch (curBeat)
	{
		case 4:
			lock_badcop_cam = true;
			defaultCamZoom = 1.25;
			FlxTween.tween(camHUD, {alpha: 1}, 0.6, {ease: FlxEase.quadOut});

		case 368:
			beatsPerZoom = 99999;
			lock_badcop_cam = false;
			dad.cameraPosition[0] += 20;
			dad.cameraPosition[1] -= 160;
			triggerEventNote('Camera Follow Pos', dad.x
				+ dad.getGraphicMidpoint().x
				+ dad.cameraPosition[0],
				dad.y
				+ dad.getGraphicMidpoint().y
				+ dad.cameraPosition[1]);
			isCameraOnForcedPos = false;
			defaultCamZoom = defaultCamZoom + 0.1;
			badcop_anim_num = -1;
			dad.alpha = 0;
			end_darn_anim();

		case 369:
			dad.cameraPosition[0] += 20;
			dad.cameraPosition[1] -= 10;
			defaultCamZoom = defaultCamZoom + 0.1;
		case 370:
			dad.cameraPosition[0] += 20;
			dad.cameraPosition[1] -= 10;
			defaultCamZoom = defaultCamZoom + 0.1;
		case 371:
			dad.cameraPosition[0] += 20;
			dad.cameraPosition[1] -= 10;
			defaultCamZoom = defaultCamZoom + 0.1;
		case 372:
			FlxTween.tween(camHUD, {alpha: 0}, 0.6, {ease: FlxEase.quadOut});
			defaultCamZoom = 1.18;
			triggerEventNote('Camera Follow Pos', badcop_darn_anims[0].x + 270, badcop_darn_anims[0].y + 410);
	}
}

function onEvent(event, value1, value2)
{
	switch (event)
	{
		case 'Fast Cam Bumps':
			fast_cam_bumps = !fast_cam_bumps;

		case 'Darn Bullets':
			switch (value1)
			{
				case 'badcop':
					badcop_shooting = !badcop_shooting;

				case 'pico':
					pico_shooting = !pico_shooting;
			}

		case 'Heli Tween':
			switch (value1)
			{
				case 'Move In':
					FlxTween.tween(bgHeli, {x: boyfriend.x + BF_X + 375}, 1.6, {ease: FlxEase.quadOut});
				case 'Play Animation':
					triggerEventNote('Camera Follow Pos', bgHeli.x + 520, bgHeli.y + 120);
					bgHeli.animation.play('poom');
					defaultCamZoom = 1.25;

				case 'Pico Camera':
					defaultCamZoom = 1.25;
					triggerEventNote('Camera Follow Pos', boyfriend.x - boyfriend.cameraPosition[0], boyfriend.y + boyfriend.cameraPosition[1] + 40);
			}
		case 'Change Character':
			if (value1 == 'bf')
			{
				boyfriend.danceEveryNumBeats = 9999999999999;
				boyfriend.playAnim('anim1', true);
				boyfriend.specialAnim = true;
				boyfriend.skipDance = true;

				cameraSpeed = 1.65;
			}
		case 'Play Animation':
			if (value1 == 'voice' && value1 != 'bf')
			{
				black_screen.visible = false;
			}
			if (value1 == 'anim2' && value2 == 'bf')
			{
				boyfriend.animation.finishCallback = function(goodbyepico:String)
				{
					boyfriend.alpha = 0;
					bgHeli.alpha = 0;
				}
			}

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
				char.playAnimForDuration(value1, 1.3, true);
				char.specialAnim = true;
			}
	}
}
