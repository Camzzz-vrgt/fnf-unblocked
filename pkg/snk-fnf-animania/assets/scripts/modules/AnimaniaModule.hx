// package;
import Main;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.util.FlxColor;
import flixel.math.FlxRect;
import flixel.FlxG;
import flixel.tweens.FlxTween;
import flixel.tweens.FlxEase;
import funkin.Conductor;
import funkin.Highscore;
import funkin.audio.FunkinSound;
import funkin.data.song.SongRegistry;
import funkin.effects.IntervalShake;
import funkin.graphics.ScriptedFunkinSprite;
import funkin.graphics.FunkinSprite;
import funkin.modding.IPlayStateScriptedClass;
import funkin.modding.module.Module;
import funkin.play.PlayState;
import funkin.util.Constants;
import funkin.util.MathUtil;
import lime.system.System;
import funkin.FunkinMemory;

class AnimaniaModule extends Module implements IPlayStateScriptedClass
{
  static var BANNED_NOTEKINDS = ["noAnimation", "noanim", "parents-miss", "solotime"];
  static var ONLY_HUD_SONGS = ["phone-call"];
  static var camX:Float = 25.0;
  static var camY:Float = 25.0;

  var usingAmTakeUI:Bool = false;

  function new()
  {
    super("AnimaniaModule", 15);
  }

  private var curFocus:String = null;

  private inline function updateCurFocus(player)
  {
    curFocus = switch (player)
    {
      case 0: "bf";
      case 1: "dad";
      case 2: "gf";
    }
  }

  var curFocusOld = null;

  override function onSongEvent(ev)
  {
    super.onSongEvent(ev);
    if (PlayState.instance == null) return;

    var eventData = ev.eventData;
    switch (eventData.eventKind)
    {
      case "FocusCamera":
        updateCurFocus(eventData.value.char ?? eventData.value);
    }

    if (curFocusOld != curFocus) doDiffFocus();
  }

  function doDiffFocus()
  {
    if (curFocusOld == "bf" && (curFocus == "dad" || curFocus == "gf")) spawnCombo();

    // HTML5 cameras may not allocate basicOffset. It is only a cosmetic
    // Animania camera nudge, so safely skip it when unavailable.
    if (FlxG.camera != null && FlxG.camera.basicOffset != null)
    {
      FlxG.camera.basicOffset.x = 0;
      FlxG.camera.basicOffset.y = 0;
    }

    curFocusOld = curFocus;
  }

  override function onCreate(e)
  {
    super.onCreate(e);
  }

  override function onCountdownStart(event)
  {
    super.onCountdownStart(event);
    camX = 50.0;
    camY = 50.0;
    applyAmTakeHoldCoverLayer();
    loadAmTakeUI();
  }

  /**
   * Legacy draws Animania's sustain covers beneath the receptors.  V-Slice's
   * default layer puts them above every strum, so keep this change scoped to
   * the two converted Animania note styles.
   */
  function applyAmTakeHoldCoverLayer():Void
  {
    var play = PlayState.instance;
    if (play == null) return;

    // Check each strumline independently. On Christmas songs, relying on
    // the player line as a global guard could skip the layer setup while the
    // `amtake-xmas` covers were being constructed.
    applyHoldCoverOrder(play.playerStrumline);
    applyHoldCoverOrder(play.opponentStrumline);
  }

  function applyHoldCoverOrder(strumline):Void
  {
    if (strumline == null || strumline.noteHoldCovers == null) return;
    var noteStyleId = (strumline.noteStyle?.id ?? "");
    if (noteStyleId != "amtake-base" && noteStyleId != "amtake-xmas") return;

    // Legacy order: sustain trail/end -> hold cover -> receptor.
    strumline.holdNotes.zIndex = 5;
    strumline.noteHoldCovers.zIndex = 9;
    strumline.refresh();
  }

  public function onStateChangeEnd(event:StateChangeScriptEvent)
  {
    usingAmTakeUI = false;
    if (Std.isOfType(event.targetState, PlayState))
    {
      loadAmTakeUI();
    }
    super.onStateChangeEnd(event);
  }

  override function onSubStateOpenEnd(event)
  {
    if (Std.isOfType(event.targetState, PlayState))
    {
      loadAmTakeUI();
    }
    super.onSubStateOpenEnd(event);
  }

  function baseFNFSong():Bool
  {
    if (PlayState.instance == null) return false;
    return listBaseGameSongIds().contains((PlayState.instance.currentSong?.id.toLowerCase() ?? ''));
  }

  function onlyHUD():Bool
  {
    if (PlayState.instance == null) return true;

    return !ONLY_HUD_SONGS.contains((PlayState.instance.currentSong?.id.toLowerCase() ?? ''));
  }

  function allowedHUD():Bool
  {
    return baseFNFSong() || !onlyHUD();
  }

  // `showJudges` and `showHealthbar` belonged to the 0.6 preference system.
  // They were removed in 0.8.5, where this HUD is always available.
  private inline function showAmTakeJudgements():Bool
  {
    return true;
  }

  private inline function showAmTakeScore():Bool
  {
    return true;
  }

  var FULL_COMBO_SPRITE:FunkinSprite = null;
  var SCORE_NUMBERS_SPRS = [];
  var scoreLabel:FunkinSprite = null;
  var POSITION_OFFSET:Int = 20;

  var scoreBaseScale:Array<Float> = [];
  var healthBarLeftFill:FunkinSprite = null;
  var healthBarRightFill:FunkinSprite = null;

