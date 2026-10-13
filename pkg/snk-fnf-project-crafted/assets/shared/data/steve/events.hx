if (PlayState.SONG.stage != "customMenu" && !ClientPrefs.data.lowQuality) { //yeah... that's not good
    import flixel.math.FlxBasePoint;

    var opp:FlxBasePoint = new FlxBasePoint(
        dad.getMidpoint().x + 150 + dad.cameraPosition[0] + opponentCameraOffset[0],
        dad.getMidpoint().y - 100 + dad.cameraPosition[1] + opponentCameraOffset[1]
    );
    var plr:FlxBasePoint = new FlxBasePoint(
        boyfriend.getMidpoint().x - 100 - boyfriend.cameraPosition[0] + boyfriendCameraOffset[0],
        boyfriend.getMidpoint().y - 100 + boyfriend.cameraPosition[1] + boyfriendCameraOffset[1]
    );

    function onCreate() {
        if (!PlayState.chartingMode) {
            game.skipArrowStartTween = true;
            uiGroup.visible = false;
            healthBar.alpha = 0;
            iconP1.alpha = 0;
            iconP2.alpha = 0;
        }
    }
    function onCreatePost() {
        if (!PlayState.chartingMode)
        for (i in strumLineNotes)
            i.visible = false;
    }

    function onSongStart() {
        if (!PlayState.chartingMode) {
            nc_snap_target("center");
            nc_lock(true, false);
        }
    }


    function noteJump(i:Int) {
        var y:Float = strumLineNotes.members[i].y;
        strumLineNotes.members[i].visible = true;
        FlxTween.tween(strumLineNotes.members[i], {y: y - 15}, 0.1, {ease: FlxEase.quartOut, 
            onComplete: function(twn:FlxTween) {
                FlxTween.tween(strumLineNotes.members[i], {y: y}, 0.1, {ease: FlxEase.quartIn});
            }});
    }

    function onStepHit() {
        //other
        
        switch curStep {
            case 48:
                uiGroup.visible = true;
                var y:Float = uiGroup.y;
                FlxTween.tween(uiGroup, {y: y - 15}, 0.1, {ease: FlxEase.quartOut, 
                    onComplete: function(twn:FlxTween) {
                        FlxTween.tween(uiGroup, {y: y}, 0.1, {ease: FlxEase.quartIn});
                    }});
                botplayTxt.visible = ClientPrefs.getGameplaySetting('botplay');
            case 50:
                noteJump(7);
            case 52:
                noteJump(6);
            case 53:
                noteJump(5);
            case 56:
                noteJump(4);
            case 58:
                noteJump(3);
            case 59:
                noteJump(2);
            case 61:
                noteJump(1);
            case 62:
                noteJump(0);
            case 64:
                healthBar.alpha = 1;
                iconP1.alpha = 1;
                iconP2.alpha = 1;
                
                /*
                for (i in 0...strumLineNotes.members.length) {
                    strumLineNotes.members[i].setColorTransform(1.0, 1.0, 1.0, (i < 4 && ClientPrefs.data.middleScroll ? 0.35 : 1), 85, 85, 85, 0.0);
                    FlxTween.num(85, 0, 1, {ease: FlxEase.circOut}, 
                        function(num:Float){
                            strumLineNotes.members[i].setColorTransform(1.0, 1.0, 1.0, (i < 4 && ClientPrefs.data.middleScroll ? 0.35 : 1), num, num, num, 0.0);
                        }
                    );
                }
                */
            case 256:
                //triggerEvent("setColorShaderDramatic");
                triggerEvent("darknessTwn", 0.6, "1,circOut");
            case 384:
                //triggerEvent("setColorShaderNormal");  
                triggerEvent("darknessTwn", 0);
        }
        

        //neoCam events
        switch curStep {


            case 16:
                nc_zoom("g", 0.625, 0, "circOut");
            case 32:
                nc_zoom("g", 0.65, 0, "circOut");
            case 48:
                nc_lock(false, false);
                nc_focus("opp", 3, "cubeInOut", true);
                nc_zoom("g", 0.675, 0, "circOut");
            case 56:
                nc_snap_zoom("g", 0.66);
            case 59:
                nc_snap_zoom("g", 0.64);
            case 62:
                nc_snap_zoom("g", 0.62);
            case 64:
                nc_snap_zoom("g", 0.6);
                nc_bump("g", 0.6);
                nc_lock(false, false);
            case 80:
                nc_zoom("g", 0.65, 0, "circOut");
            case 96:
                nc_zoom("g", 0.8, 2.2, "sineIn");
                nc_focus("center", 1, "circOut", true);
                game.setOnLuas("note_offset", false);
            case 96, 98, 100, 102, 104, 106, 108, 110, 112, 113, 114, 115, 116, 117, 118, 119:
                nc_bump("h", 0.75); 
                nc_bump("g", 0.5);
            case 120:
                nc_zoom("g", 0.7, 0, "circOut");
            case 128:
                nc_lock(false, false);
                game.setOnLuas("note_offset", getModSetting("camNoteFollow"));
                nc_zoom("g", 0.6, 0, "circOut");
            case 184:
                nc_zoom("g", 0.65, 0, "circOut");
            case 192:
                nc_zoom("g", 0.6, 0, "circOut");
//I ported chart events to hscript for some reason
            case 208:
                nc_zoom("g", 0.625, 0, "circOut");
            case 226:
                nc_zoom("g", 0.65, 0, "circOut");
            case 240:
                nc_zoom("g", 0.675, 0, "circOut");
            case 256:
                nc_set_target("opp", opp.x - 90, opp.y + 30);
                nc_set_target("plr", plr.x + 110, plr.y + 100);
                nc_snap_zoom("g", 0.9);
                nc_snap_target("opp");
            case 288:
                nc_zoom("g", 0.95, 0, "circOut");
            case 304:
                nc_zoom("g", 1, 0, "circOut");
            case 320:
                nc_zoom("g", 0.9, 0, "circOut");
            case 352:
                nc_zoom("g", 0.95, 0, "circOut");
            case 368:
                nc_zoom("g", 1, 0, "circOut");
            case 376:
                nc_reload_targets();
                nc_focus("plr", 1.5, "circIn", false);
                nc_zoom("g", 0.7, 1, "expoIn");
            case 384:
                nc_snap_zoom("g", 0.6);
                nc_snap_target("plr");
                triggerEvent("brightnessTwn", 0.2);
                triggerEvent("brightnessTwn", 0, "0.6,circOut");
            case 400:
                nc_zoom("g", 0.625, 0, "circOut");
            case 418:
                nc_zoom("g", 0.65, 0, "circOut");
            case 432:
                nc_zoom("g", 0.675, 0, "circOut");
            case 440: //inst
                nc_zoom("g", 0.65, 0, "circOut");
            case 448:
                nc_zoom("g", 0.6, 0, "circOut");
            case 464:
                nc_zoom("g", 0.625, 0, "circOut");
            case 482:
                nc_zoom("g", 0.65, 0, "circOut");
            case 496:
                nc_zoom("g", 0.675, 0, "circOut");
            case 512:
                nc_set_target("plr", plr.x + 110, plr.y + 100);
                nc_zoom("g", 0.75, 0, "circOut");
            case 522:
                nc_zoom("g", 0.775, 0, "circOut");
            case 529:
                nc_zoom("g", 0.75, 0, "circOut");
            case 536:
                //triggerEvent("cameraAngleTwn", -3, "1,circOut");
                nc_zoom("g", 0.775, 0, "circOut");
            case 540:
                //triggerEvent("cameraAngleTwn", 0, "1,circOut");
            case 544:
                //nc_zoom("g", 0.75, 0, "circOut");
            case 547:
                nc_zoom("g", 0.775, 0, "circOut");
            case 560:
                nc_snap_zoom("g", 0.775 + 0.0125);
                //triggerEvent("cameraAngleTwn", -1.5, "1,circOut");
            case 563:
                nc_snap_zoom("g", 0.775 + 0.025);
                //triggerEvent("cameraAngleTwn", 1.5, "1,circOut");
            case 566:
                nc_zoom("g", 0.65, 1.3, "sineInOut");
                //triggerEvent("cameraAngleTwn", -2, "1,sineIn");
            case 570:
                //triggerEvent("cameraAngleTwn", 1.5, "1,sineOut");
            case 576:
                nc_zoom("g", 0.6, 0, "circOut");
                nc_reload_targets();
                //triggerEvent("cameraAngleTwn", 0, "1,circOut");
            case 585:
                nc_zoom("g", 0.65, 0, "circOut");
            case 593:
                nc_zoom("g", 0.6, 0, "circOut");
            case 600:
                nc_focus("plr", 5.4, "sineIn", true);
                nc_zoom("g", 0.6, 5.4, "sineIn");
                game.setOnLuas("note_offset", false);

            case 640:
                nc_lock(false, false);
                nc_zoom("g", 0.625, 0, "circOut");
                game.setOnLuas("note_offset", getModSetting("camNoteFollow"));
            case 656:
                nc_zoom("g", 0.65, 0, "circOut");
            case 665:
                nc_zoom("g", 0.625, 0, "circOut");
            case 672:
                nc_zoom("g", 0.675, 0, "circOut");
            case 676:
                //nc_zoom("g", 0.675 + 0.0125, 0, "circOut");
            case 678:
                nc_zoom("g", 0.675, 0, "circOut");
            case 688:
                nc_zoom("g", 0.7, 0, "circOut");

            case 640 + 64:
                nc_lock(false, false);
                nc_zoom("g", 0.6, 0, "circOut");
            case 656 + 64:
                nc_zoom("g", 0.65, 0, "circOut");
            case 665 + 64:
                nc_zoom("g", 0.625, 0, "circOut");
            case 672 + 64:
                nc_zoom("g", 0.675, 0, "circOut");
            case 676 + 64:
                nc_zoom("g", 0.675 + 0.0125, 0, "circOut");
            case 678 + 64:
                nc_zoom("g", 0.675, 0, "circOut");
            case 688 + 64:
                nc_zoom("g", 0.7, 0, "circOut");
            case 768:
                nc_focus("center", 1, "circOut", true);
                nc_zoom("g", 0.75, 0, "circOut");
            case 776:
                nc_zoom("g", 0.6, 15, "sineIn"); 
                game.setOnLuas("note_offset", false);
            case 896:
                //nc_lock(false, false);
                game.setOnLuas("note_offset", getModSetting("camNoteFollow"));
            case 908:
                nc_zoom("g", 0.6125, 0, "circOut"); 
            case 912:
                nc_zoom("g", 0.6625, 0, "circOut"); 
            case 928:
                nc_zoom("g", 0.7125, 0, "circOut"); 
            case 940:
                nc_zoom("g", 0.725, 0, "circOut"); 
            case 944:
                nc_zoom("g", 0.775, 0, "circOut"); 
                nc_lock(false, false);
                nc_focus("opp", 3, "cubeInOut", true);

            case 952:
                nc_snap_zoom("g", 0.716); //shout-out to calculator
            case 955:
                nc_snap_zoom("g", 0.658);
            case 960:
                nc_snap_zoom("g", 0.6);
                nc_bump("g", 0.6);
                nc_lock(false, false);
            case 976:
                nc_zoom("g", 0.65, 0, "circOut");
            case 992:
                nc_zoom("g", 0.8, 2.2, "sineIn");
                nc_focus("center", 1, "circOut", true);
                game.setOnLuas("note_offset", false);
            case 1016:
                nc_zoom("g", 0.6, 1.7, "sineOut");
            case 992, 994, 996, 998, 1000, 1002, 1004, 1006, 1008, 1009, 1010, 1011, 1012, 1013, 1014, 1015, 1016:
                nc_bump("h", 0.75); 
                nc_bump("g", 0.5);
            case 1024:
                triggerEvent("transitionIn");
        }
    } 

}

