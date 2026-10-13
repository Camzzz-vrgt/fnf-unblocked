function onCreate()
	-- background shit
	makeLuaSprite('white', 'White', -800, -1600.95);
        scaleLuaSprite('white', 2.5, 2.5);
	setLuaSpriteScrollFactor('white', 0.9, 0.9);
        addLuaSprite('white', false);
	makeLuaSprite('bg', 'bgs/school', -800, -700.95);
        scaleLuaSprite('bg', 1.3, 1.3);
	setLuaSpriteScrollFactor('bg', 0.9, 0.9);
        addLuaSprite('bg', false);
		makeLuaSprite('notebook', 'NotebookLines', 800, -900.95);
        scaleLuaSprite('notebook', 1.5, 1.5);
		setProperty('notebook.alpha', 30)
	setLuaSpriteScrollFactor('notebook', 0.9, 0.9);
		setProperty('notebook.antialiasing', false)

function onBeatHit()
		
end
end