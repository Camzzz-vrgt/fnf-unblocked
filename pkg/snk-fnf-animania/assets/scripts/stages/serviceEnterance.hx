import flixel.addons.display.FlxBackdrop;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxMath;
import flixel.math.FlxPoint;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import funkin.audio.FunkinSound;
import funkin.play.PlayState;
import funkin.play.stage.ScriptedStage;
import funkin.graphics.shaders.OverlayBlend;
import funkin.Conductor;
import flixel.addons.effects.FlxTrail;
import funkin.play.PauseSubState;
import flixel.group.FlxTypedGroup;
import funkin.play.character.CharacterType;
import funkin.util.MathUtil;
import funkin.graphics.shaders.RuntimeRainShader;
import funkin.graphics.shaders.AdjustColorShader;
import funkin.util.FlxTweenUtil;
import funkin.graphics.shaders.DropShadowShader;
import openfl.filters.ShaderFilter;

using StringTools;

class ServiceEnteranceTake extends ScriptedStage
{
	// Allocate the expensive camera shader only when the option enables it.
	var rainShader:RuntimeRainShader;
	var rainShaderFilter:ShaderFilter;

	var rainShaderStartIntensity:Float;
	var rainShaderEndIntensity:Float;
	var rainShaderDiagnosticSent:Bool = false;
	// This custom port restores the Legacy shader preference. The Flixel rain
	// fallback remains independent so Shader Off does not make the stage empty.
	var stageShadersEnabled:Bool = Preferences.shaders;

	var carInterruptable:Bool = true; // if the car can be reset
	var car2Interruptable:Bool = true;

	var lastChange:Int = 0;
	var changeInterval:Int = 8; // make sure it doesnt change until AT LEAST this many beats

	function new()
	{
		super('serviceEnterance');
	}

	override function onCreate(e)
	{
		super.onCreate(e);
		PauseSubState.musicSuffix = '-amtake1';
		resetCar(true, true);
	}

	var mist0:FlxBackdrop;
	var mist1:FlxBackdrop;
	var mist2:FlxBackdrop;
	var mist3:FlxBackdrop;
	var mist4:FlxBackdrop;
	var mist5:FlxBackdrop;

	var rainSndAmbience:FunkinSound;
	var carSndAmbience:FunkinSound;

	var carRide1:FunkinSound;
	var carRide2:FunkinSound;

	function buildStage()
	{
		super.buildStage();

		if (Preferences.lowQuality) return;

		mist0 = new FlxBackdrop(Paths.image('stages/serviceEnterance/mistMid'), 0x01);
		mist0.setPosition(-650, 340);
		mist0.scrollFactor.set(1.2, 1.2);
		mist0.zIndex = 1000;
		mist0.blend = 0;
		mist0.color = 0xFF5c5c5c;
		mist0.alpha = 0.6;
		mist0.velocity.x = 172;
		add(mist0);

		mist1 = new FlxBackdrop(Paths.image('stages/serviceEnterance/mistMid'), 0x01);
		mist1.setPosition(-650, 305);
		mist1.scrollFactor.set(1.1, 1.1);
		mist1.zIndex = 1000;
		mist1.blend = 0;
		mist1.color = 0xFF5c5c5c;
		mist1.alpha = 0.6;
		mist1.velocity.x = 150;
		add(mist1);

		mist2 = new FlxBackdrop(Paths.image('stages/serviceEnterance/mistBack'), 0x01);
		mist2.setPosition(-650, 315);
		mist2.scrollFactor.set(1.2, 1.2);
		mist2.zIndex = 1001;
		mist2.blend = 0;
		mist2.color = 0xFF5c5c5c;
		mist2.alpha = 0.8;
		mist2.velocity.x = -80;
		add(mist2);

		mist3 = new FlxBackdrop(Paths.image('stages/serviceEnterance/mistMid'), 0x01);
		mist3.setPosition(-650, 320);
		mist3.scrollFactor.set(0.95, 0.95);
		mist3.zIndex = 30;
		mist3.blend = 0;
		mist3.color = 0xFF5c5c5c;
		mist3.alpha = 0.5;
		mist3.velocity.x = -50;
		mist3.scale.set(0.8, 0.8);
		add(mist3);

		mist4 = new FlxBackdrop(Paths.image('stages/serviceEnterance/mistBack'), 0x01);
		mist4.setPosition(-650, -250);
		mist4.scrollFactor.set(0.8, 0.8);
		mist4.zIndex = 5;
		mist4.blend = 0;
		mist4.color = 0xFF5c5c5c;
		mist4.alpha = 1;
		mist4.velocity.x = 40;
		mist4.scale.set(0.7, 0.7);
		add(mist4);

		mist5 = new FlxBackdrop(Paths.image('stages/serviceEnterance/mistMid'), 0x01);
		mist5.setPosition(-650, -400);
		mist5.scrollFactor.set(0.5, 0.5);
		mist5.zIndex = 7;
		mist5.blend = 0;
		mist5.color = 0xFF5c5c5c;
		mist5.alpha = 1;
		mist5.velocity.x = 20;
		mist5.scale.set(1.1, 1.1);
		add(mist5);

		// The authored Animate rain and the Legacy rain shader are sufficient.
		// Do not add synthetic fallback streaks here: they were port-only visuals.
		refresh(); // Apply z-index.
	}

