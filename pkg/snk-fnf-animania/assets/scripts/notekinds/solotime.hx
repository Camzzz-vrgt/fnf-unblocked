import funkin.play.PlayState;
import funkin.play.notes.notekind.NoteKind;
import funkin.Conductor;
import funkin.play.notes.NoteSplash;
import funkin.play.notes.NoteSprite;
import funkin.play.notes.Strumline;
import funkin.data.notestyle.NoteStyleRegistry;

class SoloTimeNoteKind extends NoteKind
{
	function new()
	{
		super("solotime", "SoloTime Note", "solotime", []);
		this.scoreable = false;
	}

	override function onNoteHit(event:NoteScriptEvent)
	{
		if (PlayState.instance != null)
			PlayState.instance.songScore += 800;
		if (event.doesNotesplash)
			createCustomSplash(event.note);
		event.doesNotesplash = false;
		super.onNoteHit(event);
	}

	override function onNoteMiss(event)
	{
		event.cancel();
		return;
	}

	function createCustomSplash(note)
	{
		var splash = constructNoteSplash(note);
		if (splash != null)
		{
			splash.allowAttachment = true;
			splash.objToAttach = PlayState.instance.playerStrumline.strumlineNotes.members[note.noteData.getDirection()];
			splash.play(note.noteData.getDirection(), null, PlayState.instance.playerStrumline.strumlineScale);
		}
	}

	function constructNoteSplash(note):NoteSplash
	{
		// This style used to be excluded with the legacy assets.  Resolve it when
		// the note is hit so a missing style can never construct NoteSplash(null).
		var soloType = NoteStyleRegistry.instance.fetchEntry("solotime");
		if (soloType == null) soloType = NoteStyleRegistry.instance.fetchEntry("funkin");
		if (soloType == null) return null;

		var result = new NoteSplash(soloType);
		result.zIndex = 355;
		result.allowAttachment = false;
		result.attachFunc = obj ->
		{
			result.x = (obj.x
				+ obj.width / 2)
				- result.width / 2
				- soloType.getNoteSplashOffsets()[0] * PlayState.instance.playerStrumline.strumlineScale.x;
			result.y = (obj.y
				+ obj.height / 2)
				- result.height / 2
				- soloType.getNoteSplashOffsets()[1] * PlayState.instance.playerStrumline.strumlineScale.y;
		};
		PlayState.instance.playerStrumline.add(result);
		return result;
	}

	var timeLeft:Float = 0;
	var appearTime:Float = 500; // время появления в мс

	override function onUpdate(event:UpdateScriptEvent)
	{
		for (note in getNotes())
			note.alpha = (Math.min(Math.max(1 - ((note.strumTime - Conductor.instance.songPosition) / appearTime), 0), 1) * 3) - .25;

		super.onUpdate(event);
	}

	override function onNoteIncoming(event:NoteScriptEvent)
	{
		if (event.note.noteData.kind == "solotime")
		{
			event.note.noAnimation = true;
			event.note.alpha *= .75;
		}
		super.onNoteIncoming(event);
	}
}
