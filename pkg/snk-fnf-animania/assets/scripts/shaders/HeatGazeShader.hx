import flixel.addons.display.FlxRuntimeShader;
import funkin.Paths;
import openfl.utils.Assets;

class HeatGazeShader extends FlxRuntimeShader
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

	var speed(default, set):Float = 0.0;
	function set_speed(nt:Float):Float
	{
		this.setFloat('speed', nt);
		return speed = nt;
	}

	public function new()
	{
		var fragText:String = Assets.getText(Paths.frag('heatGaze'));
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
		strength = 2.25;
		speed = 15;
	}

}
