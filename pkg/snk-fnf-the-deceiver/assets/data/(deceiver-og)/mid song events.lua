function onBeatHit()

	if(curBeat == 136) then
		setProperty('hand.visible', true);
		setProperty('Stan.visible', true);
	end

	if(curBeat == 195) then
		doTweenAlpha('leTweeneth1', 'Wall', 0, 0.05);
		doTweenAlpha('leTweeneth2', 'Floor', 0, 0.05);
		doTweenAlpha('dadFadeEventTween', 'dad', 0, 0.05, 'linear');
		setProperty('iconP2.alpha', 0, 0.05);
		
		noteTweenAlpha("NoteAlpha1", 0, 0, 0.05, 'linear')
        noteTweenAlpha("NoteAlpha2", 1, 0, 0.05, 'linear')
        noteTweenAlpha("NoteAlpha3", 2, 0, 0.05, 'linear')
        noteTweenAlpha("NoteAlpha4", 3, 0, 0.05, 'linear')

		doTweenAlpha('Stanhand', 'Stan', 0, 0.05);
		doTweenAlpha('Stan', 'hand', 0, 0.05);
	end

	if(curBeat == 196) then
		doTweenAlpha('leTweeneth1', 'Wall', 0.2, 0.3);
		doTweenAlpha('leTweeneth2', 'Floor', 0.2, 0.3);

		doTweenAlpha('dadFadeEventTween', 'dad', 0.2, 0.3, 'linear');
		setProperty('iconP2.alpha', 0.2, 0.3);
		
		noteTweenAlpha("NoteAlpha1", 0, 0.2, 0.3, 'linear')
        noteTweenAlpha("NoteAlpha2", 1, 0.2, 0.3, 'linear')
        noteTweenAlpha("NoteAlpha3", 2, 0.2, 0.3, 'linear')
        noteTweenAlpha("NoteAlpha4", 3, 0.2, 0.3, 'linear')

		doTweenAlpha('Stanhand', 'Stan', 0.2, 0.3);
		doTweenAlpha('Stan', 'hand', 0.2, 0.3);
	end

	if(curBeat == 197) then
		doTweenAlpha('leTweeneth1', 'Wall', 0.5, 0.3);
		doTweenAlpha('leTweeneth2', 'Floor', 0.5, 0.3);

		doTweenAlpha('dadFadeEventTween', 'dad', 0.5, 0.3, 'linear');
		setProperty('iconP2.alpha', 0.5, 0.3);
		
		noteTweenAlpha("NoteAlpha1", 0, 0.5, 0.3, 'linear')
        noteTweenAlpha("NoteAlpha2", 1, 0.5, 0.3, 'linear')
        noteTweenAlpha("NoteAlpha3", 2, 0.5, 0.3, 'linear')
        noteTweenAlpha("NoteAlpha4", 3, 0.5, 0.3, 'linear')

		doTweenAlpha('Stanhand', 'Stan', 0.5, 0.3);
		doTweenAlpha('Stan', 'hand', 0.5, 0.3);
	end

	if(curBeat == 199) then
		doTweenAlpha('leTweeneth1', 'Wall', 0.7, 0.3);
		doTweenAlpha('leTweeneth2', 'Floor', 0.7, 0.3);

		doTweenAlpha('dadFadeEventTween', 'dad', 0.7, 0.3, 'linear');
		setProperty('iconP2.alpha', 0.7, 0.3);
		
		noteTweenAlpha("NoteAlpha1", 0, 0.7, 0.3, 'linear')
        noteTweenAlpha("NoteAlpha2", 1, 0.7, 0.3, 'linear')
        noteTweenAlpha("NoteAlpha3", 2, 0.7, 0.3, 'linear')
        noteTweenAlpha("NoteAlpha4", 3, 0.7, 0.3, 'linear')

		doTweenAlpha('Stanhand', 'Stan', 0.7, 0.3);
		doTweenAlpha('Stan', 'hand', 0.7, 0.3);
	end

	if(curBeat == 200) then
		doTweenAlpha('leTweeneth1', 'Wall', 1, 0.3);
		doTweenAlpha('leTweeneth2', 'Floor', 1, 0.3);

		doTweenAlpha('dadFadeEventTween', 'dad', 1, 0.3, 'linear');
		setProperty('iconP2.alpha', 1, 0.3);
		
		noteTweenAlpha("NoteAlpha1", 0, 1, 0.3, 'linear')
        noteTweenAlpha("NoteAlpha2", 1, 1, 0.3, 'linear')
        noteTweenAlpha("NoteAlpha3", 2, 1, 0.3, 'linear')
        noteTweenAlpha("NoteAlpha4", 3, 1, 0.3, 'linear')

		setProperty('Ralph.visible', true);

		doTweenAlpha('Stanhand', 'Stan', 1, 0.3);
		doTweenAlpha('Stan', 'hand', 1, 0.3);
	end

	if(curBeat == 263) then
		doTweenAlpha('leTweeneth1', 'Wall', 0, 0.25);
		doTweenAlpha('leTweeneth2', 'Floor', 0, 0.25);

		doTweenAlpha('dadFadeEventTween', 'dad', 0, 0.25, 'linear');
		setProperty('iconP2.alpha', 0, 0.25);
		setProperty('boyfriend.alpha', 0.4, 0.25);
		setProperty('camHUD.alpha', 0, 0.25);

		doTweenAlpha('Ralph', 'Ralph', 0, 0.25);
		doTweenAlpha('Stanhand', 'Stan', 0, 0.25);
		doTweenAlpha('Stan', 'hand', 0, 0.25);
	end

	if(curBeat == 264) then
		setProperty('Wall2.visible', true);
		setProperty('Floor2.visible', true);

		setProperty('Wall.visible', false);
		setProperty('Floor.visible', false);

		setProperty('Stan.visible', false);

		doTweenAlpha('dadFadeEventTween', 'dad', 1, 0.05, 'linear');
		setProperty('iconP2.alpha', 1, 0.05);
		setProperty('boyfriend.alpha', 1, 0.05);
		setProperty('camHUD.alpha', 1, 0.5);
	end

	if(curBeat == 328) then
		doTweenAlpha('leTweeneth3', 'Wall2', 0, 0.05);
		doTweenAlpha('leTweeneth4', 'Floor2', 0, 0.05);
		
		setProperty('timeBar.visible', false)
		setProperty('timeBarBG.visible', false)
		setProperty('timeTxt.visible', false)

		doTweenAlpha('dadFadeEventTween', 'dad', 0, 0.05, 'linear');

		noteTweenAlpha("NoteAlpha1", 0, 0, 0.05, 'linear')
        noteTweenAlpha("NoteAlpha2", 1, 0, 0.05, 'linear')
        noteTweenAlpha("NoteAlpha3", 2, 0, 0.05, 'linear')
        noteTweenAlpha("NoteAlpha4", 3, 0, 0.05, 'linear')
	end

	if(curBeat == 359) then
		doTweenAlpha('dadFadeEventTween', 'dad', 0.5, 1, 'linear');

		noteTweenAlpha("NoteAlpha1", 0, 0.5, 1, 'linear')
        noteTweenAlpha("NoteAlpha2", 1, 0.5, 1, 'linear')
        noteTweenAlpha("NoteAlpha3", 2, 0.5, 1, 'linear')
        noteTweenAlpha("NoteAlpha4", 3, 0.5, 1, 'linear')
	end

	if(curBeat == 390) then
		doTweenAlpha('dadFadeEventTween', 'dad', 1, 0.5, 'linear');
		
		noteTweenAlpha("NoteAlpha1", 0, 1, 1, 'linear')
        noteTweenAlpha("NoteAlpha2", 1, 1, 1, 'linear')
        noteTweenAlpha("NoteAlpha3", 2, 1, 1, 'linear')
        noteTweenAlpha("NoteAlpha4", 3, 1, 1, 'linear')
	end

	if(curBeat == 392) then
		setProperty('timeBar.visible', true)
		setProperty('timeBarBG.visible', true)
		setProperty('timeTxt.visible', true)
		doTweenAlpha('dadFadeEventTween', 'dad', 1, 1, 'linear');

		doTweenAlpha('leTweeneth3', 'Wall2', 1, 0.05);
		doTweenAlpha('leTweeneth4', 'Floor2', 1, 0.05);


		doTweenAlpha('Ralph', 'Ralph', 1, 0.05);
		doTweenAlpha('Stanhandomfg', 'hand', 1, 0.05);

		setProperty('Stan2.visible', true);
	end

	if(curBeat == 424) then
		doTweenAlpha('leTweeneth3', 'Wall2', 0.5, 0.05);
		doTweenAlpha('leTweeneth4', 'Floor2', 0.5, 0.05);
	end

	if(curBeat == 425) then
		doTweenAlpha('leTweeneth3', 'Wall2', 1, 0.05);
		doTweenAlpha('leTweeneth4', 'Floor2', 1, 0.05);
	end

	if(curBeat == 456) then
		doTweenAlpha('leTweeneth3', 'Wall2', 0, 2);
		doTweenAlpha('leTweeneth4', 'Floor2', 0, 2);

		doTweenAlpha('Ralph', 'Ralph', 0, 2);
		doTweenAlpha('Stanhandomfg', 'hand', 0, 2);
		doTweenAlpha('Stan2', 'Stan2', 0, 2);
	end

	if(curBeat == 460) then
		doTweenAlpha('dadFadeEventTween', 'dad', 0, 0.05, 'linear');
		setProperty('boyfriend.alpha', 0, 0.05);
	end
end