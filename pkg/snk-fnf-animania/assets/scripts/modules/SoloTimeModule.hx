import flixel.FlxG;
import flixel.graphics.frames.FlxAtlasFrames;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import funkin.FunkinMemory;
import funkin.Paths;
import funkin.audio.FunkinSound;
import funkin.graphics.FunkinSprite;
import funkin.modding.IPlayStateScriptedClass;
import funkin.modding.module.Module;
import funkin.play.PlayState;
import funkin.play.notes.NoteSplash;
import funkin.play.notes.NoteSprite;
import funkin.data.notestyle.NoteStyleRegistry;

/**
 * 0.8.5-compatible version of the legacy global `solo_time.script`.
 * Global `.script` files are not PlayState callback classes on HTML5, so this
 * module receives the chart event through the supported module dispatcher.
 */
class SoloTimeModule extends Module implements IPlayStateScriptedClass
{
  static final MULTIPLIER:Float = 0.5;
  static final OFFSET:Float = 0.25;
  var regularSplashFrames:FlxAtlasFrames;
  var xmasSplashFrames:FlxAtlasFrames;

  public function new()
  {
    super('SoloTimeModule', 20);
  }

  override function onCreate(event)
  {
    super.onCreate(event);
    // The module is shared by all Solo Time songs. Cache every bitmap and SFX
    // it can instantiate before the first chart event/note, rather than doing
    // an asset decode in the middle of a Solo Time section.
    for (texture in ['ui/times/solo_time', 'ui/times/solo_time-xmas', 'ui/notes/solotimenotes/solotime_NOTES', 'ui/notes/solotimenotes/solotime_SPLASHES'])
      FunkinMemory.cacheTexture(Paths.image(texture));

    for (sound in ['gameplay/solo_time/solotime', 'gameplay/solo_time/solotime-xmas'])
      FunkinMemory.cacheSound(Paths.sound(sound));

    // FunkinMemory keeps the bitmap data, but the first loadSparrow() would
    // still parse an XML atlas in the middle of a Solo Time event. Retain the
    // two prepared frame sets so the event only creates its visual sprites.
    regularSplashFrames = Paths.getSparrowAtlas('ui/times/solo_time');
    xmasSplashFrames = Paths.getSparrowAtlas('ui/times/solo_time-xmas');

    // Solo Time notes use their own NoteStyle only when they begin spawning.
    // Build its reusable note and splash frames now, without asking its FNF
    // fallback style to preload unrelated strums or sustain assets.
    var soloStyle = NoteStyleRegistry.instance.fetchEntry('solotime');
    if (soloStyle != null)
    {
      var warmNote = new NoteSprite(soloStyle);
      warmNote.destroy();
      var warmSplash = new NoteSplash(soloStyle);
      warmSplash.destroy();
    }

    trace('Animania SoloTime: module loaded');
  }

  override function onSongEvent(event)
  {
    super.onSongEvent(event);

    var game = PlayState.instance;
    if (game == null || event.eventData.eventKind != 'SoloTime') return;

    var suffix:String = event.eventData.getString('randParam') ?? '';
    trace('Animania SoloTime: playing splash, suffix=$suffix');
    FunkinSound.playOnce(Paths.sound('gameplay/solo_time/solotime' + suffix));

    var splash = new FunkinSprite();
    var splashFrames = suffix == '-xmas' ? xmasSplashFrames : regularSplashFrames;
    if (splashFrames != null) splash.frames = splashFrames;
    else splash.loadSparrow('ui/times/solo_time' + suffix);
    splash.animation.addByPrefix('anim', 'solo_time', 24, false);
    splash.animation.onFinish.add(function(_)
    {
      FlxTween.tween(splash, {alpha: 0}, 0.5, {
        onComplete: function(_)
        {
          game.remove(splash, true);
          splash.destroy();
        }
      });
    });
    splash.scale.set(0.75, 0.75);
    splash.screenCenter(0x10);
    splash.cameras = [game.camHUD];
    splash.zIndex = 20;
    splash.x = -120;
    splash.animation.timeScale = 1 / MULTIPLIER;
    splash.animation.play('anim', true);
    splash.angle = FlxG.random.float(-2, 2);
    FlxTween.tween(splash, {x: splash.x + 20, angle: 0}, MULTIPLIER, {ease: FlxEase.cubeOut});
    game.add(splash);

    createCoolBackLine(100, 1, 140, -180, 300);
    createCoolBackLine(350, 1, 60, -180, 650);
    createCoolBackLine(560, 1, 15, -180, 950);
    createBlackLine(-(FlxG.height / 4), -(FlxG.height / 6));
    createBlackLine(FlxG.height, FlxG.height - (FlxG.height / 8));
    game.refresh();
  }

  function createBlackLine(yPos:Float, targetY:Float):Void
  {
    var game = PlayState.instance;
    if (game == null) return;

    var line = new FunkinSprite(0, yPos).makeSolidColor(FlxG.width, Std.int(FlxG.height / 4), FlxColor.BLACK);
    line.cameras = [game.camHUD];
    line.zIndex = 5;
    game.add(line);

    FlxTween.tween(line, {y: targetY}, 10 / 24 * MULTIPLIER, {
      startDelay: 4 / 24 * MULTIPLIER,
      ease: FlxEase.quadOut,
      onComplete: function(_)
      {
        FlxTween.tween(line, {y: yPos}, 10 / 24 * MULTIPLIER, {
          startDelay: 30 / 24 * MULTIPLIER,
          ease: FlxEase.quadOut,
          onComplete: function(_)
          {
            game.remove(line, true);
            line.destroy();
          }
        });
      }
    });
  }

  function createCoolBackLine(xPos:Float, zIndex:Int, scaleX:Float, moveAmount:Float, moveEnd:Float):Void
  {
    var game = PlayState.instance;
    if (game == null) return;

    var line = new FunkinSprite(xPos, -100).makeSolidColor(1, Std.int(FlxG.height * 1.75), FlxColor.BLACK);
    line.cameras = [game.camHUD];
    line.angle = -20;
    line.zIndex = zIndex;
    line.scale.x = 0.001;
    line.updateHitbox();
    game.add(line);

    FlxTween.tween(line.scale, {x: scaleX}, 9 / 24 * MULTIPLIER, {startDelay: OFFSET, ease: FlxEase.quadOut});
    FlxTween.tween(line, {x: line.x - moveAmount}, 10 / 24 * MULTIPLIER, {startDelay: OFFSET, ease: FlxEase.quadOut});
    FlxTween.tween(line.scale, {x: 0.0}, 9 / 24 * MULTIPLIER, {startDelay: 38 / 24 * MULTIPLIER + OFFSET, ease: FlxEase.quadOut});
    FlxTween.tween(line, {x: line.x + moveEnd}, 10 / 24 * MULTIPLIER, {
      startDelay: 38 / 24 * MULTIPLIER + OFFSET,
      ease: FlxEase.quadOut,
      onComplete: function(_)
      {
        game.remove(line, true);
        line.destroy();
      }
    });
  }
}
