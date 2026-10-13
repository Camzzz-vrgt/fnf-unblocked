local stageName = "/morning"
local stageName2 = "/noon"

--Cam Stuff
--Default Values
local dxx = 700
local dyy = 250
local dxx2 = 1400
local dyy2 = 250
--Current Cam Values, you can change these
local xx = 700
local yy = 150
local xx2 = 1400
local yy2 = 250
local ofs = 40
local followchars = true
local isFloating = true

function onCreate()
	makeLuaSprite('sky', 'bg' .. stageName .. stageName .. 'sky', -1200, -1200)
	makeLuaSprite('town', 'bg' .. stageName .. stageName .. 'town', -1200, -1200)
	makeLuaSprite('ground', 'bg' .. stageName .. stageName .. 'ground', -1200, -1200)
	makeLuaSprite('backdeco', 'bg' .. stageName .. stageName .. 'backdeco', -1200, -1200)
	makeLuaSprite('tents', 'bg' .. stageName .. stageName .. 'tents', -1200, -1200)
	
	makeLuaSprite('sky2', 'bg' .. stageName2 .. stageName2 .. 'sky', -1200, -1200)
	makeLuaSprite('town2', 'bg' .. stageName2 .. stageName2 .. 'town', -1200, -1200)
	makeLuaSprite('ground2', 'bg' .. stageName2 .. stageName2 .. 'ground', -1200, -1200)
	makeLuaSprite('backdeco2', 'bg' .. stageName2 .. stageName2 .. 'backdeco', -1200, -1200)
	makeLuaSprite('tents2', 'bg' .. stageName2 .. stageName2 .. 'tents', -1200, -1200)
	
	--bg chars
	makeLuaSprite('c0', 'bg/cameos/b3', -2300, 0)
	makeLuaSprite('c1', 'bg/cameos/b6', -2300, 0)
	--foreground
	makeLuaSprite('c2', 'bg/cameos/f1', -2300, 270)
	scaleObject('c2', 1.75, 1.75)
	--which ones flipped?
	--setProperty('c0.flipX', true)

	addLuaSprite('sky', false)
	addLuaSprite('town', false)
	addLuaSprite('ground', false)
	addLuaSprite('backdeco', false)
	addLuaSprite('tents', false)
	
	setProperty('sky2.alpha', 0)
	setProperty('town2.alpha', 0)
	setProperty('ground2.alpha', 0)
	setProperty('backdeco2.alpha', 0)
	setProperty('tents2.alpha', 0)
	
	scaleObject('sky', 1.5, 1.5)
	scaleObject('town', 1.5, 1.5)
	scaleObject('ground', 1.5, 1.5)
	scaleObject('backdeco', 1.5, 1.5)
	scaleObject('tents', 1.5, 1.5)
	
	addLuaSprite('sky2', false)
	addLuaSprite('town2', false)
	addLuaSprite('ground2', false)
	
	addLuaSprite('c0', false)
	addLuaSprite('c1', false)
	
	addLuaSprite('backdeco2', false)
	addLuaSprite('tents2', false)
	
	addLuaSprite('c2', true)
	
	scaleObject('sky2', 1.5, 1.5)
	scaleObject('town2', 1.5, 1.5)
	scaleObject('ground2', 1.5, 1.5)
	scaleObject('backdeco2', 1.5, 1.5)
	scaleObject('tents2', 1.5, 1.5)
end

function onEvent(name, val1, val2)
    if name == 'Griddy' then	--unique stage events go here
		griddy = tonumber(val1)	
		if griddy == 0 then --now its morning
			cameraFlash('hud', 'ffffff', 0.5, true)
			removeLuaSprite('sky')
			removeLuaSprite('town')
			removeLuaSprite('ground')
			removeLuaSprite('backdeco')
			removeLuaSprite('tents')
			setProperty('sky2.alpha', 1)
			setProperty('town2.alpha', 1)
			setProperty('ground2.alpha', 1)
			setProperty('backdeco2.alpha', 1)
			setProperty('tents2.alpha', 1)
		end
		if griddy == 1 then
			isFloating = false
			xx = dxx
			yy = dyy
		end
    end
	if name == 'Cameos' then --cameo shit
		who = tonumber(val1) --0, 1, 2 to pick which chars appear
		
		doTweenX('ye', 'c'..who, 2700, 15, 'linear')
	end
end

function onUpdate(elapsed)
	--Follow Cam Stuff LMAO
	if curStep >= 0 and isFloating then

		songPos = getSongPosition()

		local currentBeat = (songPos/1000)*(bpm/80)

		doTweenY('bwop', 'dad', -150+50*math.sin((currentBeat*0.25)*math.pi),0.01)

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