  function loadAmTakeUI():Void
  {
    var play = PlayState.instance;

    // State-change callbacks happen before PlayState has constructed its HUD.
    // This is also called at countdown start, when these objects are available.
    if (usingAmTakeUI || play == null || play.healthBar == null || play.comboPopUps == null) return;

    // 0.8.5 can finish constructing the health bar before the strumline's
    // note style is assigned. The former guard therefore skipped this UI
    // permanently. Only explicitly pixel-styled songs keep their pixel HUD.
    var noteStyleId = (play.playerStrumline != null && play.playerStrumline.noteStyle != null) ? play.playerStrumline.noteStyle.id : "";
    if (noteStyleId.indexOf("pixel") != -1) return;

    usingAmTakeUI = true;
    curNoteCombo = 0;
    scoreCombo = 0;

    var coolHudFrames = Paths.getSparrowAtlas("ui/ratings/GAMEPLAY_UI_ASSETS", "shared");
    FULL_COMBO_SPRITE = new FullComboSpr(20);
    FULL_COMBO_SPRITE.frames = coolHudFrames;
    FULL_COMBO_SPRITE.animation.addByPrefix("y", "full combo", 1, false);
    FULL_COMBO_SPRITE.animation.play("y", true);
    FULL_COMBO_SPRITE.camera = play.camHUD;
    FULL_COMBO_SPRITE.zIndex = 1550;
    FULL_COMBO_SPRITE.y = (Preferences.downscroll) ? 20 : FlxG.height - FULL_COMBO_SPRITE.height;
    FULL_COMBO_SPRITE.alpha = 0.0001;
    FULL_COMBO_SPRITE.updateHitbox();
    FULL_COMBO_SPRITE.visible = onlyHUD();
    play.add(FULL_COMBO_SPRITE);
    FULL_COMBO_SPRITE.zIndex = 1550;

    if (showAmTakeScore())
    {
      final dsP = Preferences.downscroll ? "downscroll " : "";
      scoreLabel = new FunkinSprite();
      var scoreSpr = scoreLabel;
      scoreSpr.frames = coolHudFrames;
      scoreSpr.animation.addByPrefix("y", dsP + "score", 1, false);
      scoreSpr.animation.play("y", true);
      scoreSpr.scale.set(.55, .55);
      scoreSpr.updateHitbox();
      scoreSpr.x = FlxG.width - scoreSpr.width - 5;
      scoreSpr.y = Preferences.downscroll ? 64 : (FlxG.height - scoreSpr.height - 62);
      scoreSpr.camera = play.camHUD;
      // The native health-bar pieces use zIndex 800+.  Keeping this at 300
      // placed the custom score behind the opaque HUD frame.
      scoreSpr.zIndex = 851;
      scoreSpr.angle = Preferences.downscroll ? -3.25 : 0;
      scoreSpr.visible = onlyHUD();
      play.add(scoreSpr);

      //////////////////

      var loadScoreAnims = (num) -> for (i in 0...NUMBERS.length)
        num.animation.addByPrefix(i, dsP + NUMBERS[i], 1, false);

      var testZero = new FunkinSprite();
      testZero.frames = coolHudFrames;
      loadScoreAnims(testZero);
      testZero.animation.play("0", true);
      testZero.scale.set(.75, .75);
      testZero.updateHitbox();
      testZero.x = FlxG.width - testZero.width - 5;
      testZero.y = Preferences.downscroll ? 5 : (FlxG.height - testZero.height - 5);
      testZero.camera = play.camHUD;
      testZero.zIndex = 850;
      testZero.angle = Preferences.downscroll ? -3 : 0;
      testZero.visible = onlyHUD();
      play.add(testZero);
      SCORE_NUMBERS_SPRS.push(testZero);
      scoreBaseScale.push(testZero.scale.x);

      var prevNum = testZero;

      var createNumberWow = (num) ->
      {
        var testZero = new FunkinSprite();
        testZero.frames = coolHudFrames;
        loadScoreAnims(testZero);
        testZero.animation.play("0", true);
        testZero.scale.set(num.scale.x * 0.8825, num.scale.y * 0.8825);
        testZero.updateHitbox();
        testZero.x = num.x - testZero.width + 10;
        testZero.y = Preferences.downscroll ? 5 : (FlxG.height - testZero.height - 5);
        testZero.camera = play.camHUD;
        testZero.zIndex = num.zIndex - 1;
        testZero.visible = false;
        testZero.shouldDraw = true;
        testZero.angle = Preferences.downscroll ? -3 : 0;
        // testZero.visible = onlyHUD();
        prevNum = testZero;
        play.add(testZero);
        SCORE_NUMBERS_SPRS.push(testZero);
        scoreBaseScale.push(testZero.scale.x);
      }

      for (i in 0...8)
        createNumberWow(prevNum);
    }

    //////////////////

    // In 0.8.5 the frame and the actual FlxBar are separate objects.
    var bar = play.healthBar;
    var barBackground = play.healthBarBG;
    barBackground.loadGraphic(Paths.image("ui/healthbar/HEALTHBAR"));
    barBackground.updateHitbox();
    barBackground.screenCenter(0x01);
    barBackground.y = Preferences.downscroll ? FlxG.height * 0.05 : FlxG.height * 0.9;
    // The legacy UI used two clipped copies of WHITEBAR. A standard FlxBar
    // can only draw the rectangular fallback, so retain it as the health
    // source but replace its rendering with the original assets.
    bar.visible = false;
    healthBarLeftFill = new FunkinSprite(barBackground.x + 24, barBackground.y + 5);
    healthBarLeftFill.loadGraphic(Paths.image("ui/healthbar/WHITEBAR"));
    healthBarLeftFill.color = Constants.COLOR_HEALTH_BAR_RED;
    healthBarLeftFill.camera = play.camHUD;
    healthBarLeftFill.zIndex = 801;
    play.add(healthBarLeftFill);

    healthBarRightFill = new FunkinSprite(barBackground.x + 24, barBackground.y + 5);
    healthBarRightFill.loadGraphic(Paths.image("ui/healthbar/WHITEBAR"));
    healthBarRightFill.color = Constants.COLOR_HEALTH_BAR_GREEN;
    healthBarRightFill.camera = play.camHUD;
    healthBarRightFill.zIndex = 801;
    play.add(healthBarRightFill);
    barBackground.zIndex = 802;
    updateAnimaniaHealthBar();

    // Do not hide the fallback score unless the custom renderer was created.
    if (scoreLabel != null) play.scoreText.kill();

    /* Legacy HealthBar API (V-Slice 0.6): no longer present in 0.8.5.
      final oldHealthbarFunc = play.updateHealthBarColors;
      var isBaseFNFSong = baseFNFSong();
      var isDownScroll:Bool = Preferences.downscroll;
      play.updateHealthBarColors = (d, b) ->
      {
        oldHealthbarFunc(null, null);
        if (isBaseFNFSong)
        {
          play.healthBar.setColors(d, b);
        }

        for (icon in [play.iconP1, play.iconP2])
        {
          if (isBaseFNFSong)
          {
            icon.updateScale = (elapsed) ->
            {
              if (!icon.isBopable || icon.bopEvery == 0 || !icon.autoUpdate)
                return;

              var ts:Int = 125;
              var curDecBeat = Conductor.instance.currentBeatTime;
              if (icon.width > icon.height)
              {
                ts = Std.int(MathUtil.smoothLerpPrecision(icon.width, ts * icon.size.x, elapsed, 0.512));
                icon.setGraphicSize(ts, 0);
              }
              else
              {
                ts = Std.int(MathUtil.smoothLerpPrecision(icon.height, ts * icon.size.y, elapsed, 0.512));
                icon.setGraphicSize(0, ts);
              }

              icon.updateHitbox();
            }
          }
          else
          {
            icon.updateScale = (elapsed) ->
            {
              if (!icon.isBopable || icon.bopEvery == 0 || !icon.autoUpdate)
                return;

              var ts:Int = 125;
              if (icon.width > icon.height)
              {
                // ts = Std.int(MathUtil.coolLerp(icon.width, ts * icon.size.x, .15));
                ts = MathUtil.smoothLerpPrecision(icon.width, ts * icon.size.x, elapsed, 0.512);
                icon.setGraphicSize(ts, 0);
              }
              else
              {
                // ts = Std.int(MathUtil.coolLerp(icon.height, ts * icon.size.y, .15));
                ts = MathUtil.smoothLerpPrecision(icon.height, ts * icon.size.y, elapsed, 0.512);
                icon.setGraphicSize(0, ts);
              }

              icon.updateHitbox();
            }
          }
          icon.updatePosition = () ->
          {
            if (icon.autoUpdate)
            {
              switch (icon.playerId)
              {
                case 0: // Boyfriend
                  icon.updateHealthIcon(play.health);
                  icon.x = play.healthBar.centerPoint.x - POSITION_OFFSET;
                  if (play.healthLerp < .25) icon.angle = 50 * (.25 - play.healthLerp);
                case 1: // Dad
                  icon.updateHealthIcon(2 - play.health);
                  icon.x = play.healthBar.centerPoint.x - (icon.width - POSITION_OFFSET);
                  if (play.healthLerp > 1.75) icon.angle = -30 * (play.healthLerp - 1.75);
              }

              if (isDownScroll)
              {
                icon.y = play.healthBar.centerPoint.y - (icon.height / 2) + 20 - (FlxMath.fastCos((play.health - 1) * 2) * 15);
              }
              else
              {
                icon.y = play.healthBar.centerPoint.y - (icon.height / 2) - 10 + (FlxMath.fastCos((play.health - 1) * 2) * 15);
              }
            }
          }
        }
      };

      play.updateHealthBarColors(Constants.COLOR_HEALTH_BAR_RED, Constants.COLOR_HEALTH_BAR_GREEN);
      if (Preferences.downscroll)
      {
        play.healthBar.basicOffset.y = 10;
        play.healthBar.y = FlxG.height * 0.05;
        play.healthBar.bg.flipY = play.healthBar.leftBar.flipY = play.healthBar.rightBar.flipY = true;
      }
      else
      {
        play.healthBar.y = FlxG.height * 0.9;
      }

      play.healthBar.updateBar(); */
    barBackground.cameras = [play.camHUD];
    bar.cameras = [play.camHUD];

    // The atlas was loaded above. `Paths.imageStr` was removed in V-Slice 0.8.5.
    // FunkinMemory.cacheTexture(Paths.imageStr("ui/combo/amt/noteCombo"));
    // FunkinMemory.cacheTexture(Paths.imageStr("ui/combo/amt/noteComboNumbers"));

    play.comboPopUps.customDisplayRating = createRatingImg;
    play.comboPopUps.customDisplayCombo = (combo:Int) -> {};
    play.comboPopUps.cameras = [play.camGame];
    play.comboPopUps.zIndex = play.currentStage?.popupZIndex ?? 900;
    var stageOffset = play.currentStage?.ratingsOffset ?? [0.0, 0.0];
    // trace('[Animania HUD] popup renderer: camera=HUD, stage=${play.currentStageId}, ratingsOffset=${stageOffset[0]},${stageOffset[1]}');

    /*if (play.currentStage != null)
      {
        play.remove(play.comboPopUps, false);
        //play.comboPopUps.zIndex = play.currentStage.getGirlfriend().zIndex+1;
        play.currentStage.add(play.comboPopUps);
        play.currentStage.refresh();
    }*/
    play.refresh();
    play.refresh();
  }

