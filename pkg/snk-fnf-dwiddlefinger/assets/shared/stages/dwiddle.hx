import flixel.addons.display.FlxBackdrop;
import openfl.display.BlendMode;

var grungeVig:FlxSprite;
var driedGradient:FlxSprite;
var driedGradient2:FlxSprite;
var foreground:FlxSprite;
var grungeVig:FunkinSprite;
var backBG:FlxSprite;
var mist:FlxSprite;
var overlayThing:FlxSprite;

function create()
{
	camHUD.fade(FlxColor.BLACK, (Conductor.stepCrochet / 2000) * 128, true, {ease: FlxEase.quadOut});
	camGame.alpha = 1;
	camHUD.alpha = 1;

	camGame.zoom = 0;
	camHUD.zoom = 0;
}

function onCountdown(event)
{
	if (event.swagCounter == 0)
	{
		FlxTween.tween(camGame, {zoom: 0.7, alpha: 1}, 3, {ease: FlxEase.quartOut});
		FlxTween.tween(camHUD, {zoom: 1, alpha: 1}, 3, {ease: FlxEase.quartOut});

		FlxTween.num(boyfriend.cameraOffset.x, 50, (Conductor.crochet / 1000) * 4, {
			onUpdate: (t) ->
			{
				boyfriend.cameraOffset.x = t.value;
			}
		});
		FlxTween.num(boyfriend.cameraOffset.y, 0, (Conductor.crochet / 1000) * 4, {
			onUpdate: (t) ->
			{
				boyfriend.cameraOffset.y = t.value;
			}
		});
	}
}

function postCreate()
{
	defaultCamZoom = camGame.zoom = 0.6;
	FlxG.camera.followLerp = 0.07;

	remove(dad);
	remove(gf);
	remove(boyfriend);
	remove(comboGroup);

	dad.x = 325;
	dad.y = -125;
	boyfriend.x = 1325;
	boyfriend.y = -110;
	gf.x = 837.5;
	gf.y = -337.5;

	for (a in [boyfriend, gf, dad])
		a.scrollFactor.set(1, 1);

	add(backBG = new FlxSprite(-2250, -2000).loadGraphic(Paths.image("maxStages/maxsBurgers"))).antialiasing = true;

	add(comboGroup);
	add(dad);
	add(boyfriend);

	add(driedGradient = new FlxSprite(0, 0).loadGraphic(Paths.image("maxStages/driedGradient"))).antialiasing = true;
	driedGradient.blend = 14;
	driedGradient.cameras = [camHUD];
	driedGradient.alpha = 0;

	add(driedGradient2 = new FlxSprite(0, 0).loadGraphic(Paths.image("maxStages/driedGradient"))).antialiasing = true;
	driedGradient2.blend = 0;
	driedGradient2.cameras = [camHUD];
	driedGradient2.alpha = 0;

	add(mist = new FlxBackdrop(Paths.image("mistFront"), 1, 1, false, true));
	mist.blend = 14;
	mist.velocity.set(50, 0);
	mist.x = 0;
	mist.y = -125;
	mist.scale.set(1.25, 1.25);

	// phase 2 :->

	foreground = new FlxSprite(-1500, 250).loadGraphic(Paths.image("maxStages/foreground"));
	foreground.scrollFactor.set(1, 1);
	foreground.antialiasing = true;

	grungeVig = new FunkinSprite(0, 0).loadGraphic(Paths.image("maxStages/grungeVig"));
	grungeVig.antialiasing = true;
	grungeVig.cameras = [camHUD];
	grungeVig.blend = 14;
	grungeVig.alpha = 1;

	grungeVig.updateHitbox();
	insert(0, grungeVig);
	remove(grungeVig);

	overlayThing = new FlxSprite(0, 0).loadGraphic(Paths.image("maxStages/overlayThingy"));
	overlayThing.antialiasing = true;
	overlayThing.cameras = camGame;
	overlayThing.scale.set(2, 2);
	overlayThing.updateHitbox();
	overlayThing.setPosition(-1000, -1000);
	overlayThing.blend = 14;

	// player.cpu = true;
}

function onCameraMove(event)
{
	defaultCamZoom = (curCameraTarget == 0) ? 0.4 : 0.5;
}

var elapsedTime:Float = 0.0;

