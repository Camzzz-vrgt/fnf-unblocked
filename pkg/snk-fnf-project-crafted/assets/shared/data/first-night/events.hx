if (PlayState.SONG.stage != "customMenu" && !ClientPrefs.data.lowQuality) { //yeah... that's not good
    import backend.Mods;
    import flixel.util.FlxTimer;
    import psychlua.FunkinLua;
    import psychlua.LuaUtils;
    import objects.VideoSprite;
    using StringTools;

    var blurShaderX;
    var blurShaderY;
    var skipTxt:FlxText;
    var seenCutscene:Bool = PlayState.seenCutscene;

    var pathModule:String = "mods/" + Mods.currentModDirectory + "/scripts/modules/";
    new FunkinLua(pathModule + "zCameraFix.lua");
    initHScript(pathModule + "cameraAngleEvents.hx");
    initHScript(pathModule + "songStartNoteTween.hx");

    var ghostTapping:Bool = ClientPrefs.data.ghostTapping;

    // it's a box
    var fadeScreenRotationFix:FlxSprite;

    var finalFade:FlxTween = null;

    function onCreate() {
        FlxG.mouse.visible = true;

        game.setOnLuas("pos_speed", 5);
        game.setOnLuas("offset_radius", 3);
        game.setOnLuas("sectionEase", "cubeOut");
        game.setOnLuas("natural_bump_toggle", false);
        boyfriend.danceEveryNumBeats = 3;
        dad.x -= 150;

        blurShaderX = game.createRuntimeShader('box_blur');
        blurShaderX.setInt("u_radius", 0);
        blurShaderX.setBool("u_horizontal", true);
        blurShaderY = game.createRuntimeShader('box_blur');
        blurShaderY.setInt("u_radius", 0);
        blurShaderY.setBool("u_horizontal", false);


        skipTxt = new FlxText(0, 550, FlxG.width, "Press SPACE to skip", 24);
        if (LuaUtils.getBuildTarget() != 'windows' && LuaUtils.getBuildTarget() != 'mac' && LuaUtils.getBuildTarget() != 'linux')
            skipTxt.text = "Tap me to skip";
        skipTxt.setFormat(Paths.font("MinecraftRegular.ttf"), 24, FlxColor.WHITE, FlxTextAlign = "center");
        skipTxt.cameras = [camOther];
        skipTxt.updateHitbox();
        //add(makeShadow(skipTxt));
        add(skipTxt);
        skipTxt.visible = false;

        fadeScreenRotationFix = new FlxSprite(0, 0).makeGraphic(FlxG.width * 1.5, FlxG.height * 1.5, 0xFF000000);
        fadeScreenRotationFix.scrollFactor.set(0, 0);
		fadeScreenRotationFix.updateHitbox();
        fadeScreenRotationFix.screenCenter();
        fadeScreenRotationFix.cameras = [camHUD];
		insert(0, fadeScreenRotationFix);
        fadeScreenRotationFix.visible = false;
        fadeScreenRotationFix.alpha = 0;

        if (!PlayState.chartingMode) {
            //camGame.fade(0xFF000000, 0.00001, false, null, true);
            fadeScreenRotationFix.visible = true;
            fadeScreenRotationFix.alpha = 1;
            uiGroup.visible = false;
            //noteGroup.visible  = false;
            game.getLuaObject("iconOpp").alpha = 0;
        }

        // Thx CommanderVideo_ from Psych Engine Discord
        game.startVideo("firstNight-start", true, false, false, false);
    }

    function onCreatePost() {
        // Thx CommanderVideo_ from Psych Engine Discord
        game.startVideo("firstNight-start", true, false, false, false);

        // Way too many bugs with loading the videos
        Paths.video("firstNight-start");
        Paths.video("firstNight-mid");

        ClientPrefs.data.ghostTapping = true;
    }

    var skipped:Bool = false;
    function onUpdatePost() {
        if (keyboardJustPressed("SPACE") && !PlayState.instance.startingSong && !skipped)
            skip();
        else if (FlxG.mouse.overlaps(skipTxt, camOther) && FlxG.mouse.justPressed && !PlayState.instance.startingSong && !skipped)
            skip();
        else if (!skipped && Conductor.songPosition >= 18.8 * 1000) {
            FlxG.mouse.visible = false;
            skipped = true;
            skipTxt.visible = false;
        }
    }
    function skip() {
        game.skipCountdown = true;
        FlxG.mouse.visible = false;
        skipped = true;
        skipTxt.visible = false;
        PlayState.instance.setSongTime(18.8 * 1000);

        nc_lock(false, false);
        nc_snap_target("plr");
        nc_snap_zoom("g", 1);
    }


    function onCountdownTick(tick:Countdown, counter:Int){
        switch(tick)
        {
            
            case Countdown.THREE:
                if (!PlayState.chartingMode) {
                    /*
                    nc_set_target("opp", 580, -360);
                    nc_snap_target("opp");
                    nc_snap_zoom("g", 1.8);
                    nc_set_target("plr", 900, 400);
                    nc_focus("plr", 6, "quadInOut", true);
                    nc_zoom("game", 1, 6, "quadInOut");
                    */
                }
        }
    }

    function onSongStart() {
        if (!PlayState.chartingMode) {
            game.startVideo("firstNight-start", true, false, false, true);
            game.videoCutscene.cameras = [camHUD];
            game.remove(game.videoCutscene);
            insert(members.indexOf(fadeScreenRotationFix) + 1, game.videoCutscene);
            game.videoCutscene.videoSprite.bitmap.onFormatSetup.add(function()
                {
                    game.videoCutscene.videoSprite.setGraphicSize(800, 600);
                    game.videoCutscene.videoSprite.scale.set(0.5 /* * 3 / 4*/, 0.5);
                    game.videoCutscene.videoSprite.updateHitbox();
                    game.videoCutscene.videoSprite.screenCenter();

                    // video sync
                    game.videoCutscene.videoSprite.bitmap.time = Conductor.songPosition;

                    if (seenCutscene) skipTxt.visible = true;
                });
            }
    }

    function onPause() {
        if (game.videoCutscene != null)
            game.videoCutscene.pause();
    }

    function onResume() {
        if (game.videoCutscene != null)
            game.videoCutscene.resume();
    }

    //max zoom 0.6
    function onStepHit() {
        switch curStep {
            case 180:
                /*
                for (i in strumLineNotes)
                    i.alpha = 0;
                noteGroup.visible = true;
                for (i in 0...strumLineNotes.members.length)
                    FlxTween.tween(strumLineNotes.members[i], { alpha: (i < 4 && ClientPrefs.data.middleScroll ? 0.35 : 1) }, 0.5, { ease: FlxEase.linear, startDelay: (0.02 * (strumLineNotes.members.length - i) )});
                */
                triggerEvent("songStartNoteTween", 0.5, "0.02,linear,reversed,1");
            case 188:
                //camGame.fade(0xFF000000, 0.5, true, null, true);
                FlxTween.tween(fadeScreenRotationFix, { alpha: 0 }, 0.5, { ease: FlxEase.linear });
                FlxTween.tween(game.getLuaObject("iconOpp"), { alpha: 1 }, 0.5, { ease: FlxEase.linear });
                uiGroup.alpha = 0;
                uiGroup.visible = true;
                iconP2.visible = false;
                botplayTxt.visible = ClientPrefs.getGameplaySetting('botplay');
                FlxTween.tween(uiGroup, { alpha: 1 }, 0.5, { ease: FlxEase.linear });

                if (!PlayState.chartingMode && game.videoCutscene != null)
                FlxTween.tween(game.videoCutscene, { alpha: 0 }, 0.5, { ease: FlxEase.linear, 
                    onComplete: function(twn:FlxTween) {
                        
                        game.videoCutscene.videoSprite.setGraphicSize(960, 720);
                        game.videoCutscene.videoSprite.scale.set(1280 / 960, 1280 / 960);
                        game.videoCutscene.videoSprite.updateHitbox();
                        
                        game.videoCutscene.destroy();
                    }});

                nc_set_target("plr", 900, 400);
                nc_snap_target("plr");
                nc_snap_zoom("g", 1.2);
                
                //it just crashes the game
                /*
                //I hope this will fix the videocutscene size bug
                new FlxTimer().start(0.52, function(tmr:FlxTimer) { 
                    if (game.videoCutscene != null) {
                        game.videoCutscene.videoSprite.setGraphicSize(960, 720);
                        game.videoCutscene.videoSprite.scale.set(1280 / 960, 1280 / 960);
                        game.videoCutscene.videoSprite.updateHitbox();
                    }
                });
                */


                ClientPrefs.data.ghostTapping = ghostTapping;

            case 192:
                game.setOnLuas("natural_bump_toggle", true);
            case 216:
                nc_zoom("game", 1.3, 0, "circOut");
            case 232:
                nc_lock(false, false);
                dad.x = 150;
            case 240:
                nc_reload_targets();
                nc_zoom("game", 1, 0, "circOut");
                triggerEvent("cameraAngleTwn", -2, "6,sineInOut");
            case 264:
                nc_zoom("game", 1.1, 0, "circOut");
            case 288:
                nc_focus("center", 1.2, "circOut", true);
                nc_zoom("game", 0.8, 0, "circOut");
                triggerEvent("cameraAngleTwn", 0, "2,quadInOut");
            case 360:
                nc_zoom("game", 0.9, 0, "circOut");
            case 384:
                nc_lock(false, false);
                nc_zoom("game", 1.2, 0, "circOut");
            case 408:
                nc_zoom("game", 1.25, 0, "circOut");
                triggerEvent("cameraAngleTwn", 1, "2,quadOut");
            case 456:
                nc_zoom("game", 1.3, 0, "circOut");
                triggerEvent("cameraAngleTwn", 2, "2,quadOut");
            case 480 - 6:
                triggerEvent("cameraAngleTwn", 0, "2,sineInOut");
            case 480:
                nc_zoom("game", 1.2, 0, "circOut");
            case 528:
                nc_zoom("game", 1.25, 0, "circOut");
                triggerEvent("cameraAngleTwn", -1, "2,quadOut");
            case 564:
                triggerEvent("cameraAngleTwn", 0, "2,quadOut");
                nc_zoom("game", 1.2, 0, "circOut");
            case 576:
                triggerEvent("cameraAngleTwn", 2, "6,sineInOut");
            case 600:
                nc_zoom("game", 1.25, 0, "circOut");
            case 624:
                nc_zoom("game", 1.3, 0, "circOut");
            case 648:
                nc_zoom("game", 1.35, 0, "circOut");
            case 672:
                nc_zoom("game", 1.2, 0, "circOut");
                triggerEvent("cameraAngleTwn", -2, "6,sineInOut");
            case 744:
                nc_zoom("game", 1.25, 0, "circOut");
            case 750:
                // fixes the stage being visible through fade when the camera is rotated

                //camGame.fade(0xFF000000, 1.6, false, null, true);
                fadeScreenRotationFix.visible = true;
                FlxTween.tween(fadeScreenRotationFix, { alpha: 1 }, 1.6, { ease: FlxEase.linear });
            case 768 - 2:
                nc_snap_zoom("g", 0.7);
            case 768:
                triggerEvent("cameraAngleTwn", 0);

                //camGame.fade(0xFF000000, 0.5, true, null, true);
                fadeScreenRotationFix.visible = false;

                nc_snap_target("plr");
                nc_snap_zoom("g", 0.7);
                
                game.startVideo("firstNight-mid", true, false, false, true);
                game.videoCutscene.cameras = [camGame];
                game.videoCutscene.scrollFactor.set(0, 0);
                game.remove(game.videoCutscene);
                addBehindGF(game.videoCutscene);
                game.videoCutscene.videoSprite.bitmap.onFormatSetup.add(function()
                    {
                        game.videoCutscene.videoSprite.setGraphicSize(960 * 2, 720 * 2);
                        //game.videoCutscene.videoSprite.scale.set(1280 / 960, 1280 / 960);
                        game.videoCutscene.videoSprite.blend = 0;
                        game.videoCutscene.videoSprite.alpha = 1;
                        game.videoCutscene.videoSprite.updateHitbox();
                        game.videoCutscene.videoSprite.screenCenter();
                        game.videoCutscene.videoSprite.y += 35;
                        debugPrint(""); //idk how it works but it somehow fixes the video scale bug
                    });
                game.videoCutscene.videoSprite.setGraphicSize(960, 720);
                game.videoCutscene.videoSprite.scale.set(1280 / 960, 1280 / 960);
                game.videoCutscene.videoSprite.updateHitbox();
                //triggerEvent("vignetteTwn", 0);

                
            case 780:
                nc_zoom("game", 0.725, 0, "circOut");
            case 792:
                nc_zoom("game", 0.75, 0, "circOut");
            case 816:
                nc_zoom("game", 0.7, 0, "circOut");
            case 840:
                nc_zoom("game", 0.725, 0, "circOut");
            case 864:
                nc_zoom("game", 0.7, 0, "circOut");
            case 876:
                nc_zoom("game", 0.725, 0, "circOut");
            case 888:
                nc_zoom("game", 0.75, 0, "circOut");
            case 912:
                nc_zoom("game", 0.725, 0, "circOut");
            case 932:
                nc_zoom("game", 0.75, 0, "circOut");
            case 948:
                nc_zoom("game", 0.7, 0, "circOut");
                FlxTween.tween(game.videoCutscene, { alpha: 0 }, 0.5, { ease: FlxEase.linear, 
                    onComplete: function(twn:FlxTween) {
                        game.videoCutscene.destroy();
                    }});
                
            case 960:
                fadeScreenRotationFix.alpha = 0;
                fadeScreenRotationFix.visible = true;
                startFinalFade();
                //camGame.fade(0xFF000000, 19, false, null, true);
                camGame.filters = [new ShaderFilter(blurShaderX), new ShaderFilter(blurShaderY)];
                if (getVar('dropShadowCamera') != null) {
                    getVar('dropShadowCamera').filters.push(new ShaderFilter(blurShaderX));
                    getVar('dropShadowCamera').filters.push(new ShaderFilter(blurShaderY));
                }
                FlxTween.num(0, 32, 20, {ease: FlxEase.sineIn}, 
                    function(num:Int) {
                        blurShaderX.setInt("u_radius", num);
                        blurShaderY.setInt("u_radius", num);
                    }
                );

                nc_focus("center", 6, "quadInOut", true);
                nc_zoom("game", 0.46, 19, "linear");
            case 1140:
                camHUD.fade(0xFF000000, 1.3, false, null, true);
        }



    }

    //Thx LarryFrosty from Psych Ward
    function onBeatHit() {
        if (!gf.animation.name.startsWith("sad")) {
            if (curBeat % 2 == 0)
                gf.playAnim("danceLeft", true);
            else
                gf.playAnim("danceRight", true);
        }

        // The game may skip curStep == 960 code
        // So it has to be done bcuz its a pretty event for the song
        if (curStep > 960 && finalFade == null) startFinalFade();
    }

    function onDestroy() {
        ClientPrefs.data.ghostTapping = ghostTapping;
    }

    function startFinalFade() {
        finalFade = FlxTween.tween(fadeScreenRotationFix, { alpha: 1 }, 19, { ease: FlxEase.linear });
    }

    /*
    funny bop
    function onBeatHit()
        if curBeat % 2 == 0 and not stringStartsWith(getProperty('gf.animation.name'), 'sing') and not getProperty('gf.stunned') then
            callMethod('gf.dance', {})
        end
    end

    if not (stringStartsWith(getProperty('dad.anim.curSymbol.name'), 'left') 
        or stringStartsWith(getProperty('dad.anim.curSymbol.name'), 'down')
        or stringStartsWith(getProperty('dad.anim.curSymbol.name'), 'up')
        or stringStartsWith(getProperty('dad.anim.curSymbol.name'), 'right') ) and not getProperty('dad.stunned') then
        if curStep % 12 == 0 then
            playAnim('dad', 'danceLeft', true)
        elseif curStep % 12 == 6 then
            playAnim('dad', 'danceRight', true)
        end
    end
    */
}