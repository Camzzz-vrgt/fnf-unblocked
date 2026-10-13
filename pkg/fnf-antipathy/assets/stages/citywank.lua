local xx = 600
local yy = 500
local xx2 = 1200
local yy2 = 500
local ofs = 50
local followchars = true
local clowning = false

function onCreate()
	-- background shit
	makeLuaSprite('sky', 'bg/wankcityback', -1400, -900)
	setScrollFactor('sky', 0.5, 0.5)
	scaleObject('sky', 1.7, 1.7)

	makeLuaSprite('city', 'bg/wankcity', -1400, -800)
	setScrollFactor('city', 0.7, 0.7)
	scaleObject('city', 1.7, 1.7)

	
	makeLuaSprite('floor', 'bg/wankfloor', -1400, -900)
	scaleObject('floor', 1.7, 1.7)
	
	makeAnimatedLuaSprite('clownman', 'characters/TRICKY', -800, -800)
	addAnimationByPrefix('clownman', 'react-start', 'hey hank anim', 24, false)
	addAnimationByIndices('clownman', 'react-start', 'hey hank anim', '0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23', 24);
	addAnimationByPrefix('clownman', 'idle', 'hey hank anim', 24, true)
	addAnimationByIndices('clownman', 'idle', 'hey hank anim', '24,25,26,27,28,29,30,31,32,33,34,35,36', 24);
	addAnimationByIndices('clownman', 'react-end', 'hey hank anim', '38,39,40,41,42,43,44,45,46,47,48,49,50,51,52,53,54,55,56,57,58,59,60,61,62,63,64,65,66,67,68,69,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90,91,92,93,94,95,96,97,98,99,100,101,102,103,104,105,106,107,108,109,110,111,112,113,114,115,116,117,118,119,120', 24);
	setProperty('clownman.alpha', 0)

	addLuaSprite('sky', false)
	addLuaSprite('city', false)
	addLuaSprite('clownman', false)
	addLuaSprite('floor', false)
	
	makeLuaSprite('cut1', 'wank/cutin-1', 0, 0)
	setObjectCamera('cut1', 'camHud')
	makeLuaSprite('cut2', 'wank/cutin-2', 0, 0)
	setObjectCamera('cut2', 'camHud')
	setProperty('cut1.alpha', 0)
	setProperty('cut2.alpha', 0)
	
	makeLuaSprite('blackfuck', 'antipathy/black', 0, 0)
	setObjectCamera('blackfuck', 'hud')
	setGraphicSize('blackfuck', screenWidth, screenHeight)
	setProperty('blackfuck.alpha', 0)
	
	addLuaSprite('blackfuck', true)
	addLuaSprite('cut1', true)
	addLuaSprite('cut2', true)
end

function onGameOver()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-efn-gameover')
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'efn_loss_sfx')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver-bf')
	return Function_Continue;
end

function onEvent(name, value1, value2)
	if name == 'Griddy' then --events BS
		gritty = tonumber(value1)
		if gritty == 0 then
			setProperty('defaultCamZoom',0.75)
			xx = 1100
			yy = 600
			xx2 = 1100
			yy2 = 600
		end
		if gritty == 69 then --default yaya
			xx = 900
			yy = 500
			xx2 = 900
			yy2 = 500
			setProperty('defaultCamZoom',0.5)
		end
		if gritty == 1 then --tricky moment
			xx = 600
			yy = 350
			xx2 = 600
			yy2 = 350
			clowning = false
			setProperty('clownman.alpha', 1)
			setProperty('defaultCamZoom',0.55)
			objectPlayAnimation('clownman', 'react-start')
		end
		if gritty == 2 then --idle tik
			objectPlayAnimation('clownman', 'idle')
			clowning = true
		end
		if gritty == 3 then --nyoom
			clowning = false
			objectPlayAnimation('clownman', 'react-end')
		end
		if gritty == 5 then --he gone
			setProperty('clownman.alpha', 0)
		end
		if gritty == 6 then --IM NOT DONE WITH YOU YET	
			if not flashing then
				cameraFlash('camHUD', 'FFFFFF', 0.7, false)
			end
			setProperty('blackfuck.alpha', 1)
			setProperty('cut1.alpha', 1)
			setProperty('defaultCamZoom',0.9)
			xx = 400
			yy = 700
			xx2 = 400
			yy2 = 700
		end
		if gritty == 7 then --back to normal
			setProperty('defaultCamZoom',0.6)
			xx = 600
			yy = 500
			xx2 = 1200
			yy2 = 500
		end
		if gritty == 8 then --2nd wank portrait, dont mind it
			setProperty('cut1.alpha', 0)
			setProperty('cut2.alpha', 1)
			xx = 400
			yy = 700
			xx2 = 400
			yy2 = 700
		end
		if gritty == 9 then --remove the cutins
			doTweenAlpha('byebyeboth', 'cut2', 0, 0.4, 'circOut')
			doTweenAlpha('sayonara', 'blackfuck', 0, 0.4, 'circOut')
		end
	end
end

function onTweenCompleted(tag) 
	if tag == 'byebyeboth' then
		removeSprite('cut1')
		removeSprite('cut2')
		removeSprite('blackfuck')
	end
end

function onBeatHit()
	-- triggered 4 times per section
	if curBeat % 2 == 0  and clowning then
		objectPlayAnimation('clownman', 'idle');
	end
end

function onUpdate()
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