import funkin.video.FunkinVideoSprite;
import flixel.text.FlxText;
import flixel.text.FlxTextFormat;

var bg:FlxSprite;
var video:FunkinVideoSprite;
var skip_cutscene_txt:FlxText;

function onLoad()
{
	bg = new FlxSprite();
	bg.scrollFactor.set();
	bg.cameras = [camOther];
	bg.color = FlxColor.BLACK;
	add(bg);

	songStartCallback = goldrush_cutscene;
}

function goldrush_cutscene()
{
	video = new FunkinVideoSprite(bg.x - 320, bg.y - 180);
	video.load(Paths.video('goldrush'));
	video.cameras = [camOther];
	video.scale.set(0.666666, 0.666666);
	add(video);
	video.onEnd(() ->
	{
		FlxG.save.data.goldrushCutscene = true;
		remove(bg);
		startCountdown();
	});
	video.play();

	skip_cutscene_txt = new FlxText(15, 0);
	skip_cutscene_txt.text = 'Press ENTER to Skip';
	skip_cutscene_txt.setFormat(Paths.font('Mont.ttf'), 32, FlxColor.WHITE, FlxTextAlign.LEFT, FlxTextBorderStyle.OUTLINE, FlxColor.BLACK);
	skip_cutscene_txt.borderSize = 3;
	skip_cutscene_txt.antialiasing = ClientPrefs.data.antialiasing;
	skip_cutscene_txt.alpha = 0;
	skip_cutscene_txt.cameras = [camOther];
	add(skip_cutscene_txt);

	var format_yellow = new FlxTextFormat(FlxColor.YELLOW);
	skip_cutscene_txt.addFormat(format_yellow, 6, 11);

	if (FlxG.save.data.goldrushCutscene)
	{
		FlxTween.tween(skip_cutscene_txt, {y: 15, alpha: 1}, 0.6, {startDelay: 1, ease: FlxEase.quadOut});
		new FlxTimer().start(5, (t) ->
		{
			if (video != null)
				FlxTween.tween(skip_cutscene_txt, {alpha: 0}, 1.2, {ease: FlxEase.quadOut});
		});
	}
}

function onUpdate()
{
	if (FlxG.keys.justPressed.ENTER && video != null && FlxG.save.data.goldrushCutscene)
	{
		video.destroy();
		video = null;
		remove(skip_cutscene_txt);
		remove(bg);
		startCountdown();
	}
}
