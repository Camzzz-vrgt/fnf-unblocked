import flixel.FlxCamera;
import substates.GameOverSubstate;

var playerCam:FlxCamera;
var shaderTime:Float = 0;

var glitchShader:FlxRuntimeShader;
var vignetteShader:FlxRuntimeShader;
var chromaticShader:FlxRuntimeShader;
var bugShader:FlxRuntimeShader;
var bloomShader:FlxRuntimeShader;

var retryText:FlxText;
var lastAnim:Array = ['', 0];
var shaderOverride:Array<Float> = [0, 0, 0];
var shakeOverride:Float = 0;
var fullShaderOverride:Bool = false;
var isSongGlitching:Bool = false;
var songGlitchTime:Float = 0;
var bullshit:Array = [];

function onCreate() game.missSoundSuffix = "mad";

function onCreatePost()
{
    retryText = new FlxText(375, 353, 650, "RETRY?", 180);
    retryText.scrollFactor.set(0, 0);
    retryText.screenCenter();
    retryText.setPosition(355, 235);
    retryText.font = Paths.font("vcr.ttf");
    GameOverSubstate.deathDelay = 0.4;

    if (!ClientPrefs.data.shaders) return;

    playerCam = new FlxCamera();
    playerCam.bgColor = 0x00000000;

    FlxG.cameras.remove(game.camBars, false); 
    FlxG.cameras.remove(game.camHUD, false); 
    FlxG.cameras.remove(game.camEvents, false); 
    FlxG.cameras.remove(game.camOther, false); 
 
    FlxG.cameras.add(playerCam, false); 
    FlxG.cameras.add(game.camEvents, false); 
    FlxG.cameras.add(game.camBars, false); 
    FlxG.cameras.add(game.camHUD, false); 
    FlxG.cameras.add(game.camOther, false); 

    game.boyfriendGroup.cameras = [playerCam];

    glitchShader = game.createRuntimeShader("glitch"); // thanks vs rewrite
    glitchShader.setFloat("glitchAmplitude", 2.0);
    glitchShader.setFloat("glitchNarrowness", 9.0);
    glitchShader.setFloat("glitchBlockiness", 1.0);
    glitchShader.setFloat("glitchMinimizer", 7.0);

    vignetteShader = game.createRuntimeShader("vignetteGlitch");
    vignetteShader.setFloat("prob", 1.7);
    vignetteShader.setFloat("blocks", 2.8);
    vignetteShader.setFloat("grid", 0.5);
    vignetteShader.setFloat("size", 0.1);
    vignetteShader.setFloat('vignetteIntensity', 100);
    vignetteShader.setFloat("glitchScale", 0.00001);

    chromaticShader = game.createRuntimeShader("chromatic");
    chromaticShader.setFloat("rOffset", 0);
    chromaticShader.setFloat("gOffset", 0);
    chromaticShader.setFloat("bOffset", 0);

    bugShader = game.createRuntimeShader("bunearyGlitch"); // thanks fnf corruption
    bugShader.setFloat("glitchStrength", 0);

    bloomShader = game.createRuntimeShader("bloom");
    bloomShader.setFloat("dim", 1.4);
    bloomShader.setFloat("Directions", 12.0);
    bloomShader.setFloat("Quality", 10.0);
    bloomShader.setFloat("Size", 16.0);

    game.camGame.filtersEnabled = false;
    playerCam.filters = [new ShaderFilter(bugShader), new ShaderFilter(vignetteShader), new ShaderFilter(chromaticShader), new ShaderFilter(glitchShader), new ShaderFilter(bloomShader)];
    game.camHUD.filters = [new ShaderFilter(glitchShader), new ShaderFilter(bugShader)];
    playerCam.filtersEnabled = false;
    retryText.cameras = [playerCam];
    game.setOnScripts("playerCam", playerCam);
}

