import flixel.tweens.FlxEase;
import flixel.text.FlxText;
import flixel.text.FlxTextBorderStyle;
import flixel.tweens.FlxTween;
import funkin.audio.FunkinSound;
import funkin.graphics.FunkinSprite;
import funkin.ui.MusicBeatState;
import StringTools;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import funkin.save.Save;
import funkin.ui.MusicBeatSubState;
import funkin.modding.base.ScriptedMusicBeatState;
import funkin.ui.AtlasText;
import funkin.FunkinMemory;

class TrickyExtrasState extends ScriptedMusicBeatState
{
  public function new()
  {
    super();
  }

  var menuControllable:Bool = false;

  public override function create():Void
  {
    super.create();

    bgCamera = FlxG.camera = new FlxCamera(0, 0, FlxG.width, FlxG.height, 0);
    bgCamera.bgColor = 0xFF3a0000;
    FlxG.cameras.add(bgCamera);

    gridVoid = new FlxBackdrop(Paths.image('trickyMenu/main/grid'));
    gridVoid.velocity.x = -20;
    gridVoid.scrollFactor.set();
    add(gridVoid);

    setupButtons();

    menuOverlay();

    menuControllable = true;
  }

  function menuOverlay()
  {
    vignette = FunkinSprite.create(0, 0, 'trickyMenu/main/vignette');
    vignette.blend = 9;
    vignette.setGraphicSize(FlxG.width, FlxG.height);
    vignette.scrollFactor.set();

    blackFade = new FunkinSprite(0, 0).makeGraphic(FlxG.width, FlxG.height, 0xFF000000);
    blackFade.alpha = 0;

    for (i in [vignette, blackFade])
      add(i);
  }

  var mainButtons = [];
  var musicPieces = [];
  var creditsPieces = [];

