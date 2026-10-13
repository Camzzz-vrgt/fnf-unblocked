import flixel.addons.display.FlxRuntimeShader;
import funkin.Paths;
import openfl.utils.Assets;

class LiquidShader extends FlxRuntimeShader
{
	var currentTime(default, set):Float = 0.0;
	function set_currentTime(nt:Float):Float
	{
		this.setFloat('iTime', nt);
		return currentTime = nt;
	}

	var strength(default, set):Float = 0.0;
	function set_strength(nt:Float):Float
	{
		this.setFloat('strength', nt);
		return strength = nt;
	}

	var freq(default, set):Float = 0.0;
	function set_freq(nt:Float):Float
	{
		this.setFloat('freq', nt);
		return freq= nt;
	}

	public function new()
	{
		var fragText:String = Assets.getText(Paths.frag('liquid'));
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
		strength = .75;
		freq = 1;
	}

}
