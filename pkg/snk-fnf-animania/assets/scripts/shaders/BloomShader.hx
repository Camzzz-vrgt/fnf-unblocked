import flixel.addons.display.FlxRuntimeShader;
import funkin.Paths;
import openfl.utils.Assets;

class BloomShader extends FlxRuntimeShader
{
	public function new()
	{
		super(Assets.getText(Paths.frag('bloom')));
		setFloatArray("blurSize", [50, 50]);
	}

	public function setBlurSize(x:Float, y:Float)
	{
		setFloatArray("blurSize", [x, y]);
	}

}
