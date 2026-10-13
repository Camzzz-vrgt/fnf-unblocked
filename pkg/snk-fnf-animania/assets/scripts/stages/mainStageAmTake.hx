import flixel.addons.display.FlxBackdrop;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import funkin.audio.FunkinSound;
import funkin.play.stage.ScriptedStage;
import funkin.Conductor;
import flixel.addons.effects.FlxTrail;
import funkin.play.PauseSubState;
import funkin.play.PlayState;
import flixel.group.FlxTypedGroup;
import funkin.play.character.CharacterType;
import funkin.graphics.FunkinSprite;
import openfl.filters.ShaderFilter;
import openfl.display.BlendMode;
import flixel.addons.display.FlxRuntimeShader;
import funkin.Paths;
import openfl.utils.Assets;
import flixel.FlxG;

class MainStageAmTake extends ScriptedStage
{
  // `initialZoom` and `zoomFactor` were stage-data properties in Legacy.
  // V-Slice 0.8.5 no longer implements them, so the vignette textures must
  // compensate for camera zoom explicitly.
  static final LEGACY_VIGNETTE_INITIAL_ZOOM:Float = .6;

  function new()
  {
    super('mainStageAmTake');
  }

  override function onCreate(e)
  {
    super.onCreate(e);
    PauseSubState.musicSuffix = '-amtake1';
    cameraDance = false;
  }

  var spotlighShits = [];

  var crowd1:FunkinSprite;
  var crowd2:FunkinSprite;
  var crowd3:FunkinSprite;

  var smokes = [];

  // Runtime shader uniforms are exposed as dynamic fields.  Keeping HScript
  // wrapper properties with the same names as those uniforms makes Polymod
  // reject the class as a redefinition of a superclass field.
  var highShader:FlxRuntimeShader;
  var trippyShader:FlxRuntimeShader;
  var highShaderFilter:ShaderFilter;
  var trippyShaderFilter:ShaderFilter;
  var shaderTime:Float = 0;
  var highEffectiveness:Float = 0;
  var trippyDarkness:Float = 0;
  var trippyIntensity:Float = 0;
  var trippyMultTween:FlxTween;

  function setHighEffectiveness(value:Float):Void
  {
    highEffectiveness = value;
    if (highShader != null) highShader.setFloat('effectiveness', value);
  }

  function setTrippyDarkness(value:Float):Void
  {
    trippyDarkness = value;
    if (trippyShader != null) trippyShader.setFloat('darkness', value);
  }

  function setTrippyIntensity(value:Float):Void
  {
    trippyIntensity = value;
    if (trippyShader != null) trippyShader.setFloat('intensity', value);
  }

  function removeCameraShaders():Void
  {
    var game = PlayState.instance;
    if (game == null || game.camGame.filters == null) return;

    var cameraFilters = game.camGame.filters;
    if (highShaderFilter != null) cameraFilters.remove(highShaderFilter);
    if (trippyShaderFilter != null) cameraFilters.remove(trippyShaderFilter);
    game.camGame.filters = cameraFilters;
  }

  function hasFreshStageShaders():Bool
  {
    return Preferences.shaders && isFreshStage();
  }

  function isFreshStage():Bool
  {
    return PlayState.instance?.currentSong?.id == 'fresh';
  }

  /** Allocate and attach costly camera filters only at Fresh's first visual cue. */
  function enableFreshPostProcess():Void
  {
    if (!hasFreshStageShaders() || PlayState.instance == null) return;

    var game = PlayState.instance;
    var cameraFilters = game.camGame.filters;
    if (cameraFilters == null) cameraFilters = [];

    if (highShaderFilter == null)
    {
      var highFragment = Assets.getText(Paths.frag('high'));
      if (highFragment != null)
      {
        highShader = new FlxRuntimeShader(highFragment);
        setHighEffectiveness(0);
        highShaderFilter = new ShaderFilter(highShader);
        cameraFilters.push(highShaderFilter);
      }
    }

    if (trippyShaderFilter == null)
    {
      var trippyFragment = Assets.getText(Paths.frag('trippy'));
      if (trippyFragment != null)
      {
        trippyShader = new FlxRuntimeShader(trippyFragment);
        setTrippyDarkness(0);
        setTrippyIntensity(0);
        trippyShaderFilter = new ShaderFilter(trippyShader);
        cameraFilters.push(trippyShaderFilter);
      }
    }

    game.camGame.filters = cameraFilters;
  }