	var bfRim;
	var dadRim;
	var legacyCameraFocusApplied:Bool = false;

	override function stageFullConstruct():Void
	{
		if (stageShadersEnabled)
		{
			rainShader = new RuntimeRainShader();
			bfRim = new DropShadowShader();
			// Do not attach this shader during the rainy opening. In 0.8.5 the
			// base DropShadow pass is visible even when the legacy rim alpha is 0.
			// It is attached at beat 284, where the Legacy light cue actually starts.
			bfRim.setAdjustColor(-5, -26, 0, -16);
			bfRim.color = 0xFFFFF56D;
			bfRim.angle = 115;
			bfRim.distance = 20;
			bfRim.rimAlphaV = 0;

			dadRim = new DropShadowShader();
			dadRim.setAdjustColor(-5, -26, 0, -16);
			dadRim.color = 0xFFFFFFFF;
			dadRim.angle = 115;
			dadRim.distance = 20;
			dadRim.rimAlphaV = 0;

			// Exact Legacy values. The previously stronger values were only a
			// temporary workaround while this filter was unintentionally disabled.
			rainShaderStartIntensity = 0.1;
			rainShaderEndIntensity = 0.3;
			fuckAssMultRain = 1;

			rainShader.intensity = rainShaderStartIntensity;
			rainShader.scale = FlxG.height / 300;
			rainShader.rainColor = 0xff5dd19b;
			// FunkinCamera does not expose FlxCamera's old addShader helper.
			// Register the filter directly; Dadbattle then appends its chroma
			// shader instead of replacing this one.
			rainShaderFilter = new ShaderFilter(rainShader);
			var cameraFilters = PlayState.instance.camGame.filters ?? [];
			cameraFilters.push(rainShaderFilter);
			PlayState.instance.camGame.filters = cameraFilters;
			PlayState.instance.camGame.filtersEnabled = true;
			trace('[Animania rain] stage filter registered; camGame.filters=' + cameraFilters.length);
		}

		// V-Slice 0.6 stored the authored camera targets as `stageCamera` in
		// the stage JSON. That field no longer exists in 0.8.5, so the camera
		// would otherwise follow each large Animate sprite's calculated centre
		// and leave this wide stage almost entirely out of frame.
		applyLegacyCameraFocus();

		rainSndAmbience = FunkinSound.load(Paths.sound("gameplay/stages/serviceEnterance/rainAmbience"), 1, true, false, false);
		rainSndAmbience.volume = 0;
		rainSndAmbience.play(false, FlxG.random.float(0, rainSndAmbience.length));
		rainSndAmbience.looped = true;

		carSndAmbience = FunkinSound.load(Paths.sound("gameplay/stages/serviceEnterance/carAmbience"), 1, true, false, false);
		carSndAmbience.volume = 0.1;
		carSndAmbience.play(false, FlxG.random.float(0, carSndAmbience.length));
		carSndAmbience.looped = true;

		FlxTween.tween(getNamedProp("fgRedOverlay"), {alpha: 0.5}, 2, {ease: FlxEase.sineInOut, type: 4});

		if (!Preferences.lowQuality)
		{
			carRide1 = FunkinSound.load(Paths.sound("gameplay/stages/serviceEnterance/car"), 1, true, false, false);
			carRide1.volume = 0;
			carRide1._proximityPan = true;
			carRide1._target = getGirlfriend();
			carRide1._radius = 1000;

			carRide2 = FunkinSound.load(Paths.sound("gameplay/stages/serviceEnterance/car"), 1, true, false, false);
			carRide2.volume = 0;
			carRide2._proximityPan = true;
			carRide2._target = getGirlfriend();
			carRide2._radius = 1000;

			for (el in getNamedProp("rain").timeline.layers[0].frames[0].elements)
			{
				var element = el.toSymbolInstance();
				element.firstFrame = FlxG.random.int(0, 9);
			}

			for (el in getNamedProp("fgBoxes").timeline.getLayer("Слой_2").frames[0].elements)
			{
				var element = el.toSymbolInstance();
				element.firstFrame = FlxG.random.int(0, 9);
			}
		}

	}

