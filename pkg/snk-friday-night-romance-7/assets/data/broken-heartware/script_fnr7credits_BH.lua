local allowCountdown = false--dialogue stuff
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then
        playSound('sfx_brokenglitch', 1);
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then
		startDialogue('dialogue', 'dialogue-bh');
	end
end

function onNextDialogue(count)

end

function onSkipDialogue(count)

end


function onEndSong()
	if not allowEnd and isStoryMode then
        --the amazing people that worked here <3333
		startVideo('FNR7credits');--You have to watch it full, cry abt it
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
end