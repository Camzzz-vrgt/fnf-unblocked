--Script by Teniente Mantequilla#0139--
--Modified by Toast--

--change this ones--
local camMovement = 20
local velocity = 2
local scriptOn = true

--leave this ones alone--
local campointx = 0
local campointy = 0
local camlockx = 0
local camlocky = 0
local camlock = false
local bfturn = false

function onCreatePost( ... )
	campointx = getProperty('camFollow.x')
	campointy = getProperty('camFollow.y')
end

	
function onMoveCamera(focus)
	if scriptOn then
		if focus == 'boyfriend' then
		campointx = getProperty('camFollow.x')
		campointy = getProperty('camFollow.y')
		bfturn = true
		camlock = false
		setProperty('cameraSpeed', 1)
		
		elseif focus == 'dad' then
		campointx = getProperty('camFollow.x')
		campointy = getProperty('camFollow.y')
		bfturn = false
		camlock = false
		setProperty('cameraSpeed', 1)
		end
	end
end


function goodNoteHit(id, direction, noteType, isSustainNote)
	if scriptOn then
		if bfturn then
			if direction == 0 then
				camlockx = campointx - camMovement
				camlocky = campointy
			elseif direction == 1 then
				camlocky = campointy + camMovement
				camlockx = campointx
			elseif direction == 2 then
				camlocky = campointy - camMovement
				camlockx = campointx
			elseif direction == 3 then
				camlockx = campointx + camMovement
				camlocky = campointy
			end
		runTimer('camreset', 1)
		setProperty('cameraSpeed', velocity)
		camlock = true
		end	
	end
end

--teninete mantequilla was here--
		-- delete this if you dont want the oponent to move the camera
function opponentNoteHit(id, direction, noteType, isSustainNote)
	if scriptOn then
		if not bfturn then
			if direction == 0 then
				camlockx = campointx - camMovement
				camlocky = campointy
			elseif direction == 1 then
				camlocky = campointy + camMovement
				camlockx = campointx
			elseif direction == 2 then
				camlocky = campointy - camMovement
				camlockx = campointx
			elseif direction == 3 then
				camlockx = campointx + camMovement
				camlocky = campointy
			end
		--nice--
		runTimer('camreset', 1)
		setProperty('cameraSpeed', velocity)
		camlock = true
		end	
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'camreset' and scriptOn then
	camlock = false
	setProperty('cameraSpeed', 1)
	setProperty('camFollow.x', campointx)
	setProperty('camFollow.y', campointy)
	end
end

function onStepHit()
	if curStep == 1551 then
		scriptOn = false
	end
end

function onUpdate()
	if camlock and scriptOn then
	setProperty('camFollow.x', camlockx)
	setProperty('camFollow.y', camlocky)
	end
end
	-- cringe camera EWW --