  function clearRatingStuff():Void
  {
    var play = PlayState.instance;
    if (play == null) return;

    for (shit in previousComboStuff)
    {
      if (shit == null) continue;

      var spr:FunkinSprite = shit[0];
      if (spr == null) continue;

      FlxTween.cancelTweensOf(spr);
      play.comboPopUps.remove(spr, true);
      play.remove(spr, true);
      spr.kill();
      spr.destroy();
    }

    previousComboStuff = [];
  }

  function updateAnimaniaHealthBar():Void
  {
    var play = PlayState.instance;
    if (play == null || healthBarLeftFill == null || healthBarRightFill == null) return;

    var ratio:Float = Math.max(0, Math.min(1, play.healthBar.value / Constants.HEALTH_MAX));
    var width = healthBarLeftFill.frameWidth;
    var height = healthBarLeftFill.frameHeight;
    var inverted = play.currentSong?.id == "phone-call";
    // Dadbattle's legacy HUD intentionally used the classic red/green bar,
    // rather than Dad and BF's per-character purple/cyan icon colors.
    // Other Animania songs still follow scripted character swaps.
    var useDadbattleColors = play.currentSong != null && play.currentSong.id.toLowerCase() == 'dadbattle';
    var playerColor = useDadbattleColors ? Constants.COLOR_HEALTH_BAR_GREEN : (play.currentStage?.getBoyfriend()?.getHealthIconColor() ?? Constants.COLOR_HEALTH_BAR_GREEN);
    var opponentColor = useDadbattleColors ? Constants.COLOR_HEALTH_BAR_RED : (play.currentStage?.getDad()?.getHealthIconColor() ?? Constants.COLOR_HEALTH_BAR_RED);

    if (inverted)
    {
      // Phone Call reverses the usual direction: the player's color grows
      // from the left and the opponent occupies the remaining right side.
      var playerWidth = width * ratio;
      healthBarLeftFill.color = playerColor;
      healthBarRightFill.color = opponentColor;
      healthBarLeftFill.clipRect = new FlxRect(0, 0, playerWidth, height);
      healthBarRightFill.clipRect = new FlxRect(playerWidth, 0, width - playerWidth, height);
    }
    else
    {
      var opponentWidth = width * (1 - ratio);
      healthBarLeftFill.color = opponentColor;
      healthBarRightFill.color = playerColor;
      healthBarLeftFill.clipRect = new FlxRect(0, 0, opponentWidth, height);
      healthBarRightFill.clipRect = new FlxRect(opponentWidth, 0, width - opponentWidth, height);
    }
  }

