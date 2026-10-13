local stageName = "/prime"

--Cam Stuff
--Default Values
local dxx = 700
local dyy = 180
local dxx2 = 1400
local dyy2 = 250
--Current Cam Values, you can change these
local xx = 700
local yy = 180
local xx2 = 1400
local yy2 = 250
local ofs = 40
local followchars = true
local isFloating = true

local cantdie = false
local vido = true

function onCreate()
	setProperty('camHUD.alpha', 0)
	
	precacheImage('characters/conniescared')
	precacheImage('characters/conniemad')
	precacheImage('characters/SIDE_PRIME')
	precacheImage('characters/SIDE_CONNIE')
	precacheImage('characters/primeholdup')
	precacheImage('characters/PRIME-Sad')
	precacheImage('characters/PRIME-Unmasked')
	precacheImage('characters/PRIME')
	precacheImage('bg/prime/connieholdup')
	
	makeLuaSprite('sky', 'bg' .. stageName .. stageName .. 'sky', -1200, -1400)
	makeLuaSprite('ground', 'bg' .. stageName .. stageName .. 'ground', -1200, -1400)
	makeLuaSprite('sky_wide', 'bg' .. stageName .. stageName .. 'sky_wide', -1200, -800)
	makeLuaSprite('ground_wide', 'bg' .. stageName .. stageName .. 'ground_wide', -1200, -800)
	makeLuaSprite('whitebg', 'bg' .. stageName .. '/whitebg', -1200, -1400)
	makeLuaSprite('fuckinwhite', 'bg' .. stageName .. '/whitebg', -1200, -1400)
	makeLuaSprite('redbg', 'bg' .. stageName .. '/redbg', -1200, -1400)
	makeLuaSprite('purpbg', 'purpbg', -1200, -1400)
	makeLuaSprite('actuallywhite', 'bg' .. stageName .. '/whitebg', 0, 0)
	
	makeLuaSprite('fuckass','',0,0)
	addLuaSprite('fuckass', false)

	--anime shit
	makeAnimatedLuaSprite('anime_linear', 'anime_linear', 0, 0)
   	addAnimationByPrefix('anime_linear', 'anime_linear', 'anime_linear', 24, true)
	addLuaSprite('anime_linear',true)
	setObjectCamera('anime_linear','hud')
	scaleObject('anime_linear',1.1,1.1)
	setBlendMode('anime_linear','multiply')

	makeAnimatedLuaSprite('anime_radial', 'anime_radial', 0, 0)
    addAnimationByPrefix('anime_radial', 'anime_radial', 'anime_radial', 24, true)
	addLuaSprite('anime_radial',true)
	setObjectCamera('anime_radial','hud')
	scaleObject('anime_radial',1.1,1.1)
	setBlendMode('anime_radial','multiply')
	setProperty('anime_radial.alpha',0.001)
	setProperty('anime_linear.alpha',0.001)
	playAnim('anime_linear','anime_linear',true)
	playAnim('anime_radial','anime_radial',true)

	makeAnimatedLuaSprite('connieheld', 'bg/prime/connieholdup', 700, -240)
    addAnimationByPrefix('connieheld', 'idle', 'connie idle', 24, false)
	
	setProperty('connieheld.alpha', 0)
	setProperty('whitebg.alpha', 0)
	setProperty('purpbg.alpha', 0)
	setProperty('redbg.alpha', 0)
	setProperty('fuckinwhite.alpha', 0)
	setProperty('actuallywhite.alpha', 0)
	
	scaleObject('sky', 1.5, 1.5)
	scaleObject('ground', 1.5, 1.5)
	scaleObject('whitebg', 1.5, 1.5)
	scaleObject('redbg', 1.5, 1.5)
	scaleObject('purpbg', 1.5, 1.5)
	scaleObject('sky_wide', 0.9, 0.9)
	scaleObject('ground_wide', 0.9, 0.9)
	scaleObject('fuckinwhite', 1.5, 1.5)
	
	setObjectCamera('actuallywhite', 'other')	

	addLuaSprite('sky_wide', false)
	addLuaSprite('ground_wide', false)
	addLuaSprite('sky', false)
	addLuaSprite('ground', false)
	addLuaSprite('redbg', false)
	addLuaSprite('purpbg', false)
	addLuaSprite('whitebg', false)
	addLuaSprite('connieheld', true)
	
	addLuaSprite('fuckinwhite', true)
	addLuaSprite('actuallywhite', true)
	
	for i = 0,11 do --cgs
		makeLuaSprite('b'..i, 'bg'.. stageName .. '/cg/' ..i, 0, -0)
		setObjectCamera('b'..i, 'other')
		addLuaSprite('b'..i, true)
		setProperty('b'..i..'.alpha', 0)
    end