  function setupButtons()
  {
    var index = 0;
    var padding = 200;
    // main
    mainButtons = [];
    for (i in ["FANART", "CONCEPT ART", "MUSIC", "CREDITS"])
    {
      txtButton = new AtlasText(0, 0, i, "trickyAlphabet");
      txtButton.scale.set(0.5, 0.5);
      txtButton.updateHitbox();
      txtButton.setPosition(FlxG.width / 2 - txtButton.width / 1.3, padding + ((FlxG.height - txtButton.height - (padding * 2)) * (index / 3)));
      if (i == "FANART") txtButton.color = 0xFFffffff;
      else
        txtButton.color = 0xFFff0000;
      mainButtons.push(txtButton);
      index += 1;
    }
    // concepts

    // music
    musicPieces = [];
    index = 0;
    for (i in ["improbable-outset", "madness", "hellclown", "expurgation", "improbable-outset-erect", "madness-erect", "hellclown-erect", "expurgation-erect", "assault", "tiky", "honkers", "nexus", "breakfast-tricky"])
    {
      txtButton = new AtlasText(0, 0, i, "trickyAlphabet");
      txtButton.scale.set(0.7, 0.7);
      txtButton.updateHitbox();
      txtButton.setPosition(650 - txtButton.width / 1.15, 350 + txtButton.height + (index * 80));
      if (index != 0) txtButton.color = 0xFFff0000;
      musicPieces.push(txtButton);
      index += 1;
    }
    // cassette
    cassette = new FunkinSprite(0, 0).loadTextureAtlas("trickyMenu/music/cassette", "preload");
    cassette.anim.addByFrameLabel('idle', 'cassette', 24, true);
    cassette.anim.play('idle');
    cassette.setPosition(FlxG.width / 2 - cassette.width / 2 + 65, 100);
    cassette.scale.set(0.8, 0.8);
    cassette.updateHitbox();

    cassetteColor = new FunkinSprite(cassette.x + 35, cassette.y + 5).makeGraphic(1, 1, 0xFFffffff);
    cassetteColor.scale.set(cassette.width - 70, cassette.height - 10);
    cassetteColor.updateHitbox();
    cassetteColor.color = 0xFFb03984;

    cassetteColor2 = new FunkinSprite(cassette.x + 5, cassette.y + 40).makeGraphic(1, 1, 0xFFffffff);
    cassetteColor2.scale.set(cassette.width - 10, cassette.height - 85);
    cassetteColor2.updateHitbox();
    cassetteColor2.color = 0xFFb03984;

    cassetteIcon = new FunkinSprite(0, 0);
    cassetteIcon.frames = Paths.getSparrowAtlas("trickyMenu/music/icons");
    cassetteIcon.scale.set(0.8, 0.8);
    cassetteIcon.updateHitbox();
    cassetteIcon.animation.addByPrefix('rozebud', 'rozebud', 24, true);
    cassetteIcon.animation.addByPrefix('marc', 'marc', 24, true);
    cassetteIcon.animation.addByPrefix('yingyang', 'yingyang', 24, true);
    cassetteIcon.animation.play("rozebud", true, false);
    cassetteIcon.setPosition(cassette.x + cassette.width / 2 - cassetteIcon.width / 2, cassette.y + 50);

    cassetteCredit = new FlxText(0, 0, FlxG.width, "ROZEBUD", 10);
    cassetteCredit.setFormat(Paths.font('tahoma-bold.ttf'), 30, 0xFFff0000, "center");
    cassetteCredit.setPosition(0, cassette.y - cassetteCredit.height);

    musicPieces.push(cassetteColor);
    musicPieces.push(cassetteColor2);
    musicPieces.push(cassette);
    musicPieces.push(cassetteIcon);
    musicPieces.push(cassetteCredit);

    for (i in musicPieces)
      i.x += FlxG.width;
    // credits
    creditsPieces = [];
    index = 0;
    for (i in ["BANBUDS", "MARC CEA", "ROZEBUD", "JADS", "YINGYANG48", "MK", "FIFFI", "LUSCIOUS", "CHUBBYGAMER464", "WERETOONS", "TRI DOT", "BRACED YETI", "HXZELRXVEN"])
    {
      txtButton = new AtlasText(0, 0, i, "trickyAlphabet");
      txtButton.setPosition(150 - (index * 50), FlxG.height / 2 - txtButton.height + (index * 100));
      if (index != 0) txtButton.color = 0xFFff0000;
      creditsPieces.push(txtButton);
      index += 1;
    }

    creditCredit = new FlxText(0, 0, FlxG.width, "DIRECTOR, SPRITES, MENU ART", 10);
    creditCredit.setFormat(Paths.font('tahoma-bold.ttf'), 30, 0xFFff0000, "center");
    creditCredit.setPosition(0, FlxG.height - creditCredit.height - 20);
    creditCredit.borderColor = 0xff000000;
    creditCredit.borderSize = 2;
    creditCredit.borderStyle = FlxTextBorderStyle.OUTLINE;
    creditsPieces.push(creditCredit);

    for (i in creditsPieces)
      i.x -= FlxG.width;
    // end
    for (i in [mainButtons, musicPieces, creditsPieces])
    {
      for (o in i)
        add(o);
    }
  }

  var curState = "main";
  var curSelected = 0;

  function changeMain(amt:Int, set:Bool = false)
  {
    var target = curSelected + amt;
    var range = mainButtons.length;
    if (set) target = amt;
    if (target >= range) target = 0;
    else if (target < 0) target = range - 1;

    mainButtons[curSelected].color = 0xFFff0000;
    mainButtons[target].color = 0xFFffffff;

    curSelected = target;
  }

