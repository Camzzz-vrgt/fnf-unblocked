import flixel.addons.display.FlxRuntimeShader;
import funkin.Paths;
import openfl.utils.Assets;

class HSVBlendedShader extends FlxRuntimeShader
{
	public static function xmasInit():HSVBlendedShader {
		var shader = new HSVBlendedShader(0xCC7D6EB8, 9);
		shader.setHue(-35);
		return shader;
	}

	// ARGB = FlxColor
    public var hue:Float;
    public var saturation:Float;
    public var contrast:Float;
    public var brightness:Float;
	public var color:Int = 0xFFFFFFFF;
    public var blendMode:Int = BlendMode.MULTIPLY;

	function new(color:Int = 0xFFFFFFFF, blendMode:BlendMode = BlendMode.MULTIPLY)
	{
		super(Assets.getText(Paths.frag('hsvBlended')));
		setColor(color);
		setBlendMode(blendMode);
        setHue(1);
        setSaturation(1);
        setContrast(1);
        setBrightness(1);
	}

	function setColor(value:Int):Void
	{
		this.color = value;

		this.setFloatArray('blendColor', [
	    	((value >> 16) & 0xff) / 255.0,
	    	((value >> 8) & 0xff) / 255.0,
	    	((value) & 0xff) / 255.0,
            ((value >> 24) & 0xff) / 255.0
        ]);
	}
	function setBlendMode(value:Int):Void
	{
		this.blendMode = value;

		this.setInt('iBlendMode', value);
	}
	function setHue(value:Float):Void
	{
		hue = value;
		this.setFloat('hue', value);
	}

	function setSaturation(value:Float):Void
	{
		saturation = value;
		this.setFloat('sat', value);
	}

	function setContrast(val:Float):Void
	{
		contrast = val;
		this.setFloat('contrast', val);
	}

	function setBrightness(val:Float):Void
	{
		brightness = val;
		this.setFloat('brightness', val);
	}
}
