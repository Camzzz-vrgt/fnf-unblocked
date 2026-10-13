import funkin.ui.story.Level;
import funkin.save.Save;

class Week5Level extends Level
{
	function new()
	{
		super('week5');
	}

	override function isUnlocked():Bool
	{
		return true;
	}

	override function getDifficulties():Array<String>
	{
		return Constants.DEFAULT_DIFFICULTY_LIST;
	}

	override function getSongDisplayNames(difficultyId:String):Array<String>
	{
		return Save.instance.hasBeatenLevel('week5') ? super.getSongDisplayNames(difficultyId) : ["Cocoa", "Eggnog"];
	}
}