  var SHOW_COMBO_VALUE:Int = 25; // 50
  var SHOW_COMBONUMS_VALUE:Int = 15; // 15
  var NUMBERS = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine"];
  var variation = true;
  var previousComboStuff = [];
  // Legacy renders these through its custom FunkinSprite.zoomFactor transform.
  // V-Slice has no equivalent, so use a visual-only multiplier on camGame.
  // Do not call updateHitbox afterwards: popups have no collision and their
  // authored positions must retain the original logical dimensions.
  final POPUP_GAME_SCALE:Float = 1.5;
  final LEGACY_POPUP_ZOOM_FACTOR:Float = .5;
  final USE_LEGACY_POPUP_ZOOM_FACTOR:Bool = true;
  final COMBO_LABEL_Y_OFFSET:Float = 40;
  final COMBO_NUMBERS_X_OFFSET:Float = 60;
  final COMBO_NUMBERS_Y_OFFSET:Float = 40;
  var comboBlotColors = [0xFF6666FF, 0xFFFF66CC, 0xFFFFCC99, 0xFF66FF99, 0xFF66FF99];
  var comboBlotColorsMax = [50, 100, 200, 300];

  function createRatingImg(rat:String):Void
  {
    var play = PlayState.instance;
    if (play == null || !onlyHUD() || !showAmTakeJudgements()) return;

    var ratingsFrames = Paths.getSparrowAtlas("ui/ratings/GAMEPLAY_UI_ASSETS", "shared");
    var daRating = rat;
    var combo = Highscore.tallies.combo;
    var dissapearTimeMult:Float = 1;

    if (daRating == "fuck up") dissapearTimeMult = 1.25;

    var blot;
    var rating;
    var comboSpr;

    var stageOffset = play.currentStage?.ratingsOffset ?? [0.0, 0.0];

    clearRatingStuff();

    blot = new FunkinSprite();
    blot.frames = ratingsFrames; // wow cool object
    blot.animation.addByPrefix('blot1', "blot0", 24, false);
    blot.animation.addByPrefix('blot2', "blot 2", 24, false);
    blot.zIndex = 10;
    blot.setGraphicSize(Std.int(blot.width * 0.6));
    blot.updateHitbox();
    blot.x = (FlxG.width * 0.474) + play.comboPopUps.offsets[0] + stageOffset[0];
    blot.y = (FlxG.camera.height * 0.45 - 60) + play.comboPopUps.offsets[1] + stageOffset[1];
    blot.offset.x += 15;
    previousComboStuff.push([blot, true]);
    blot.animation.play("blot" + ((variation = !variation) ? 1 : 2));
    if (blot.animation.curAnim.name == "blot2") blot.offset.y += 15;
    blot.origin.set(blot.frameWidth * .4, blot.frameHeight * .4);
    blot.angle = FlxG.random.float(-15, 15);

    // BLOT COLOR CHANGE
    if (daRating != "fuck up")
    {
      var currentColorPoint = 0;
      for (i in 0...comboBlotColorsMax.length - 1)
      {
        currentColorPoint = i;
        if (combo < comboBlotColorsMax[i]) break;
      }

      var cfv = comboBlotColorsMax[currentColorPoint]
        - (comboBlotColorsMax[currentColorPoint - 1] != null ? comboBlotColorsMax[currentColorPoint - 1] : comboBlotColorsMax[currentColorPoint]);
      blot.color = FlxColor.interpolate(comboBlotColors[currentColorPoint], comboBlotColors[currentColorPoint + 1],
        (combo - cfv) / (comboBlotColorsMax[currentColorPoint] - cfv));
    }
    else
      blot.color = FlxColor.GRAY;

    if (play.timeBar != null) play.timeBar.color = blot.color;

    rating = new FunkinSprite();
    rating.frames = ratingsFrames;
    rating.animation.addByPrefix(daRating, daRating, 24, false);
    rating.zIndex = 11;
    rating.setPosition(blot.x - 100, blot.y + 35);
    // rating.setGraphicSize(Std.int(rating.width * 0.85)); rating.updateHitbox();
    rating.setGraphicSize(Std.int(rating.width * 0.55));
    rating.updateHitbox();
    previousComboStuff.push([rating, true]);
    rating.animation.play(daRating);
    var offss = getRatingOffset(daRating);
    rating.offset.set(offss[0], offss[1]);
    // RATING

    // COMBO
    if (combo >= SHOW_COMBO_VALUE)
    {
      // trace("SPAWNING COMBO SPRITE");
      comboSpr = constructComboSprite(comboSpr, rating, ratingsFrames);
      if (daRating == "fuck up") comboSpr.color = FlxColor.GRAY;
      previousComboStuff.push([comboSpr, true]);
    }
    // COMBO

    // COMBO NUMBERS
    if (combo >= SHOW_COMBONUMS_VALUE)
    {
      // ...
      // trace("SPAWNING COMBO NUMBERS SPRITES");
      var seperatedScore:Array<Int> = [];
      var tempCombo:Int = combo;

      while (tempCombo != 0)
      {
        seperatedScore.push(tempCombo % 10);
        tempCombo = Std.int(tempCombo / 10);
      }
      while (seperatedScore.length < 3)
        seperatedScore.push(0);

      seperatedScore.reverse();
      // trace(seperatedScore);
      var daLoop:Int = 0;
      var previousNumber:FunkinSprite = null;
      for (i in seperatedScore)
      {
        var cnumber = constructComboNumberSprite(NUMBERS[i], ratingsFrames);
        // var currentScale = .75 + (daLoop * .1);
        var currentScale = .45 + (daLoop * .1);
        cnumber.scale.set(currentScale, currentScale);
        cnumber.updateHitbox();
        // cnumber.setPosition(blot.x + blot.width * .65, blot.y + blot.height * 1.25 - cnumber.frameHeight/2 * cnumber.scale.y);
        cnumber.setPosition(blot.x
          + blot.width * .65
          + COMBO_NUMBERS_X_OFFSET,
          blot.y
          + blot.height * 1.25
          - cnumber.height / 2 * cnumber.scale.y
          + COMBO_NUMBERS_Y_OFFSET);
        if (previousNumber != null)
        {
          // Keep the first digit at its authored location. Later digits need
          // the same visual spacing multiplier as the popup itself; their
          // logical hitboxes intentionally stay at the Legacy dimensions.
          cnumber.x = previousNumber.x + previousNumber.frameWidth * .75 * previousNumber.scale.x * POPUP_GAME_SCALE;
          cnumber.y = previousNumber.y + (previousNumber.height / 2 * previousNumber.scale.y) - (cnumber.height / 1.725 * cnumber.scale.y);
        }

        cnumber.angularVelocity = FlxG.random.int(-15, 15);

        cnumber.zIndex += daLoop;
        previousNumber = cnumber;
        if (daRating == "fuck up") cnumber.color = FlxColor.GRAY; // gay
        previousComboStuff.push([cnumber, true]);
        daLoop++;
      }
    }
    else
    {
      rating.x += 50;
      rating.y += 50 - blot.offset.y / 2;
    }
    // COMBO NUMBERS
    var comboColors = ((Highscore.tallies.sick == Highscore.tallies.totalNotesHit)
      && Highscore.tallies.missed == 0) ? FlxColor.gradient(blot.color, FlxColor.WHITE, 5, FlxEase.linear) : null; // 0xF2F5A4 : null;
    for (shit in previousComboStuff)
    {
      var baseShit = shit[0];
      if (baseShit == null) continue;
      if (shit[1])
      {
        // Remember the authored scale once. This is intentionally separate
        // from width/height so zoom compensation cannot move the popup.
        if (shit[2] == null)
        {
          shit[2] = baseShit.scale.x;
          shit[3] = baseShit.scale.y;
        }
        baseShit.scale.set(shit[2] * POPUP_GAME_SCALE, shit[3] * POPUP_GAME_SCALE);
        baseShit.scrollFactor.set(.85, .85);
        baseShit.antialiasing = true;
        baseShit.acceleration.y = 650;
        baseShit.velocity.y -= FlxG.random.int(160, 175);
        baseShit.velocity.x -= FlxG.random.int(0, 10);
        baseShit.angle = FlxG.random.int(-5, 5);
        baseShit.angularVelocity += FlxG.random.int(-5, 5);
        baseShit.maxVelocity.y = 0;

        if (comboColors != null && baseShit != blot)
        {
          baseShit.color = comboColors[3];
          FlxTween.color(baseShit, Conductor.instance.beatLengthMs * 0.001 * dissapearTimeMult, comboColors[3], comboColors[1], {ease: FlxEase.sineOut});
        }
      }

      play.comboPopUps.add(baseShit);

      FlxTween.tween(baseShit, {
        alpha: 0,
        angle: baseShit.angle + FlxG.random.float(-16, 16)
      },
        Conductor.instance.beatLengthMs * 0.001 / 1.5, {ease: FlxEase.cubeOut, startDelay: Conductor.instance.beatLengthMs * 0.001 * dissapearTimeMult});
    }
    updateLegacyPopupZoomFactor(play);
  }

