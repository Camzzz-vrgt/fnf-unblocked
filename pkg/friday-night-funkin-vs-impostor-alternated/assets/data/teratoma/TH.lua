function onCreatePost()
    middle = getPropertyFromClass('ClientPrefs', 'middleScroll')
	if middle == false then
		for i = 0,7 do
			xValue = getPropertyFromGroup('strumLineNotes', i, 'x')
			if i < 3.5 then
				setPropertyFromGroup('strumLineNotes', i, 'x', xValue+9999)
			else
				setPropertyFromGroup('strumLineNotes', i, 'x', xValue-600)
			end
		end
	end
end

function onUpdate()
if canDodge == true and (keyJustPressed('space') or ((getMouseY('camHUD') > 593 and getMouseY('camHUD') < 720) and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and mouseClicked('left'))) then
Dodged = true
canDodge = false
end
end

function onCreatePost()
        setTextColor('scoreTxt','884709')
    end
function onStepHit()
        if curStep == 260 then
    runTimer('dodge', 0.8);
    canDodge = true
    Dodged = false
    
end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'dodge' and Dodged == true then
    Dodged = false
    elseif tag == 'dodge' and Dodged == false then
        setProperty('health', -100);
      
    end
end