  function buildStage()
  {
    spotlighShits = [];
    super.buildStage();

    // The physical spotlight props are shared by Bopeebo and Fresh, but their
    // animated ray/ring companions exist only during Fresh's light sequence.
    if (isFreshStage()) createAllSpotlights();
    setLight(true);
    smokes = [];
    if (isFreshStage()) createFreshSmoke();
    setSmokeVisible(false);

    getNamedProp("vin1").alpha = 1;
    getNamedProp("vin2").alpha = 0;

    if (!Preferences.lowQuality)
    {
      crowd1 = new FunkinSprite(-1050, 770, Paths.animateAtlas("stages/mainStageAmTake/crowd", "week1"));
      crowd1.anim.addByFrameLabel("y", "crowd1", 1, false);
      crowd1.anim.play("y", true);
      crowd1.scrollFactor.set(1.1, 1.1);
      crowd1.zIndex = 80;
      crowd1.useRenderTexture = true;
      crowd1.applyStageMatrix = true;
      add(crowd1);

      crowd2 = new FunkinSprite(-1100, 750, Paths.animateAtlas("stages/mainStageAmTake/crowd", "week1"));
      crowd2.anim.addByFrameLabel("y", "croud2 bop", 24, false);
      crowd2.anim.addByFrameLabelIndices("dL", "croud2 dance", [0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14], 24, false);
      crowd2.anim.addByFrameLabelIndices("dR", "croud2 dance", [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29], 24, false);
      crowd2.anim.play("y", true);
      crowd2.scrollFactor.set(1.2, 1.2);
      crowd2.zIndex = 200;
      crowd2.color = 0xFFAAA9B2;
      namedProps.set("crowdA", crowd2);
      crowd2.useRenderTexture = true;
      crowd2.applyStageMatrix = true;
      add(crowd2);

      crowd3 = new FunkinSprite(-1050, 600, Paths.animateAtlas("stages/mainStageAmTake/crowd", "week1"));
      crowd3.anim.addByFrameLabel("y", "croud3", 24, false);
      crowd3.anim.play("y", true);
      crowd3.scrollFactor.set(1.3, 1.3);
      crowd3.zIndex = 205;
      crowd3.color = 0xFFA29EAF;
      crowd3.useRenderTexture = true;
      crowd3.applyStageMatrix = true;
      add(crowd3);
    }

    refresh();

    // High/Trippy are allocated at Fresh beat 112, not while this shared
    // stage is loading for Bopeebo or during Fresh's unaffected opening.
  }

  function onGameOver(e)
  {
    removeCameraShaders();
  }

  function onSongRetry(e)
  {
    // Sprite transforms are restored by Stage.resetStage(). These fields are
    // the remaining runtime-only state of Fresh's shared stage.
    trippyMultTween?.cancel();
    trippyMultTween = null;
    shaderTime = 0;
    trippyMult = 1;
    highEffectiveness = 0;
    trippyDarkness = 0;
    trippyIntensity = 0;
    removeCameraShaders();
    highShader = null;
    trippyShader = null;
    highShaderFilter = null;
    trippyShaderFilter = null;
    itsSoloTime = false;
    allowedColorChange = 0;
    cameraDance = false;
    crowd2Bop = false;
    crowd2Right = false;
    if (PlayState.instance != null) PlayState.instance.canShowCombo = true;

    // Stage.resetStage() has just rebuilt the automatic 0.8.5 focus point.
    // Restore the authored Legacy focus before PlayState.resetCamera() snaps
    // the retry camera to it.
    applyLegacyCameraFocus();
  }

