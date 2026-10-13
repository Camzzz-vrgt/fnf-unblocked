import funkin.play.character.MultiAnimateAtlasCharacter;
import funkin.play.character.CharacterType;
import funkin.modding.module.ModuleHandler;

/**
 * Restores the legacy BF note-kind mappings using the 0.8.5 scripted
 * character entry point.  In particular, `cheer` is BF's HEY animation and
 * `stop bope` releases the forced fake-note animation in Bopeebo.
 */
class BoyfriendCharacter extends MultiAnimateAtlasCharacter
{
	function new()
	{
		super('bf');
	}

	function onCreate(event)
	{
		super.onCreate(event);
		// Legacy lets the stop-bope down note interrupt the forced fake-note
		// animation. Without this exception, its face can remain on the wrong
		// Animate frame until a later animation replaces it.
		if (!ignoreExclusionPref.contains('singDOWN')) ignoreExclusionPref.push('singDOWN');
	}

	function initHealthIcon(isOpponent:Bool)
	{
		var icon = super.initHealthIcon(isOpponent);
		// Animania's atlas uses basic0 / basic-to-lose0 rather than V-Slice's
		// default idle / toLosing prefixes.
		return ModuleHandler.getModule('AnimaniaStuff').scriptCall('makeAmTakeAnimatedIcon', [icon, !isOpponent]);
	}

	function onNoteHit(event:HitNoteScriptEvent)
	{
		if (event == null || event.eventCanceled || event.note == null) return;

		if (event.note.kind == 'stop bope')
		{
			canPlayOtherAnims = true;
			playAnimation('singDOWN', true, true);
			return;
		}

		if (!event.note.noteData.getMustHitNote() || characterType != CharacterType.BF) return;
		if (event.note.noAnimation || event.note.kind == 'solotime' || event.note.kind == 'noAnimation' || event.note.kind == 'noanim') return;

		if (event.note.holdNoteSprite != null) lastHoldFinish = event.note.strumTime + event.note.noteData.length;
		holdTimer = 0;

		switch (event.note.kind)
		{
			case 'beatbox':
				playSingAnimation(event.note.noteData.getDirection(), false, 'beatbox');
			case 'blush':
				playSingAnimation(event.note.noteData.getDirection(), false, 'blush');
			case 'mom':
				playSingAnimation(event.note.noteData.getDirection(), false, 'alt');
			case 'fresh':
				playSingAnimation(event.note.noteData.getDirection(), false, 'fresh');
			case 'cheer':
				playAnimation('hey', true, false);
			case 'cheer-alt':
				playAnimation('cheer-alt', true, false);
			case 'erect-up':
				playAnimation('erect up', true, false);
			default:
				playSingAnimation(event.note.noteData.getDirection(), false);
		}
	}
}
