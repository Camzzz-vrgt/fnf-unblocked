function onCreate()

    makeLuaSprite('sky', 'charlie/sky', -293, -184)
    setScrollFactor('sky', 1, 1);

    makeLuaSprite('clouds', 'charlie/clouds', -150, 550)
	scaleObject('clouds', 0.8, 0.8);
    setScrollFactor('clouds', 0.5, 0.5);

    makeLuaSprite('groundback', 'charlie/groundback', -293, -184)
    setScrollFactor('groundback', 0.8, 0.8);

    makeLuaSprite('camp', 'charlie/camp', -293, -184)
    setScrollFactor('camp', 1, 1);

    makeLuaSprite('ground', 'charlie/ground', -293, -184)
    setScrollFactor('ground', 1, 1);

    addLuaSprite('sky', false)
    addLuaSprite('clouds', false)
    addLuaSprite('groundback', false)
    addLuaSprite('ground', false)
    addLuaSprite('camp', false)
end