function postUpdate(elapsed:Float)
{
	elapsedTime += elapsed;
	if (elapsedTime >= 0.25)
	{
		elapsedTime = 0.0;
		grungeVig.skew.set(FlxG.random.float(-0.2, 2), FlxG.random.float(-0.2, 2));
	}
}

function stepHit(s)
{
	switch (s)
	{
		case 1355:
			for (a in [grungeVig])
				FlxTween.tween(grungeVig, {alpha: 0}, 3, {ease: FlxEase.quartIn});
	}
}

function beatHit()
{
	switch (curBeat)
	{
		case 40:
		case 80:
			flash();
			defaultCamZoom = 0.7;
			FlxTween.num(0.53, 0.8, (Conductor.crochet / 1000) * 8, {
				ease: FlxEase.cubeInOut,
				onUpdate: (t) ->
				{
					defaultCamZoom = t.value;
				}
			});

			for (a in [comboGroup, dad, boyfriend, mist])
				remove(a);
			backBG.loadGraphic(Paths.image("maxStages/maxsHell"));
			add(comboGroup);
			add(dad);
			add(boyfriend);
			add(foreground);
			add(grungeVig);
			backBG.x = -1250;
			backBG.y = -1325;
		case 204:
		case 208:
			// phase 2 > 2.5
			flash();
			defaultCamZoom = 0.6;
			FlxTween.num(0.53, 0.7, (Conductor.crochet / 1000) * 8, {
				ease: FlxEase.cubeInOut,
				onUpdate: (t) ->
				{
					defaultCamZoom = t.value;
				}
			});
			for (a in [dad, boyfriend, foreground, grungeVig])
				remove(a);
			backBG.loadGraphic(Paths.image("maxStages/maxsBurgers2"));
			add(comboGroup);
			add(dad);
			add(boyfriend);
			add(grungeVig);
			backBG.x = -2250;
			backBG.y = -2000;
		case 272:
			// phase 2.5 > phase 2
			flash();
			defaultCamZoom = 0.6;
			FlxTween.num(0.53, 0.8, (Conductor.crochet / 1000) * 8, {
				ease: FlxEase.cubeInOut,
				onUpdate: (t) ->
				{
					defaultCamZoom = t.value;
				}
			});

			for (a in [comboGroup, dad, boyfriend, mist, grungeVig])
				remove(a);
			backBG.loadGraphic(Paths.image("maxStages/maxsHell"));
			add(comboGroup);
			add(dad);
			add(boyfriend);
			add(foreground);
			add(grungeVig);
			backBG.x = -1250;
			backBG.y = -1325;
		case 344:
			// phase 3
			defaultCamZoom = camGame.zoom = 0.35;
			for (a in [comboGroup, dad, boyfriend, mist, grungeVig, foreground])
				remove(a);
			backBG.loadGraphic(Paths.image("maxStages/maxFinal"));
			add(comboGroup);
			add(dad);
			add(boyfriend);
			add(grungeVig);
			backBG.scale.set(2.6, 2.6);
			backBG.updateHitbox();
			backBG.x = -1500;
			backBG.y = -1500;
			add(overlayThing);

		case 472:
			// boyfriend.cameraOffset.set(-300, -600);
	}
}

function changeCamOffsets(char:Character, camX:Float, camY:Float, ?add:Bool)
{
	if (char != null)
	{
		if (add == null || add == false)
		{
			char.cameraOffset.x = camX;
			char.cameraOffset.y = camY;
		}
		else
		{
			char.cameraOffset.x += camX;
			char.cameraOffset.y += camY;
		}
	}
}

function measureHit()
{
	driedGradient.alpha = 0.5;
	FlxTween.tween(driedGradient, {alpha: 0}, (Conductor.stepCrochet / 2000) * 16);

	driedGradient2.alpha = 0.25;
	FlxTween.tween(driedGradient2, {alpha: 0}, (Conductor.stepCrochet / 2000) * 16);

	scoreTxt.scale.set(1.35, 1.35);
	FlxTween.tween(scoreTxt.scale, {x: 1.25, y: 1.25}, (Conductor.stepCrochet / 2000) * 16, {ease: FlxEase.quadOut});
}

public function flash()
{
	camGame.flash(FlxColor.WHITE, 0.75, true);
}
