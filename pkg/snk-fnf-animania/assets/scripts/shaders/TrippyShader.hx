import flixel.addons.display.FlxRuntimeShader;
import funkin.Paths;
import openfl.utils.Assets;

class TrippyShader extends FlxRuntimeShader
{
	var currentTime(default, set):Float = 0.0;
	var darkness(default, set):Float = 0.0;
	var intensity(default, set):Float = 0.0;

	function set_currentTime(nt:Float):Float
	{
		this.setFloat('iTime', nt);
		return currentTime = nt;
	}

	function set_darkness(nt:Float):Float
	{
		this.setFloat('darkness', nt);
		return darkness = nt;
	}

	function set_intensity(nt:Float):Float
	{
		this.setFloat('intensity', nt);
		return intensity = nt;
	}

	public function new()
	{
		var fragText:String = Assets.getText(Paths.frag('trippy'));
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
		darkness = 1.0;
		intensity = 8.0;
	}

}
