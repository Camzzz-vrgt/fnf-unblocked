import funkin.graphics.FunkinSprite;

class AttachedSprite extends FunkinSprite
{
	public var sprTracker:FlxSprite;
	public var xAdd:Float = 0;
	public var yAdd:Float = 0;
	public var angleAdd:Float = 0;
	public var alphaMult:Float = 1;

	public var copyPos:Bool = true;
	public var copyAngle:Bool = true;
	public var copyAlpha:Bool = true;
	public var copyVisible:Bool = false;
	public var copyCameras:Bool = false;
	public var copyColor:Bool = false;

	public function new(?x:Float = 0, ?y:Float = 0)
	{
		super(x, y);
	}

	public function update(elapsed:Float)
	{
		super.update(elapsed);
		if (sprTracker != null)
		{
			if (copyPos)
				setPosition(sprTracker.x + xAdd, sprTracker.y + yAdd);
			// scrollFactor.set(sprTracker.scrollFactor.x, sprTracker.scrollFactor.y);

			if (copyAngle)
				angle = sprTracker.angle + angleAdd;

			if (copyAlpha)
				alpha = sprTracker.alpha * alphaMult;

			if (copyVisible)
				visible = sprTracker.visible;

			if (copyCameras)
				cameras = sprTracker.cameras;

			if (copyColor)
				color = sprTracker.color;
		}
	}
}