function onGameOver() {
    GameOverSubstate.characterName = game.boyfriend.curCharacter + '-dead'; // There is a strange bug where if i dont do this (this as in copy the entire json of the actual character but just add -dead at the end of the name) 
    // the game over boyfriend is offset tremendously. I dont give enough of a fix to fix it.
    // Shadow Mario. Shadow Mario. Why did you archive the repository so soon?

    lastAnim = [game.boyfriend.animation.curAnim.name, game.boyfriend.animation.curAnim.curFrame];
    songGlitchTime = Conductor.songPosition;
    isSongGlitching = true;
    if (game.opponentVocals != null) game.opponentVocals.stop();
    if (ClientPrefs.data.shaders) game.camGame.filtersEnabled = playerCam.filtersEnabled = true;

    game.camOther.filters = game.camEvents.filters = game.camBars.filters = [new ShaderFilter(bugShader), new ShaderFilter(vignetteShader), new ShaderFilter(chromaticShader), new ShaderFilter(glitchShader)];
}

function onGameOverStart() {
    FlxTween.cancelTweensOf(FlxG.camera);
    FlxG.camera.angle = 0;
    FlxG.camera.fade(0xFF000000, 0.001, true, null, true);
    FlxG.sound.music.loadEmbedded(Paths.music(GameOverSubstate.loopSoundName), true);
    FlxG.camera.filters = [];
    isSongGlitching = false;
    FlxG.camera.followLerp = 1000000;
    FlxG.camera.zoom = game.defaultZooms[2];
    game.defaultCamZoom = game.defaultZooms[2];
    GameOverSubstate.instance.boyfriend.playAnim(lastAnim[0], true, false, lastAnim[1]);
    game.camOther.filtersEnabled = game.camEvents.filtersEnabled = game.camBars.filtersEnabled = false;

    var timer0 = new FlxTimer().start(0.4, function(tmr:FlxTimer) {
        GameOverSubstate.instance.boyfriend.shader = null;
        GameOverSubstate.instance.remove(GameOverSubstate.instance.boyfriend);
	});

    var timer1 = new FlxTimer().start(1, function(tmr:FlxTimer) {
        if (ClientPrefs.data.shaders) fullShaderOverride = true;
        GameOverSubstate.instance.add(retryText);
        if (!ClientPrefs.data.shaders) {
            retryText.alpha = 0.001;
            FlxTween.tween(retryText, {alpha: 1}, 0.25);
        }
        FlxG.sound.music.play();
	});

    if (!ClientPrefs.data.shaders) return;

    GameOverSubstate.instance.boyfriend.camera = playerCam;
    GameOverSubstate.instance.boyfriend.shader = vignetteShader;
    playerCam.filtersEnabled = true;
    retryText.shader = vignetteShader;

    var shaderTween0 = FlxTween.num(shaderOverride[0], FlxG.random.float(-1.5, 1.75), 0.2, {ease: FlxEase.cubeIn}, function (num) {
        shaderOverride[0] = num;
    });

    var shaderTween1 = FlxTween.num(shaderOverride[1], FlxG.random.float(-2000, 3000), 0.2, {ease: FlxEase.cubeIn}, function (num) {
        shaderOverride[0] = num;
    });

    var shaderTween2 = FlxTween.num(shaderOverride[2], FlxG.random.float(-10, 20), 0.25, {ease: FlxEase.cubeIn}, function (num) {
        shaderOverride[2] = num;
    });

    var shakeTween = FlxTween.num(shakeOverride, FlxG.random.float(0.12, 0.24), 0.3, {ease: FlxEase.cubeInOut}, function (num) {
        shakeOverride = num;
    });

    for (i in [shaderTween0, shaderTween1, shaderTween2, shakeTween, timer0, timer1]) {
        if (!ClientPrefs.data.shaders && (i == shaderTween0 || i == shaderTween1 || i == shaderTween2 || i == shakeTween)) continue;
        bullshit.push(i);
    }
}