  // concepts
  // songs
  function musicTrans( in:Bool = true)
  {
    if (! in) musicRequestId++;
    menuControllable = false;
    var set1 = mainButtons;
    var set2 = musicPieces;
    var amt = -FlxG.width;
    if (! in)
    {
      set1 = musicPieces;
      set2 = mainButtons;
      amt = amt * -1;
    }
    for (i in set1)
    {
      FlxTween.tween(i, {x: i.x + amt}, 0.5, {
        ease: FlxEase.quartIn,
        onComplete: _ ->
        {
          if (set1.indexOf(i) == 0)
          {
            for (o in set2)
            {
              FlxTween.tween(o, {x: o.x + amt}, 0.5, {
                ease: FlxEase.expoOut,
                onComplete: _ ->
                {
                  if (set2.indexOf(o) == 0)
                  {
                    if (set2 == mainButtons) resetMusic();
                    menuControllable = true;
                  }
                }
              });
            }
          }
        }
      });
    }
    curState = in ?"music":"main";
    curSelected = in ?0:2;
  }

  function changeSong(amt:Int, set:Bool = false)
  {
    var target = curSelected + amt;
    if (set) target = amt;
    var range = musicPieces.length - 5;

    // if (target >= range) target = 0;
    // else if (target < 0) target = range - 1;
    if (target >= range || target < 0) return; // no wrap around cuz it looks ugly
    var change = target - curSelected;

    musicPieces[curSelected].color = 0xFFff0000;
    musicPieces[target].color = 0xFFffffff;

    curSelected = target;

    var songName = musicPieces[curSelected].text;

    var cassetteColorCode = 0xFF781d99;
    switch (songName)
    {
      case "improbable-outset", "madness", "hellclown", "expurgation":
        cassetteColorCode = 0xFFb03984;
      case "honkers", "nexus":
        cassetteColorCode = 0xFF317b95;
    }

    for (i in [cassetteColor, cassetteColor2])
      i.color = cassetteColorCode;

    switch (cassetteColorCode)
    {
      case 0xFFb03984:
        cassetteIcon.animation.play("rozebud", true, false);
        cassetteCredit.text = "ROZEBUD";
      case 0xFF317b95:
        cassetteIcon.animation.play("yingyang", true, false);
        cassetteCredit.text = "YINGYANG48";
      default:
        cassetteIcon.animation.play("marc", true, false);
        cassetteCredit.text = "MARC CEA";
    }

    for (i in [cassette, cassetteColor, cassetteColor2, cassetteIcon, cassetteCredit])
    {
      var offset = 0;
      if (i == cassetteColor) offset = 5;
      else if (i == cassetteColor2) offset = 40;
      else if (i == cassetteIcon) offset = 50;
      else if (i == cassetteCredit) offset = -cassetteCredit.height;
      FlxTween.cancelTweensOf(i);
      i.y = offset + 100 + (amt * 50);
      FlxTween.tween(i, {y: offset + 100}, 0.5, {ease: FlxEase.expoOut});
    }

    for (i in musicPieces)
    {
      if (musicPieces.indexOf(i) >= range) return;
      i.alpha = musicPieces.indexOf(i) < curSelected ? 0 : 1;
      FlxTween.completeTweensOf(i);
      FlxTween.tween(i, {y: i.y - (change * 80)}, 0.5, {ease: FlxEase.expoOut});
    }
  }

  var musicRequestId:Int = 0;

  function playSong()
  {
    var targetSong:String = musicPieces[curSelected].text;
    var requestId = ++musicRequestId;
    if (targetSong == "nexus" || targetSong == "honkers")
    {
      playLoadedSong(targetSong);
      return;
    }

    // HTML5 music outside preload is asynchronous. Load only on selection.
    var library = targetSong == "breakfast-tricky" ? "shared" : "songs";
    Assets.loadLibrary(library).onComplete(_ ->
    {
      if (exists && requestId == musicRequestId) playLoadedSong(targetSong);
    }).onError(error ->
      {
        if (exists && requestId == musicRequestId) trace("Tricky music loading failed: " + error);
      });
  }

