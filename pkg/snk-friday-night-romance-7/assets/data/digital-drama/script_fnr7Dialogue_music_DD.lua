local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
		startDialogue('dialogue', '');
	end
end

function onNextDialogue(line)
	if line == 5 then
		playMusic('dialogue-dd', 1, true);		
	end

	if line == 6 then
		playSound('ANGRY_TEXT_BOX', 1);
		cameraShake('hud', 0.005, 1);
	end

	if line == 8 then
		cameraShake('hud', 0.001, 2.5);
	end

end

function onSkipDialogue(count)
	
end