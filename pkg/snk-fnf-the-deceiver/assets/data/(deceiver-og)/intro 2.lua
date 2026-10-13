function onCreate()
	setProperty('timeBar.visible', false)
	setProperty('timeBarBG.visible', false)
	setProperty('timeTxt.visible', false)

	setProperty('skipCountdown', true) --skips the countdown
end

function onCreatePost()
	setProperty('boyfriend.alpha', 0, 0.05);
	setProperty('iconP2.alpha', 0, 2, 'linear');
	doTweenAlpha('dadFadeEventTween', 'dad', 0, 1.5, 'linear');
end

function onBeatHit()

	if(curBeat == 32) then
		doTweenAlpha('dadFadeEventTween', 'dad', 1, 100, 'linear');
		setProperty('iconP2.alpha', 1, 1);

		noteTweenAlpha("NoteAlpha1", 0, 1, 100, 'linear')
        noteTweenAlpha("NoteAlpha2", 1, 1, 100, 'linear')
        noteTweenAlpha("NoteAlpha3", 2, 1, 100, 'linear')
        noteTweenAlpha("NoteAlpha4", 3, 1, 100, 'linear')
	end

	if(curBeat == 134) then
		doTweenAlpha('dadFadeEventTween', 'dad', 1, 1, 'linear');
		setProperty('iconP2.alpha', 1, 1);

		doTweenAlpha('leTweeneth', 'fraudBGshade', 1, 1);
		doTweenAlpha('leTweeneth2', 'Wall', 1, 1);
		doTweenAlpha('leTweeneth1', 'Floor', 1, 1);

		noteTweenAlpha("NoteAlpha1", 0, 1, 1, 'linear')
        noteTweenAlpha("NoteAlpha2", 1, 1, 1, 'linear')
        noteTweenAlpha("NoteAlpha3", 2, 1, 1, 'linear')
        noteTweenAlpha("NoteAlpha4", 3, 1, 1, 'linear')
		
		setProperty('boyfriend.alpha', 1, 1);
		setProperty('camHUD.alpha', 1, 1);

		setProperty('timeBar.visible', true)
		setProperty('timeBarBG.visible', true)
		setProperty('timeTxt.visible', true)
	end
end