	var ___time:Float = 0;
	var _alphaTarget:Float = 1;

	var _timer:Float = 0;

	function setLegacyCameraFocus(character, x:Float, y:Float):Void
	{
		if (character == null || character.cameraFocusPoint == null)
			return;

		character.cameraFocusPoint.set(x, y);
	}

	function applyLegacyCameraFocus():Void
	{
		var play = PlayState.instance;
		var dad = getDad();
		var boyfriend = getBoyfriend();
		if (play == null || dad == null || boyfriend == null || dad.cameraFocusPoint == null || boyfriend.cameraFocusPoint == null)
			return;

		// Stage.resetStage(), and Animate atlas refreshes, can recreate either
		// character's focus point. Validate both targets so BF never falls back
		// to the atlas-derived point far below the authored framing.
		var needsApply = !legacyCameraFocusApplied
			|| dad.cameraFocusPoint.x != 350 || dad.cameraFocusPoint.y != 350
			|| boyfriend.cameraFocusPoint.x != 650 || boyfriend.cameraFocusPoint.y != 375;
		if (!needsApply)
			return;

		setLegacyCameraFocus(boyfriend, 650, 375);
		setLegacyCameraFocus(dad, 350, 350);
		play.cameraFollowPoint.setPosition(350, 350);
		legacyCameraFocusApplied = true;
	}

