luaDebugMode = true
luaDeprecatedWarnings = true

function onCreate()
	makeLuaSprite('bg', 'stages/oswaldslair/oswaldLair', -400, -250);
	setLuaSpriteScrollFactor('bg', 1, 1);
	scaleObject('bg', 0.6, 0.6)

	makeAnimatedLuaSprite('com', 'stages/oswaldslair/oswaldComputer', -165, -100);
	addAnimationByPrefix('com', 'oswaldComputer', 'oswaldComputer dance', 12, true);
	scaleObject('com', 0.5, 0.5)
	
	makeAnimatedLuaSprite('gus', 'stages/em/Gus', 1510, 450);
	addAnimationByPrefix('gus', 'idle', 'idle instance 1', 24, false);
	setLuaSpriteScrollFactor('gus', 1, 1);
	scaleObject('gus', 1.4,1.4)
	
	addLuaSprite('bg', false);
	addLuaSprite('com', false);
	objectPlayAnimation('com', 'oswaldComputer', true)
	addLuaSprite('gus', false);
end

function onBeatHit()
	if curBeat % 2 == 0 then
		objectPlayAnimation('gus', 'idle', true);
	end
end