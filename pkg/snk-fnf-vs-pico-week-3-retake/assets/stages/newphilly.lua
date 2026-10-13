function onCreate()
    --background
	makeLuaSprite('sky','newphilly/sky',-680,-360)
	makeLuaSprite('Roof','newphilly/Roof',-680,-400)
	makeLuaSprite('Fore','newphilly/Fore',-630,-360)
	makeLuaSprite('bgsky','newphilly/bgsky',-550,-530)
	makeLuaSprite('BBF','newphilly/BBF',-550,-330)
	makeLuaSprite('BBb','newphilly/BBb',-550,-330)
	makeLuaSprite('power','newphilly/power',-640,-530)
	
	makeAnimatedLuaSprite('build','newphilly/B',-620,-360)
	scaleObject('build',1.2,1.2)
	addAnimationByPrefix('build','idle','B Blink',24, true)
	setScrollFactor('build', 1.02, 1.02)
	
	makeAnimatedLuaSprite('BBF','newphilly/BBF',-550, -330)
	scaleObject('BBF',1.1,1.1)
	setScrollFactor('BBF', 1.07, 1.07)
	addAnimationByPrefix('BBF','idle','BBF bop',24, true)
	
	makeAnimatedLuaSprite('BBb','newphilly/BBb',-550, -330)
	scaleObject('BBb',1.1,1.1)
	setScrollFactor('BBb', 1.07, 1.07)
	addAnimationByPrefix('BBb','idle','BBb bop',24, true)
	
	scaleObject('sky',1.4,1.4)
	scaleObject('Roof',1.2,1.2)
	scaleObject('Fore',1.2,1.2)
	scaleObject('power',1.4,1.4)
	scaleObject('bgsky',1.1,1.0)
	
	setScrollFactor('sky', 1.07, 1.07)
	setScrollFactor('bgsky', 1.07, 1.07)
	setScrollFactor('Roof', 1.0, 1.0)
	setScrollFactor('Fore', 1.0, 1.0)
	setScrollFactor('power', 1.03, 1.03)
	
	addLuaSprite('sky',false)
	addLuaSprite('bgsky',false)
	addLuaSprite('BBb',false)
	addLuaSprite('BBF',false)
	addLuaSprite('build',false)
	addLuaSprite('power',false)
	addLuaSprite('Roof',false)
	addLuaSprite('Fore',true)

end

function onBeatHit()
    -- triggered 4 times per section
    if curBeat % 2 == 0 then
        objectPlayAnimation('build', 'B Blink');
    end
	
	if curBeat % 4 == 0 then
        objectPlayAnimation('BBF', 'BBF bop');
    end
	
	if curBeat % 4 == 0 then
        objectPlayAnimation('BBb', 'BBb bop');
    end
end