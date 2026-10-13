
-- Stuff for the part where he's sitting down
function onCreatePost()
	setProperty('camHUD.alpha', 0, 0.05);

	doTweenAlpha('leTweeneth2', 'Wall', 0, 0.05);
	doTweenAlpha('leTweeneth1', 'Floor', 0, 0.05);
end

function onStepHit()

	if curStep == 1 then
		setProperty('iconP1.alpha', 1, 5);
		setProperty('boyfriend.alpha', 1, 4);
		setProperty('camHUD.alpha', 0.7, 1);

		noteTweenAlpha("NoteAlpha1", 0, 0, 2, 'linear')
        noteTweenAlpha("NoteAlpha2", 1, 0, 2, 'linear')
        noteTweenAlpha("NoteAlpha3", 2, 0, 2, 'linear')
        noteTweenAlpha("NoteAlpha4", 3, 0, 2, 'linear')
	end

	if curBeat == 68 then
		doTweenAlpha('leTweeneth1', 'Wall', 1, 200);
		doTweenAlpha('leTweeneth2', 'Floor', 1, 200);
	end
end