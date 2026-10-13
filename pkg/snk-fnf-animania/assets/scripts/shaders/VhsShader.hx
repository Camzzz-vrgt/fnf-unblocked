import flixel.addons.display.FlxRuntimeShader;
import funkin.Paths;
import openfl.utils.Assets;

class VhsShader extends FlxRuntimeShader
{
	var currentTime(default, set):Float = 0.0;
	function set_currentTime(nt:Float):Float
	{
		this.setFloat('iTime', nt);
		return currentTime = nt;
	}

	var amount(default, set):Float = 0.0;
	function set_amount(nt:Float):Float
	{
		this.setFloat('amount', nt);
		return amount= nt;
	}

	var glitchSpeed(default, set):Float = 0.0;
	function set_glitchSpeed(nt:Float):Float
	{
		this.setFloat('glitchSpeed', nt);
		return glitchSpeed= nt;
	}

	public function new()
	{
		var fragText:String = Assets.getText(Paths.frag('vhs'));
		super(fragText);
		reset();
	}

	public function update(elapsed:Float):Void
	{
		currentTime += elapsed;
	}

	public function reset()
	{
		currentTime = 0;
		amount = .5;
		glitchSpeed = 2;
	}

}