  var legacyCameraFocusApplied:Bool = false;

  override function stageFullConstruct():Void
  {
    // PlayState initially copied Dad's automatic 0.8.5 focus before this
    // hook ran. Set both the authored points and cameraFollowPoint here, so
    // the first resetCamera() already starts at the Legacy position instead
    // of visibly travelling there on the first update.
    applyLegacyCameraFocus();
  }

  function setLegacyCameraFocus(character, x:Float, y:Float):Void
  {
    if (character == null || character.cameraFocusPoint == null) return;

    character.cameraFocusPoint.x = x;
    character.cameraFocusPoint.y = y;
  }

  function applyLegacyCameraFocus():Void
  {
    var dad = getDad();
    if (PlayState.instance == null || dad == null || dad.cameraFocusPoint == null) return;

    // Stage.resetStage() recreates the character focus points on Retry.
    // Reapply the legacy coordinates whenever that reset is detected.
    var dadCameraX = 420;
    var needsApply = !legacyCameraFocusApplied || dad.cameraFocusPoint.x != dadCameraX || dad.cameraFocusPoint.y != 475;
    if (!needsApply) return;

    setLegacyCameraFocus(getBoyfriend(), 900, 475);
    setLegacyCameraFocus(dad, dadCameraX, 475);
    setLegacyCameraFocus(getGirlfriend(), 650, 375);

    // The legacy stage opened focused on Dad. In 0.8.5 this point was
    // already copied before the obsolete stageFullConstruct hook could run.
    PlayState.instance.cameraFollowPoint.x = dadCameraX;
    PlayState.instance.cameraFollowPoint.y = 475;
    legacyCameraFocusApplied = true;
  }

  function createAllSpotlights()
  {
    for (prop in namedProps)
      if (prop.name.indexOf("stoplight") != -1)
      {
        var uhuh = new SpotlightAccesories("asss", prop);
        spotlighShits.push(uhuh);
        add(uhuh);
      }
  }

  /** Fresh-only smoke was removed from the shared stage JSON, so Bopeebo no
   * longer creates four invisible boppers nor loads bgSmoke.png. */
  function createFreshSmoke()
  {
    var smokeData = [{
      x: -350,
      y: 750,
      z: 53,
      scroll: .99,
      animation: 'weed1'
    }, {
      x: 600,
      y: 715,
      z: 54,
      scroll: .99,
      animation: 'weed4'
    }, {
      x: -200,
      y: 640,
      z: 6,
      scroll: .97,
      animation: 'weed2'
    }, {
      x: 510,
      y: 610,
      z: 7,
      scroll: .97,
      animation: 'weed3'
    }];

    for (data in smokeData)
    {
      var smoke = new FunkinSprite(data.x, data.y);
      smoke.frames = Paths.getSparrowAtlas('stages/mainStageAmTake/bgSmoke', 'week1');
      smoke.animation.addByPrefix('y', data.animation, 24, true);
      smoke.animation.play('y', true);
      smoke.scrollFactor.set(data.scroll, data.scroll);
      smoke.zIndex = data.z;
      add(smoke);
      smokes.push(smoke);
    }
  }

  function onUpdate(event)
  {
    super.onUpdate(event);
    applyLegacyCameraFocus();
    updateLegacyVignettes();

    if (hasFreshStageShaders())
    {
      shaderTime += event.elapsed;
      if (highShader != null) highShader.setFloat('iTime', shaderTime);
      if (trippyShader != null) trippyShader.setFloat('iTime', shaderTime * trippyMult);
    }

    if (isFreshStage())
    {
      if (getNamedProp("floorLightsBlendy").alpha > 0) getNamedProp("floorLightsBlendy").alpha -= (Conductor.instance.beatLengthMs / 1000) * FlxG.elapsed * 2.2;
      if (getNamedProp("floorLights").alpha > 0) getNamedProp("floorLights").alpha -= (Conductor.instance.beatLengthMs / 1000) * FlxG.elapsed * 2.2;

      if (spotlighShits.length > 0 && spotlighShits[0].alpha > 0 && !itsSoloTime)
      {
        var alph = spotlighShits[0].alpha;
        alph -= (Conductor.instance.beatLengthMs / 1000) * FlxG.elapsed * 3.3;
        for (s in spotlighShits)
          s.alpha = alph;
      }
    }
    if (PlayState.instance.cameraAngleTween == null) FlxG.camera.scrollAngle = FlxMath.lerp(neededAngle, FlxG.camera.scrollAngle,
      Math.exp(-FlxG.elapsed * 6.125));
  }

