local stageName = "/night"

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
local isFloating = true
whotf = 'bf'

function onCreate()
	makeLuaSprite('sky', 'bg' .. stageName .. stageName .. 'sky', -1200, -1200)
	makeLuaSprite('town', 'bg' .. stageName .. stageName .. 'town', -1200, -1200)
	makeLuaSprite('ground', 'bg' .. stageName .. stageName .. 'ground', -1200, -1200)
	makeLuaSprite('backdeco', 'bg' .. stageName .. stageName .. 'backdeco', -1200, -1200)
	makeLuaSprite('tents', 'bg' .. stageName .. stageName .. 'tents', -1200, -1200)
	makeLuaSprite('lanterns', 'bg' .. stageName .. stageName .. 'laterns', -1200, -1200)
	
	scaleObject('sky', 1.5, 1.5)
	scaleObject('town', 1.5, 1.5)
	scaleObject('ground', 1.5, 1.5)
	scaleObject('backdeco', 1.5, 1.5)
	scaleObject('tents', 1.5, 1.5)
	scaleObject('lanterns', 1.5, 1.5)
	
	--bg chars
	makeLuaSprite('c0', 'bg/cameos/b2', -2300, 0)
	makeLuaSprite('c1', 'bg/cameos/b5', -2300, 0)
	--foreground
	makeLuaSprite('c2', 'bg/cameos/f2', -2300, 270)
	makeLuaSprite('c3', 'bg/cameos/f3', -2300, 270)
	scaleObject('c2', 1.75, 1.75)
	scaleObject('c3', 1.75, 1.75)
	--which ones flipped?
	--setProperty('c0.flipX', true)

	addLuaSprite('sky', false)
	addLuaSprite('lanterns', false)
	addLuaSprite('town', false)
	addLuaSprite('ground', false)
	
	addLuaSprite('c0', false)
	addLuaSprite('c1', false)
	
	addLuaSprite('backdeco', false)
	addLuaSprite('tents', false)
	
	addLuaSprite('c2', true)
	addLuaSprite('c3', true)
end

function onEvent(name,value1,value2)
	if name == 'Change Character' then
		what = tostring(value2)
		whotf = what
		cameraFlash('other', 'FFFFFF', 0.5, true)
	end
	
	if name == 'Cameos' then --cameo shit
		who = tonumber(value1) --0, 1, 2 to pick which chars appear
		
		doTweenX('ye', 'c'..who, 2700, 15, 'linear')
	end
end

function onUpdate(elapsed)
	--Follow Cam Stuff LMAO
	
	if curStep >= 0 and isFloating then

		songPos = getSongPosition()

		local currentBeat = (songPos/1000)*(bpm/80)

		doTweenY('bwop', 'lanterns', -500-20*math.sin((currentBeat*0.25)*math.pi),0.01)

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

function opponentNoteHit(i,d,t,s)
	if whotf == 'hank' then
		triggerEvent('Screen Shake','0.1,0.005','0,0')
	end
end