  function playLoadedSong(targetSong:String)
  {
    FlxG.sound.music?.stop();

    if (targetSong == "nexus")
    {
      var menuMusic = FunkinSound.load(Paths.music("trickyMenuMusic/nexus"), 1, true, false, true);
      FunkinSound.setMusic(menuMusic);
    }
    else if (targetSong == "honkers" || targetSong == "breakfast-tricky")
    {
      FunkinSound.playMusic(targetSong, {
        startingVolume: 1,
        overrideExisting: true,
        restartTrack: false,
        mapTimeChanges: false,
        persist: true
      });
    }
    else if (StringTools.endsWith(targetSong, "-erect"))
    {
      targetSong = targetSong.substr(0, targetSong.length - 6);
      FunkinSound.playMusic(targetSong, {
        startingVolume: 1,
        suffix: '-erect',
        mapTimeChanges: false,
        overrideExisting: true,
        restartTrack: false,
        persist: true,
        pathsFunction: 'INST'
      });
    }
    else
      FunkinSound.playMusic(targetSong, {
        mapTimeChanges: false,
        startingVolume: 1,
        overrideExisting: true,
        restartTrack: false,
        persist: true,
        pathsFunction: 'INST'
      });
  }

  function resetMusic()
  {
    cassetteColor.color = 0xFFb03984;
    cassetteColor2.color = 0xFFb03984;
    cassetteIcon.animation.play("rozebud", true, false);
    cassetteCredit.text = "ROZEBUD";

    var index = 0;
    for (i in musicPieces)
    {
      if (musicPieces.indexOf(i) >= musicPieces.length - 5) return;
      i.y = 350 + i.height + (index * 80);
      i.alpha = 1;
      if (index == 0) i.color = 0xFFffffff;
      else
        i.color = 0xFFff0000;
      index += 1;
    }
  }

  // credits
  function creditsTrans( in:Bool = true)
  {
    menuControllable = false;
    var set1 = mainButtons;
    var set2 = creditsPieces;
    var amt = FlxG.width;
    if (! in)
    {
      set1 = creditsPieces;
      set2 = mainButtons;
      amt = amt * -1;
    }
    for (i in set1)
    {
      FlxTween.tween(i, {x: i.x + amt}, 0.5, {
        ease: FlxEase.quartIn,
        onComplete: _ ->
        {
          if (set1.indexOf(i) == 0)
          {
            for (o in set2)
            {
              FlxTween.tween(o, {x: o.x + amt}, 0.5, {
                ease: FlxEase.expoOut,
                onComplete: _ ->
                {
                  if (set2.indexOf(o) == 0)
                  {
                    if (set2 == mainButtons) resetCredits();
                    menuControllable = true;
                  }
                }
              });
            }
          }
        }
      });
    }
    curState = in ?"credits":"main";
    curSelected = in ?0:3;
  }

