function onCreate()
	-- background shit
	makeLuaSprite('white', 'backgrounds/White', -800, -1600.95);
        scaleLuaSprite('white', 2.5, 2.5);
	setLuaSpriteScrollFactor('white', 0.9, 0.9);
        addLuaSprite('white', false);
	makeLuaSprite('bg', 'backgrounds/house/House', -900, -800.95);
        scaleLuaSprite('bg', 0.9, 0.9);
	setLuaSpriteScrollFactor('bg', 0.9, 0.9);
        addLuaSprite('bg', false);
		makeAnimatedLuaSprite('speaker', 'backgrounds/Speaker', 1000.50, 260.05);
		addAnimationByPrefix('speaker', 'Speaker', 'Speaker', 24, false);
		setProperty('Speaker.scale.x', 0.8);
		setProperty('Speaker.scale.y', 0.8);
		makeLuaSprite('notebook', 'backgrounds/NotebookLines', -1200, -1400.95);
        scaleLuaSprite('notebook', 2.5, 1);
		setProperty('notebook.alpha', 100)
	setLuaSpriteScrollFactor('notebook', 0.9, 0.9);
		setProperty('notebook.antialiasing', true)
		setBlendMode("notebook", "multiply")
		addLuaSprite('notebook', true);
		makeLuaSprite('shader', 'backgrounds/shader', -900, -600.95);
        scaleLuaSprite('shader', 1.7, 1.5);
	setLuaSpriteScrollFactor('shader', 0.9, 0.9);
	makeLuaSprite('BlackScreen','',-900,-900)
	makeGraphic('BlackScreen',4000,4000,'000000')
	addLuaSprite('BlackScreen',false)
	scaleObject('BlackScreen', 2.0, 2.0 )
	setObjectCamera('BlackScreen','hud')
end

function onBeatHit()
	if curBeat == 1 then
		doTweenAlpha('introFade', 'BlackScreen', 0.0001, 10, 'linear')
	end
end
