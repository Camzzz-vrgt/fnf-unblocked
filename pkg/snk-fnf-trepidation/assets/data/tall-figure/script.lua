local allowCountdown = false
local waitThing = false
local confirmed = 0

function onCreate()
	addCharacterToList('yeet', 'gf')
	precacheImage('mods/images/characters/yeet')
	setPropertyFromClass('GameOverSubstate', 'characterName', 'slenderdeath');
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx');
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver');
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd');
	setProperty("static.alpha", 0);
	setProperty("jumpywumpy.alpha", 0);
end
function onStartCountdown()
	if not waitThing and isStoryMode then --Block the first countdown
		startVideo('slender');
		waitThing = true
		allowCountdown = true
		return Function_Stop;
	end

	if isStoryMode and not allowCountdown then
		return Function_Stop
	end
	if isStoryMode and allowCountdown then
		return Function_Continue
	end
	return Function_Continue;
end
function onStepHit()
    if curStep == 1 then
		doTweenX('slender1', 'slender1', 0, 0.5, "quartInOut")
	end
	if curStep == 18 then
		doTweenAlpha('slender1', 'slender1', 0, 1, "quartInOut")
    end
end