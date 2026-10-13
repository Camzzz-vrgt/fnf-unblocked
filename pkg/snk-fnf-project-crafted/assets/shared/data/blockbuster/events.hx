if (PlayState.SONG.stage != "customMenu" && !ClientPrefs.data.lowQuality) { //yeah... that's not good
    import backend.Mods;
    import backend.CoolUtil;
    import flixel.addons.display.FlxBackdrop;
    import flixel.addons.effects.FlxTrail;
    import flixel.math.FlxBasePoint;
    import flixel.group.FlxTypedSpriteGroup;
    import flixel.util.FlxTimer;
    import flixel.text.FlxText;
    import flixel.text.FlxText.FlxTextBorderStyle;
    import openfl.filters.ShaderFilter;
    import psychlua.FunkinLua;
    import tjson.TJSON;
    import haxe.ds.StringMap;
    import psychlua.CustomFlxColor; //thx LarryFrosty

    var pathModule:String = "mods/" + Mods.currentModDirectory + "/scripts/modules/";
    initHScript(pathModule + "cinematicBars.hx");
    new FunkinLua(pathModule + "zCameraFix.lua");
    initHScript(pathModule + "cameraAngleEvents.hx");
    initHScript(pathModule + "songStartNoteTween.hx");
    //new FunkinLua(pathModule + "ExtraChars.lua");

    var subtitles:FlxText, subtitlesS:FlxText;
    var blurSubtitles;
    var subtitlesCountdown:FlxText;

    var opp:FlxBasePoint = new FlxBasePoint(
        dad.getMidpoint().x + 150 + dad.cameraPosition[0] + opponentCameraOffset[0],
        dad.getMidpoint().y - 100 + dad.cameraPosition[1] + opponentCameraOffset[1]
    );
    var plr:FlxBasePoint = new FlxBasePoint(
        boyfriend.getMidpoint().x - 100 - boyfriend.cameraPosition[0] + boyfriendCameraOffset[0],
        boyfriend.getMidpoint().y - 100 + boyfriend.cameraPosition[1] + boyfriendCameraOffset[1]
    );
    var blurShaderX, colorShaderCam; 
    //var overlayShader;
    //var overlayRed:FlxSprite;
    var jackCutscene:FlxAnimate;
    var hypnosis:FlxSprite, vignetteRed:FlxSprite, epic:FlxSprite, jackMinecraft:FlxSprite, starBig:FlxSprite,  jackSkin:FlxSprite;
    var vignetteRedTwn:FlxTween;
    var jackGroup:FlxTypedSpriteGroup<FlxSprite>;

    var jackFake1:FlxSprite, jackFake2:FlxSprite;
    var jackFakeOffsets:Array<Array<Int>> = [[0, 0], [0, 0], [0, 0], [0, 0]];
    var jackReal:FlxSprite;

    var squareBackdrop:FlxBackdrop, wavyLineBackdrop:FlxBackdrop;

    var bfFake:Array<FlxSprite> = [];
    var bfFakeOffsets:StringMap<Array<Dynamic>> = [];//Map<String, Array<Dynamic>> = [];

    //minecraft movie scenes
    var scene:FlxSprite;
    var sceneNames:Array<String> = ["comingInHot", "chickenJockey", "lavaChicken", "iAmSteve", "catch", "mines", "loaf"];
    var sceneTwn:FlxTween;
    var camZoomScenes:Float = 1;

    var originalPos:Array<Float> = [0,0,0,0,0,0];

    var oldComboOffsets:Array<Int> = ClientPrefs.data.comboOffset;
    var ghostTapping:Bool = ClientPrefs.data.ghostTapping;

    function onCreate() {
        if (!PlayState.chartingMode) {
            uiGroup.visible = false;
            uiGroup.alpha = 0;
            
            game.setOnLuas("pos_speed", 100);
            game.setOnLuas("zoom_speed", 100);
            triggerEvent("cinematicBars", 0.3);
            game.setOnLuas("natural_bump_toggle", false);
        }

        function makeShadow(spr:FlxText){
            var shadow = new FlxText(spr.x, spr.y, spr.width, spr.text, spr.size);
            shadow.setFormat(spr.font, spr.size, FlxColor = 0xff000000, spr.alignment);
            shadow.updateHitbox();
            return shadow;
        }

        if (getModSetting("subtitles")) {
            subtitles = new FlxText(0, FlxG.height - 175, FlxG.width, "", 30);
            subtitles.setFormat(Paths.font("arabic-font-2013.ttf"), 30, FlxColor.WHITE, "center");
            subtitles.cameras = [camOther];
            subtitles.antialiasing = ClientPrefs.data.antialiasing;
            subtitles.updateHitbox();

            subtitlesS = makeShadow(subtitles);
            subtitlesS.cameras = [camOther];
            subtitlesS.antialiasing = ClientPrefs.data.antialiasing;
            subtitlesS.updateHitbox();

            add(subtitlesS);
            add(subtitles);
            subtitles.visible = subtitlesS.visible = false;
            
            blurSubtitles = game.createRuntimeShader('blur');
            blurSubtitles.setFloat("directions", 16);
            blurSubtitles.setFloat("quality", 4);
            blurSubtitles.setFloat("size", 8);
            subtitlesS.shader = blurSubtitles;


            subtitlesCountdown = new FlxText(FlxG.width - 240, 55, 80, "3", 30);
            subtitlesCountdown.setFormat(Paths.font("MinecraftTen.ttf"), 100, 0xFF91fe32, "center");
            subtitlesCountdown.borderStyle = FlxTextBorderStyle.SHADOW;
            subtitlesCountdown.borderSize = 10;
            subtitlesCountdown.borderColor = 0xFF17701b;
            subtitlesCountdown.cameras = [camOther];
            subtitlesCountdown.antialiasing = ClientPrefs.data.antialiasing;
            subtitlesCountdown.updateHitbox();
            add(subtitlesCountdown);
            subtitlesCountdown.visible = false;
        }

        blurShaderX = game.createRuntimeShader('box_blur');
        blurShaderX.setInt("u_radius", 0);
        blurShaderX.setBool("u_horizontal", true);

        colorShaderCam = game.createRuntimeShader('adjustColor');
        /*
        colorShaderCam.setFloat('brightness', -10);
        colorShaderCam.setFloat('contrast', 19);
        colorShaderCam.setFloat('saturation', -16);
        colorShaderCam.setFloat('hue', -12);
        */



        /*
        overlayShader = game.createRuntimeShader('overlay');

        overlayRed = new FlxSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, 0xFF861717);
        overlayRed.cameras = [camHUD];
        overlayRed.alpha = 0.3;
        //overlayRed.blend = 0;
        overlayRed.updateHitbox();
        insert(0, overlayRed);
        overlayRed.shader = overlayShader;
        */

        hypnosis = new FlxSprite(-1320, -1500).loadGraphic(Paths.image("stages/minecraftMovie/events/hypnosis"));
        hypnosis.scrollFactor.set(0.4, 0.4);
        hypnosis.scale.set(1.5, 1.5);
        hypnosis.antialiasing = ClientPrefs.data.antialiasing;
        hypnosis.blend = 14;
        hypnosis.alpha = 0.2;
        hypnosis.color = 0xFFFF8B68;
        hypnosis.updateHitbox();
        addBehindGF(hypnosis);
        hypnosis.alpha = 0;
        hypnosis.visible = false;
        //hypnosis.origin.set((hypnosis.width - 20) / (2 * hypnosis.scale.x), (hypnosis.height - 20) / (2 * hypnosis.scale.y));

        vignetteRed = new FlxSprite(0, 0).loadGraphic(Paths.image("stages/minecraftMovie/events/vignette"));
        vignetteRed.scale.set(2/3, 2/3);
        vignetteRed.antialiasing = ClientPrefs.data.antialiasing;
        vignetteRed.blend = 0;
        vignetteRed.alpha = 1;
        vignetteRed.cameras = [camHUD];
        vignetteRed.setColorTransform(1.0, 1.0, 1.0, 1.0, 138, 8, 51, 0.0);
        vignetteRed.updateHitbox();
        insert(0, vignetteRed);
        vignetteRed.alpha = 0;
        vignetteRed.visible = false;

        //gf.visible = false;
        epic = new FlxSprite(-1320, -1500 + 400).loadGraphic(Paths.image("stages/minecraftMovie/events/epic"));
        epic.scrollFactor.set(0.4, 0.4);
        epic.scale.set(1.5, 1.5);
        epic.antialiasing = ClientPrefs.data.antialiasing;
        epic.setColorTransform(1.0, 1.0, 1.0, 1.0, 255, 250, 209, 0.0);
        epic.alpha = 0.2;
        epic.blend = 0;
        epic.updateHitbox();
        insert(members.indexOf(getVar("front")), epic);
        epic.alpha = 0;
        epic.visible = false;

        jackCutscene = new FlxAnimate(-138, 11);
        Paths.loadAnimateAtlas(jackCutscene, "characters/jack_steve");
        jackCutscene.anim.addBySymbol("intro", "INTRO_Countdown", 24, false);
        jackCutscene.anim.addBySymbol("outro", "OUTRO", 24, false);
        jackCutscene.antialiasing = ClientPrefs.data.antialiasing;
        jackCutscene.scale.set(0.9, 0.9);
        jackCutscene.updateHitbox();
        addBehindDad(jackCutscene);
        jackCutscene.visible = false;


        jackGroup = new FlxTypedSpriteGroup();
        insert(members.indexOf(getVar("front")), jackGroup);
        var path:String = "stages/minecraftMovie/events/jacks/";
        var folder:String = "mods/" + Mods.currentModDirectory + "/images/" + path;
        if(FileSystem.exists(folder)) {
            var list = FileSystem.readDirectory(folder);
            for (i in 0...list.length) {
                var file2:String = list[i].substring(0, list[i].length - 4);

                
                var spr = new FlxSprite(1800 + i * 500, -100).loadGraphic(Paths.image(path + file2));
                spr.scrollFactor.set(0.4, 0.4);
                spr.scale.set(0.65, 0.65);
                spr.antialiasing = ClientPrefs.data.antialiasing;
                spr.color = 0xFF4B4B4B;
                //spr.setColorTransform(1.0, 1.0, 1.0, 1.0, 255, 250, 209, 0.0);
                spr.updateHitbox();
                jackGroup.add(spr);

                var trail:FlxTrail = new FlxTrail(spr, null, 2, 12 * ClientPrefs.data.framerate / 120, 1, 0);
                //trail.y -= 100;
                trail.blend = 0;
                trail.color = 0xFF00FFF2;
                jackGroup.insert(members.indexOf(spr) + 1, trail);
                
            }
        }
        jackGroup.visible = false;

        
        //Thx LeGooey for inspiration
        jackFake1 = new FlxSprite(dad.x, dad.y - 30); //(-700, -90);
        jackFake1.frames = Paths.getSparrowAtlas("characters/jacksteve");
        var json:Dynamic = TJSON.parse(File.getContent("mods/" + Mods.currentModDirectory + "/characters/jack.json"));
        for (anim in json.animations) {
            jackFake1.animation.addByPrefix(anim.anim, anim.name, anim.fps, anim.loop);
            
            var id:Int = -1;
            switch anim.anim {
                case "singLEFT": id = 0;
                case "singDOWN": id = 1;
                case "singUP": id = 2;
                case "singRIGHT": id = 3;
            }
            if (id != -1) jackFakeOffsets[id] = [anim.offsets[0], anim.offsets[1]];
        }
        jackFake1.antialiasing = ClientPrefs.data.antialiasing;
        jackFake1.scale.set(json.scale, json.scale);
        jackFake1.updateHitbox();
        addBehindDad(jackFake1);

        jackFake2 = new FlxSprite(dad.x, dad.y - 30); //(70, -90);
        jackFake2.frames = Paths.getSparrowAtlas("characters/jacksteve");
        for (anim in json.animations)
            jackFake2.animation.addByPrefix(anim.anim, anim.name, anim.fps, anim.loop);
        jackFake2.antialiasing = ClientPrefs.data.antialiasing;
        jackFake2.scale.set(json.scale, json.scale);
        jackFake2.updateHitbox();
        addBehindDad(jackFake2);
        
        jackFake1.setColorTransform(1.0, 1.0, 1.0, 1.0, 115, 115, 63, 0.0);
        jackFake2.setColorTransform(1.0, 1.0, 1.0, 1.0, 115, 115, 63, 0.0);
        jackFake1.blend = jackFake2.blend = 0;
        jackFake1.visible = jackFake2.visible = false;


        squareBackdrop = new FlxBackdrop();
        squareBackdrop.frames = Paths.getSparrowAtlas("stages/minecraftMovie/events/squares");
        squareBackdrop.animation.addByPrefix("idle", "main", 24, true);
        squareBackdrop.antialiasing = ClientPrefs.data.antialiasing;
        squareBackdrop.animation.play("idle");
        squareBackdrop.scrollFactor.set(0.9, 0.9);
        squareBackdrop.scale.set(2, 2);
        squareBackdrop.velocity.x = 20;
        addBehindGF(squareBackdrop);
        squareBackdrop.alpha = 0;
        squareBackdrop.visible = false;


        wavyLineBackdrop = new FlxBackdrop(Paths.image('stages/minecraftMovie/events/wavyLineInvert'));
        wavyLineBackdrop.antialiasing = ClientPrefs.data.antialiasing;
        wavyLineBackdrop.scrollFactor.set(0.9, 0.9);
        wavyLineBackdrop.scale.set(2, 2);
        wavyLineBackdrop.velocity.y = 30;
        wavyLineBackdrop.blend = 14;
        wavyLineBackdrop.alpha = 0.2;
        addBehindGF(wavyLineBackdrop);
        wavyLineBackdrop.alpha = 0;
        wavyLineBackdrop.visible = false;


        jackMinecraft = new FlxSprite(-250, 30);
        jackMinecraft.frames = Paths.getSparrowAtlas("stages/minecraftMovie/events/jack-minecraft");
        jackMinecraft.animation.addByPrefix("minecraft", "minecraft", 30, false);
        jackMinecraft.scale.set(1.5, 1.5);
        jackMinecraft.flipX = true;
        jackMinecraft.antialiasing = ClientPrefs.data.antialiasing;
        jackMinecraft.updateHitbox();
        add(jackMinecraft);
        jackMinecraft.visible = false;


        starBig = new FlxSprite(-700, -1000).loadGraphic(Paths.image("stages/minecraftMovie/events/star-big"));
        starBig.scrollFactor.set(0.4, 0.4);
        starBig.scale.set(1.2, 1.2);
        starBig.antialiasing = ClientPrefs.data.antialiasing;
        starBig.blend = 0;
        starBig.alpha = 0.2;
        starBig.color = 0xFFFFFACB;
        starBig.updateHitbox();
        addBehindGF(starBig);
        starBig.alpha = 0;
        starBig.visible = false;


        
        var json:Dynamic = TJSON.parse(File.getContent("mods/" + Mods.currentModDirectory + "/characters/bf_craft.json"));
        bfFakeOffsets = new StringMap(); //thx crazysillyguy and riconut for the help with StringMap
        for (anim in json.animations)
            bfFakeOffsets[anim.anim] = [anim.offsets[0], anim.offsets[1]];
        
        for (i in 0...4) {
            var spr = new FlxSprite(boyfriend.x + (i + 1) * 200, boyfriend.y);
            spr.frames = Paths.getSparrowAtlas("characters/bf_crafted");
            for (anim in json.animations)
                spr.animation.addByPrefix(anim.anim, anim.name + "0", anim.fps, anim.loop);
            spr.antialiasing = ClientPrefs.data.antialiasing;
            spr.scale.set(json.scale, json.scale);
            spr.updateHitbox();
            spr.animation.play("idle");
            if (i > 0) insert(members.indexOf(bfFake[i - 1]), spr);
            else       addBehindBF(spr);
            var color:Float = 255 * ((4 - i) / 5);
            spr.color = CustomFlxColor.fromRGB(color, color, color);
            spr.visible = false;
            spr.alpha = 0;
            bfFake.push(spr);
        }



        //MINECRAFT MOVIE SCENES
        scene = new FlxSprite(0, 0).loadGraphic(Paths.image("stages/minecraftMovie/events/scenes/comingInHot"));
        scene.antialiasing = ClientPrefs.data.antialiasing;
        scene.updateHitbox();
        insert(members.indexOf(getVar("front")) + 1, scene);
        scene.visible = false;



        jackReal = new FlxSprite(-200, -10).loadGraphic(Paths.image("stages/minecraftMovie/events/jackReal"));
        jackReal.scale.set(2/3, 2/3);
        jackReal.antialiasing = ClientPrefs.data.antialiasing;
        jackReal.flipX = true;
        jackReal.updateHitbox();
        add(jackReal);
        jackReal.visible = false;
        jackReal.alpha = 0;


        jackSkin = new FlxSprite(0, 0);
        jackSkin.frames = Paths.getAsepriteAtlas("stages/minecraftMovie/events/jackSkin");
        for (i in ["1", "2", "3"])
            jackSkin.animation.addByPrefix(i, i + "anim0", 24, false);
        jackSkin.antialiasing = false;
        jackSkin.scale.set(3, 3);//(0.5, 0.5);
        jackSkin.scrollFactor.set(0, 0);
        jackSkin.cameras = [camHUD];
        jackSkin.updateHitbox();
        jackSkin.screenCenter();
        jackSkin.animation.play("1");
        insert(0, jackSkin);
        jackSkin.visible = false;

    }

    function onCreatePost() {
        if (!PlayState.chartingMode) {
            triggerEvent("cinematicBars", 0.3);
            ClientPrefs.data.ghostTapping = true;
        }
        originalPos[0] = dad.x; 
        originalPos[1] = dad.y; 
        originalPos[2] = gf.x; 
        originalPos[3] = gf.y;
        originalPos[4] = boyfriend.x; 
        originalPos[5] = boyfriend.y;
        
        //precache
        for (i in sceneNames) Paths.image("stages/minecraftMovie/events/scenes/" + i);
    }

    function onSongStart() {
        if (!PlayState.chartingMode) {
            dad.visible = false;
            jackCutscene.visible = true;
            jackCutscene.anim.play("intro", true);

            nc_snap_zoom("g", 0.8);
            nc_set_target("opp", opp.x - 50, opp.y + 150);
            nc_set_target("plr", plr.x + 110, plr.y + 180);
            nc_snap_target("opp");
        }
    }
    //death video
    //https://www.youtube.com/watch?v=CQcNM0ss-YE&t=2s
    function onStepHit() {

        switch curStep {
            case 1:
                game.setOnLuas("natural_bump_toggle", true);
            case 2:
                if (subtitles != null) {
                    subtitles.visible = subtitlesS.visible = true;
                    subtitles.text = subtitlesS.text = "Are you plugged in?";
                }
            case 9:
                nc_focus("plr", 0.12, "sineInOut", true);
                nc_zoom("g", 0.9, 0.12, "sineInOut");

                //MOTION BLUR!!!!!!
                camGame.filters = [new ShaderFilter(blurShaderX)];
                FlxTween.num(0, 128, 0.12, {ease: FlxEase.quadInOut}, 
                    function(num:Int) {
                        var newNum:Int = num;
                        if (num > 64) newNum = 128 - num;
                        blurShaderX.setInt("u_radius", newNum);
                    }
                );
            case 12:
                if (subtitles != null)
                    subtitles.text = subtitlesS.text = "Beep";
            case 15:
                camGame.filters = [];
                nc_snap_zoom("g", 0.8);
                nc_snap_target("opp");
            case 16:
                if (subtitles != null)
                    subtitles.text = subtitlesS.text = "Alright, you ready?";
            case 23:
                if (subtitles != null)
                    subtitles.text = subtitlesS.text = "A one-two-three.";
            case 28:
                triggerEvent("cinematicBars", 0, "1,quadInOut");
                uiGroup.visible = true;
                botplayTxt.visible = ClientPrefs.getGameplaySetting('botplay');
                FlxTween.tween(uiGroup, { alpha: 1 }, 0.3, { ease: FlxEase.linear});
                triggerEvent("songStartNoteTween", 0.3, "0.03,linear,classic,1");
                /*
                for (i in 0...strumLineNotes.members.length)
                    FlxTween.tween(strumLineNotes.members[i], { alpha: (i < 4 && ClientPrefs.data.middleScroll ? 0.35 : 1) }, 0.3, { ease: FlxEase.linear, startDelay: (0.03 * i )});
                */
                game.setOnLuas("pos_speed", 8);
                game.setOnLuas("zoom_speed", 2);
                nc_reload_targets();
                nc_lock(false, false);
                nc_focus("opp", 0.5, "circOut", false);
                nc_zoom("g", 0.5, 0.5, "circOut");
            case 32:
                if (subtitles != null) {
                    subtitles.text = subtitlesS.text = "";
                    subtitles.visible = subtitlesS.visible = false;
                }
                dad.visible = true;
                jackCutscene.visible = false;

                ClientPrefs.data.ghostTapping = ghostTapping;
            case 50:
                nc_zoom("g", 0.55, 0, "circOut");
            case 64:
                nc_zoom("g", 0.5, 0.5, "circOut");
            case 78:
                nc_focus("opp", 1, "expoOut", false);
                nc_zoom("g", 0.7, 1, "expoOut");
            case 88:
                nc_zoom("g", 0.65, 0, "circOut");
            case 92:
                nc_zoom("g", 0.6, 0, "circOut");
            case 96:
                nc_zoom("g", 0.55, 0, "circOut");
            case 112:
                nc_zoom("g", 0.6, 0, "circOut");
            case 128:
                nc_zoom("g", 0.55, 0, "circOut");
            case 147:
                nc_zoom("g", 0.6, 0, "circOut");
            case 160 - 2:
                //game.setOnLuas("zoom_speed", 100);
                nc_set_target("opp", opp.x - 50, opp.y + 150);
                nc_set_target("plr", plr.x + 110, plr.y + 180);
            case 160:
                game.setOnLuas("pos_speed", 100);
                game.setOnLuas("note_offset", false);
                nc_focus("opp", 0.12, "sineInOut", true);
                nc_zoom("g", 0.75, 0.12, "sineInOut");
                //MOTION BLUR!!!!!!
                camGame.filters = [new ShaderFilter(blurShaderX)];
                FlxTween.num(0, 64, 0.2, {ease: FlxEase.quadInOut}, 
                    function(num:Int) {
                        var newNum:Int = num;
                        if (num > 32) newNum = 64 - num;
                        blurShaderX.setInt("u_radius", newNum);
                    }
                );
            case 176:
                nc_lock(false, false);
                nc_focus("plr", 0.12, "sineInOut", true);
                nc_zoom("g", 0.8, 0.12, "sineInOut");
                //MOTION BLUR!!!!!!
                FlxTween.num(0, 64, 0.2, {ease: FlxEase.quadInOut}, 
                    function(num:Int) {
                        var newNum:Int = num;
                        if (num > 32) newNum = 64 - num;
                        blurShaderX.setInt("u_radius", newNum);
                    }
                );
            case 194:
                nc_lock(false, false);
                nc_focus("opp", 0.12, "sineInOut", true);
                nc_zoom("g", 0.85, 0.12, "sineInOut");
                //MOTION BLUR!!!!!!
                FlxTween.num(0, 64, 0.2, {ease: FlxEase.quadInOut}, 
                    function(num:Int) {
                        var newNum:Int = num;
                        if (num > 32) newNum = 64 - num;
                        blurShaderX.setInt("u_radius", newNum);
                    }
                );
            case 210:
                nc_lock(false, false);
                nc_focus("plr", 0.12, "sineInOut", true);
                nc_zoom("g", 0.9, 0.12, "sineInOut");
                //MOTION BLUR!!!!!!
                FlxTween.num(0, 64, 0.2, {ease: FlxEase.quadInOut}, 
                    function(num:Int) {
                        var newNum:Int = num;
                        if (num > 32) newNum = 64 - num;
                        blurShaderX.setInt("u_radius", newNum);
                    }
                );
            case 224:
                nc_lock(false, false);
                nc_focus("opp", 0.12, "sineInOut", true);
                nc_zoom("g", 0.95, 0.12, "sineInOut");
                //MOTION BLUR!!!!!!
                FlxTween.num(0, 64, 0.2, {ease: FlxEase.quadInOut}, 
                    function(num:Int) {
                        var newNum:Int = num;
                        if (num > 32) newNum = 64 - num;    
                        blurShaderX.setInt("u_radius", newNum);
                    }
                );
            case 234:
                nc_snap_zoom("g", 0.975);
            case 240:
                nc_snap_zoom("g", 1);
            case 244:
                nc_snap_zoom("g", 1.025);
            case 248:
                nc_snap_zoom("g", 1.05);
            case 256:
                nc_lock(false, false);
                nc_focus("plr", 0.12, "sineInOut", true);
                nc_zoom("g", 1, 0.12, "sineInOut");
                //MOTION BLUR!!!!!!
                FlxTween.num(0, 64, 0.2, {ease: FlxEase.quadInOut}, 
                    function(num:Int) {
                        var newNum:Int = num;
                        if (num > 32) newNum = 64 - num;
                        blurShaderX.setInt("u_radius", newNum);
                    }
                );
            case 272:
                camGame.filters = [];
                nc_lock(false, false);
                nc_set_target("plr", plr.x + 170, plr.y + 260);
                nc_snap_target("plr");
                nc_snap_zoom("g", 1.1);
                triggerEvent("cameraAngleTwn", 5);
            case 276:
                nc_set_target("plr", plr.x + 150, plr.y + 160);
                nc_snap_target("plr");
                nc_snap_zoom("g", 1.2);
                triggerEvent("cameraAngleTwn", -5);
            case 280:
                nc_set_target("plr", plr.x + 280, plr.y + 230);
                nc_snap_target("plr");
                nc_snap_zoom("g", 1.3);
                triggerEvent("cameraAngleTwn", 10);
            case 284:
                nc_set_target("plr", plr.x + 110, plr.y + 260);
                nc_snap_target("plr");
                nc_snap_zoom("g", 1.4);
                triggerEvent("cameraAngleTwn", -5);
            case 288:
                game.setOnLuas("note_offset", getModSetting("camNoteFollow"));
                hypnosis.visible = true;
                FlxTween.tween(hypnosis, {alpha: 0.2}, 4, {ease: FlxEase.sineIn});

                game.setOnLuas("pos_speed", 8);
                game.setOnLuas("zoom_speed", 2);
                nc_set_target("opp", (opp.x + plr.x) / 2 - 80, (opp.y + plr.y) / 2);
                nc_set_target("plr", (opp.x + plr.x) / 2 + 80, (opp.y + plr.y) / 2);
                nc_focus("opp", 0, "circOut", false);
                nc_zoom("g", 0.5, 0, "circOut");
                triggerEvent("cameraAngleTwn", 0, "1,circOut");
            case 300:
                nc_zoom("g", 0.55, 0, "circOut");
            case 304:
                nc_zoom("g", 0.5, 0, "circOut");
            case 320:
                nc_zoom("g", 0.55, 0, "circOut");
            case 336:
                nc_zoom("g", 0.6, 0, "circOut");
            case 352:
                nc_zoom("g", 0.5, 0, "circOut");
            case 364:
                nc_zoom("g", 0.55, 0, "circOut");
            case 368:
                nc_zoom("g", 0.5, 0, "circOut");
            case 384:
                FlxTween.tween(hypnosis, {alpha: 0}, 1.5, {ease: FlxEase.sineOut, 
                onComplete: function(twn:FlxTween) {hypnosis.visible = false;}});

                nc_set_target("plr", plr.x + 110, plr.y + 180);
                nc_focus("plr", 0, "circOut", false);
                nc_zoom("g", 0.75, 0, "circOut");
                triggerEvent("darknessTwn", 0.3, "1,circOut");
            case 396:
                nc_set_target("opp", (opp.x + plr.x) / 2 - 80, (opp.y + plr.y) / 2);
                nc_focus("opp", 3.1, "sineIn", true);
                game.setOnLuas("note_offset", false);
                nc_zoom("g", 0.5, 3.1, "sineIn");
                triggerEvent("darknessTwn", 0, "3.1,sineIn");
            case 400:
                nc_bump("g", 2);
            case 404:
                nc_bump("g", 2);
            case 408:
                nc_bump("g", 2);
            case 412:
                nc_bump("g", 2);
            case 416:
                camGame.filters = [new ShaderFilter(colorShaderCam)];
                FlxTween.num(0, 1, 2, {ease: FlxEase.sineIn}, 
                    function(mult:Float) {
                        colorShaderCam.setFloat('brightness', -10 * mult);
                        colorShaderCam.setFloat('contrast', 19 * mult);
                        colorShaderCam.setFloat('saturation', -16 * mult);
                        colorShaderCam.setFloat('hue', -12 * mult);
                    }
                );

                vignetteRed.visible = true;
                vignetteRedTwn = FlxTween.tween(vignetteRed, {alpha: 1}, 2, {ease: FlxEase.sineIn, onComplete: function(twn:FlxTween) {vignetteRedTwn = null;} });

                epic.visible = true;
                FlxTween.tween(epic, {alpha: 0.25}, 4, {ease: FlxEase.sineIn});
                triggerEvent("cinematicBarsColorChange", "255,255,255");
                triggerEvent("cinematicBars", 0.12, "1,sineIn");
                game.setOnLuas("note_offset", getModSetting("camNoteFollow"));
                //triggerEvent("darknessTwn", 0.25, "1,sineIn");
                
                jackGroup.visible = true;
                jackGroup.velocity.x = -200;


                
                nc_set_target("opp", (opp.x + plr.x) / 2 - 80, (opp.y + plr.y) / 2);
                nc_set_target("plr", (opp.x + plr.x) / 2 + 80, (opp.y + plr.y) / 2);
            case 448:
                nc_lock(false, false);
                nc_zoom("g", 0.55, 0, "circOut");
            case 464:
                nc_zoom("g", 0.6, 0, "circOut");
            case 475:
                nc_zoom("g", 0.55, 0, "circOut");
            case 480:
                nc_zoom("g", 0.5, 0, "circOut");
            case 512:
                nc_zoom("g", 0.55, 0, "circOut");
            case 539:
                nc_zoom("g", 0.5, 0, "circOut");
            case 544:
                nc_set_target("opp", opp.x - 50, opp.y + 150);
                nc_focus("opp", 8.3, "sineIn", true);
                nc_zoom("g", 0.75, 8.3, "sineIn");
            case 592 - 2:
                jackFake1.visible = jackFake2.visible = true;
                jackFake1.alpha = jackFake2.alpha = 0;
                jackFake1.x = jackFake2.x = dad.x;

            case 592:
                triggerEvent("brightnessTwn", 0.1, "1,circOut");
                FlxTween.tween(jackFake1, {alpha: 0.5}, 1, {ease: FlxEase.quartOut});
                FlxTween.tween(jackFake2, {alpha: 0.5}, 1, {ease: FlxEase.quartOut});

                FlxTween.tween(jackFake1, {x: dad.x - 200}, 1, {ease: FlxEase.quartOut});
                FlxTween.tween(jackFake2, {x: dad.x + 200}, 1, {ease: FlxEase.quartOut});
                /*
                game.callOnLuas("createCharacter", ["jack1", "jack", 0, 0, false, false]);
                game.callOnLuas("setNotes",['jack1','']);
                */
            case 599:
                triggerEvent("brightnessTwn", 0.2, "1,circOut");
            case 602:
                triggerEvent("brightnessTwn", 0.15);
            case 604:
                triggerEvent("brightnessTwn", 0.1);
            case 606:
                triggerEvent("brightnessTwn", 0.05);
            case 608:
                triggerEvent("brightnessTwn", 0);
                FlxTween.tween(jackFake1, {alpha: 0}, 3, {ease: FlxEase.sineOut});
                FlxTween.tween(jackFake2, {alpha: 0}, 3, {ease: FlxEase.sineOut});
            case 614:
                nc_lock(false, false);
                nc_reload_targets();
                nc_focus("plr", 2, "sineInOut", false);
                nc_zoom("g", 0.6, 2, "sineInOut");
            case 624:
                nc_zoom("g", 0.65, 0, "circOut");
            case 632:
                nc_zoom("g", 0.7, 0, "circOut");
            case 636:
                nc_zoom("g", 1.1, 0.45, "expoIn");
                nc_set_target("plr", plr.x + 110, plr.y + 180);
                nc_focus("plr", 0.45, "expoIn", false);
                triggerEvent("cinematicBars", 0, "0.4,quartIn");
                game.setOnLuas("note_offset", false);
            case 640:
                nc_snap_zoom("g", 1.1);
                nc_snap_target("plr");                
                triggerEvent("darknessTwn", 0.3, "1,circOut");
                FlxTween.tween(epic, {alpha: 0}, 1, {ease: FlxEase.circOut});
                vignetteRedTwn = FlxTween.tween(vignetteRed, {alpha: 0}, 1, {ease: FlxEase.circOut});
            case 652:
            case 656:
                triggerEvent("cinematicBarsColorChange", "0,0,0");
                triggerEvent("cinematicBars", 0.25, "0.2,backOut");
                triggerEvent("darknessTwn", 0.35, "0.2,backOut");
            case 660:
                triggerEvent("cinematicBars", 0.5, "0.2,backOut");
                triggerEvent("darknessTwn", 0.4, "0.2,backOut");
            case 664:
                triggerEvent("cinematicBars", 0.75, "0.2,backOut");
                triggerEvent("darknessTwn", 0.45, "0.2,backOut");
            case 668:
                triggerEvent("cinematicBars", 1, "0.2,backOut");
                triggerEvent("darknessTwn", 0.5, "0.2,backOut");
            case 672:
                camGame.filters = [];
                vignetteRed.visible = epic.visible = jackGroup.visible = false;
                nc_reload_targets();
                nc_snap_zoom("g", 0.5);
                nc_snap_target("opp");
                triggerEvent("cinematicBars", 0, "0.2,backOut");
                triggerEvent("darknessTwn", 0);
                game.setOnLuas("note_offset", getModSetting("camNoteFollow"));
            case 689:
                nc_zoom("g", 0.55, 0, "circOut");
            case 699:
                nc_zoom("g", 0.5, 1.4, "circInOut");
                nc_lock(false, false);
                nc_focus("plr", 1.4, "circInOut", true);
            case 718:
                nc_lock(false, false);
                nc_focus("opp", 1, "expoOut", true);
                nc_zoom("g", 0.7, 1, "expoOut");
            case 728:
                nc_zoom("g", 0.65, 0, "circOut");
            case 732:
                nc_zoom("g", 0.6, 0, "circOut");
            case 736:
                nc_zoom("g", 0.55, 0, "circOut");
            case 752:
                nc_zoom("g", 0.6, 0, "circOut");
            case 768:
                nc_lock(false, false);
                nc_focus("plr", 1, "expoOut", true);
                nc_zoom("g", 0.5, 1, "expoOut");
            case 787:
                nc_zoom("g", 0.55, 0, "circOut");
            case 792:
                nc_lock(false, false);
                nc_set_target("opp", opp.x - 50, opp.y + 150);
                nc_set_target("plr", plr.x + 110, plr.y + 180);
                nc_focus("opp", 1.1, "sineInOut", true);
                nc_zoom("g", 0.7, 1.1, "sineInOut");
                triggerEvent("darknessTwn", 0.75, "1,sineInOut");
                squareBackdrop.visible = true;
                FlxTween.tween(squareBackdrop, {alpha: 0.3}, 1, {ease: FlxEase.sineInOut});
                //game.setOnLuas("natural_bump_toggle", false);
            case 800:
                //https://www.youtube.com/watch?v=yXRY9c3-X88&t=140
                //use the circle background thing
                //animate them via code,
                //use FlxBackdrop, and
                //place coded circles inside of a group

                //https://www.youtube.com/watch?v=Ot515wx4e4E this video looks good too
            case 816:
                nc_zoom("g", 0.75, 0, "circOut");
            case 824:
                nc_zoom("g", 0.8, 0, "circOut");
            case 832:
                nc_zoom("g", 0.75, 0, "circOut");
            case 836:
                nc_zoom("g", 0.7, 0, "circOut");
            case 840:
                nc_zoom("g", 0.75, 0, "circOut");
            case 848:
                nc_zoom("g", 0.8, 0, "circOut");
            case 852:
                if (subtitles != null) {
                    subtitlesCountdown.visible = true;
                }
            case 855:
                nc_snap_zoom("g", 0.78);
            case 858:
                nc_snap_zoom("g", 0.76);
            case 860:
                nc_snap_zoom("g", 0.74);
                if (subtitles != null) {
                    subtitlesCountdown.text = "2";
                }
            case 862:
                nc_snap_zoom("g", 0.72);
            case 867:
                new FlxTimer().start(0.09, function(tmr:FlxTimer) { 
                    if (subtitles != null) {
                        subtitlesCountdown.text = "1";
                    }
                });
            case 864:
                nc_lock(false, false);
                nc_zoom("g", 0.7, 0, "circOut");
            case 872:
                game.setOnLuas("note_offset", false);
                nc_set_target("opp", opp.x - 100, opp.y + 100);
                nc_snap_target("opp");
                nc_lock(true, false);
                nc_snap_zoom("g", 1);
            case 875:
                new FlxTimer().start(0.06, function(tmr:FlxTimer) { 
                    dad.visible = false;
                    jackMinecraft.visible = true;
                    jackMinecraft.animation.play("minecraft");
                    if (subtitles != null) {
                        subtitles.font = subtitlesS.font = Paths.font("MinecraftTen.ttf");
                        subtitles.size = subtitlesS.size = 100;
                        subtitles.borderStyle = subtitlesS.borderSize = FlxTextBorderStyle.SHADOW;
                        subtitles.borderSize = subtitlesS.borderSize = 10;
                        subtitles.borderColor = 0xFF17701b;
                        subtitles.color = 0xFF91fe32;
                        subtitlesS.borderColor = subtitlesS.color = 0xFFFFFFFF;
                        subtitlesS.alpha = 0.5;
                        subtitles.y -= 80;
                        subtitlesS.y -= 80;
                        subtitles.text = subtitlesS.text = "Mine";

                        subtitlesCountdown.visible = false;
                        subtitles.visible = subtitlesS.visible = true;
                    }
                });
            case 877:
                new FlxTimer().start(0.08, function(tmr:FlxTimer) { 
                    if (subtitles != null) {
                        subtitles.text = subtitlesS.text = "Minecraft!";
                    }
                });
            case 888 - 1:
                game.setOnLuas("pos_speed", 8);
                game.setOnLuas("note_offset", getModSetting("camNoteFollow"));
            case 888:
                nc_lock(false, false);
                nc_snap_target("plr");
                nc_snap_zoom("g", 0.7);

                if (subtitles != null) {
                    subtitles.font = subtitlesS.font = Paths.font("arabic-font-2013.ttf");
                    subtitles.size = subtitlesS.size = 30;
                    subtitles.borderStyle = subtitlesS.borderSize = FlxTextBorderStyle.NONE;
                    subtitles.borderSize = subtitlesS.borderSize = 0;
                    subtitles.color = 0xffffffff;
                    subtitlesS.color = 0xFF000000;
                    subtitlesS.alpha = 1;
                    subtitles.y += 80;
                    subtitlesS.y += 80;
                    subtitles.visible = subtitlesS.visible = false;
                    subtitles.text = subtitlesS.text = "";
                }
            case 896:
                nc_zoom("g", 0.75, 0, "circOut");
            case 912:
                nc_zoom("g", 0.8, 0, "circOut");
            case 920:
                triggerEvent("darknessTwn", 0, "1,sineInOut");
                FlxTween.tween(squareBackdrop, {alpha: 0}, 1, {ease: FlxEase.sineInOut, onComplete: function() {squareBackdrop.visible = false;}});
                nc_set_target("opp", (opp.x + plr.x) / 2 - 80, (opp.y + plr.y) / 2);
                nc_set_target("plr", (opp.x + plr.x) / 2 + 80, (opp.y + plr.y) / 2);
                nc_focus("opp", 1, "sineInOut", true);
                nc_zoom("g", 0.5, 1, "sineInOut");
                wavyLineBackdrop.visible = true;
                FlxTween.tween(wavyLineBackdrop, {alpha: 0.2}, 4, {ease: FlxEase.sineIn});
            case 929:
                nc_lock(false, false);
            case 940:
                nc_zoom("g", 0.55, 0, "circOut");
            case 944:
                nc_zoom("g", 0.5, 0, "circOut");
            case 960:
                nc_zoom("g", 0.55, 0, "circOut");
            case 976:
                nc_zoom("g", 0.6, 0, "circOut");
            case 992:
                nc_zoom("g", 0.5, 0, "circOut");
            case 1008:
                nc_zoom("g", 0.55, 0, "circOut");
            case 1015:
                nc_zoom("g", 0.6, 0, "circOut");
                for (i in bfFake) {
                    i.visible = true;
                }
            case 1024:
                FlxTween.tween(wavyLineBackdrop, {alpha: 0}, 1.5, {ease: FlxEase.sineOut, 
                onComplete: function(twn:FlxTween) {wavyLineBackdrop.visible = false;}});
                FlxTween.tween(gf, {alpha: 0}, 1, {ease: FlxEase.sineOut});
                FlxTween.tween(dad, {alpha: 0}, 1, {ease: FlxEase.sineOut});

                game.setOnLuas("note_offset", false);
                nc_set_target("plr", plr.x + 260, plr.y + 220);
                nc_focus("plr", 0, "circOut", false);
                nc_zoom("g", 0.75, 0, "circOut");
                triggerEvent("darknessTwn", 1, "1,circOut");
            case 1030:
                game.setOnLuas("pos_speed", 1000);
            case 1040:
                bfFakeAppear(0);
            case 1044:
                bfFakeAppear(1);
            case 1048:
                bfFakeAppear(2);
            case 1052:
                bfFakeAppear(3);
            case 1056: //end
                for (i in 0...bfFake.length + 1) {
                    if (i <= 3)
                    FlxTween.tween(bfFake[i], {alpha: 0}, 0.5, {ease: FlxEase.circOut, startDelay: 0.1 + (0.05 * (i + 1)), onComplete: function() {bfFake[i].visible = false;}});
                    else
                    FlxTween.tween(boyfriend, {alpha: 0}, 0.5, {ease: FlxEase.circOut, startDelay: 0.1});
                }
                nc_lock(false, false);

                nc_set_target("plr", plr.x + 260 + 800, plr.y - 200);
                nc_focus("plr", 0.6, "cubeIn", true);
                ClientPrefs.data.comboOffset = [-350, -220, -190, -160];
            case 1061:
                triggerEvent("cinematicBars", 1);
                triggerEvent("cinematicBars", 0.3, "1,quintOut");
                
                nc_lock(false, false);
                game.setOnLuas("note_offset", false);
                nc_set_target("opp", 0, 100);
                nc_snap_target("opp");
                new FlxTimer().start(0.03, function(tmr:FlxTimer) { 
                    nc_set_target("opp", 0, 0);
                    nc_focus("opp", 0.5, "cubeOut", true);
                });
                nc_snap_target("opp");
                nc_snap_zoom("g", camZoomScenes);
                triggerEvent("darknessTwn", 0, "1.2,linear");

                var off:Int = 50;
                dad.x = -800 - off;
                dad.y = -300;
                gf.x = 0 + off;
                gf.y = -300 - 100;
                boyfriend.x = 350 + off;
                boyfriend.y = -300 - 100;
                boyfriend.alpha = dad.alpha = gf.alpha = 0;
                FlxTween.tween(dad, {x: -800, alpha: 0.7}, 1, {ease: FlxEase.expoOut});
                FlxTween.tween(gf, {x: 0, alpha: 0.7}, 1, {ease: FlxEase.expoOut});
                FlxTween.tween(boyfriend, {x: 350, alpha: 0.7}, 1, {ease: FlxEase.expoOut});
                boyfriend.color = dad.color = gf.color = 0xFF222222;
                boyfriend.visible = dad.visible = gf.visible = true;
                boyfriend.blend = dad.blend = gf.blend = 9;

                scene.visible = true;
                changeScene(0);
            case 1088 - 8:
                FlxTween.color(scene, 1.0, 0xFFFFFFFF, 0xFF000000, {ease: FlxEase.linear});
            case 1088:
                changeScene(1);
            case 1120 - 8:
                FlxTween.color(scene, 1.0, 0xFFFFFFFF, 0xFF000000, {ease: FlxEase.linear});
            case 1120:
                changeScene(2);
            case 1152 - 8:
                FlxTween.color(scene, 1.0, 0xFFFFFFFF, 0xFF000000, {ease: FlxEase.linear});
            case 1152:
                changeScene(3);
            case 1184 - 8:
                FlxTween.color(scene, 1.0, 0xFFFFFFFF, 0xFF000000, {ease: FlxEase.linear});
            case 1184:
                changeScene(4);
            case 1216 - 8:
                FlxTween.color(scene, 1.0, 0xFFFFFFFF, 0xFF000000, {ease: FlxEase.linear});
            case 1216:
                changeScene(5);
            case 1232:
                triggerEvent("cinematicBars", 0.35, "1,circOut");
            case 1239:
                triggerEvent("cinematicBars", 0.4, "1,quintOut");
            case 1248 - 8:
                FlxTween.color(scene, 1.0, 0xFFFFFFFF, 0xFF000000, {ease: FlxEase.linear});
            case 1242:
                triggerEvent("cinematicBars", 0.375, "0.1,quadOut");
            case 1244:
                triggerEvent("cinematicBars", 0.35, "0.1,quadOut");
            case 1246:
                triggerEvent("cinematicBars", 0.325, "0.1,quadOut");
            case 1248:
                triggerEvent("cinematicBars", 0.3, "0.1,quadOut");
                changeScene(6);
            case 1280 - 8:
                FlxTween.color(scene, 1.0, 0xFFFFFFFF, 0xFF000000, {ease: FlxEase.linear});
            case 1280 - 4:
                triggerEvent("cinematicBars", 1, 3 * Conductor.stepCrochet / (1000) + ",quadOut");
            case 1280:
                dad.x = originalPos[0];
                dad.y = originalPos[1];
                gf.x = originalPos[2];
                gf.y = originalPos[3];
                boyfriend.x = originalPos[4];
                boyfriend.y = originalPos[5];
                dad.alpha = gf.alpha = boyfriend.alpha = 0;
                boyfriend.color = dad.color = gf.color = 0xFFFFFFFF;
                boyfriend.blend = dad.blend = gf.blend = 10;
                scene.visible = false;
                FlxTween.tween(dad, {alpha: 1}, 1, {ease: FlxEase.cubeInOut});
                FlxTween.tween(gf, {alpha: 1}, 1, {ease: FlxEase.cubeInOut});
                FlxTween.tween(boyfriend, {alpha: 1}, 1, {ease: FlxEase.cubeInOut});

                triggerEvent("cinematicBars", 0);
                triggerEvent("darknessTwn", 1);
                triggerEvent("darknessTwn", 0.65, "2,cubeInOut");

                nc_snap_zoom("g", 1.1);
                nc_set_target("plr", plr.x + 260, plr.y + 220);
                nc_snap_target("plr");
                vignetteRed.visible = false;
            case 1290:
                
                jackReal.visible = true;
            
            case 1296:
                game.setOnLuas("note_offset", false);
                nc_set_target("opp", opp.x - 300, opp.y + 150);
                nc_lock(false, false);
                nc_snap_target("opp");
                nc_lock(true, false);
                nc_snap_zoom("g", 1.4);
                triggerEvent("cameraAngleTwn", 20);
                triggerEvent("darknessTwn", 0.65);
            case 1300:
                nc_set_target("plr", plr.x + 280, plr.y + 230);
                nc_lock(false, false);
                nc_snap_target("plr");
                nc_lock(true, false);
                nc_snap_zoom("g", 1.6);
                triggerEvent("cameraAngleTwn", -10);
            case 1304:
                nc_set_target("opp", opp.x - 370, opp.y + 100);
                nc_lock(false, false);
                nc_snap_target("opp");
                nc_lock(true, false);
                nc_snap_zoom("g", 1.8);
                triggerEvent("cameraAngleTwn", 190);
            case 1308:
                nc_set_target("plr", (opp.x + plr.x) / 2 - 160, (opp.y + plr.y) / 2 - 110);
                nc_lock(false, false);
                nc_snap_target("plr");
                nc_lock(true, false);
                nc_snap_zoom("g", 0.4);
                triggerEvent("cameraAngleTwn", 0);
            case 1312:
                //GF
                nc_set_target("opp", opp.x + 200, opp.y + 70);
                nc_lock(false, false);
                nc_snap_target("opp");
                nc_lock(true, false);
                nc_snap_zoom("g", 1.7);
                triggerEvent("cameraAngleTwn", 10);
            case 1316:
                nc_set_target("plr", plr.x + 250, plr.y + 300);
                nc_lock(false, false);
                nc_snap_target("plr");
                nc_lock(true, false);
                nc_snap_zoom("g", 1.6);
                triggerEvent("cameraAngleTwn", 90);
            case 1320:
                jackReal.alpha = 1;
                dad.visible = false;
                nc_snap_zoom("g", 1.5);
                triggerEvent("cameraAngleTwn", 0);
                nc_set_target("opp", opp.x - 250, opp.y + 70);
                nc_lock(false, false);
                nc_snap_target("opp");
                nc_lock(true, false);
            case 1324:
                nc_set_target("plr", plr.x + 180, plr.y + 230);
                nc_lock(false, false);
                nc_snap_target("plr");
                nc_lock(true, false);
                nc_snap_zoom("g", 2);
                triggerEvent("cameraAngleTwn", 10);

            //ROTATING JACK BLACK SKIN
            case 1326:
                jackReal.visible = false;
                dad.visible = true;
                triggerEvent("darknessTwn", 0);

                camGame.visible = comboGroup.visible = uiGroup.visible = false;
                for (i in 0...strumLineNotes.members.length)
                    if (i < 4) strumLineNotes.members[i].alpha = 0;
                jackSkin.visible = true;
            case 1327:
                new FlxTimer().start(Conductor.stepCrochet / (1000 * 3), function(tmr:FlxTimer) { //0.05
                    jackSkin.animation.play("2");
                });
            case 1328:
                jackSkin.animation.play("3");

                ClientPrefs.data.comboOffset = oldComboOffsets;
            case 1330:
                camGame.visible = comboGroup.visible = uiGroup.visible = true;
                botplayTxt.visible = ClientPrefs.getGameplaySetting('botplay');
                for (i in 0...strumLineNotes.members.length)
                    if (i < 4) strumLineNotes.members[i].alpha = (ClientPrefs.data.middleScroll ? 0.35 : 1);
                jackSkin.visible = false;

                nc_set_target("plr", (opp.x + plr.x) / 2, (opp.y + plr.y) / 2);
                nc_lock(false, false);
                nc_snap_target("plr");
                nc_lock(true, false);
                nc_snap_zoom("g", 0.6);
                game.setOnLuas("zoom_speed", 100);
                nc_zoom("g", 0.5, 1, "elasticOut");
                triggerEvent("cameraAngleTwn", 0);
                triggerEvent("brightnessTwn", 0.5);
                triggerEvent("brightnessTwn", 0, "0.5,expoOut");

                FlxTween.tween(camHUD, { alpha: 0 }, 3, { ease: FlxEase.quadIn});
                //FlxTween.tween(camGame, { alpha: 0 }, 0.5, { ease: FlxEase.circOut});

            case 1354:
                new FlxTimer().start(Conductor.stepCrochet / (1000 * 2), function(tmr:FlxTimer) { //0.05
                    if (subtitles != null) {
                        subtitles.visible = subtitlesS.visible = true;
                        subtitles.text = subtitlesS.text = "That's it, that's the one.";
                    } 
                    dad.visible = false;
                    jackCutscene.visible = true;
                    jackCutscene.anim.play("outro", true);

                    nc_snap_zoom("g", 0.8);
                    nc_set_target("opp", opp.x - 50, opp.y + 150);
                    nc_snap_target("opp");
                    nc_lock(true, false);
                });
            case 1363:
                if (subtitles != null)
                    subtitles.text = subtitlesS.text = "It's on the album.";
            case 1371:
                triggerEvent("transitionIn");
            case 1374:
                if (subtitles != null) {
                    subtitles.visible = subtitlesS.visible = false;
                    subtitles.text = subtitlesS.text = "";
                }


        }

        if (curStep >= 800 && curStep <= 912 && curSection != 54 && (curStep % 16 == 4 || curStep % 16 == 12)) {
            FlxTween.tween(camGame, { y: -5 }, 0.1, { ease: FlxEase.circOut, onComplete: function() {
                FlxTween.tween(camGame, { y: 0 }, 0.5, { ease: FlxEase.circOut});
            } });
        }
    }

    function bfFakeAppear(i:Int) {
        var pos:Float = bfFake[i].y;
        bfFake[i].y += 50;
        FlxTween.tween(bfFake[i], { y: pos }, 0.7, { ease: FlxEase.elasticOut});
        FlxTween.tween(bfFake[i], { alpha: 1 }, 0.5, { ease: FlxEase.circOut});

        nc_lock(false, false);
        nc_set_target("plr", plr.x + 260 + 200 * (i + 1), plr.y + 220);
        nc_focus("plr", 0.3, "backOut", true);
        /*
        FlxTween.num(255, 0, 0.5, {ease: FlxEase.circOut}, 
            function(num:Float) {
                //var color:Float = 255 * ((4 - i) / 5);
                //spr.color = CustomFlxColor.fromRGB(color, color, color);
            }
        );
        */
    }

    function changeScene(i:Int) {
        scene.loadGraphic(Paths.image("stages/minecraftMovie/events/scenes/" + sceneNames[i]));
        scene.setGraphicSize(0, FlxG.height);
        scene.scale.set(scene.scale.x * (1 / camZoomScenes), scene.scale.y * (1 / camZoomScenes));
        scene.x = -scene.width / 2;
        scene.y = -scene.height / 2;
        if (sceneTwn != null) sceneTwn.cancel();
        sceneTwn = FlxTween.tween(scene.scale, {x: scene.scale.x * 1.1, y: scene.scale.y * 1.1}, 4, {ease: FlxEase.linear});

        FlxTween.color(scene, 1.0, 0xFF000000, 0xFFFFFFFF, {ease: FlxEase.linear});
    }

    function onUpdate(delta) {
        if (hypnosis.visible)
            hypnosis.angle -= 75 * delta;
        if (epic.visible)
            epic.angle -= 10 * delta;
        if (jackMinecraft != null && jackMinecraft.visible && jackMinecraft.animation.finished) {
            dad.visible = true;
            jackMinecraft.visible = false;
        }
        if (starBig.visible)
            starBig.angle += 5 * delta;

        if ((curStep == 1328 || curStep == 1329) && FlxG.keys.justPressed.SPACE) {
            FlxG.sound.play(Paths.sound("ui/freeplay/confirmMenu"));
            PlayState.instance.openPauseMenu();
            CoolUtil.browserLoad('https://www.youtube.com/watch?v=aSf2UjhZNdc');
        }
    }

    function onSectionHit() {
        if (vignetteRed.visible && curStep < 1056 && vignetteRedTwn == null)
            FlxTween.num(3, 1, 0.8, {ease: FlxEase.quadOut}, 
                function(num:Float) {
                    vignetteRed.setColorTransform(1.0, 1.0, 1.0, 1.0, 138 * num, 8 * num, 51 * num, 0.0);
                }
            );
    }


    function opponentNoteHit(note:Note)
    {
        if (jackFake1.visible && !note.isSustainNote) {
            var anim:String = "idle";
            switch note.noteData {
                case 0: anim = "singLEFT";
                case 1: anim = "singDOWN";
                case 2: anim = "singUP";
                case 3: anim = "singRIGHT";
            }
            jackFake1.animation.play(anim, true);
            jackFake1.offset.set(jackFakeOffsets[note.noteData][0], jackFakeOffsets[note.noteData][1]);

            jackFake2.animation.play(anim, true);
            jackFake2.offset.set(jackFakeOffsets[note.noteData][0], jackFakeOffsets[note.noteData][1]);
        }
    }

    function goodNoteHit(note:Note) {
        if (bfFake[0].visible && !note.isSustainNote) {
            var anim:String = "idle";
            switch note.noteData {
                case 0: anim = "singLEFT";
                case 1: anim = "singDOWN";
                case 2: anim = "singUP";
                case 3: anim = "singRIGHT";
            }
            for (i in bfFake) {
                i.animation.play(anim, true);
                i.offset.set(bfFakeOffsets[anim][0], bfFakeOffsets[anim][1]);
            }
        }
    }

    function noteMissPress(direction:Int)
    {
        // Called after the note press miss calculations
        // Player pressed a button, but there was no note to hit (ghost miss)
        bfPlayMiss(direction);
    }
    
    function noteMiss(note:Note)
    {
        // Called after the note miss calculations
        // Player missed a note by letting it go offscreen
        bfPlayMiss(note.noteData);
    }

    function bfPlayMiss(direction:Int) {
        if (bfFake[0].visible) {
            var anim:String = "idle";
            switch direction {
                case 0: anim = "singLEFTmiss";
                case 1: anim = "singDOWNmiss";
                case 2: anim = "singUPmiss";
                case 3: anim = "singRIGHTmiss";
            }
            for (i in bfFake) {
                i.animation.play(anim, true);
                i.offset.set(bfFakeOffsets[anim][0], bfFakeOffsets[anim][1]);
            }
        }
    }

    function onDestroy() {
        ClientPrefs.data.comboOffset = oldComboOffsets;
        ClientPrefs.data.ghostTapping = ghostTapping;
    }

}