  /**
   * Preserve Legacy's partial zoom cancellation for vin1 and vin2.
   * Without it, their 2185px texture can expose a sharp rectangular edge
   * when Fresh's chart zooms out or follows BF at the right side of stage.
   */
  function updateLegacyVignettes():Void
  {
    var zoom = Math.max(.01, FlxG.camera.zoom);
    applyLegacyVignetteZoom('vin1', 1.45, 1.4, .65, zoom);
    applyLegacyVignetteZoom('vin2', 1.4, 1.4, .9, zoom);
  }

  function applyLegacyVignetteZoom(name:String, baseScaleX:Float, baseScaleY:Float, zoomFactor:Float, cameraZoom:Float):Void
  {
    var vignette = getNamedProp(name);
    if (vignette == null) return;

    // zoomFactor 1 means a normal world sprite; 0 would cancel all camera
    // zoom.  This matches the Legacy 0.6 stage renderer's behaviour.
    var compensation = Math.pow(LEGACY_VIGNETTE_INITIAL_ZOOM / cameraZoom, 1 - zoomFactor);
    var targetX = baseScaleX * compensation;
    var targetY = baseScaleY * compensation;
    if (Math.abs(vignette.scale.x - targetX) < .0001 && Math.abs(vignette.scale.y - targetY) < .0001) return;

    vignette.scale.set(targetX, targetY);
    vignette.updateHitbox();
  }

  var cameraDance:Bool = false;
  var neededAngle:Float = 0;

  var crowd2Bop:Bool = false;
  var crowd2Right:Bool = false;
  var trippyMult:Float = 1;