  /**
   * Recreates Legacy's partial camera-zoom response for combo popups only.
   * At the stage's default zoom it keeps the 1.5x visual scale; as camGame
   * zooms, it cancels half the added zoom (Legacy zoomFactor = .5).
   * No updateHitbox is performed, so coordinates and animation pivots stay
   * authored in the same logical space.
   */
  function updateLegacyPopupZoomFactor(play:PlayState):Void
  {
    if (!USE_LEGACY_POPUP_ZOOM_FACTOR || play == null || play.camGame == null) return;

    var referenceZoom = Math.max(.01, play.stageZoom);
    var cameraZoom = Math.max(.01, play.camGame.zoom);
    var compensation = Math.pow(referenceZoom / cameraZoom, 1 - LEGACY_POPUP_ZOOM_FACTOR);

    for (shit in previousComboStuff)
    {
      var popup = shit[0];
      if (popup == null || shit[2] == null || shit[3] == null) continue;

      // A state transition can destroy a fading popup before this module's
      // update callback runs again. Destroyed FlxSprites have no scale point.
      var popupScale = popup.scale;
      if (popupScale == null) continue;
      popupScale.set(shit[2] * POPUP_GAME_SCALE * compensation, shit[3] * POPUP_GAME_SCALE * compensation);
    }
  }

