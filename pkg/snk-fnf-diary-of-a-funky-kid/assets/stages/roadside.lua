function onCreate()
	-- background shit
	makeLuaSprite('BlackScreen','',-900,-900)
	makeGraphic('BlackScreen',4000,4000,'000000')
	addLuaSprite('BlackScreen',false)
	scaleObject('BlackScreen', 2.0, 2.0 )
	setObjectCamera('BlackScreen','hud')

	makeLuaSprite('white', 'backgrounds/White', -800, -1600.95);
        scaleLuaSprite('white', 2.5, 2.5);
	setLuaSpriteScrollFactor('white', 0.9, 0.9);
        addLuaSprite('white', false);

	makeLuaSprite('bg', 'backgrounds/roadside/Sidewalk', -900, -600.95);
        scaleLuaSprite('bg', 1, 1);
	setLuaSpriteScrollFactor('bg', 0.9, 0.9);
        addLuaSprite('bg', false);

		makeLuaSprite('notebook', 'backgrounds/NotebookLines', -800, -1400.95);
        scaleLuaSprite('notebook', 1.5, 1);
		setProperty('notebook.alpha', 100)
	setLuaSpriteScrollFactor('notebook', 0.9, 0.9);
		setProperty('notebook.antialiasing', true)
		setBlendMode("notebook", "multiply")
		addLuaSprite('notebook', true);

		makeLuaSprite('shader', 'backgrounds/shader', -900, -600.95);
        scaleLuaSprite('shader', 1.7, 1.5);
	setLuaSpriteScrollFactor('shader', 0.9, 0.9);
end

function onBeatHit()
	if curBeat == 1 then
		doTweenAlpha('endshit2','black',0.0001,0.001)
		triggerEvent('Camera Follow Pos', 100, -500);
	end
	if curBeat == 4 then
		doTweenAlpha('introFade', 'BlackScreen', 0.0001, 6, 'linear')
	end
	if curBeat == 5 then
		setProperty('cameraSpeed', 0.1)
		triggerEvent('Camera Follow Pos');
end
if curBeat == 32 then
	setProperty('cameraSpeed', 1)
end
end