  function onBeatHit(event:SongTimeScriptEvent)
  {
    super.onBeatHit(event);

    if ((event.beat > 95 && event.beat < 129 && PlayState.instance.currentSong.id == "bopeebo")
      || (event.beat > 145 && event.beat < 175 && PlayState.instance.currentSong.id == "fresh")) crowd2Bop = true;
    else
      crowd2Bop = false;

    if (allowedColorChange > 0 && event.beat % allowedColorChange == 0) setLight();

    neededAngle = (cameraDance) ? ((neededAngle > 0) ? -.5 : .5) : 0;

    if (!Preferences.lowQuality)
    {
      // Keep a failed optional visual asset from breaking the whole stage.
      // In particular this prevents a second error if an atlas failed to load.
      if (crowd1 != null)
      {
        FlxTween.cancelTweensOf(crowd1);
        crowd1.y = 780;
        FlxTween.tween(crowd1, {y: crowd1.y - 10}, .5, {ease: FlxEase.backOut});
      }

      if (crowd2 != null)
      {
        if (crowd2Bop) crowd2.anim.play(crowd2Right ? "dL" : "dR", true);
        else
          crowd2.anim.play("y", true);
      }

      if (crowd3 != null) crowd3.anim.play("y", true);

      crowd2Right = !crowd2Right;
    }

    if (PlayState.instance.currentSong.id == "fresh")
    {
      if (event.beat == 48)
      {
        itsSoloTime = true;
        projectDad();
      }

      if (event.beat == 56)
      {
        itsSoloTime = true;
        setLight();
        // projectGF();
      }

      if (event.beat == 65)
      {
        itsSoloTime = true;
        // setLight();
        projectGF();
      }

      if (event.beat == 72)
      {
        itsSoloTime = true;
        // setLight();
        putProjectors(0xFF99FFFF, .45, .7);
      }

      if (event.beat >= 74 && event.beat <= 76)
      {
        itsSoloTime = false;
        putProjectors(0xFF99FFFF, .45, FlxG.random.float(.4, .8));
        // projectGF();
      }

      if (event.beat == 80)
      {
        itsSoloTime = false;
        cameraDance = false;
        for (p in spotlighShits)
          p.targetSpotlight.animation.play('off', true);
      }

      if (event.beat == 110) PlayState.instance.canShowCombo = false;

      if (event.beat == 112)
      {
        itsSoloTime = true;
        setLight(false, FlxColor.WHITE);
        for (smoke in smokes)
          smoke.alpha = 1;

        if (hasFreshStageShaders())
        {
          enableFreshPostProcess();
          FlxTween.num(highEffectiveness, .2, 10, {ease: FlxEase.sineInOut}, setHighEffectiveness);
          FlxTween.num(trippyDarkness, .5, 10, {ease: FlxEase.sineInOut}, setTrippyDarkness);
          FlxTween.num(trippyIntensity, 2, 10, {ease: FlxEase.sineInOut}, setTrippyIntensity);
        }
        trippyMult = 0.75;
      }

      if (event.beat == 144)
      {
        PlayState.instance.canShowCombo = true;
        itsSoloTime = false;
        allowedColorChange = 1;
        cameraDance = true;
        setLight();
        // setSmokeVisible(true);
        for (smoke in smokes)
          FlxTween.tween(smoke, {alpha: 0}, 6, {ease: FlxEase.smootherStepInOut});

        if (hasFreshStageShaders())
        {
          FlxTween.num(highEffectiveness, 0, .25, {ease: FlxEase.cubeOut}, setHighEffectiveness);
          FlxTween.num(trippyDarkness, .4, 2, {ease: FlxEase.sineInOut}, setTrippyDarkness);
          FlxTween.num(trippyIntensity, .95, 2, {ease: FlxEase.sineInOut}, setTrippyIntensity);
        }
        trippyMult = 2;
        trippyMultTween?.cancel();
        trippyMultTween = FlxTween.num(trippyMult, 0.9, .75, {ease: FlxEase.sineInOut}, i -> trippyMult = i);
      }
      if (event.beat == 176)
      {
        itsSoloTime = false;
        allowedColorChange = 2;
        cameraDance = false;
        setLight();
      }

      if (event.beat == 206)
      {
        itsSoloTime = false;
        setLight(true);
      }

      if (event.beat == 208)
      {
        itsSoloTime = true;
        allowedColorChange = 0;
        cameraDance = false;
        setLight(false, FlxColor.WHITE);

        var vin2 = getNamedProp('vin2');
        FlxTween.tween(vin2, {alpha: .5}, 3, {ease: FlxEase.cubeOut});

        if (hasFreshStageShaders())
        {
          FlxTween.num(trippyDarkness, 0, 1, {ease: FlxEase.sineInOut}, setTrippyDarkness);
          FlxTween.num(trippyIntensity, 0, 1, {ease: FlxEase.sineInOut}, setTrippyIntensity);
          trippyMultTween?.cancel();
          trippyMultTween = FlxTween.num(trippyMult, 0, 1, {ease: FlxEase.sineInOut}, i -> trippyMult = i);
        }
      }
    }
  }

  var lightColors = [FlxColor.WHITE, 0xFF00F9FF, 0xFF2BFF00, 0xFFFF4F00, 0xFFCC00FF, 0xFFFF0064];
  var currentLightsColor = null;
  var allowedColorChange:Int = 0;

