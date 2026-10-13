local allowCountdown = false
function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'charlesDialogue');
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

local allowEnd = false

function onEndSong()
 if not allowEnd and isStoryMode and not seenCutscene then
  setProperty('inCutscene', true);
  startDialogue('enddialogue', 'charlesDialogue');
  setProperty('healthBar.visible', false)
  setProperty('healthBarBG.visible', false)
  setProperty('scoreTxt.visible', false)
  setProperty('iconP1.visible', false)
  setProperty('iconP2.visible', false)
  allowEnd = true;
  return Function_Stop;
 end
 return Function_Continue;
end