  function changeCredit(amt:Int, set:Bool = false)
  {
    var target = curSelected + amt;
    if (set) target = amt;
    var range = creditsPieces.length - 1;
    if (target >= range) target = 0;
    else if (target < 0) target = range - 1;
    creditsPieces[curSelected].color = 0xFFff0000;
    creditsPieces[target].color = 0xFFffffff;
    var change = target - curSelected;
    curSelected = target;
    var creditName = creditsPieces[target].text;
    var creditDescriptor = "";
    switch (creditName)
    {
      case "BANBUDS":
        creditDescriptor = "DIRECTOR, SPRITES, MENU ART";
      case "MARC CEA":
        creditDescriptor = "CO-DIRECTOR, NEW MUSIC, SPRITES, EXTRA ART, CAMERA WORK";
      case "ROZEBUD":
        creditDescriptor = "WEEK SONGS, EXPURGATION";
      case "JADS":
        creditDescriptor = "EXPURGATION";
      case "YINGYANG48":
        creditDescriptor = "HONKERS, NEXUS (MENU THEME)";
      case "MK":
        creditDescriptor = "BACKGROUNDS";
      case "FIFFI":
        creditDescriptor = "CODE";
      case "LUSCIOUS":
        creditDescriptor = "CODE";
      case "CHUBBYGAMER464":
        creditDescriptor = "CHARTS";
      case "WERETOONS":
        creditDescriptor = "ANIMATED CUTSCENES";
      case "BRACED YETI":
        creditDescriptor = "BOOT KEYART";
      case "TRI DOT":
        creditDescriptor = "ASSAULT TRICKY SPRITES";
      case "HXZELRXVEN":
        creditDescriptor = "MENUCORE EXPERIMENTING";
      default:
        creditDescriptor = "WIP";
    }
    creditCredit.text = creditDescriptor;
    // if (curSelected == 1) creditCredit.size = 25;
    // else if (creditCredit.size != 40) creditCredit.size = 40;

    for (i in creditsPieces)
    {
      if (creditsPieces.indexOf(i) >= range) return;
      FlxTween.completeTweensOf(i);
      FlxTween.tween(i, {x: i.x + (change * 50), y: i.y - (change * 100)}, 0.5, {ease: FlxEase.expoOut});
    }
  }

  function resetCredits()
  {
    creditCredit.text = "DIRECTOR, SPRITES, MENU ART";
    var index = 0;
    for (i in creditsPieces)
    {
      if (creditsPieces.indexOf(i) >= creditsPieces.length - 1) return;
      i.setPosition(150 - (index * 50) - FlxG.width, FlxG.height / 2 - i.height + (index * 100));
      if (index == 0) i.color = 0xFFffffff;
      else
        i.color = 0xFFff0000;
      index += 1;
    }
  }

  static var usedTrans:String = '';

  function conceptTrans( in:Bool):Void
  {
    menuControllable = false;
    FlxTween.tween(FlxG.camera.scroll, {y: -600}, 0.5, {
      ease: FlxEase.quartIn,
      onComplete: _ ->
      {
        persistentDraw = persistentUpdate = true;
        openSubState(new TrickyConceptArtState());
      }
    });
  }

  function fanartTrans( in:Bool):Void
  {
    menuControllable = false;
    FlxTween.tween(FlxG.camera.scroll, {y: 600}, 0.5, {
      ease: FlxEase.quartIn,
      onComplete: _ ->
      {
        persistentDraw = persistentUpdate = true;
        openSubState(new TrickyFanartState());
      }
    });
  }

  static function bringBack():Bool
  {
    return menuControllable = true;
  }

  // update
  override function update(elapsed:Float):Void
  {
    super.update(elapsed);

    if (!menuControllable) return;

    if (controls.UI_DOWN_P || controls.UI_UP_P)
    {
      var amount = controls.UI_DOWN_P ? 1 : -1;
      switch (curState)
      {
        case "main":
          changeMain(amount);
        case "music":
          changeSong(amount);
        case "credits":
          changeCredit(amount);
      }
    }

    if (controls.ACCEPT_P)
    {
      if (curState == "main")
      {
        switch (curSelected)
        {
          case 0:
            fanartTrans(true);
          case 1:
            conceptTrans(true);
          case 2:
            musicTrans();
          case 3:
            creditsTrans();
          default:
        }
      }
      else if (curState == "music") playSong();
    }

    if (controls.BACK_P || FlxG.mouse.justPressedRight)
    {
      switch (curState)
      {
        case "main":
          exitTrickyState();
        case "music":
          musicTrans(false);
        case "credits":
          creditsTrans(false);
      }
    }
  }

  function exitTrickyState()
  {
    musicRequestId++;
    FlxTween.tween(blackFade, {alpha: 1}, 0.2, {
      onComplete: _ ->
      {
        var state:MusicBeatState = new TrickyMenuState();
        FlxG.switchState(state);
      }
    });
  }

  override function destroy()
  {
    musicRequestId++;
    super.destroy();
  }
}