  public function setLight(?turnOff:Bool = false, ?forceColor:FlxColor)
  {
    if (turnOff)
    {
      allowedColorChange = 0;
      getNamedProp("floorLightBged").animation.play("off", true);
      getNamedProp("floorLights").alpha = 0.00001;
      getNamedProp("floorLightsBlendy").alpha = 0.00001;

      for (p in spotlighShits)
        p.targetSpotlight.animation.play('off', true);

      return;
    }

    if (forceColor == null)
    {
      var oldColor = currentLightsColor;
      while (currentLightsColor == oldColor)
        currentLightsColor = lightColors[FlxG.random.int(1, lightColors.length - 1)];
    }
    else
      currentLightsColor = forceColor;

    putProjectors(currentLightsColor);

    if (itsSoloTime) return;

    for (p in spotlighShits)
      p.targetSpotlight.animation.play('on', true);

    getNamedProp("floorLightBged").animation.play("on", true);
    getNamedProp("floorLights").alpha = .9;
    getNamedProp("floorLights").color = currentLightsColor;
    getNamedProp("floorLightsBlendy").alpha = .9;
    getNamedProp("floorLightsBlendy").color = currentLightsColor;
  }

  var itsSoloTime:Bool = false;

  function putProjectors(currentLightsColor, ?coolAlpha:Float = .45, ?ass:Float = 1)
  {
    if (!itsSoloTime)
    {
      for (spot in spotlighShits)
      {
        spot.alpha = ass;
        spot.color = currentLightsColor;
        spot.targetSpotlight.animation.play('on', true);
        FlxTween.tween(spot.targetSpotlight, {angle: FlxG.random.float(-18, 18)}, FlxG.random.float(0.5, 1.5) * 0.2, {ease: FlxEase.circOut});
      }
    }
    else
    {
      if (spotlighShits.length <= 0) return;

      for (p in spotlighShits)
        p.targetSpotlight.animation.play('on', true);

      currentLightsColor = FlxColor.WHITE;

      spotlighShits[1].alpha = 0;
      spotlighShits[1].targetSpotlight.angle = 0;

      // spotlighShits[0].targetSpotlight.angle = -35;
      FlxTween.tween(spotlighShits[0].targetSpotlight, {angle: -35}, FlxG.random.float(0.25, .5), {ease: FlxEase.circOut});
      spotlighShits[0].alpha = coolAlpha;
      spotlighShits[0].color = 0xFF99FFFF;

      // spotlighShits[2].targetSpotlight.angle = 15;
      FlxTween.tween(spotlighShits[2].targetSpotlight, {angle: 15}, FlxG.random.float(0.25, .5), {ease: FlxEase.circOut});
      spotlighShits[2].alpha = coolAlpha;
      spotlighShits[2].color = 0xFF99FFFF;

      // spotlighShits[3].targetSpotlight.angle = -20;
      FlxTween.tween(spotlighShits[3].targetSpotlight, {angle: -20}, FlxG.random.float(0.25, .5), {ease: FlxEase.circOut});
      spotlighShits[3].alpha = coolAlpha;
      spotlighShits[3].color = 0xFF99FFFF;
    }
  }

  function projectDad()
  {
    for (p in spotlighShits)
      p.targetSpotlight.animation.play('on', true);

    spotlighShits[0].alpha = .45;
    spotlighShits[0].color = 0xFF99FFFF;
    // spotlighShits[0].targetSpotlight.angle = 15;
    FlxTween.tween(spotlighShits[0].targetSpotlight, {angle: 15}, FlxG.random.float(0.25, .5), {ease: FlxEase.circOut});

    spotlighShits[1].alpha = .45;
    spotlighShits[1].color = 0xFF99FFFF;
    // spotlighShits[1].targetSpotlight.angle = -20;
    FlxTween.tween(spotlighShits[1].targetSpotlight, {angle: -20}, FlxG.random.float(0.25, .5), {ease: FlxEase.circOut});

    spotlighShits[3].alpha = .45;
    spotlighShits[3].color = 0xFF99FFFF;
    // spotlighShits[3].targetSpotlight.angle = 40;
    FlxTween.tween(spotlighShits[3].targetSpotlight, {angle: 40}, FlxG.random.float(0.25, .5), {ease: FlxEase.circOut});

    spotlighShits[2].targetSpotlight.animation.play('off', true);
    spotlighShits[2].alpha = 0;
  }