function onGameOverConfirm(retry)
{
    if (!retry) return;

    if (!ClientPrefs.data.shaders) {
        FlxTween.cancelTweensOf(retryText);
        if (ClientPrefs.data.flashing) FlxG.camera.flash(0xFFFFFFFF, 2);
    }
    for (i in bullshit) i.cancel();
    FlxG.camera.zoom = 0.85;
    GameOverSubstate.instance.camFollow.y += 100;
    FlxTween.tween(FlxG.camera, {zoom: 0.7}, 1.1, {ease: FlxEase.cubeOut});
    GameOverSubstate.instance.boyfriend.flipX = false;
    GameOverSubstate.instance.remove(retryText);
    GameOverSubstate.instance.add(GameOverSubstate.instance.boyfriend);
    game.camOther.filters = game.camEvents.filters = game.camBars.filters = [];
    FlxG.sound.music.volume = 0;
    FlxG.sound.music.stop();

    if (!ClientPrefs.data.shaders) return;

    shakeOverride = 0.02;
    fullShaderOverride = false;
    playerCam.filtersEnabled = true;
    GameOverSubstate.instance.boyfriend.shader = vignetteShader;

    FlxTween.num(shaderOverride[0], -0.003, 0.05, {ease: FlxEase.cubeIn}, function (num) {
        shaderOverride[0] = num;
    });
    FlxTween.num(shaderOverride[1], -25, 0.05, {ease: FlxEase.cubeIn}, function (num) {
        shaderOverride[0] = num;
    });
    FlxTween.num(shaderOverride[2], -0.6, 0.05, {ease: FlxEase.cubeIn}, function (num) {
        shaderOverride[2] = num;
    });
    FlxTween.num(shakeOverride, 0, 0.2, {ease: FlxEase.cubeIn}, function (num) {
        shakeOverride = num;
    });

    new FlxTimer().start(0.15, function(tmr:FlxTimer) {
        playerCam.filtersEnabled = false;
    });
    new FlxTimer().start(0.2, function(tmr:FlxTimer) {
        GameOverSubstate.instance.boyfriend.shader = null;
    });
    new FlxTimer().start(0.7, function(tmr:FlxTimer) {
        playerCam.fade(0xFF000000, 2);
	});
}

function onUpdatePost(e)
{
    game.iconP1.offset.x = -15;

    if (isSongGlitching) {
        game.boyfriend.offset.x = FlxG.random.float(-10, 10);
        FlxG.sound.music.time = songGlitchTime + FlxG.random.float(-50, 50);
        game.vocals.time = songGlitchTime + FlxG.random.float(-50, 50);
        game.camGame.filters = [new ShaderFilter(bugShader), new ShaderFilter(vignetteShader), new ShaderFilter(chromaticShader), new ShaderFilter(glitchShader)];
    }
    if (!ClientPrefs.data.shaders) return;

    shaderTime += e;
    for (i in [glitchShader, vignetteShader]) i.setFloat("iTime", shaderTime);

    if (playerCam.filtersEnabled || fullShaderOverride) {
        if (!fullShaderOverride) playerCam.shake(0.02 + shakeOverride, 0.05);
        vignetteShader.setFloat("size", FlxG.random.float(0.01, 0.03) + shaderOverride[0]);
        vignetteShader.setFloat("vignetteIntensity", FlxG.random.float(50, 100) + shaderOverride[1]);
        vignetteShader.setFloat("glitchScale", FlxG.random.float(0.5, 0.8) + shaderOverride[2]);
        chromaticShader.setFloat("rOffset", FlxG.random.float(-0.025, 0.025));
        chromaticShader.setFloat("gOffset", FlxG.random.float(-0.005, 0.005));
        chromaticShader.setFloat("bOffset", FlxG.random.float(-0.035, 0.035));
        bugShader.setFloat("glitchStrength", FlxG.random.float(-5, 5));
    }

    game.camHUD.filtersEnabled = (playerCam.filtersEnabled && game.mechanics);

    if (playerCam != null) {
        playerCam.target = game.camGame.target;
        playerCam.zoom = game.camGame.zoom;
        playerCam.style = game.camGame.style;
        playerCam.scroll = game.camGame.scroll;
        playerCam.followLerp = game.camGame.followLerp;
        playerCam.angle = game.camGame.angle;
    }

    retryText.offset.set(FlxG.random.float(-5, 5), FlxG.random.float(-10, 10));
}

function onEvent(e, v1, v2, sT) {
    if (e == "Paradox Force Glitches" && game.vocals.volume > 0 && ClientPrefs.data.shaders)
        playerCam.filtersEnabled = v1 == "true" ? true : false;
}

function noteMiss(n) if (ClientPrefs.data.shaders) playerCam.filtersEnabled = false;