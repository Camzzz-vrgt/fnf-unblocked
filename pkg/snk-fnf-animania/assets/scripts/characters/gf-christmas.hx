import funkin.play.character.AnimateAtlasCharacter;
import funkin.play.character.CharacterType;
import funkin.play.PlayState;
import funkin.Conductor;
import funkin.modding.module.Module;
import funkin.modding.module.ModuleHandler;
import funkin.graphics.FunkinSprite;

using StringTools;

class GirlfriendChristmasCharacter extends AnimateAtlasCharacter
{
	function new()
	{
		super('gf-christmas');
	}

	var fgSnow;
	function onAdd()
	{
		super.onAdd();
		var stage = PlayState.instance?.currentStage;
		if (stage != null)
		{
			fgSnow = FunkinSprite.create(this.x + 285, this.y + 600, "characters/amtake/gf/gf-snow");
			stage.add(fgSnow);
			fgSnow.zIndex = zIndex + 1;
			// The snow stays unshaded.  Sharing GF's live ColorSwap shader worked in
			// 0.6, but on 0.8.5 HTML5 it reuses uniform locations from the Animate
			// render program and produces invalid WebGL uniform operations.
			stage.refresh();
		}
	}

	function onCountdownStep(e)
	{
		super.onCountdownStep(e);
		// Les valeurs d'enum ne sont pas résolues de façon fiable par HScript HTML5.
		switch (Std.string(e.step))
		{
			case "THREE":
				playAnimation("count3", true, false, false);
			case "TWO":
				playAnimation("count2", true, false, false);
			case "ONE":
				playAnimation("count1", true, false, false);
			case "GO":
				playAnimation("cheer", true, false, false);
		}
	}

	override function onAnimationFinished(prefix:String):Void
	{
		switch (prefix)
		{
			case "combo251":
				hasDanced = false;
				super.onAnimationFinished(prefix);

			default:
				super.onAnimationFinished(prefix);
		}
	}

}
