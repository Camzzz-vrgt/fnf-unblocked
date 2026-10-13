local stageName = "/scary"

--Cam Stuff
--Default Values
local dxx = 700
local dyy = 250
local dxx2 = 1400
local dyy2 = 250
--Current Cam Values, you can change these
local xx = 700
local yy = 250
local xx2 = 1400
local yy2 = 250
local ofs = 40
local followchars = true
local isFloating = false

function onCreate()
	makeLuaSprite('sky', 'bg' .. stageName .. stageName .. 'sky', -1200, -1200)
	makeLuaSprite('town', 'bg' .. stageName .. stageName .. 'town', -1200, -1200)
	makeLuaSprite('ground', 'bg' .. stageName .. stageName .. 'ground', -1200, -1200)
	makeLuaSprite('backdeco', 'bg' .. stageName .. stageName .. 'backdeco', -1200, -1200)
	makeLuaSprite('tents', 'bg' .. stageName .. stageName .. 'tents', -1200, -1200)
	
	makeLuaSprite('darkbg', 'bg/black', -1200, -1200)
	
	scaleObject('sky', 1.5, 1.5)
	scaleObject('town', 1.5, 1.5)
	scaleObject('ground', 1.5, 1.5)
	scaleObject('backdeco', 1.5, 1.5)
	scaleObject('tents', 1.5, 1.5)
	
	scaleObject('darkbg', 3.0, 3.0)
	
	--bg chars
	makeLuaSprite('c0', 'bg/cameos/b4', -2300, 0)
	--foreground
	makeLuaSprite('c1', 'bg/cameos/f4', -2300, 270)
	makeLuaSprite('c2', 'bg/cameos/f5', -2300, 270)
	makeLuaSprite('c3', 'bg/cameos/f6', -2300, 270)
	scaleObject('c1', 1.75, 1.75)
	scaleObject('c2', 1.75, 1.75)
	scaleObject('c3', 1.75, 1.75)
	--which ones flipped?
	--setProperty('c0.flipX', true)

	addLuaSprite('sky', false)
	addLuaSprite('town', false)
	addLuaSprite('ground', false)
	
	addLuaSprite('c0', false)
	
	addLuaSprite('backdeco', false)
	addLuaSprite('tents', false)
	
	setProperty('darkbg.alpha', 0)
	addLuaSprite('darkbg', false)
	
	addLuaSprite('c1', true)
	addLuaSprite('c2', true)
	addLuaSprite('c3', true)
end

function onEvent(name, value1, value2)
	if name == 'Cameos' then --cameo shit
		who = tonumber(value1) --0, 1, 2 to pick which chars appear
		
		doTweenX('ye', 'c'..who, 2700, 15, 'linear')
	end
	
	if name == 'Change Scene' then
		scene = tonumber(value1)
		
		if scene == 0 then
			doTweenAlpha('ye', 'darkbg', 0.9, 5, 'linear')
		end
		if scene == 1 then
			setProperty('darkbg.alpha', 0)
		end
	end
	
	if name == 'Gold Transform' then --events BS
		state = tonumber(value1)
		
		if state == 1 then
			cameraFlash('other', 'FFFFFF', 0.3, true)
			setProperty('sky.alpha', 0)
			setProperty('town.alpha', 0)
			setProperty('ground.alpha', 0)
			setProperty('backdeco.alpha', 0)
			setProperty('tents.alpha', 0)
			setProperty('dad.alpha', 0)
			triggerEvent('Change Character','bf','connie_flippedplayable')
			setProperty('boyfriend.x', 300)
			xx = 900
			yy = 180
			xx2 = 700
			yy2 = 300
			if not middlescroll then
				noteTweenX('bfTween1', 4, 90, 0.3, 'linear')
				noteTweenX('bfTween2', 5, 205, 0.3, 'linear')
				noteTweenX('bfTween3', 6, 315, 0.3, 'linear')
				noteTweenX('bfTween4', 7, 425, 0.3, 'linear')
				noteTweenX('dadTween1', 0, -150, 0.3, 'linear')
				noteTweenX('dadTween2', 1, -150, 0.3, 'linear')
				noteTweenX('dadTween3', 2, -150, 0.3, 'linear')
				noteTweenX('dadTween4', 3, -150, 0.3, 'linear')
			end
		end
		if state == 2 then
			cameraFlash('other', 'FFFFFF', 0.3, true)
			setProperty('sky.alpha', 1)
			setProperty('town.alpha', 1)
			setProperty('ground.alpha', 1)
			setProperty('backdeco.alpha', 1)
			setProperty('tents.alpha', 1)
			setProperty('dad.alpha', 1)
			setProperty('boyfriend.x', 1270)
			xx = dxx
			yy = dyy
			xx2 = dxx2
			yy2 = dyy2
			triggerEvent('Change Character','bf','connie')
			triggerEvent('Change Character','dad','exe')
			if not middlescroll then
				noteTweenX('bfTween1', 4, 730, 0.3, 'linear')
				noteTweenX('bfTween2', 5, 845, 0.3, 'linear')
				noteTweenX('bfTween3', 6, 955, 0.3, 'linear')
				noteTweenX('bfTween4', 7, 1065, 0.3, 'linear')
				noteTweenX('dadTween1', 0, 90, 0.3, 'linear')
				noteTweenX('dadTween2', 1, 205, 0.3, 'linear')
				noteTweenX('dadTween3', 2, 315, 0.3, 'linear')
				noteTweenX('dadTween4', 3, 425, 0.3, 'linear')
			end
		end
	end
end

function onUpdate(elapsed)
	--Follow Cam Stuff LMAO
	
	if curStep >= 0 and isFloating then

		songPos = getSongPosition()

		local currentBeat = (songPos/1000)*(bpm/80)

		doTweenY('bwop', 'dad', -30+50*math.sin((currentBeat*0.25)*math.pi),0.01)

	end
  
     if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
	else
        triggerEvent('Camera Follow Pos','','')
	end
end