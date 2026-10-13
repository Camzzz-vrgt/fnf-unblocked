import funkin.audio.FunkinSound;
import funkin.ui.MusicBeatState;
import flixel.FlxCamera;
import funkin.util.Constants;
import funkin.modding.base.ScriptedMusicBeatState;
import funkin.ui.AtlasText;
import flixel.group.FlxTypedGroup;
import flixel.util.FlxAxes;
import funkin.ui.mainmenu.MainMenuState;
import funkin.util.TouchUtil;

class TrickyMobileChecker extends ScriptedMusicBeatState {

	public function new() {
		super();
	}

	var allowShit = [false, true];

	var texts = ['THIS MOD IS', 'BEST PLAYED ON PC', '', 'FEEL FREE TO ENJOY', 'THE MOD ON MOBILE'];

	var group:FlxTypedGroup;

	public override function create():Void {
		super.create();

		group = new FlxTypedGroup();

		bgCamera = FlxG.camera = new FlxCamera(0, 0, FlxG.width, FlxG.height, 0);
		bgCamera.bgColor = 0xff000000;
		FlxG.cameras.add(bgCamera);

		if(FlxG.onMobile){
			for(i in 0...texts.length){
				if(texts[i] != ''){
					sprite = new AtlasText(0, 200 + (i * 65), texts[i], "trickyAlphabet");
					sprite.scale.set(0.4,0.4);
					sprite.updateHitbox();
					sprite.x = ((FlxG.width - sprite.width) * 0.7) - 270;
					group.add(sprite);
				}
			}
			add(group);
		}
	}

	public override function update(){
		if(!allowShit[0]) if(TouchUtil.justPressed){
			for(i in group.members) i.visible = false;
			allowShit[0] = true;
		}
		if(allowShit[0] && allowShit[1]){
			allowShit[1] = false;
			FunkinSound.playOnce(Paths.sound("tricky/menu/loadComplete"), 1, () -> {
				var state:MusicBeatState = new MainMenuState();
				FlxG.switchState(state);
			});
		}
	}
}
