import funkin.play.PlayState;
import funkin.play.notes.notekind.NoteKind;
import funkin.Conductor;
import funkin.play.notes.NoteSplash;
import funkin.play.notes.NoteSprite;
import funkin.play.notes.Strumline;
import funkin.data.notestyle.NoteStyleRegistry;
import flixel.util.FlxTimer;

using StringTools;

class FuckUpNoteKind extends NoteKind
{
	function new()
	{
		super("Fuck Up", "Fuck Up", "fuckup", [
			{
				name: "Custom Anim",
				description: "Custom Anim Name",
				type: "String",
				data: {
					defaultValue: ""
				}
			},
			{
				name: "valMin",
				description: "MinRandomTime",
				type: "Float",
				data: {
					min: -0.3,
					max: 0.3,
					step: 0.01,
					precision: 2,
					defaultValue: 0.1
				}
			},
			{
				name: "valMax",
				description: "MaxRandomTime",
				type: "Float",
				data: {
					min: -0.3,
					max: 0.3,
					step: 0.01,
					precision: 2,
					defaultValue: 0.2
				}
			},
			{
				name: "holdTimer",
				description: "hold Timer",
				type: "Float",
				data: {
					min: 0.0,
					max: 12,
					step: 0.1,
					precision: 2,
					defaultValue: 0
				}
			},
			{
				name: "conOrPress",
				description: "Confirm or Press",
				type: "Int",
				data: {
					min: 0,
					max: 1,
					step: 1,
					precision: 0,
					defaultValue: 1
				}
			},
			{
				name: "sex",
				description: "Reddit Mode",
				type: "Bool",
				data: {
					defaultValue: false
				}
			}
		]);
		this.scoreable = false;
	}

	override function onNoteHit(event:NoteScriptEvent)
	{
		event.cancel();
		super.onNoteHit(event);
	}

	function playForcedAnimRandom()
	{
	}

	override function onNoteMiss(event)
	{
		super.onNoteMiss(event);
	}

	override function onUpdate(event:UpdateScriptEvent)
	{
		super.onUpdate(event);
	}

	override function onNoteIncoming(event:NoteScriptEvent)
	{
		FlxTimer.wait(((event.note.strumTime - Conductor.instance.songPosition) / 1000)
			- FlxG.random.float(event.note.getParam("valMin") ?? 0.1, event.note.getParam("valMax") ?? 0.2),
			() ->
			{
				var pPress:Bool = ((event.note.getParam("conOrPress") ?? 1) == 1);

				var strumline = event.note.noteData.getMustHitNote()
					? PlayState.instance.playerStrumline
					: PlayState.instance.opponentStrumline;
				// 0.8.5 removed the legacy third `hitNote` argument.
				strumline.hitNote(event.note, false);
				if (!pPress)
					strumline.playPress(event.note.direction);

				var customAnim:String = event.note.getParam("Custom Anim");
				if (customAnim != null && customAnim.trim() != "")
				{
					var char = PlayState.instance?.currentStage?.getDad();
					if (event.note.noteData.getMustHitNote())
						char = PlayState.instance?.currentStage?.getBoyfriend();

					event.note.noAnimation = true;
					if (char != null)
					{
						// The legacy kind explicitly releases a previous forced
						// animation before starting the authored fake-note pose.
						char.canPlayOtherAnims = true;
						char.playAnimation(customAnim, true, true);
						char.holdTimer = -(event.note.getParam("holdTimer") ?? 0);
					}
				}
			});
		var customAnim:String = event.note.getParam("Custom Anim");
		if (customAnim != null && customAnim.trim() != "")
		{
			event.note.noAnimation = true;
		}

		if (event.note.noteData.getMustHitNote())
			event.note.hasBeenHit = true;
		super.onNoteIncoming(event);
	}
}