end

function onCreatePost()
	initLuaShader('bcs')
	setSpriteShader('dad','bcs')
	setSpriteShader('boyfriend','bcs')
end

phase = 0
function onEvent(name, value1, value2)
	if name == 'Trigger BG Ghouls' then --white void!
		white = tonumber(value1)
		whiteback = tonumber(value2)
		if white == 0 then
			doTweenAlpha('yeah', 'whitebg', 1, 10, 'linear')
		elseif white == 1 then
			doTweenAlpha('yeah', 'actuallywhite', whiteback, 0.3, 'linear')
		elseif white == 2 then
			doTweenAlpha('yeah', 'fuckinwhite', whiteback, 1.5, 'linear')
		end
	end
	
	if name == 'Griddy' then --for the CGs!
		cg = tonumber(value1)
		for i = 0,11 do --cgs
			setProperty('b'..i..'.alpha', 0)
		end
		if cg >= 0 then --if value is -1, remove all CGs
			setProperty('b'..cg..'.alpha', 1)
		end
	end
	if name == 'Quick Event' then --for the Quickshit
		if value1 == 'dabg' then

			doTweenX('dadio','fuckass',0, 0.4)
			doTweenAlpha('bgbg','purpbg',1, 0.4)
		end
		if value1 == 'daZoom' then

			doTweenAlpha('bgbg','anime_radial',1,0.4)
		end
	end
	
	if name == 'Change Character' then
	setSpriteShader('dad','bcs')
	setSpriteShader('boyfriend','bcs')
	end


	if name == 'Change Scene' then --events BS, SORRY IF I REUSE A LOT OF EVENTS HERE, ITS JUST SO ITS CONSISTENT <3
		isFloating = false
		shit = tonumber(value1)
		phase = shit
		if shit == 0 then --default
			setProperty('anime_radial.alpha',0.001)
			setProperty('anime_linear.alpha',0.001)
			triggerEvent('Change Character','bf','connie-scared')
			triggerEvent('Change Character','dad','prime')
			setProperty('boyfriend.x', 1270)
			setProperty('boyfriend.y', -50)
			setProperty('dad.x', 300)
			setProperty('dad.y', -50)
			setProperty('defaultCamZoom', 0.5)
			setProperty('sky.alpha', 1)
			setProperty('ground.alpha', 1)
			setProperty('connieheld.alpha', 0)
			setProperty('redbg.alpha', 0)
			setProperty('purpbg.alpha', 0)
			xx = dxx
			yy = dyy
			xx2 = xx2
			yy2 = yy2
			isFloating = true
		end
		if shit == 1 then --zoomed in
			doTweenX('dadio','fuckass',-0.3,0.4)
			setProperty('anime_radial.alpha',0.001)
			setProperty('anime_linear.alpha',0.001)
			triggerEvent('Change Character','bf','f2f-connie')
			triggerEvent('Change Character','dad','f2f-prime-masked')
			setProperty('boyfriend.x', 1200)
			setProperty('boyfriend.y', -50)
			setProperty('dad.x', 350)
			setProperty('dad.y', -50)
			setProperty('defaultCamZoom', 0.9)
			setProperty('redbg.alpha', 1)
			setProperty('purpbg.alpha', 0)
			xx = 1080
			yy = 170
			xx2 = 1080
			yy2 = 170
		end
		if shit == 2 then --zoomed in, now mad
			setProperty('anime_radial.alpha',0.001)
			setProperty('anime_linear.alpha',0.001)
			triggerEvent('Change Character','bf','f2f-connie')
			triggerEvent('Change Character','dad','f2f-prime-nomask')
			setProperty('boyfriend.x', 1200)
			setProperty('boyfriend.y', -50)
			setProperty('dad.x', 350)
			setProperty('dad.y', -50)
			setProperty('defaultCamZoom', 0.9)
			setProperty('redbg.alpha', 1)
			setProperty('purpbg.alpha', 1)
			xx = 1080
			yy = 170
			xx2 = 1080
			yy2 = 170
		end
		if shit == 3 then --held up!
			setProperty('anime_radial.alpha',0.001)
			setProperty('anime_linear.alpha',1)
			triggerEvent('Change Character','dad','holdup-prime')
			setProperty('boyfriend.x', 2000)
			setProperty('boyfriend.y', -50)
			setProperty('dad.x', 350)
			setProperty('dad.y', -50)
			setProperty('defaultCamZoom', 0.8)
			setProperty('sky.alpha', 0)
			setProperty('ground.alpha', 0)
			setProperty('connieheld.alpha', 1)
			setProperty('redbg.alpha', 0)
			setProperty('purpbg.alpha', 0)
			xx = 700
			yy = 130
			xx2 = 700
			yy2 = 130
		end
		if shit == 4 then --prime, no more mask, its real now
			setProperty('anime_radial.alpha',0.001)
			setProperty('anime_linear.alpha',0.001)
			triggerEvent('Change Character','bf','connie-angry')
			triggerEvent('Change Character','dad','primeunmask')
			setProperty('boyfriend.x', 1270)
			setProperty('boyfriend.y', 100)
			setProperty('dad.x', 300)
			setProperty('dad.y', 100)
			setProperty('defaultCamZoom',1)
			setProperty('sky.alpha', 1)
			setProperty('ground.alpha', 1)
			setProperty('connieheld.alpha', 0)
			setProperty('redbg.alpha', 0)
			setProperty('purpbg.alpha', 0)
			setScrollFactor('groundwide', 0.8,0.8)
			setScrollFactor('ground', 0.8,0.8)
			xx = 700
			yy = 270
			xx2 = 1400
			yy2 = 270
		end
		if shit == 5 then --its primes funny face
			addLuaScript('startbloom')
			setProperty('anime_radial.alpha',0.001)
			setProperty('anime_linear.alpha',0.001)
			triggerEvent('Change Character','dad','zoomed-primecrying')
			setProperty('boyfriend.x', 2000)
			setProperty('boyfriend.y', -50)
			setProperty('dad.x', 350)
			setProperty('dad.y', -200)
			setProperty('defaultCamZoom', 0.7)
			setProperty('redbg.alpha', 0)
			setProperty('purpbg.alpha', 0)
			xx = 700
			yy = 130
			xx2 = 700
			yy2 = 130
		end
		if shit == 6 then --prime is zad now, *sniffles*
			setProperty('anime_radial.alpha',0.001)
			setProperty('anime_linear.alpha',0.001)
			triggerEvent('Change Character','bf','connie')
			triggerEvent('Change Character','dad','prime-zad')
			setProperty('boyfriend.x', 1270)
			setProperty('boyfriend.y', 100)
			setProperty('dad.x', 300)
			setProperty('dad.y', 100)
			setProperty('defaultCamZoom', 0.7)
			setProperty('sky.alpha', 1)
			setProperty('ground.alpha', 1)
			setProperty('connieheld.alpha', 0)
			setProperty('redbg.alpha', 0)
			setProperty('purpbg.alpha', 0)
			xx = 1000
			yy = 300
			xx2 = 1000
			yy2 = 300
			isFloating = false
		end
		if shit == 7 then --I KNOW YOU CAAAAARE
			startVideo('youcare')
			cantdie = true
			vido = true
			runTimer('dodavid', 21)
			setProperty('inCutscene',false)
		end
	end
