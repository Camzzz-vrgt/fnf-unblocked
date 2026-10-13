local p1y;
local p2y;

function onCreate()
	setProperty('skipCountdown', true) --skips the countdown
end

function onCreatePost()
	p1x = defaultOpponentX;
	p2x = defaultBoyfriendX;

	doTweenX('stanTweenX1', 'dad', 900, 0.05, 'linear')
	doTweenX('enterPl', 'boyfriendGroup', p2x - 350, 0.05, 'quadOut');
	setProperty("dad.alpha", 0);
	cameraFlash('other', '000000', '8')

	doTweenAlpha('leTweeneth2', 'Wall', 0, 0.05);
	doTweenAlpha('leTweeneth1', 'Floor', 0, 0.05);
end

-- the guy appears !!

function onStepHit()
	if curStep == 1 then
		doTweenAlpha('leTweeneth2', 'Wall', 1, 8);
		doTweenAlpha('leTweeneth1', 'Floor', 1, 8);
	end

	if curBeat == 16 then
		setProperty("dad.alpha", 1);
		doTweenAlpha('hudTween', 'camHUD', 1, 0.05, 'linear')
	end

	if curBeat == 144 then
		doTweenAlpha('leTweeneth2', 'Wall', 0, 25);
		doTweenAlpha('leTweeneth1', 'Floor', 0, 25);
		doTweenAlpha('dadFadeEventTween', 'dad', 0, 25, 'linear');
		
		noteTweenAlpha("NoteAlpha1", 0, 0, 25, 'linear')
        noteTweenAlpha("NoteAlpha2", 1, 0, 25, 'linear')
        noteTweenAlpha("NoteAlpha3", 2, 0, 25, 'linear')
        noteTweenAlpha("NoteAlpha4", 3, 0, 25, 'linear')
	end
end