	function onUpdate(event)
	{
		super.onUpdate(event);
		applyLegacyCameraFocus();

		_timer += event.elapsed;
		PlayState.instance.camGame.targetOffset.x = (Math.sin(_timer * .15) * 25);
		PlayState.instance.camGame.targetOffset.y = (Math.sin(_timer * .05) * 10);

		if (stageShadersEnabled && rainShaderFilter != null)
		{
			var remappedIntensityValue:Float = FlxMath.remapToRange(Conductor.instance.songPosition, 0,
				FlxG.sound.music != null ? PlayState.instance.currentSongLengthMs : 0, rainShaderStartIntensity, rainShaderEndIntensity);
			rainShader.intensity = Conductor.instance.songPosition > 0 ? remappedIntensityValue : rainShaderStartIntensity;
			rainShader.updateViewInfo(FlxG.width, FlxG.height, FlxG.camera);
			rainShader.update(event.elapsed * fuckAssMultRain);

			if (rainSndAmbience != null)
				rainSndAmbience.volume = Math.min(0.1, rainShader.intensity * 1); // if (FlxG.sound.music != null)

			if (!rainShaderDiagnosticSent && Conductor.instance.songPosition > 0)
			{
				var filters = PlayState.instance.camGame.filters;
				trace('[Animania rain] running; intensity=' + rainShader.intensity + ', camGame.filters=' + (filters == null ? 0 : filters.length));
				rainShaderDiagnosticSent = true;
			}
		}

		if (!Preferences.lowQuality)
		{
			mist0.y = 480 + (Math.sin(_timer * 0.35) * 70);
			mist1.y = 460 + (Math.sin(_timer * 0.3) * 80);
			mist2.y = 476 + (Math.sin(_timer * 0.4) * 60);
			mist3.y = 470 + (Math.sin(_timer * 0.3) * 70);
			mist4.y = -120 + (Math.sin(_timer * 0.35) * 50);
			mist5.y = -280 + (Math.sin(_timer * 0.08) * 100);

			getNamedProp('fgMist').x = -1650 + (Math.sin(_timer * .85) * 15);

			___time += FlxMath.bound(event.elapsed, 0, 0.1); // hi 5 rubles
			if (___time > 0.05)
			{
				_alphaTarget = FlxG.random.float(0.75, 1.2);
				___time -= 0.05;
			}
			if (FlxG.game.ticks % 100 > 50)
				getNamedProp('vendingLight').colorTransform.alphaMultiplier = MathUtil.coolLerp(getNamedProp('vendingLight').colorTransform.alphaMultiplier,
					_alphaTarget, 0.9);
		}
	}

	public override function kill():Void
	{
		super.kill();

		var cars = getNamedProp('phillyCars');
		if (cars != null)
			FlxTween.cancelTweensOf(cars);
		var cars2 = getNamedProp('phillyCars2');
		if (cars2 != null)
			FlxTween.cancelTweensOf(cars2);

		if (rainSndAmbience != null)
			rainSndAmbience.stop();
		if (carSndAmbience != null)
			carSndAmbience.stop();
		if (carRide1 != null)
			carRide1.stop();
		if (carRide2 != null)
			carRide2.stop();

	}

	public override function destroy():Void
	{
		super.destroy();

		var cars = getNamedProp('phillyCars');
		if (cars != null)
			FlxTween.cancelTweensOf(cars);
		var cars2 = getNamedProp('phillyCars2');
		if (cars2 != null)
			FlxTween.cancelTweensOf(cars2);

		if (rainSndAmbience != null)
			rainSndAmbience.stop();
		if (carSndAmbience != null)
			carSndAmbience.stop();
		if (carRide1 != null)
			carRide1.stop();
		if (carRide2 != null)
			carRide2.stop();

	}

	override function onGameOver(event:ScriptEvent):Void
	{
		super.onGameOver(event);
		// Make it so the rain shader doesn't show over the game over screen
		PlayState.instance.camGame.filters = [];
		getBoyfriend().shader = null;
	}

	function onSongRetry(event):Void
	{
		_timer = 0;
		___time = 0;
		_alphaTarget = 1;
		lastChange = 0;
		fuckAssMultRain = 1;
		rainShaderDiagnosticSent = false;
		PlayState.instance.camGame.targetOffset.set();
		resetCar(true, true);

		var overlay = getNamedProp('fgRedOverlay');
		if (overlay != null)
		{
			FlxTween.cancelTweensOf(overlay);
			FlxTween.tween(overlay, {alpha: 0.5}, 2, {ease: FlxEase.sineInOut, type: 4});
		}

		if (stageShadersEnabled)
		{
			if (rainShaderFilter != null)
			{
				var filters = PlayState.instance.camGame.filters ?? [];
				if (filters.indexOf(rainShaderFilter) == -1)
				{
					filters.unshift(rainShaderFilter);
					PlayState.instance.camGame.filters = filters;
				}
			}
			if (rainShader != null) rainShader.intensity = rainShaderStartIntensity;
			FlxTween.cancelTweensOf(bfRim);
			FlxTween.cancelTweensOf(dadRim);
			bfRim.rimAlphaV = 0;
			dadRim.rimAlphaV = 0;
			getBoyfriend().shader = null;
			getDad().shader = null;
		}
	}

