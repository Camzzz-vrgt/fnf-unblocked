if (PlayState.SONG.stage != "customMenu" && !ClientPrefs.data.lowQuality) { //yeah... that's not good
    import flixel.util.FlxTimer;    
    import flixel.sound.FlxSound;
    import flixel.math.FlxBasePoint;
    import substates.GameOverSubstate;
    import flixel.FlxCamera.FlxCameraFollowStyle;


    var opp:FlxBasePoint = new FlxBasePoint(
        dad.getMidpoint().x + 150 + dad.cameraPosition[0] + opponentCameraOffset[0],
        dad.getMidpoint().y - 100 + dad.cameraPosition[1] + opponentCameraOffset[1]
    );
    var plr:FlxBasePoint = new FlxBasePoint(
        boyfriend.getMidpoint().x - 100 - boyfriend.cameraPosition[0] + boyfriendCameraOffset[0],
        boyfriend.getMidpoint().y - 100 + boyfriend.cameraPosition[1] + boyfriendCameraOffset[1]
    );

    var path:String = "stages/mojangLogo/";
    var allowCountdown:Bool = false;
    var seenCutscene:Bool = true;
    var originalPos:Array<Float> = [0,0,0,0,0,0];
    
    var staticImage:FlxSprite;

    var fadeFix:FlxSprite;
    
    var amogusTransition:FlxAnimate;
    var amogusTransitionScale:Float = 1;
    var amogusTransitionCurFrame:Int = -1;
    
    function onCreate() {
        //PlayState.seenCutscene is always true in onStartCountdown in HScript for some reason
        seenCutscene = PlayState.seenCutscene;
        
        GameOverSubstate.deathSoundName = "noSound";
        GameOverSubstate.loopSoundName = "noSound";
        GameOverSubstate.endSoundName = "noSound";
        GameOverSubstate.characterName = 'papaya-gameOver';
        
        fadeFix = new FlxSprite(0, 0).makeGraphic(FlxG.width * 1.5, FlxG.height * 1.5, 0xFF000000);
        fadeFix.scrollFactor.set(0, 0);
		fadeFix.updateHitbox();
        fadeFix.screenCenter();
		add(fadeFix);
        fadeFix.visible = false;
        fadeFix.alpha = 0;

        amogusTransition = new FlxAnimate(-400, -175);
        Paths.loadAnimateAtlas(amogusTransition, "stages/mojangLogo/amogusEvent");
        amogusTransition.anim.addBySymbol("intro", "intro", 24, false);
        amogusTransition.anim.addBySymbol("bop0", "bop0", 24, false);
        amogusTransition.anim.addBySymbol("bop1", "bop1", 24, false);
        amogusTransition.anim.addBySymbol("charging", "charging", 24, false);
        amogusTransition.anim.addBySymbol("jump", "jump", 24, false);
        amogusTransition.antialiasing = ClientPrefs.data.antialiasing;
        amogusTransition.scale.set(1, 1);
        amogusTransition.updateHitbox();
        amogusTransition.origin.set(1920 / 2 - 50, 1080 / 2 + 200);
        addBehindDad(amogusTransition);
        amogusTransition.visible = false;
    }

    function onCreatePost() {
        originalPos[0] = dad.x; 
        originalPos[1] = dad.y; 
        originalPos[2] = gf.x; 
        originalPos[3] = gf.y;
        originalPos[4] = boyfriend.x;
        originalPos[5] = boyfriend.y;

        addCharacterToList("amogus-big", 1);
        addCharacterToList("bf_craft-big", 0);

        Paths.video("miniCrewmateKillsFNF");

        nc_set_target("opp", ((opp.x + 70 - 250) + (plr.x + 100)) / 2, ((opp.y + 50) + (plr.y + 50)) / 2);
        
        nc_snap_target("opp");

        nc_set_target("opp", opp.x + 70 - 250, opp.y + 50);
        nc_set_target("plr", plr.x + 100, plr.y + 50);
    }

    function onStartCountdown() {
        if (!allowCountdown && !seenCutscene) {
            PlayState.seenCutscene = true;
            doCutscene();
            return Function_Stop;
        }
        else {
            return Function_Continue;
        }
    }

    // There must be an easier way to do cutscenes instead of using timers
    // Note to past self: there's no easy way to do that. Funkin devs do the same stuff.
    function doCutscene() {
        triggerEvent("transitionCancel");

        uiGroup.visible = false;
        // neoCam needs some time to set their functions on this script,
        // but I think it's a bad practice, cuz a low-end device may take more time than 0.1 seconds to do this.
        new FlxTimer().start(0.1, function(tmr:FlxTimer) {
            // I had to press alt tab a couple of times to make it close to the original
            if (getModSetting("more3d")) {
                nc_set_target("opp", 600, -1200);
                nc_snap_target("opp");
                nc_snap_zoom("g", 1.1);
            }
            else {
                nc_set_target("opp", 615, -1600);
                nc_snap_target("opp");
                nc_snap_zoom("g", 0.83);
            }
            
            triggerEvent("bgSet", "-500");
        });


        new FlxTimer().start(1, function(tmr:FlxTimer) {
            FlxG.sound.play(Paths.sound("papaya/mojangStudios-" + FlxG.random.int(1, 2)));
        });

        new FlxTimer().start(2.5, function(tmr:FlxTimer) {
            //triggerEvent("nc_reload_targets", "", "");
            nc_set_target("opp", opp.x + 70 - 250, opp.y + 50);
            nc_set_target("plr", plr.x + 100, plr.y + 50);
            nc_focus("opp", 3, "quadInOut", true);
            nc_zoom("game", game.defaultCamZoom, 3, "quadInOut");
            triggerEvent("bgTwn", 3);
        });
        
        new FlxTimer().start(4, function(tmr:FlxTimer) {
            uiGroup.visible = true;
            uiGroup.alpha = 0;

            FlxTween.tween(uiGroup, { alpha: 1 }, 12/24, { ease: FlxEase.sineIn });
            botplayTxt.visible = ClientPrefs.getGameplaySetting('botplay');

            allowCountdown = true;
            startCountdown();
        });

        new FlxTimer().start(2.5 + 3, function(tmr:FlxTimer) {
            nc_lock(false, false);
            //triggerEvent("nc_reload_targets", "", "");
            nc_set_target("opp", opp.x + 70 - 250, opp.y + 50);
            nc_set_target("plr", plr.x + 100, plr.y + 50);
        });
    }

    function onGameOverStart() {
        camGame.bgColor = 0xFFFFFFFF;
        
        game.startVideo("miniCrewmateKillsFNF");
        game.videoCutscene.finishCallback = onVideoEnd;
        
        camGame.zoom = 2;

        /*
        //thx LarryFrosty
        FlxG.camera.target = null;
        camGame.scroll.set(0, 0);
        boyfriend.x = 0;
        boyfriend.y = 0;
        FlxG.camera.scroll.set(boyfriend.getGraphicMidpoint().x + boyfriend.cameraPosition[0], boyfriend.getGraphicMidpoint().y + boyfriend.cameraPosition[1]);
        */
        //i cant add the image in gameover
        /*
        staticImage = new FlxSprite(0, 0).loadGraphic(Paths.image(path + "miniCrewmateKillsFNFStatic"));
        staticImage.scale.set(2, 2);
        staticImage.updateHitbox();
        staticImage.antialiasing = ClientPrefs.data.antialiasing;
        staticImage.cameras = [camOther];
        add(staticImage);
        */
    }

    function onGameOverConfirm(retry) {
        // Called when you Press Enter/Esc on Game Over
        // If you've pressed Esc, value "retry" will be false
        if (retry) {
            game.remove(game.videoCutscene);
			game.videoCutscene.destroy();

            //it doesnt work
            FlxTween.num(85, 0, 1, {ease: FlxEase.circOut}, 
                function(num:Float){
                    boyfriend.setColorTransform(1.0, 1.0, 1.0, 1.0, num, num, num, 0.0);
                }
            );
        }
        FlxG.sound.music.stop();
		FlxG.sound.play(Paths.music("gameOverEnd"));
    }

    function onVideoEnd() {
        FlxG.sound.playMusic(Paths.music("gameOver"), 0, true);
		FlxTween.tween(FlxG.sound.music,{volume: 1}, 4, {ease: FlxEase.quintIn});
    }
    
    function onStepHit() {
        switch curStep {
            case 120:
                game.setOnLuas("note_offset", false);
                nc_zoom("game", 0.4, 1.2, "quartInOut");
                nc_set_target("opp", ((opp.x + 70 - 250) + (plr.x + 100)) / 2, ((opp.y + 50) + (plr.y + 50)) / 2);
                nc_focus("opp", 1.2, "sineInOut", true);
            case 126:
                nc_zoom("g", 0.75, 0.45, "expoIn");
                nc_set_target("opp", opp.x + 70 - 250, opp.y + 50);
                nc_focus("opp", 0.45, "expoIn", true);
            case 132:
                nc_snap_zoom("g", 0.75);
                nc_bump("g", 4);
                nc_set_target("opp", opp.x + 70 - 250 - 15, opp.y + 50);
                nc_snap_target("opp");
                nc_lock(false, false);
                nc_set_target("opp", opp.x + 70 - 250, opp.y + 50);
                nc_focus("opp", 0, "circOut", false);
                game.setOnLuas("note_offset", getModSetting("camNoteFollow"));
            case 160:
                nc_zoom("game", 0.8, 0, "circOut");
            case 174:
                nc_zoom("game", 0.85, 0, "circOut");
            case 192:
                nc_zoom("game", 0.75, 0, "circOut");
            case 224:
                nc_zoom("game", 0.8, 0, "circOut");
            case 238:
                nc_zoom("game", 0.85, 0, "circOut");
            case 256:
                nc_zoom("game", 0.75, 0, "circOut");
                spinNote();
            case 260:
                spinNote();
            case 264:
                spinNote();
            case 268:
                spinNote();
            case 280:
                nc_zoom("game", 0.8, 0, "circOut");
            case 284:
                nc_zoom("game", 0.85, 0, "circOut");
            case 288:
                nc_zoom("game", 0.8, 0, "circOut");
            case 292:
                nc_zoom("game", 0.75, 0, "circOut");
            case 296:
                nc_zoom("game", 0.7, 0, "circOut");
            case 304:
                nc_zoom("game", 0.75, 0, "circOut");
            case 314:
                nc_zoom("game", 0.8, 0, "circOut");
            case 320:
                nc_zoom("game", 0.85, 0, "circOut");
            case 336:
                nc_zoom("game", 0.75, 0, "circOut");
            case 352:
                nc_zoom("game", 0.85, 0, "circOut");
            case 368:
                nc_zoom("game", 0.75, 0, "circOut");
            case 384:
                nc_zoom("game", 0.9, 0, "circOut");
            case 396:
                //nc_set_target("plr", plr.x + 100, plr.y + 50);
                nc_set_target("plr", plr.x + 100 + 100, plr.y + 50 + 60);
                nc_snap_target("plr");
                nc_snap_zoom("g", 1);
                game.setOnLuas("note_offset", false);
            case 400:
                fadeFix.visible = true;
                fadeFix.alpha = 1;
                //camGame.fade(0xFF000000, 2, true, null, true);
                FlxTween.tween(fadeFix, { alpha: 0 }, 2, { ease: FlxEase.linear });

                nc_set_target("opp", opp.x + 70 - 250, opp.y + 200);
                nc_snap_target("opp");
                nc_snap_zoom("g", 1.1);
                nc_set_target("opp", opp.x - 30 - 250, opp.y + 200);
                nc_focus("opp", 64 * Conductor.stepCrochet / 1000, "linear", true);
                game.setOnLuas("note_offset", false);

                triggerEvent("Change Character", "bf", "bf_craft-big");
                boyfriend.scrollFactor.set(0, 0);
                boyfriend.alpha = 0;
                boyfriend.x = 700;
                boyfriend.y = -200;
                boyfriend.angle = -2;
                boyfriend.blend = 8;

                remove(boyfriendGroup, true);
                insert(members.indexOf(dadGroup), boyfriendGroup);

                FlxTween.tween(boyfriend, {y: boyfriend.y + 50, angle: 2}, 64 * Conductor.stepCrochet / 1000, {ease: FlxEase.linear});
                FlxTween.tween(boyfriend, {alpha: 0.4}, 3, {ease: FlxEase.sineOut});

                triggerEvent("Set GF Speed", 2);
            case 440:
                //camGame.fade(0xFF000000, 2, false, null, true);
                FlxTween.tween(fadeFix, { alpha: 1 }, 2, { ease: FlxEase.linear });
            case 453:
                FlxTween.tween(boyfriend, {alpha: 0}, 1, {ease: FlxEase.sineIn});
            case 464:
                //camGame.fade(0xFF000000, 2, true, null, true);
                FlxTween.tween(fadeFix, { alpha: 0 }, 2, { ease: FlxEase.linear });

                nc_set_target("plr", plr.x - 30 + 100, plr.y + 100);
                nc_snap_target("plr");
                nc_snap_zoom("g", 1);
                nc_lock(false, false);
                nc_set_target("plr", plr.x + 70 + 100, plr.y + 100);
                nc_focus("plr", 64 * Conductor.stepCrochet / 1000, "linear", true);
                game.setOnLuas("note_offset", false);


                triggerEvent("Change Character", "dad", "amogus-big");
                triggerEvent("Change Character", "bf", "bf_craft");
                dad.scrollFactor.set(0, 0);
                dad.alpha = 0;
                dad.x = 100;
                dad.y = 200;
                dad.angle = 2;
                dad.blend = 8;

                boyfriend.scrollFactor.set(1, 1);
                boyfriend.alpha = 1;
                boyfriend.x = originalPos[4];
                boyfriend.y = originalPos[5];
                boyfriend.angle = 0;
                
                
                remove(dad, true);
                insert(members.indexOf(boyfriendGroup), dadGroup);

                FlxTween.tween(dad, {y: dad.y + 50, angle: -2}, 64 * Conductor.stepCrochet / 1000, {ease: FlxEase.linear});
                FlxTween.tween(dad, {alpha: 0.4}, 3, {ease: FlxEase.sineOut});
            case 508:
                //camGame.fade(0xFF000000, 20 * Conductor.stepCrochet / 1000, false, null, true);
                FlxTween.tween(fadeFix, { alpha: 1 }, 20 * Conductor.stepCrochet / 1000, { ease: FlxEase.linear });
            case 528:
                //camGame.fade(0xFF000000, 1, true, null, true);
                FlxTween.tween(fadeFix, { alpha: 0 }, 1, { ease: FlxEase.linear });
                game.setOnLuas("note_offset", false);

                triggerEvent("Change Character", "dad", "amogus");
                triggerEvent("Change Character", "bf", "bf_craft");
                dad.scrollFactor.set(1, 1);
                dad.x = originalPos[0];
                dad.y = originalPos[1];
                dad.alpha = 1;
                dad.angle = 0;
                nc_snap_zoom("g", 1);
                nc_zoom("game", 0.75, 128 * Conductor.stepCrochet / 1000, "linear");
                nc_reload_targets();
                nc_lock(false, false);
                //nc_set_target("plr", (plr.x + opp.x) / 2, (plr.y + opp.y) / 2 + 250);
                nc_set_target("plr", ((opp.x + 70 - 250) + (plr.x + 100)) / 2, ((opp.y + 50) + (plr.y + 50)) / 2 + 200);
                nc_snap_target("plr");
                //nc_set_target("plr", (plr.x + opp.x) / 2, (plr.y + opp.y) / 2);
                nc_set_target("plr", ((opp.x + 70 - 250) + (plr.x + 100)) / 2, ((opp.y + 50) + (plr.y + 50)) / 2);
                nc_focus("plr", 128 * Conductor.stepCrochet / 1000, "linear", true);

                //fixes the mojang logo being under the bg amoguses
                triggerEvent("bgSet", -340 - 50);
                triggerEvent("bgTwn", 128 * Conductor.stepCrochet / 1000);

            case 656:
                triggerEvent("Set GF Speed", 1);
            case 688:
                nc_reload_targets();
                nc_set_target("opp", opp.x + 70 - 250, opp.y + 50);
                nc_set_target("plr", plr.x + 100, plr.y + 50);
                nc_lock(false, false);
                game.setOnLuas("note_offset", getModSetting("camNoteFollow"));
            case 720:
                if (amogusTransition != null) {
                    amogusTransition.visible = true;
                    amogusTransition.anim.play('intro', true);
                }
            case 752:
                nc_reload_targets();
                nc_focus("opp", 1, "circOut", true);
            case 768:
                if (amogusTransition != null) {
                    remove(amogusTransition, true);
                    insert(1000, amogusTransition);
                    amogusTransition.anim.play('bop0', true);
                }
            case 772:
                if (amogusTransition != null) {
                    amogusTransition.anim.play('bop1', true);
                }
            case 776:
                if (amogusTransition != null) {
                    amogusTransition.anim.play('charging', true);
                }
            case 788:
                if (amogusTransition != null) {
                    amogusTransition.anim.play('jump', true);
                    FlxTween.num(1.5, 18, 0.7, {ease: FlxEase.sineOut}, 
                        function(num:Float){
                            amogusTransitionScale = num;
                        }
                    );
                    //FlxTween.tween(amogusTransition.scale, { x: 18, y: 18 }, 0.5, { ease: FlxEase.sineOut});
                }
            case 791:
                triggerEvent("spawn");
                nc_lock(false, false);
            case 792:
                if (amogusTransition != null) {
                    FlxTween.tween(amogusTransition, { alpha: 0 }, 1, { ease: FlxEase.linear, 
                    onComplete: function(twn:FlxTween) {
                        amogusTransition.visible = false;
                    }
                    });
                }
            case 798:
                nc_zoom("game", 0.8, 0, "circOut");
            case 816:
                nc_zoom("game", 0.75, 0, "circOut");
            case 830:
                nc_zoom("game", 0.8, 0, "circOut");
            case 838:
                nc_zoom("game", 0.85, 0, "circOut");
            case 848:
                nc_zoom("game", 0.75, 0, "circOut");
            case 862:
                nc_zoom("game", 0.8, 0, "circOut");
            case 880:
                nc_zoom("game", 0.75, 0, "circOut");
            case 894:
                nc_zoom("game", 0.8, 0, "circOut");
            case 902:
                nc_zoom("game", 0.85, 0, "circOut");
            case 912:
                nc_set_target("plr", plr.x + 100, plr.y + 60);
                nc_snap_target("plr");
                nc_snap_zoom("g", 1);
                game.setOnLuas("note_offset", false);
            case 928:
                game.setOnLuas("pos_speed", 1000);
                nc_set_target("opp", plr.x - 420, plr.y + 150);
                nc_focus("opp", 0.2, "backOut", true);
                nc_snap_zoom("g", 1.5);
                nc_zoom("game", 1.3, 64 * Conductor.stepCrochet / 1000, "sineOut");
            case 934:
                game.setOnLuas("pos_speed", 8);
                game.setOnLuas("note_offset", getModSetting("camNoteFollow"));
            case 984:
                nc_snap_zoom("g", 1.4);
            case 988:
                nc_snap_zoom("g", 1.5);
            case 992:
                game.setOnLuas("pos_speed", 1000);
                game.setOnLuas("note_offset", false);
                nc_set_target("plr", plr.x + 300, plr.y + 150);
                nc_lock(false, false);
                nc_focus("plr", 0.2, "backOut", true);
                nc_snap_zoom("g", 1.5);
                nc_zoom("game", 1.3, 64 * Conductor.stepCrochet / 1000, "sineOut");
            case 998:
                game.setOnLuas("pos_speed", 8);
                game.setOnLuas("note_offset", getModSetting("camNoteFollow"));
            case 1048:
                nc_snap_zoom("g", 1.4);
            case 1052:
                nc_snap_zoom("g", 1.5);
            case 1056:
                nc_reload_targets();
                nc_lock(false, false);
                nc_focus("opp", 1, "quadInOut", true);
                nc_zoom("game", 0.75, 0, "backOut");
            case 1057:
                nc_lock(false, false);
            case 1102:
                nc_zoom("game", 0.8, 0, "circOut");
            case 1112:
                nc_snap_zoom("g", 0.825);
            case 1116:
                nc_snap_zoom("g", 0.85);
            case 1120:
                nc_snap_zoom("g", 0.75);
            case 1128:
                nc_zoom("game", 0.8, 0, "circOut");
            case 1152:
                nc_zoom("game", 0.85, 0, "circOut");
            case 1166:
                nc_zoom("game", 1, 18 * Conductor.stepCrochet / 1000, "linear");
            case 1184:
                game.setOnLuas("zoom_speed", 100);
                game.setOnLuas("note_offset", false);
                nc_zoom("game", 0.75, 2 * Conductor.stepCrochet / 1000, "backOut");
            case 1196:
                nc_zoom("game", 0.8, 4 * Conductor.stepCrochet / 1000, "quartIn");
            case 1208:
                triggerEvent("transitionIn");
        }
    }

    function onUpdatePost() {
        if (amogusTransition != null && amogusTransition.anim.curSymbol.name == 'jump') {
            if (amogusTransitionCurFrame != amogusTransition.anim.curFrame) {
                amogusTransition.scale.set(amogusTransitionScale, amogusTransitionScale);
            }
            amogusTransitionCurFrame = amogusTransition.anim.curFrame;
        }
    }

    function spinNote() {
        FlxTween.tween(strumLineNotes.members[5], {angle: 360}, 0.2, {ease: FlxEase.quartOut, onComplete: function(tween:FlxTween) {
            strumLineNotes.members[5].angle = 0;
        }});
    }
    
}