import flixel.FlxSprite;
import flixel.FlxG;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.effects.FlxTrail;
import flixel.group.FlxTypedGroup;
import flixel.math.FlxBasePoint;
import flixel.util.FlxBitmapDataUtil;
import flixel.util.FlxSort;
import flixel.util.FlxTimer;
import flixel.util.FlxColor;
import funkin.Conductor;
import funkin.audio.FunkinSound;
import funkin.graphics.FunkinSprite;
import funkin.graphics.adobeanimate.FlxAtlasSprite;
import funkin.graphics.shaders.OverlayBlend;
import funkin.graphics.shaders.AnimaniaXmasShader;
import funkin.graphics.shaders.AnimaniaSnowfallShader;
import funkin.play.CountdownStep;
import funkin.play.GameOverSubState;
import funkin.play.PauseSubState;
import funkin.play.PlayState;
import funkin.play.character.CharacterType;
import funkin.play.stage.ScriptedStage;
import funkin.util.Constants;
import funkin.util.MathUtil;
import funkin.util.Sequence;
import funkin.util.SortUtil;
import StringTools;

class XMasCityHallAmTakeDarkStage extends ScriptedStage
{
  function new()
  {
    super('xMasCityMallAmTakeDark');
  }

	var railBoppers = [];
	var railBopTimers = [];

  function onCreate(e)
  {
    super.onCreate(e);

    PauseSubState.musicSuffix = '-amtake5';
  }

  var leftTV;
  var rightTV;

  function buildStage()
  {
    var play = PlayState.instance;
    if (play == null) return;

    railBoppers = [];
    super.buildStage();

    for (dataProp in _data.props)
    {
      final prop = getNamedProp(dataProp.name);
      if (prop == null) continue;

      if (dataProp.name.indexOf('rail-guys-') != -1) railBoppers.push(prop);
    }

    if (!Preferences.lowQuality)
    {
      leftTV = new FunkinSprite(-1800, -690);
      leftTV.loadTextureAtlas("stages/xMassCityMallDark/tvl", "week5", {cacheOnLoad: true});
      leftTV.zIndex = 70;
      leftTV.scrollFactor.set(0.875, 0.875);
      leftTV.anim.addByFrameLabel("noise", "noise", 24, false);
      leftTV.anim.onFinish.add(name -> if (name == "noise")
      {
        if (FlxG.random.bool(15)) leftTV.anim.play("OOGA BOOGA", true);
        else
          leftTV.anim.play(FlxG.random.int(0, 5), true);
      }
      else if (name == "OOGA BOOGA") leftTV.anim.play("noise", true));
      leftTV.anim.addByFrameLabel("0", "f1", 24);
      leftTV.anim.addByFrameLabel("1", "f2", 24);
      leftTV.anim.addByFrameLabel("2", "f3", 24);
      leftTV.anim.addByFrameLabel("3", "f4", 24);
      leftTV.anim.addByFrameLabel("4", "f5", 24);
      leftTV.anim.addByFrameLabel("5", "f6", 24);
      leftTV.anim.addByFrameLabelIndices("OOGA BOOGA", "OOGA BOOGA", [0, 0, 0, 0], 24, false);
      leftTV.anim.play("OOGA BOOGA", true);
      leftTV.flipX = true;
      add(leftTV);

      rightTV = new FunkinSprite(980, -690);
      rightTV.loadTextureAtlas("stages/xMassCityMallDark/tvr", "week5", {cacheOnLoad: true});
      rightTV.zIndex = 70;
      rightTV.scrollFactor.set(0.875, 0.875);
      rightTV.anim.addByFrameLabel("noise", "noise", 24, false);
      rightTV.anim.onFinish.add(name -> if (name == "noise") rightTV.anim.play(FlxG.random.int(0, 6), true));
      rightTV.anim.addByFrameLabel("0", "f1", 24);
      rightTV.anim.addByFrameLabel("1", "f2", 24);
      rightTV.anim.addByFrameLabel("2", "f3", 24);
      rightTV.anim.addByFrameLabel("3", "f4", 24);
      rightTV.anim.addByFrameLabel("4", "f5", 24);
      rightTV.anim.addByFrameLabel("5", "f6", 24);
      rightTV.anim.addByFrameLabel("6", "f7", 24);
      rightTV.anim.play("noise", true);
      add(rightTV);
    }
    createSnowfall();
    refresh();
  }

  var snowfall = null;
  var snowfallShader = null;
  var snowfallTime:Float = 0;

  function createSnowfall():Void
  {
    if (!Preferences.shaders || snowfall != null) return;

    var width = FlxG.width * 3.5;
    var height = FlxG.height * 3.5;
    snowfall = new FunkinSprite((FlxG.width - width) / 2, (FlxG.height - height) / 2);
    snowfall.makeSolidColor(width, height, FlxColor.WHITE);
    snowfall.zIndex = 395;
    snowfall.scrollFactor.set(1.2, 1.2);
    snowfallShader = new AnimaniaSnowfallShader(width, height, 0.35, 4.0, 0.75);
    snowfall.shader = snowfallShader;
    add(snowfall);
  }

  function updateSnowfall(elapsed:Float):Void
  {
    if (snowfallShader == null) return;
    snowfallTime += elapsed;
    snowfallShader.advance(snowfallTime);
  }

  var xmasDarkShader = null;
  var legacyCameraFocusApplied:Bool = false;

