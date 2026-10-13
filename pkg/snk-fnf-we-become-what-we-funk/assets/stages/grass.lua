local allowStart = false

function onStartCountdown()
    setProperty('skipCountdown', true)
    if allowStart then
        return Function_Continue;
    else
        customCountdown()
        return Function_Stop;
    end
end

local startYGlobal = 0
local jumpGLOBAL = 0

function createNPC(npcName, walkTime, startingY, endX)
	startYGlobal = startingY
	jumpGLOBAL = startingY + 100
	makeLuaSprite('npc', 'bg/npcs/'..npcName, endX *-1, startingY)
    addLuaSprite('npc', true)
	scaleObject('npc', 0.7, 0.7)

	doTweenX('move', 'npc', endX, walkTime, 'easeIn')
	doTweenY('moveUP', 'npc', jumpGLOBAL, 1, 'bounceOut')
end

function onTweenCompleted(tag)
	if tag == "moveUP" then
		doTweenY('moveDOWN', 'npc', startYGlobal, 1, 'bounceIn')
	elseif tag == "moveDOWN" then
		doTweenY('moveUP', 'npc', jumpGLOBAL, 1, 'bounceOut')
	end
end

function onCreate()
	makeLuaSprite('bg', 'bg/grass', -800, -500)
    addLuaSprite('bg', false)
	scaleObject('bg', 3, 3)

	makeAnimatedLuaSprite('tv', 'bg/tv', -800, -450)
    addAnimationByPrefix('tv', 'idle', 'idle', 3, true)
    objectPlayAnimation('tv', 'idle', true)
	addLuaSprite('tv', false)
	scaleObject('tv', 2.5, 2.5)

	makeLuaSprite('psychicVignette', 'bg/vignette', 0, 0)
	setObjectCamera('pyschicVignette', 'hud')
	setGraphicSize('psychicVignette', screenWidth, screenHeight)
	setScrollFactor('psychicVignette', 0, 0);
	addLuaSprite('physicVignette', true)
end

local penisCatcher = getRandomInt(15,20)

function onUpdate()
	setTextFont('scoreTxt', 'G_ari_bd.TTF')
	setTextFont('timeTxt', 'G_ari_bd.TTF')
end

function onBeatHit()
	penisCatcher = penisCatcher - 1

	if penisCatcher <= 0 then
		penisCatcher = getRandomInt(15,20)
		if getRandomInt(1,2) == 2 then
			createNPC('npc2', 10, 400, -2300)
		else
			createNPC('npc1', 10, 400, 4500)
		end
	end
end