  function constructComboSprite(comboSpr:FunkinSprite, rating:FunkinSprite, frames):FunkinSprite
  {
    comboSpr = new FunkinSprite();
    comboSpr.frames = frames;
    comboSpr.animation.addByPrefix("combo", "combo", 24, false);
    comboSpr.animation.play("combo");
    comboSpr.zIndex = 12;
    // comboSpr.setGraphicSize(Std.int(comboSpr.width * 0.85)); comboSpr.updateHitbox();
    comboSpr.setGraphicSize(Std.int(comboSpr.width * 0.55));
    comboSpr.updateHitbox();
    if (rating != null) comboSpr.setPosition((rating.x + rating.width) - comboSpr.width / 1.5, rating.y + rating.height + COMBO_LABEL_Y_OFFSET);
    return comboSpr;
  }

  function constructComboNumberSprite(currentNumber:String, frames):FunkinSprite
  {
    var num = new FunkinSprite();
    num.frames = frames;
    num.animation.addByPrefix(currentNumber, currentNumber, 24, false);
    num.animation.play(currentNumber);
    num.zIndex = 13;
    return num;
  }

  function getRatingOffset(curRating:String)
  {
    // trace(curRating);
    return switch (curRating)
    {
      case "good": [-10, -10];
      default: [0, 0];
    }
  }

  override function onNoteHit(event)
  {
    if (PlayState.instance == null) return;

    if (!PlayState.instance.isMinimalMode && !BANNED_NOTEKINDS.contains(event.note.kind))
    {
      if ((curFocus == "bf" && event.note.noteData.getMustHitNote())
        || (curFocus == "dad" && !event.note.noteData.getMustHitNote())
        || curFocus == "gf") triggerCameraMovement(event.note.direction);

      if (!event.note.noteData.getMustHitNote() && FlxG.random.bool(60) && !event.eventCanceled) spawnOpponentSplash(event.note);
    }

    if (!usingAmTakeUI)
    {
      super.onNoteHit(event);
      return;
    }
    if (event.note.noteData.getMustHitNote() && !PlayState.instance.isMinimalMode)
    {
      checkComo(event, false);
    }

    super.onNoteHit(event);
  }

  function spawnOpponentSplash(note)
  {
    final play = PlayState.instance;
    if (play == null || note.noAnimation || BANNED_NOTEKINDS.contains(note.kind)) return;
    if (play.health > Constants.HEALTH_MAX * .2) play.health -= .85 / 100.0 * Constants.HEALTH_MAX;

    play.opponentStrumline.playNoteSplash(note.noteData.getDirection());
  }

  function onNoteMiss(e)
  {
    if (!usingAmTakeUI)
    {
      super.onNoteMiss(e);
      return;
    }
    if (e.note.noteData.getMustHitNote()) checkComo(e, true);

    super.onNoteMiss(e);
  }

  function checkComo(e, miss)
  {
    if (BANNED_NOTEKINDS.contains(e.note.kind) || e.eventCanceled) return;

    if (!e.isComboBreak && !miss)
    {
      curNoteCombo++;
      // `event` only exists in onNoteHit().  In this helper it caused an
      // HScript runtime error before the native popup hook could run.
      scoreCombo += e.score;
      if (FULL_COMBO_SPRITE != null && FULL_COMBO_SPRITE.active && FULL_COMBO_SPRITE.alpha < .1)
      {
        FULL_COMBO_SPRITE.scale.set(.55, .55);
        FULL_COMBO_SPRITE.angle = -45;
        FlxTween.tween(FULL_COMBO_SPRITE.scale, {x: 0.8, y: 0.8}, .25);
        FlxTween.tween(FULL_COMBO_SPRITE, {angle: 0, alpha: 1}, .25);
      }

      FULL_COMBO_SPRITE.comboStatus = (Highscore.tallies.sick == Highscore.tallies.totalNotesHit) ? "PFC" : "Normal";
    }

    if (e.comboCount < Highscore.tallies.combo || e.isComboBreak || miss)
    {
      curNoteCombo = 0;
      if (FULL_COMBO_SPRITE != null && FULL_COMBO_SPRITE.active)
      {
        FULL_COMBO_SPRITE.comboStatus = "Break";
        FULL_COMBO_SPRITE.active = false;
        FlxTween.tween(FULL_COMBO_SPRITE, {x: FULL_COMBO_SPRITE.x - 150, angle: -95, alpha: 0}, .2, {
          onComplete: () ->
          {
            FULL_COMBO_SPRITE.kill();
            // FULL_COMBO_SPRITE.destroy();
          }
        });
      }

      if (Highscore.tallies.combo > 1) createRatingImg("fuck up");
    }
  }

  var intendentScore = 0;

