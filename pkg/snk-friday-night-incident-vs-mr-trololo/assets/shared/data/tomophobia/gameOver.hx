import substates.GameOverSubstate;
import backend.Conductor;
import backend.Mods;
import backend.MusicBeatState;
import states.PlayState;
import states.CustomState;

var derp:FlxSprite;
var subtitles:FlxText;
var grafterSound:FlxSound;

var grafterLines:Array<String> = [
	"Bye-bye!",
	"OOOH! This is just so much fun!",
	"Gosh, that was fun, wasn't it?",
	"*crazed laughter*",
	"Don't look so serious!",
	"Ugh... you spoil my fun.",
	"*maniacal laughter*",
	"*incorrect buzzer*\nTry again next time!",
	"Huh? Why aren't ya laughing?",
	"Congratulations! I think...\n*chuckle*",
	"That's it, game's over.\nStep along, step along, nothing to see.\nGet going before my good mood wears off.\nTHAT MEANS NOW.",
	"Run along now.",
	"Too bad, so sad, buh-bye.",
	"Ha!",
	"Tsk, tsk, you're missing out on all the good stuff!",
	"*incorrect buzzer*\nOh, sorry... try again later.",
	"BOO! Did I scare you?",
	"Oh, isn't that a pity? All I can say is 'nah nah, nah nah nah nah.'",
	"Have a pat on the back!"
];

var grafterLinesRetry:Array<String> = [
	"Looks like it's your lucky day...",
	"This party is just getting started!",
	"Well, well, well, look at the big shot!",
	"Oh, give up, you'll never beat me!",
	"Haven't you given up yet?",
	"OHHH... Hoohoohoohooooo...\nlook who's come back to play... Did you miss me?"
];

var isEnding:Bool = false;
var isDead:Bool = false;
var backingAudio:FlxSound;

function onCreatePost()
{
    GameOverSubstate.disableEvents = true;

    derp = new FlxSprite();
    derp.frames = Paths.getSparrowAtlas("songs/tomophobia/derpGameOver");
    derp.animation.addByPrefix("death", "death", 24, false);
    derp.animation.addByIndices("deathLoop", "death", [34, 35, 36, 37, 38], "", 24, true);
    derp.animation.addByIndices("deathEnd", "death", [34, 33, 32, 31, 28, 30], "", 24, false);
    derp.setGraphicSize(FlxG.width, FlxG.height);
    derp.antialiasing = ClientPrefs.data.antialiasing;

    subtitles = new FlxText(0, 540, FlxG.width, "", 28);
	subtitles.setFormat(Paths.font("vcr.ttf"), 28, 0xFFFFFFFF, "center", game.scoreTxt.borderStyle, 0xFF000000);
	subtitles.scrollFactor.set();
	subtitles.borderSize = 2.5;
	subtitles.alpha = 0.0001;

	if (!ClientPrefs.data.lowQuality) {
		for (i in 1...grafterLines.length + 1) Paths.sound("grafterDeath/Grafter_GameOver_" + i);
		for (i in 1...grafterLinesRetry.length + 1) Paths.sound("grafterDeath/Grafter_GameOver_Retry_" + i);
		for (i in ["LightStart", "graftedGameOver"]) Paths.sound(i);
		for (i in ["LightAmbience", "LightEnd", "gameOver-trollge"]) Paths.music(i);
	}
}

function onUpdatePost(e) {
    if (!isDead) return;

    if (FlxG.sound.music.playing) Conductor.songPosition = FlxG.sound.music.time;

	if (isEnding) return;
    if (controls.ACCEPT) {
        if (grafterSound != null && grafterSound.playing) {
            grafterSound.stop();
            grafterSound.volume = 0;
        }
		isEnding = true;

		var line = FlxG.random.int(1, 6);
		FlxTween.cancelTweensOf(subtitles);
		subtitles.alpha = 1;
		subtitles.text = grafterLinesRetry[line - 1];
		grafterSound = FlxG.sound.play(Paths.sound('grafterDeath/Grafter_GameOver_Retry_' + line), 1, false, null, true);
		new FlxTimer().start((grafterSound.length / 1000) - 1.5, function (twn) {
			FlxTween.tween(subtitles, {alpha: 0}, 0.25);
			if (backingAudio != null) {
				FlxTween.cancelTweensOf(backingAudio);
				FlxTween.tween(backingAudio, {volume: 0}, 1);
			}
			FlxG.sound.music.stop();
			FlxG.sound.play(Paths.music(GameOverSubstate.endSoundName));
			new FlxTimer().start(0.3, function(tmr:FlxTimer) {
				derp.animation.play('deathEnd', true);
			});

			new FlxTimer().start(2.5, function(tmr:FlxTimer) {
				MusicBeatState.resetState();
			});
		});
		game.callOnScripts('onGameOverConfirm', [true]);
    } else if (controls.BACK) {
		isEnding = true;
		FlxG.camera.visible = false;
		FlxG.sound.music.stop();
		PlayState.deathCounter = 0;
		PlayState.seenCutscene = false;
		PlayState.chartingMode = false;
	
		Mods.loadTopMod();
		if (PlayState.isStoryMode)
			MusicBeatState.switchState(new CustomState(Paths.hscript("states/StoryMenuState")));
		else
			MusicBeatState.switchState(new CustomState(Paths.hscript("states/FreeplayState")));
	
		FlxG.sound.playMusic(Paths.music('freakyMenu'));
		game.callOnScripts('onGameOverConfirm', [false]);
    }
}

function onGameOver() FlxG.sound.play(Paths.sound("graftedGameOver"));

function onGameOverStart()
{
	new FlxTimer().start(1.5, function(tmr:FlxTimer) {
		backingAudio = FlxG.sound.play(Paths.music("gameOver-trollge"), 0);
		backingAudio.looped = true;
		FlxTween.tween(backingAudio, {volume: 0.5}, 2);

		isEnding = true;
		isDead = true;
		FlxG.camera.scroll.set();
		FlxG.camera.target = null;
		FlxG.camera.fade(0xFF000000, 0.001, true);
		FlxG.camera.alpha = FlxG.camera.zoom = 1;
		FlxG.camera.visible = true;
		FlxG.camera.filtersEnabled = false;
		GameOverSubstate.instance.add(derp);
		GameOverSubstate.instance.add(subtitles);
		derp.screenCenter();
		derp.animation.play("death");
		FlxG.sound.play(Paths.sound("LightStart"));
		derp.animation.finishCallback = function (anim)
		{
			isEnding = false;
			derp.animation.play("deathLoop");
			derp.animation.finishCallback = null;
			FlxG.sound.music.loadEmbedded(Paths.music(GameOverSubstate.loopSoundName), true);
			FlxG.sound.music.fadeIn(0.2, 1, 4);

			if (isEnding) return;
			new FlxTimer().start(1.25, function (twn) {
				if (isEnding) return;
				var line = FlxG.random.int(1, 19);
				subtitles.alpha = 1;
				subtitles.text = grafterLines[line - 1];
				grafterSound = FlxG.sound.play(Paths.sound('grafterDeath/Grafter_GameOver_' + line), 1, false, null, true);
				new FlxTimer().start((grafterSound.length / 1000) - (line > 12 ? 0.5 : 2.5), function (twn) {
					if (!isEnding) FlxTween.tween(subtitles, {alpha: 0}, 1, {ease: FlxEase.sineInOut});
				});
			});
		}
	});
}