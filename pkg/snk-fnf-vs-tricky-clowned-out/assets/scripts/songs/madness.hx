import flixel.tweens.FlxEase;
import flixel.text.FlxText;
import flixel.util.FlxTimer;
import flixel.tweens.FlxTween;
import funkin.audio.FunkinSound;
import funkin.FunkinMemory;
import funkin.graphics.FunkinSprite;
import funkin.play.PlayState;
import funkin.play.PlayStatePlaylist;
import funkin.play.cutscene.VideoCutscene;
import funkin.play.cutscene.CutsceneType;
import funkin.play.song.Song;

class MadnessSong extends Song {
    var hasPlayedCutscene:Bool = false;

    public function new() { super('madness'); }

    override function onCreate(event){
        super.onCreate(event);

        // Reset per new PlayState; script instances survive a return to menu.
        hasPlayedCutscene = false;

        // These assets are only revealed by the ending cutscene.
        FunkinMemory.cacheTexture(Paths.image('characters/tricky/trickyMclown/spritemap1', 'shared'));
        FunkinMemory.cacheTexture(Paths.image('characters/tricky/trickyM/TrickyStatic', 'shared'));
        FunkinMemory.cacheTexture(Paths.image('characters/tricky/tweaky/spritemap1', 'shared'));
        FunkinMemory.cacheSound(Paths.sound('tricky/madness-ending', 'shared'));
        FunkinMemory.cacheSound(Paths.sound('tricky/staticSound', 'shared'));

        playedOnce = false;
    }

    var endingStatic:FunkinSprite;
    var txt:FlxText;

    public override function onCountdownStart(event:CountdownScriptEvent):Void{
        super.onCountdownStart(event);
        var state = PlayState.instance;
        event.cancel();
        if (!PlayStatePlaylist.isStoryMode){
            hasPlayedCutscene = true;
            PlayState.instance.isInCutscene = false;
            PlayState.instance.isInCountdown = true;
            PlayState.instance.startSong();
        }

        if(!hasPlayedCutscene){
            hasPlayedCutscene = true;
            VideoCutscene.play(Paths.videos('madness_cutscene'));
            VideoCutscene.onVideoEnded.addOnce(function(){
                PlayState.instance.isInCutscene = false;
                PlayState.instance.isInCountdown = true;
                PlayState.instance.startSong();
            });
        }

        if(!PlayStatePlaylist.isStoryMode) return;

        trickyCutscene = new FunkinSprite(state.currentStage.getDad().x - 300, state.currentStage.getDad().y - 1800).loadTextureAtlas('characters/tricky/trickyMclown', 'shared');
        trickyCutscene.anim.addByFrameLabel('cutsceneStart', 'clownStart', 24, true);
        trickyCutscene.anim.addByFrameLabel('cutscene', 'clown', 24, false);
        trickyCutscene.anim.addByFrameLabel('cutscene-loop', 'clown-loop', 24, true);
        trickyCutscene.alpha = 0.001;
        state.insert(1000, trickyCutscene);

        endingStatic = FunkinSprite.create(0, 0, 'characters/tricky/trickyM/TrickyStatic');
        endingStatic.scrollFactor.set();
        endingStatic.antialiasing = false;
        endingStatic.visible = false;
        endingStatic.setGraphicSize(FlxG.width * 2, FlxG.height * 2);
        endingStatic.updateHitbox();
        endingStatic.screenCenter();
        state.insert(1001, endingStatic);

        redFadeIn = new FunkinSprite(0,0).makeGraphic(1,1,0xFFFF0000);
        redFadeIn.setGraphicSize(FlxG.width*4,FlxG.height*4);
        state.insert(1002, redFadeIn);
        redFadeIn.alpha = 0;

        txt = new FlxText(-2200, -800, 1280, "YOU DONT KILL CLOWN", 32);
        txt.bold = true;
        txt.setFormat(Paths.font('tahoma-bold.ttf'), txt.size, 0xFFff0000, "center");
        txt.scale.set(3,4); txt.updateHitbox();
        // txt.camera = state.camCutscene;
        txt.visible = false;
        state.insert(1003, txt);
    }

    function onUpdate(event){
        super.onUpdate(event);
        if(!PlayStatePlaylist.isStoryMode) return;

        if (txt != null) txt?.angle = FlxG.random.float(-10, 10);
        if (endingStatic != null) endingStatic?.y = FlxG.random.float(-400,-300);
    }

    var playedOnce:Bool = false;
    function onSongEnd(event){
        if (playedOnce) return;
        if(PlayStatePlaylist.isStoryMode){
            FunkinSound.playOnce(Paths.sound("tricky/madness-ending"));
            var state = PlayState.instance;
            event.eventCanceled = true;
            playedOnce = true;

            FlxG.sound.music.time = FlxG.sound.music.length;
            FlxTween.tween(state.cameraFollowPoint, {x: state.currentStage.getDad().cameraFocusPoint.x - 150, y: state.currentStage.getDad().cameraFocusPoint.y}, 2, {ease: FlxEase.quartOut});
            FlxTween.tween(state.camHUD, {alpha: 0.001}, 1);
            trickyCutscene.animation.play('cutsceneStart');
            trickyCutscene.alpha = 1;
            state.debugUnbindCameraZoom = true;
            FlxTween.tween(FlxG.camera, {zoom: 0.8}, 2, {ease: FlxEase.quartOut});

            new FlxTimer().start(6, _ -> {
                doStatic(1);
                txt.visible = true;
            });
            
            new FlxTimer().start(17, _ -> {
                trickyCutscene.animation.play('cutscene');
            });

            new FlxTimer().start(22, _ -> {
                FlxTween.tween(redFadeIn, {alpha: 1}, 4, {ease: FlxEase.quartOut, onComplete: () -> {
                    new FlxTimer().start(2, _ -> {state.endSong(true);});
                }});
            });

            new FlxTimer().start(20, _ -> {
                doStatic(2);
                txt.text = "CLOWN KILLS YOU";
                txt.y += 500;
            });

            state.currentStage.getDad().alpha = 0.001;

            // trickyCutscene.animation.onFinishEnd.add(endCutscene);
            trickyCutscene.animation.finishCallback = function (anim:String){
                if (anim == "cutscene"){
                    
                    trickyCutscene.animation.play('cutscene-loop', true);
                    trickyCutscene?.animation?.curAnim?.looped = true;
                }
            };
        }
    }

    function doStatic(?dur:Float = 2){
        FunkinSound.playOnce(Paths.sound("tricky/staticSound"));
        endingStatic.visible = true;

        new FlxTimer().start(dur, _ -> {endingStatic.visible = false;});
    }
}