  function onUpdate(e)
  {
    super.onUpdate(e);
    if (PlayState.instance == null) return;

    if (PlayState.instance.isGamePaused) return;

    // The state-change and countdown callbacks can run before the HUD exists
    // in 0.8.5. Retry here until the PlayState has finished constructing it.
    if (!usingAmTakeUI) loadAmTakeUI();
    if (usingAmTakeUI)
    {
      updateAnimaniaHealthBar();
      updateLegacyPopupZoomFactor(PlayState.instance);
    }

    // Animania's player icon artwork is authored facing the player side.
    // The 0.8.5 base character code flips every P1 icon automatically,
    // unlike the original runtime used by this mod.
    if (usingAmTakeUI && PlayState.instance.iconP1 != null) PlayState.instance.iconP1.flipX = false;

    if (FlxG.camera != null && FlxG.camera.basicOffset != null)
    {
      FlxG.camera.basicOffset.x = MathUtil.smoothLerpPrecision(FlxG.camera.basicOffset.x, 0, e.elapsed, 1);
      FlxG.camera.basicOffset.y = MathUtil.smoothLerpPrecision(FlxG.camera.basicOffset.y, 0, e.elapsed, 1);
    }

    if (!usingAmTakeUI || !onlyHUD()) return;

    if (FlxG.keys.justPressed.F1) PlayState.instance.camHUD.visible = !PlayState.instance.camHUD.visible;

    // PlayState.instance.isBotPlayMode = !PlayState.instance.camHUD.visible;

    // songScoreInt was removed after V-Slice 0.6.  The live score is now
    // a Float so held notes can award fractional points.
    var displayedScore:Int = Std.int(Math.max(0, PlayState.instance.songScore));
    if (intendentScore != displayedScore)
    {
      var play = PlayState.instance;
      var scoreArray:Array<String> = Std.string(displayedScore).split("");
      scoreArray.reverse();

      for (i in 0...SCORE_NUMBERS_SPRS.length)
      {
        var currentNumber = scoreArray[i];
        if (currentNumber == null || currentNumber.length == 0)
        {
          SCORE_NUMBERS_SPRS[i].visible = false;
          currentNumber = "0";
        }
        else
          SCORE_NUMBERS_SPRS[i].visible = true;
        SCORE_NUMBERS_SPRS[i].animation.play(currentNumber, true);
      }
      intendentScore = displayedScore;
    }

    var mdTime = Conductor.instance.songPosition * 0.001;
    var scoreValue = Math.max(0, displayedScore - 10000);
    var t = scoreValue / 90000;
    var intensity = Math.min(1.5, t);
    if (intensity > 0 /*.002*/)
    {
      for (i in 0...SCORE_NUMBERS_SPRS.length)
      {
        var spr = SCORE_NUMBERS_SPRS[i];

        if (spr == null || !spr.visible) continue;

        var phase = i * 0.55;
        spr.frameOffset.x = Math.cos(mdTime * 2.0 + phase) * (0.12 + intensity * 0.55);
        spr.frameOffset.y = Math.sin(mdTime * 2.6 + phase) * (0.25 + intensity * 1.2);
        var scale = scoreBaseScale[i] + Math.sin(mdTime * 3.2 + phase) * (0.002 + intensity * 0.010);
        spr.scale.set(scale, scale);
        spr.angle = (Preferences.downscroll ? -3 : 0) + Math.sin(mdTime * 1.8 + phase) * (0.2 + intensity * 0.8);
      }

      if (scoreLabel != null)
      {
        scoreLabel.frameOffset.x = Math.cos(mdTime * 1.7) * (0.08 + intensity * 0.35);
        scoreLabel.frameOffset.y = -Math.sin(mdTime * 2.0) * (0.15 + intensity * 0.65);
        scoreLabel.angle = (Preferences.downscroll ? -3.25 : 0) + Math.sin(mdTime * 1.4) * (0.15 + intensity * 0.5);
      }
    }
  }

  function onBeatHit(e)
  {
    super.onBeatHit(e);
    if (!usingAmTakeUI) return;

    if (FULL_COMBO_SPRITE != null && FULL_COMBO_SPRITE.active && FULL_COMBO_SPRITE.alpha == 1)
    {
      FULL_COMBO_SPRITE.scale.set(0.825, 0.825);
      FlxTween.tween(FULL_COMBO_SPRITE.scale, {x: 0.9, y: 0.9}, Conductor.instance.beatLengthMs / 2000);
    }
  }

  function onDestroy(e)
  {
    usingAmTakeUI = false;
    super.onDestroy(e);
    if (FULL_COMBO_SPRITE != null)
    {
      // FULL_COMBO_SPRITE.kill();
      FULL_COMBO_SPRITE.destroy();
    }

    for (num in SCORE_NUMBERS_SPRS)
    {
      // num.kill();
      num.destroy();
      // SCORE_NUMBERS_SPRS.remove(num);
    }
    SCORE_NUMBERS_SPRS = [];
    trace("DESTROOOOOOOOOOOOOOOY");
  }

  function triggerCameraMovement(id)
  {
    var state = PlayState.instance;
    if (state == null || FlxG.camera == null || FlxG.camera.basicOffset == null) return;
    FlxG.camera.basicOffset.x = 0;
    FlxG.camera.basicOffset.y = 0;
    switch (id)
    {
      case 0:
        FlxG.camera.basicOffset.x = -camX / state.camGame.zoom * (state.stageZoom / 2);
      case 1:
        FlxG.camera.basicOffset.y = camY / state.camGame.zoom * (state.stageZoom / 2);
      case 2:
        FlxG.camera.basicOffset.y = -camY / state.camGame.zoom * (state.stageZoom / 2);
      case 3:
        FlxG.camera.basicOffset.x = camX / state.camGame.zoom * (state.stageZoom / 2);
    }
    // trace(FlxG.camera.basicOffset);
  }

  var curNoteCombo = 0;
  var scoreCombo = 0;

  function _toAddCombo(item)
  {
    item.scrollFactor.set(0.85, 0.85);
    PlayState.instance.add(item);
  }

