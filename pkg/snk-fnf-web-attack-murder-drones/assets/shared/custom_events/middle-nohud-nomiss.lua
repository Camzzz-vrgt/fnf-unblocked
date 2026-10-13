local keepScroll = false
function onCreate()
setProperty('camHUD.visible',false)
setProperty('notes.cameras',true)
setProperty('strumLineNotes.cameras',true)
setProperty('gf.alpha', 0)
-- setProperty('grpNoteSplashes.cameras',true) idk how to fix this, they bug out
setProperty('doof.cameras',true)

setPropertyFromClass('GameOverSubstate', 'bf-backdead', 'defeatDeath'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'loss'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
	if getPropertyFromClass('ClientPrefs', 'middleScroll') == true then
		keepScroll = true;
	elseif getPropertyFromClass('ClientPrefs', 'middleScroll') == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', true);
	end
end

function onDestroy()
	if keepScroll == false then
		setPropertyFromClass('ClientPrefs', 'middleScroll', false);
	elseif keepScroll == true then
		keepScroll = false;
	end
end
function noteMiss(id, direction, noteType, isSustainNote)
setProperty('health', 0)
end
function noteMissPress(direction)
setProperty('health', 0)
end