	public override function onPause(event:PauseScriptEvent)
	{
		super.onPause(event);

		pauseCars();

		// Temporarily stop ambiance.
		if (rainSndAmbience != null)
			rainSndAmbience.pause();

		if (carSndAmbience != null)
			carSndAmbience.pause();

		if (carRide1 != null)
			carRide1.pause();
		if (carRide2 != null)
			carRide2.pause();
	}

	public override function onResume(event:ScriptEvent)
	{
		super.onResume(event);

		resumeCars();

		// Temporarily stop ambiance.
		if (rainSndAmbience != null)
			rainSndAmbience.resume();
		if (carSndAmbience != null)
			carSndAmbience.resume();

		if (carRide1 != null)
			carRide1.resume();
		if (carRide2 != null)
			carRide2.resume();
	}

	var fuckAssMultRain = 1;
	function onBeatHit(event:SongTimeScriptEvent)
	{
		super.onBeatHit(event);

		// Try driving a car when its possible
		if (FlxG.random.bool(15) && event.beat != (lastChange + changeInterval) && carInterruptable)
			driveCar(getNamedProp('phillyCars'));

		// try driving one on the right too. in this case theres no red light logic, it just can only spawn on green lights
		if (FlxG.random.bool(15) && event.beat != (lastChange + changeInterval) && car2Interruptable)
			driveCarBack(getNamedProp('phillyCars2'));

		// After the interval has been hit, change the light state.
		if (event.beat == (lastChange + changeInterval))
			lastChange = event.beat;

		if (PlayState.instance.currentSong.id.toLowerCase() == "dadbattle" && stageShadersEnabled)
			switch (event.beat)
			{
				case 284:
					fuckAssMultRain = 0.4;
					getBoyfriend().shader = bfRim;
					bfRim.attachedSprite = getBoyfriend();
					getDad().shader = dadRim;
					dadRim.attachedSprite = getDad();
					FlxTween.tween(bfRim, {rimAlphaV: 0.33}, 3, {startDelay: 2, ease: FlxEase.sineInOut});
					FlxTween.tween(dadRim, {rimAlphaV: 0.33}, 3, {startDelay: 2, ease: FlxEase.sineInOut});

				case 348:
					FlxTween.tween(bfRim, {rimAlphaV: 0}, 4, {ease: FlxEase.sineInOut});
					FlxTween.tween(dadRim, {rimAlphaV: 0}, 4, { ease: FlxEase.sineInOut});
					getBoyfriend().shader = null;
					getDad().shader = null;
			}
	}

	function pauseCars():Void
	{
		var cars = getNamedProp('phillyCars');
		if (cars != null)
			FlxTweenUtil.pauseTweensOf(cars);

		var cars2 = getNamedProp('phillyCars2');
		if (cars2 != null)
			FlxTweenUtil.pauseTweensOf(cars2);
	}

	function resumeCars():Void
	{
		var cars = getNamedProp('phillyCars');
		if (cars != null)
			FlxTweenUtil.resumeTweensOf(cars);

		var cars2 = getNamedProp('phillyCars2');
		if (cars2 != null)
			FlxTweenUtil.resumeTweensOf(cars2);
	}

	function resetCar(left:Bool, right:Bool)
	{
		if (Preferences.lowQuality) return;

		if (left)
		{
			carInterruptable = true;
			var cars = getNamedProp('phillyCars');
			if (cars != null)
			{
				FlxTween.cancelTweensOf(cars);
				cars.x = -1750;
				cars.y = 450;
				cars.angle = -20;
			}
		}

		if (right)
		{
			car2Interruptable = true;
			var cars2 = getNamedProp('phillyCars2');
			if (cars2 != null)
			{
				FlxTween.cancelTweensOf(cars2);
				cars2.x = -1750;
				cars2.y = 450;
				cars2.angle = -20;
			}
		}
	}

