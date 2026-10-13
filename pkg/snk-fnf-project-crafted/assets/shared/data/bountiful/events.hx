if (PlayState.SONG.stage != "customMenu" && !ClientPrefs.data.lowQuality)
{ // yeah... that's not good
	// I'm such a base FNF modder wannabe
	// import backend.Mods;
	// import psychlua.HScript;
	/*
		var alexStageScript:Hscript;

		function onCreate() {
			alexStageScript = new HScript(null, "mods/" + Mods.currentModDirectory + "/stages/alexStage.hx");
		}
	 */
	var mosaicShader;
	// thx All Night from FNF Weekly: Tweakmas
	function onCreatePost()
	{
		mosaicShader = game.createRuntimeShader('mosaic');
		mosaicShader.setFloatArray("uBlocksize", [1, 1]);
	}
	function onCountdownTick(tick:Countdown, counter:Int)
	{
		switch (tick)
		{
			case Countdown.THREE:
				// Counter equals to 0
				nc_zoom("game", 0.65, 0.7, "sineOut");
				nc_focus("opp", 1.7, "sineIn", true);
			case Countdown.TWO:
				// Counter equals to 1
			case Countdown.ONE:
				// Counter equals to 2
			case Countdown.GO:
				// Counter equals to 3
			case Countdown.START:
				// Counter equals to 4, this has no visual indication or anything, it's pretty much at nearly the exact time the song starts playing
		}
	}
	function onSongStart()
	{
		nc_zoom("game", 0.8, 0.7, "sineOut");
		// nc_focus("opp", 1, "circIn", false);
	}
	function onStepHit()
	{
		switch curStep
		{
			case 10:
				nc_lock(false, false);
			case 88:
				nc_zoom("g", 0.7, 0, "circOut");
			case 98:
				nc_zoom("g", 0.8, 0, "circOut");
			case 112:
				nc_focus("center", 1, "circOut", true);
				nc_zoom("g", 0.7, 0, "circOut");
			case 140:
				nc_zoom("g", 0.6, 0, "circOut");
			case 128:
				nc_zoom("g", 0.6, 1.3, "sineOut");
				nc_zoom("h", 0.95, 1.3, "sineOut");
				triggerEvent("darknessTwn", 0.7, "1.3,sineIn");
			case 143:
				nc_lock(false, false);
			case 144:
				nc_snap_zoom("g", 0.85);
				nc_snap_zoom("h", 1.1);
				nc_snap_target("plr");
				nc_bump("g", 2);
				nc_zoom("g", 0.7, 1, "expoOut");
				nc_zoom("h", 1, 1, "expoOut");
				triggerEvent("darknessTwn", 0);
				triggerEvent("brightnessTwn", 0.2);
				triggerEvent("brightnessTwn", 0, "0.6,circOut");
			case 176:
				nc_zoom("g", 0.8, 0, "circOut");
			case 192:
				nc_zoom("g", 0.9, 0, "circOut");
			case 208:
				nc_focus("center", 1, "circOut", true);
				nc_zoom("g", 0.7, 0, "circOut");
			case 271:
				nc_lock(false, false);
			case 272:
				nc_zoom("g", 0.8, 0, "circOut");
			case 368:
				nc_focus("center", 1, "circOut", true);
				nc_zoom("g", 0.7, 0, "circOut");
			case 400:
				nc_snap_zoom("g", 0.55);
				nc_snap_zoom("h", 0.9);
				camGame.fade(0x44000000, 0.01, false, null, true);
				triggerEvent("darknessTwn", 0.5);

				boyfriend.holdTimer = 0;
				dad.holdTimer = 0;
				boyfriend.dance();
				dad.dance();
			case 416:
				nc_zoom("g", 0.5, 1.3, "sineOut");
			case 425:
				camGame.fade(0x44000000, 0.6, true, null, true);
				triggerEvent("darknessTwn", 0, "0.6,circOut");
			case 431:
				nc_lock(false, false);
			case 432:
				nc_zoom("g", 0.7, 0, "backOut");
				nc_snap_zoom("h", 1);
				// nc_snap_zoom("g", 0.7);
				// nc_snap_target("plr");
				nc_bump("g", 2);
				nc_bump("h", 6);
			case 474:
				nc_zoom("g", 0.75, 0, "circOut");
			case 536:
				nc_zoom("g", 0.7, 0, "circOut");
			case 552:
				nc_focus("plr", 0.65, "expoOut", false);
			case 560:
				nc_snap_target("plr");
			case 610:
				nc_snap_zoom("g", 0.72);
			case 612:
				nc_snap_zoom("g", 0.74);
			case 614:
				nc_snap_zoom("g", 0.76);
			case 616:
				nc_snap_zoom("g", 0.78);
			case 618:
				nc_snap_zoom("g", 0.8);
			case 620:
				nc_snap_zoom("g", 0.82);
			case 622:
				nc_snap_zoom("g", 0.84);
			case 624:
				nc_zoom("g", 0.6, 1, "expoOut");
				nc_focus("center", 1, "expoOut", true);
			case 664:
				nc_lock(false, false);
				nc_focus("opp", 1, "circOut", false);
				nc_zoom("g", 0.7, 1, "expoOut");
			case 681:
				camGame.filters = [new ShaderFilter(mosaicShader)];
				FlxTween.num(1, 50, 0.6, {ease: FlxEase.quadIn}, function(num:Int)
				{
					mosaicShader.setFloatArray("uBlocksize", [num, num]);
				});
			case 688:
				// alexStageScript.call("changeStageTo3d", []); //THIS STUFF SUCKS. IT DOESN'T WORK PROPERLY.
				// changeStageTo3d();
				triggerEvent("changeStageTo3d");
				nc_snap_zoom("game", 1.5);
				nc_snap_target("opp");
				camGame.filters = [new ShaderFilter(mosaicShader)];
				FlxTween.num(50, 1, 0.6, {
					ease: FlxEase.quadOut,
					onComplete: function(twn:FlxTween)
					{
						camGame.filters = [];
					}
				}, function(num:Int)
				{
					mosaicShader.setFloatArray("uBlocksize", [num, num]);
				});
			case 720:
				nc_zoom("g", 1.6, 0, "circOut");
			case 736:
				nc_zoom("g", 1.5, 0, "circOut");
			case 944:
				nc_focus("center", 1, "circOut", true);
				nc_zoom("g", 1.3, 0, "circOut");
			case 1008:
				nc_zoom("g", 1.4, 0, "circOut");
			case 1040:
				nc_zoom("g", 1.5, 0, "circOut");
			case 1056:
				nc_lock(false, false);
				nc_focus("opp", 1, "circOut", false);
			case 1062:
				nc_zoom("g", 1.35, 0, "circOut");
			case 1072:
				// alexStageScript.call("changeStageTo2d", []);
				// changeStageTo2d();
				triggerEvent("changeStageTo2d");
				nc_lock(false, false);
				nc_snap_zoom("game", 0.8);
				nc_snap_target("opp");
				triggerEvent("brightnessTwn", 0.2);
				triggerEvent("brightnessTwn", 0, "0.5,circOut");

				nc_shake("g", 5, 5, 0.15, "linear");
				nc_shake("h", 5, 5, 0.15, "linear");
			case 1136:
				nc_zoom("g", 0.7, 1, "quadOut");
				nc_zoom("h", 0.95, 1, "quadOut");
				triggerEvent("darknessTwn", 0.3, "0.3,circOut");
			case 1146:
				nc_zoom("g", 0.9, 0.45, "expoIn");
				nc_zoom("h", 1, 0.45, "expoIn");
			case 1152:
				nc_snap_zoom("g", 0.9);
				nc_snap_zoom("h", 1);
				nc_bump("g", 2);
				triggerEvent("darknessTwn", 0, "0.6,circOut");
				triggerEvent("brightnessTwn", 0.2);
				triggerEvent("brightnessTwn", 0, "0.5,circOut");
			case 1200:
				nc_zoom("g", 0.7, 2, "quadInOut");
				nc_zoom("h", 0.95, 2, "quadInOut");
				triggerEvent("darknessTwn", 0.3, "0.3,circOut");
			case 1226:
				nc_zoom("g", 0.9, 0.45, "expoIn");
				nc_zoom("h", 1, 0.45, "expoIn");
			case 1232:
				nc_snap_zoom("g", 0.9);
				nc_snap_zoom("h", 1);
				nc_bump("g", 2);
				triggerEvent("darknessTwn", 0, "0.6,circOut");
				triggerEvent("brightnessTwn", 0.2);
				triggerEvent("brightnessTwn", 0, "0.5,circOut");
			case 1264:
				nc_zoom("g", 0.8, 0, "circOut");
			case 1272:
				nc_zoom("g", 0.6, 5, "sineInOut");
				nc_focus("center", 5, "sineInOut", true);
				triggerEvent("brightnessTwn", 0.15, "5,sineInOut");
			case 1328:
				nc_zoom("g", 0.8, 0, "circOut");
				nc_lock(false, false);
				triggerEvent("brightnessTwn", 0, "0.5,circOut");
			case 1424:
				nc_zoom("g", 0.7, 0, "circOut");
				nc_focus("center", 1, "circOut", true);
			case 1440:
				nc_zoom("g", 0.65, 0, "circOut");
			case 1446:
				nc_zoom("g", 0.45, 2, "sineOut");
				camGame.fade(0xFF000000, 1.69, false, null, true);
			// triggerEvent("darknessTwn", 1, "1.69,quintIn");
			case 1448:
				camHUD.alpha = 0.66;
			case 1450:
				camHUD.alpha = 0.33;
			case 1452:
				camHUD.alpha = 0.5;
			case 1453:
				camHUD.alpha = 1;
			case 1455:
				camHUD.alpha = 0;
		}
	}
}
