local cloudSpeed = 2
local cloudRepetivity = 2
local charTweenDur = 1
local charPosDifference = 100 -- prefferably 40






















































































--hi
































































































--what are you doing?




















--(step-bro)




























































































































--dont make me shoot!



























































































--*dies*













--[SCRIPT MADE BY EMERALDYT]

function onCreatePost()
	setProperty('gf.visible', true)
end

function onCreate()

        makeLuaSprite('Sky', 'bg',-1000,-530)
	addLuaSprite('Sky',false)
	setLuaSpriteScrollFactor('Sky', 0, 0)
        scaleObject('Sky', 1.61, 1.61);

        makeLuaSprite('clod', 'cloud_1',-1000,-530)
	addLuaSprite('clod',false)
	setLuaSpriteScrollFactor('clod', 0, 0)
        scaleObject('clod', 1.61, 1.61);

        makeLuaSprite('clod2', 'cloud_2',-1000,-530)
	addLuaSprite('clod2',true)
	setLuaSpriteScrollFactor('clod2', 0, 0)
        scaleObject('clod2', 1.61, 1.61);

        makeLuaSprite('clod3', 'IMG_8171',-1000,-530)
	addLuaSprite('clod3',true)
	setLuaSpriteScrollFactor('clod3', 0, 0)
        scaleObject('clod3', 1.61, 1.61);
		
        makeLuaSprite('box', 'maroonbox', 170, 0)
	addLuaSprite('box',false)
        scaleObject('box', 0.7, 0.7);
		
		                        setProperty('Sky.alpha', 1)
                                setProperty('clod.alpha', 1)
                                setProperty('clod2.alpha', 1)
                                setProperty('clod3.alpha', 1)
								setProperty('box.alpha', 1)

        cloud()
end

function onSongStart()
	bfX = getProperty('boyfriend.x')
	bfY = getProperty('boyfriend.y')
	dX = getProperty('dad.x')
	dY = getProperty('dad.y')

        doTweenY("cloddy", 'clod', -3350, songLength / 1000)

	doTweenY('BFtweenY', 'boyfriend', 395 - charPosDifference, charTweenDur)
	doTweenX('BFtweenX', 'boyfriend', bfX - charPosDifference, charTweenDur)
	doTweenY('DadtweenY', 'dad', dY - charPosDifference, charTweenDur)
	doTweenX('DadtweenX', 'dad', dX - charPosDifference, charTweenDur)

	debugPrint(getProperty('dad.y')) --testing stuff
end

function onUpdate(elapsed)
        triggerEvent('Screen Shake', '0.02,0.005', '')
	--debugPrint(getProperty("dad.x")) --testing stuff
end

function cloud()
	setProperty("clod2.y", -530 + getProperty('Sky.height'))
        doTweenY("clod", 'clod2', -530 - getProperty('Sky.height'), cloudSpeed)

	setProperty("clod3.y", -530 + getProperty('Sky.height'))
        doTweenY("clodd", 'clod3', -530 - getProperty('Sky.height'), cloudSpeed / 1.5)
	runTimer('daCloud', cloudRepetivity)
end

function onTimerCompleted(tag)
    if tag == 'daCloud' then
	cloud()
    end
end

function onTweenCompleted(tag)
    if tag == 'BFtweenX' then
	doTweenY('BFtweenY2', 'boyfriend', bfY, charTweenDur, 'quadInOut')
	doTweenX('BFtweenX2', 'boyfriend', bfX, charTweenDur, 'quadInOut')
	doTweenY('DadtweenY2', 'dad', dY, charTweenDur, 'quadInOut')
	doTweenX('DadtweenX2', 'dad', dX, charTweenDur, 'quadInOut')
    end
    if tag == 'DadtweenX2' then
	doTweenY('BFtweenY', 'boyfriend', bfY - charPosDifference, charTweenDur, 'quadInOut')
	doTweenX('BFtweenX', 'boyfriend', bfX - charPosDifference, charTweenDur, 'quadInOut')
	doTweenY('DadtweenY', 'dad', dY - charPosDifference, charTweenDur, 'quadInOut')
	doTweenX('DadtweenX', 'dad', dX - charPosDifference, charTweenDur, 'quadInOut')
    end
end