  override function stageFullConstruct():Void
  {
    // if (!Preferences.shaders) return; // bleh

    xmasDarkShader = AnimaniaXmasShader.xmasInit();
    getDad().shader = xmasDarkShader;
    getGirlfriend().shader = xmasDarkShader;
    getBoyfriend().shader = xmasDarkShader;

    if (getGirlfriend().fgSnow != null) getGirlfriend().fgSnow.shader = xmasDarkShader;

    function disableShaderLayer(layer)
    {
      layer.allowShaders = false;
    }
    if (getDad().characterId == "parents-christmas")
    {
      var dad = getDad();
      for (k => i in dad.library.dictionary)
        if (StringTools.startsWith(k, "SYMBOLS/EXCLUDE_SHADERS/")) i.timeline.forEachLayer(disableShaderLayer);

      // These additive halo layers are authored as white light.  Running them
      // through the dark Christmas colour grade makes them muddy/yellow in
      // the current renderer, so keep their original additive colour.
      for (name in ["idle lights", "left lights", "down lights", "up lights", "right lights"])
      {
        var lightSymbol = dad.library.getSymbol("SYMBOLS/" + name);
        if (lightSymbol != null) lightSymbol.timeline.forEachLayer(disableShaderLayer);
      }
    }

    if (getGirlfriend().characterId == "gf-christmas")
    {
      var gf = getGirlfriend();
      for (k => i in gf.library.dictionary)
        if (StringTools.startsWith(k, "SYMBOLS/EXCLUDE_SHADERS/")) i.timeline.forEachLayer(disableShaderLayer);
      disableShaderLayer(gf.library.getSymbol("SYMBOLS/boombox stage").timeline.getLayer("Слой_4"));
    }

    if (!Preferences.lowQuality)
    {
      getNamedProp("rail-guys-miku").alpha = (getBoyfriend().characterId.indexOf("miku") == -1 ? 1 : 0.0001);
      getNamedProp("tree-crushers").shader = xmasDarkShader;
      getNamedProp("meat-boy").shader = xmasDarkShader;
      getNamedProp("c-toy-1").shader = xmasDarkShader;
      getNamedProp("c-toy-2").shader = xmasDarkShader;
      getNamedProp("alien_ship").shader = xmasDarkShader;
    }

    getNamedProp("zonet").shader = xmasDarkShader;
    getNamedProp("casset").shader = xmasDarkShader;
    getNamedProp("gang").shader = xmasDarkShader;
    getNamedProp("coolbud").shader = xmasDarkShader;
    getNamedProp("cops").shader = xmasDarkShader;
    getNamedProp("bandage_girl").shader = xmasDarkShader;
    getNamedProp("santa").shader = xmasDarkShader;
    getNamedProp("snowfg").shader = xmasDarkShader;
    getNamedProp("snowman").shader = xmasDarkShader;

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
    var play = PlayState.instance;
    var dad = getDad();
    if (play == null || dad == null || dad.cameraFocusPoint == null) return;

    // `stageCamera` was an absolute target in the 0.6 stage JSON.  V-Slice
    // 0.8.5 no longer reads it, so restore the authored focus coordinates.
    var needsApply = !legacyCameraFocusApplied || dad.cameraFocusPoint.x != -450 || dad.cameraFocusPoint.y != -90;
    if (!needsApply) return;

    setLegacyCameraFocus(getBoyfriend(), 250, -35);
    setLegacyCameraFocus(getGirlfriend(), -150, -50);
    setLegacyCameraFocus(dad, -450, -90);
    play.cameraFollowPoint.setPosition(-450, -90);
    legacyCameraFocusApplied = true;
  }

  function onUpdate(event)
  {
    super.onUpdate(event);
    updateSnowfall(event.elapsed);
    // Retry/reset rebuilds character focus points, so restore them once.
    applyLegacyCameraFocus();
  }

  function onBeatHit(event)
  {
    super.onBeatHit(event);

    if (!Preferences.lowQuality)
    {
      if (leftTV != null && FlxG.random.bool(10)) leftTV.anim.play("noise", true);

      if (rightTV != null && FlxG.random.bool(10)) rightTV.anim.play("noise", true);

      if (event.beat % boppersIdle == 0) boppersBop();
    }
  }

  var boppersIdle:Int = 2;

  function boppersBop()
  {
    for (p in railBoppers)
    {
      var bopperY = p.y;
      p.y += 10;
      scheduleRailBop(p, bopperY + 7.5, 2 / 24);
      scheduleRailBop(p, bopperY + 2.5, 4 / 24);
      scheduleRailBop(p, bopperY, 6 / 24);
    }
  }

  function scheduleRailBop(prop, y:Float, delay:Float):Void
  {
    var timer = new FlxTimer();
    railBopTimers.push(timer);
    timer.start(delay, _ ->
    {
      railBopTimers.remove(timer);
      prop.y = y;
    });
  }

  function onSongRetry(event):Void
  {
    for (timer in railBopTimers) timer.cancel();
    railBopTimers = [];
    snowfallTime = 0;
    snowfallShader?.advance(0);
    legacyCameraFocusApplied = false;
  }

  override function onNoteHit(e)
  {
    if (e.isComboBreak) makeCrowdLaugh();
  }

  function onNoteGhostMiss(e)
  {
    super.onNoteGhostMiss(e);
    makeCrowdLaugh();
  }

  function onNoteMiss(e)
  {
    if (e.eventCanceled || e.note.kind == "solotime") return;
    super.onNoteMiss(e);
    makeCrowdLaugh();
  }

  function makeCrowdLaugh()
  {
    if (getNamedProp("cops").getCurrentAnimation().indexOf("snowball") == -1) getNamedProp("cops").playAnimation("laugh", true, true);
  }
}