  function spawnCombo()
  {
    if (curNoteCombo <= 7 || !usingAmTakeUI || !mayGhostTap() || !onlyHUD() || PlayState.instance == null || !showAmTakeJudgements()) return;

    // clearRatingStuff();

    /*var play = PlayState.instance;
      if (play == null || !onlyHUD())
        return;

      var ratingsFrames = Paths.getSparrowAtlas("ui/ratings/GAMEPLAY_UI_ASSETS", "shared");
      var combo = curNoteCombo;
      var dissapearTimeMult:Float = 1;

      var blot;
      var comboSpr;
      play.comboPopUps.zIndex = 9;
      var stageOffset:Array<Float> = play.currentStage == null ? [0, 0] : play.currentStage.ratingsOffset;

      blot = new FunkinSprite();
      blot.frames = ratingsFrames;
      blot.animation.addByPrefix('blot1', "blot0", 24, false);
      blot.animation.addByPrefix('blot2', "blot 2", 24, false);
      blot.zIndex = 10;
      blot.x = (FlxG.width * 0.474) + play.comboPopUps.offsets[0] + stageOffset[0];
      blot.y = (FlxG.camera.height * 0.45 - 60) + play.comboPopUps.offsets[1] + stageOffset[1];
      blot.setGraphicSize(Std.int(blot.width * 0.6));
      blot.updateHitbox();
      blot.offset.x += 15;
      previousComboStuff.push([blot, true]);
      blot.animation.play("blot" + ((variation = !variation) ? 1 : 2));
      if (blot.animation.curAnim.name == "blot2")
        blot.offset.y += 15;
      blot.origin.set(blot.frameWidth * .4, blot.frameHeight * .4);
      blot.angle = FlxG.random.float(-15, 15);

      var currentColorPoint = 0;
      for (i in 0...comboBlotColorsMax.length - 1)
      {
        currentColorPoint = i;
        if (Highscore.tallies.combo < comboBlotColorsMax[i])
          break;
      }

      var cfv = comboBlotColorsMax[currentColorPoint]
        - (comboBlotColorsMax[currentColorPoint - 1] != null ? comboBlotColorsMax[currentColorPoint - 1] : comboBlotColorsMax[currentColorPoint]);
      blot.color = FlxColor.interpolate(comboBlotColors[currentColorPoint], comboBlotColors[currentColorPoint + 1],
        (Highscore.tallies.combo - cfv) / (comboBlotColorsMax[currentColorPoint] - cfv));

      if (combo >= 0)
      {
        comboSpr = constructComboSprite(comboSpr, null, ratingsFrames);
        comboSpr.setPosition(blot.x, blot.y + 105);
        previousComboStuff.push([comboSpr, true]);
      }

      if (combo >= 0)
      {
        var seperatedScore:Array<Int> = [];
        var tempCombo:Int = combo;

        while (tempCombo != 0)
        {
          seperatedScore.push(tempCombo % 10);
          tempCombo = Std.int(tempCombo / 10);
        }
        while (seperatedScore.length < 3)
          seperatedScore.push(0);

        seperatedScore.reverse();
        // trace(seperatedScore);
        var daLoop:Int = 0;
        var previousNumber:FunkinSprite = null;
        for (i in seperatedScore)
        {
          var cnumber = constructComboNumberSprite(NUMBERS[i], ratingsFrames);
          var currentScale = .45 + (daLoop * .1);
          cnumber.scale.set(currentScale, currentScale);
          cnumber.updateHitbox();
          cnumber.setPosition(blot.x + blot.width * .65, blot.y + blot.height * 1.25 - cnumber.height / 2 * cnumber.scale.y);
          if (previousNumber != null)
          {
            cnumber.x = previousNumber.x + previousNumber.frameWidth * .75 * previousNumber.scale.x;
            cnumber.y = previousNumber.y + (previousNumber.height / 2 * previousNumber.scale.y) - (cnumber.height / 1.725 * cnumber.scale.y);
          }

          cnumber.angularVelocity = FlxG.random.int(-15, 15);

          cnumber.zIndex += daLoop;
          previousNumber = cnumber;
          previousComboStuff.push([cnumber, true]);
          daLoop++;
        }
      }
      // COMBO NUMBERS
      var comboColors = ((Highscore.tallies.sick == Highscore.tallies.totalNotesHit)
        && Highscore.tallies.missed == 0) ? FlxColor.gradient(blot.color, FlxColor.WHITE, 5, FlxEase.linear) : null; // 0xF2F5A4 : null;
      for (shit in previousComboStuff)
      {
        var baseShit = shit[0];
        if (baseShit == null)
          continue;
        if (shit[1])
        {
          baseShit.scrollFactor.set(.85, .85);
          baseShit.antialiasing = true;
          baseShit.acceleration.y = 650;
          baseShit.velocity.y -= FlxG.random.int(160, 175);
          baseShit.velocity.x -= FlxG.random.int(0, 10);
          baseShit.angle = FlxG.random.int(-5, 5);
          baseShit.angularVelocity += FlxG.random.int(-5, 5);
          baseShit.maxVelocity.y = 0;

          if (comboColors != null && baseShit != blot)
          {
            baseShit.color = comboColors[3];
            FlxTween.color(baseShit, Conductor.instance.beatLengthMs * 0.001 * dissapearTimeMult, comboColors[3], comboColors[1],
              {ease: FlxEase.sineOut});
          }
        }

        play.comboPopUps.add(baseShit);

        FlxTween.tween(baseShit, {
          alpha: 0,
          angle: baseShit.angle + FlxG.random.float(-16, 16)
        },
          Conductor.instance.beatLengthMs * 0.001 / 1.5,
          {ease: FlxEase.cubeOut, startDelay: Conductor.instance.beatLengthMs * 0.001 * dissapearTimeMult});
    }*/

    final bonusScore:Int = Math.round(curNoteCombo * (scoreCombo / 150));
    PlayState.instance.songScore += Math.round(bonusScore - (scoreCombo / 150));
    scoreCombo = 0;
    curNoteCombo = 0;
  }

  public function mayGhostTap():Bool // uh
  {
    return PlayState.instance.playerStrumline.notes.members.filter((note:NoteSprite) ->
    {
      return note != null && note.alive && !note.hasBeenHit;
    }).length <= 5;
  }

  function onSongStart(e)
  {
    super.onSongStart(e);
    // Some scripted note styles finish their setup after CountdownStart.
    // Reapply once the song actually starts so the Xmas covers cannot retain
    // V-Slice's default layer above the receptors.
    applyAmTakeHoldCoverLayer();
    if (FULL_COMBO_SPRITE != null)
    {
      FULL_COMBO_SPRITE.revive();
      FULL_COMBO_SPRITE.comboStatus = "PFC";
      FULL_COMBO_SPRITE.x = 20;
      FULL_COMBO_SPRITE.y = (Preferences.downscroll) ? 20 : FlxG.height - FULL_COMBO_SPRITE.height;
      FULL_COMBO_SPRITE.active = true;
      FULL_COMBO_SPRITE.alpha = 0.0001;
    }
  }

  public function listBaseGameSongIds():Array<String>
  {
    return
      ["tutorial", "bopeebo", "fresh", "dadbattle", "spookeez", "south", "monster", "philly-nice", "blammed", "satin-panties", "high", "milf", "cocoa", "eggnog", "winter-horrorland", "senpai", "roses", "thorns", "ugh", "guns", "stress", "darnell", "lit-up", "2hot", "blazin", "test"];
  }
}