  function projectGF()
  {
    for (p in spotlighShits)
      p.targetSpotlight.animation.play('on', true);

    spotlighShits[0].alpha = .3;
    spotlighShits[0].color = 0xFF99FFFF;
    // spotlighShits[0].targetSpotlight.angle = -25;
    FlxTween.tween(spotlighShits[0].targetSpotlight, {angle: -25}, FlxG.random.float(0.25, .5), {ease: FlxEase.circOut});

    spotlighShits[1].alpha = .3;
    // spotlighShits[1].targetSpotlight.angle = -20;
    FlxTween.tween(spotlighShits[1].targetSpotlight, {angle: -20}, FlxG.random.float(0.25, .5), {ease: FlxEase.circOut});

    spotlighShits[3].alpha = .3;
    spotlighShits[3].color = 0xFF99FFFF;
    // spotlighShits[3].targetSpotlight.angle = 25;
    FlxTween.tween(spotlighShits[3].targetSpotlight, {angle: 25}, FlxG.random.float(0.25, .5), {ease: FlxEase.circOut});

    spotlighShits[2].alpha = .3;
    // spotlighShits[2].targetSpotlight.angle = 15;
    FlxTween.tween(spotlighShits[2].targetSpotlight, {angle: 15}, FlxG.random.float(0.25, .5), {ease: FlxEase.circOut});
  }

  function setSmokeVisible(how:Bool)
  {
    for (smoke in smokes)
      smoke.alpha = how ? 1 : 0.00001;
  }

  public override function destroy():Void
  {
    removeCameraShaders();
    super.destroy();
  }

  override function onSongEvent(event)
  {
    super.onSongEvent(event);

    var eventData = event.eventData;
    switch (eventData.eventKind)
    {
      case "Blank":
        // updateCurFocus(eventData.value.value1 ?? eventData.value);
        trace(eventData.value.value1);
        if (eventData.value.value1 == "true") trace("GAY SEX");
        trace(eventData.value.value2);
        trace(eventData.value.value3);
        trace(eventData.value.value4);
        trace(eventData.value.value5);
    }
  }
}

class SpotlightAccesories extends FunkinSprite
{
  public var targetSpotlight:FunkinSprite = null;

  public var light:FunkinSprite;

  public function new(ass, prop)
  {
    super(prop.x, prop.y);
    scrollFactor.set(prop.scrollFactor.x, prop.scrollFactor.y);
    targetSpotlight = prop;
    trace(targetSpotlight);
    this.zIndex = prop.zIndex + 1;

    frames = Paths.getSparrowAtlas("stages/mainStageAmTake/spotlight");
    animation.addByPrefix("y", "spotlight ring", 1, true);
    animation.play("y", true);
    blend = BlendMode.MULTIPLY;
    updateHitbox();

    frameOffset.set(-103, -195);
    origin.set(80 / 2, -158 / 2); // TO MAKE THEN LOOK ATTACHED TO MAIN SPR

    light = new FunkinSprite(prop.x, prop.y);
    light.frames = Paths.getSparrowAtlas("stages/mainStageAmTake/spotlight");
    light.animation.addByPrefix("y", "spotlight ray", 1, true);
    light.blend = BlendMode.ADD;
    light.animation.play("y", true);
    light.scrollFactor.set(prop.scrollFactor.x, prop.scrollFactor.y);
    alpha = light.alpha = 0;
    light.updateHitbox();
    light.frameOffset.set(160, -25);
    light.origin.set(290, 80); // TO MAKE THEN LOOK ATTACHED TO MAIN SPR
  }

  override function update(elapsed)
  {
    super.update(elapsed);
    light.update(elapsed);

    angle = targetSpotlight.angle;
    light.angle = angle;
    light.color = color;
    light.alpha = .9 * alpha;
  }

  override function draw()
  {
    super.draw();
    light.draw();
  }
}
