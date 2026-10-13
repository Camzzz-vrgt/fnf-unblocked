import funkin.ui.story.Level;
import funkin.save.Save;
import funkin.util.Constants;

class Week1Level extends Level
{
	function new()
	{
		super('week1');
	}

	override function isUnlocked():Bool {
		return true;
	}

	override function getDifficulties():Array<String>
	{
		return Constants.DEFAULT_DIFFICULTY_LIST;
	}


	override function getSongDisplayNames(difficultyId:String):Array<String> {
		return ["Bopeebo", "Fresh", "DadBattle"];
	}
}
