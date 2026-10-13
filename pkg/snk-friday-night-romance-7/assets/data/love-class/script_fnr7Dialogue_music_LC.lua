local allowCountdown = false
local dialoguestarted = false

function onStartCountdown()

	if not allowCountdown and isStoryMode and not seenCutscene and not dialoguestarted then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.2);
		startVideo('fnr7-comic1')
		return Function_Stop;
	end

	if not allowCountdown and isStoryMode and not seenCutscene and dialoguestarted then
		allowCountdown = true;
		return Function_Stop;
	end
	
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
		startDialogue('dialogue', '');
		dialoguestarted = true;
	end
end


function onNextDialogue(line)

	if line == 2 then
		playMusic('dialogue-lc', 1, true);
	end

end


function onSkipDialogue(count)
	
end