	override function onCountdownStart(event:ScriptEvent)
	{
		super.onCountdownStart(event);

		resetCar(true, true);
	}

	function driveCar(sprite:FlxSprite):Void
	{
		if (Preferences.lowQuality) return;

		carInterruptable = false;
		FlxTween.cancelTweensOf(sprite);
		var variant:Int = FlxG.random.int(1, 4);
		sprite.animation.play('car' + variant);
		// setting an offset here because the current implementation of stage prop offsets was not working at all for me
		// if possible id love to not have to do this but im keeping this for now
		var extraOffset = [0, 0];
		var duration:Float = 2;
		// set different values of speed for the car types (and the offset)
		switch (variant)
		{
			case 1:
				extraOffset = [0, 120];
				duration = FlxG.random.float(1, 1.7);
			case 2:
				extraOffset = [30, 65];
				duration = FlxG.random.float(1.6, 2.4);
			case 3:
				extraOffset = [30, 60];
				duration = FlxG.random.float(1.8, 2.5);
			case 4:
				extraOffset = [10, 120];
				duration = FlxG.random.float(.6, 1.9);
		}
		duration *= 1.5;
		sprite.offset.set(extraOffset[0], extraOffset[1]);
		// start/end rotation
		var rotations:Array<Int> = [-20, -1];
		// the path to move the car on
		var path:Array<FlxPoint> = [FlxPoint.get(-1750, 550), FlxPoint.get(-1550, 330), FlxPoint.get(950, 360)];

		FlxTween.angle(sprite, rotations[0], rotations[1], duration * 0.7, null);
		FlxTween.quadPath(sprite, path, duration, true, {
			ease: null,
			onStart: _ ->
			{
				carRide1.fadeIn(duration * .5, 0, .9);
				carRide1.play();
			},
			unUpdate: _ -> carRide1.setPosition(sprite.x, sprite.y),
			onComplete: _ -> carRide1.fadeOut(duration * .5, 0, _ ->
			{
				carRide1.stop();
				carInterruptable = true;
			})
		});
	}

	function driveCarBack(sprite:FlxSprite):Void
	{
		if (Preferences.lowQuality) return;

		car2Interruptable = false;
		FlxTween.cancelTweensOf(sprite);
		var variant:Int = FlxG.random.int(1, 4);
		sprite.animation.play('car' + variant);
		// setting an offset here because the current implementation of stage prop offsets was not working at all for me
		// if possible id love to not have to do this but im keeping this for now
		var extraOffset = [0, 0];
		var duration:Float = 2;
		// set different values of speed for the car types (and the offset)
		switch (variant)
		{
			case 1:
				extraOffset = [0, 120];
				duration = FlxG.random.float(1, 1.7);
			case 2:
				extraOffset = [30, 65];
				duration = FlxG.random.float(1.6, 2.4);
			case 3:
				extraOffset = [30, 60];
				duration = FlxG.random.float(1.8, 2.5);
			case 4:
				extraOffset = [10, 120];
				duration = FlxG.random.float(.6, 1.9);
		}
		duration *= 1.5;
		sprite.offset.set(extraOffset[0], extraOffset[1]);
		// start/end rotation
		var rotations:Array<Int> = [-1, -20];
		// the path to move the car on
		var path:Array<FlxPoint> = [FlxPoint.get(950, 360), FlxPoint.get(-1550, 350), FlxPoint.get(-1750, 550)];

		FlxTween.angle(sprite, rotations[0], rotations[1], duration * 0.75, {startDelay: duration * 0.25});
		FlxTween.quadPath(sprite, path, duration, true, {
			ease: null,
			onStart: _ ->
			{
				carRide2.fadeIn(duration * .5, 0, .9);
				carRide2.play();
			},
			unUpdate: _ -> carRide2.setPosition(sprite.x, sprite.y),
			onComplete: _ -> carRide2.fadeOut(duration * .5, 0, _ ->
			{
				carRide2.stop();
				car2Interruptable = true;
			})
		});
	}
}
