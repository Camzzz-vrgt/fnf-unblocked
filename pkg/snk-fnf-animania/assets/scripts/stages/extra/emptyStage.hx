import flixel.FlxSprite;
import flixel.addons.display.FlxBackdrop;
import flixel.addons.effects.FlxTrail;
import flixel.group.FlxTypedGroup;
import flixel.math.FlxBasePoint;
import flixel.util.FlxBitmapDataUtil;
import flixel.util.FlxSort;
import funkin.Conductor;
import funkin.audio.FunkinSound;
import funkin.graphics.FunkinSprite;
import funkin.graphics.adobeanimate.FlxAtlasSprite;
import funkin.graphics.shaders.OverlayBlend;
import funkin.play.CountdownStep;
import funkin.play.GameOverSubState;
import funkin.play.PauseSubState;
import funkin.play.character.CharacterType;
import funkin.play.stage.ScriptedStage;
import funkin.util.Constants;
import funkin.util.MathUtil;
import funkin.util.SortUtil;
import openfl.filters.ShaderFilter;

class EmptyStage extends ScriptedStage
{
	function new()
	{
		super('empty');
	}

	function buildStage()
	{
		super.buildStage();
	}
}