end

function onEndSong()
	if vido then
	return Function_Stop;
	else
	if not allowEnd and isStoryMode then
		startVideo('ending');
		allowEnd = true;
		return Function_Stop;
	end
	return Function_Continue;
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'dodavid' then
		vido = false
		endSong()
	end
end

i = 0
function onUpdate(elapsed)
	--Follow Cam Stuff LMAO
	if curStep >= 0 and isFloating then

		songPos = getSongPosition()

		local currentBeat = (songPos/1000)*(bpm/80)

		doTweenY('bwop', 'dad', -200+-100*math.sin((currentBeat*0.25)*math.pi),0.01)

	end
  
	setShaderFloat('dad','brightness',getProperty('fuckass.x'))

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
	--connie gets held up!
	if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
		setProperty('connieheld.x', 670)
		setProperty('connieheld.y', -260)
	end
	if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
		setProperty('connieheld.x', 730)
		setProperty('connieheld.y', -260)
	end
	if getProperty('dad.animation.curAnim.name') == 'singUP' then
		setProperty('connieheld.x', 700)
		setProperty('connieheld.y', -300)
	end
	if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
		setProperty('connieheld.x', 700)
		setProperty('connieheld.y', -260)
	end
	if getProperty('dad.animation.curAnim.name') == 'idle' then
		setProperty('connieheld.x', 700)
		setProperty('connieheld.y', -240)
	end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0  then
		objectPlayAnimation('connieheld', 'idle')
	end
end


function opponentNoteHit(i,d,t,s)
	if phase == 3 or phase == 5 then
		triggerEvent('Add Camera Zoom',0.015,0.03)
		triggerEvent('Screen Shake','0.1,0.0.05','0,0')
	end
end

