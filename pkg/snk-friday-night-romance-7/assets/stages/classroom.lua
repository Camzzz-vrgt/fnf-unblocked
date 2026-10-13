function onCreate()

    --combo position
    

    makeLuaSprite('back', 'stages/gif_BG1_background', -200, 0);
    setLuaSpriteScrollFactor('back',  0.95, 0.95);
    scaleObject('back', 6, 6);
    setProperty('back.antialiasing', false);
    addLuaSprite('back', false)

    makeLuaSprite('chairs', 'stages/gif_BG1_foreground', -200, 60);
    setLuaSpriteScrollFactor('chairs', 0.95, 0.95);
    scaleObject('chairs', 6, 6);
    setProperty('chairs.antialiasing', false);
    addLuaSprite('chairs', true);
    --close(true);

    if not lowQuality then
        makeAnimatedLuaSprite('GIFhaatos', 'GIFhaatos', 1, 1)
        addAnimationByIndices('GIFhaatos', 'danceMOVE', 'GHloop', '0, 1, 2', 12);
        addAnimationByIndices('GIFhaatos', 'danceSTOP', 'GHloop', '2', 24);
        setScrollFactor('GIFhaatos', 0.1, 0.1);
        addLuaSprite('GIFhaatos', true); --foreground = true
        setProperty('GIFhaatos.alpha', 0)
    end

    if not lowQuality then
        makeAnimatedLuaSprite('GIFsparkles', 'GIFsparkles', 1, 1)
        luaSpriteAddAnimationByPrefix('GIFsparkles', 'Anim', 'GIFsparklesLoop', 24, true);
        setScrollFactor('GIFsparkles', 0.1, 0.1);
        addLuaSprite('GIFsparkles', true); --foreground = true
        setProperty('GIFsparkles.alpha', 0)
    end

    --mid-game countdown

    if not lowQuality then
    makeLuaSprite('GIFcount3', 'countdownimg_gif_3', 0, 0)
	screenCenter('GIFcount3', 'xy')
    addLuaSprite('GIFcount3', true)
    setObjectCamera('GIFcount3', 'other')
    setProperty('GIFcount3.alpha', 0)

    makeLuaSprite('GIFcount2', 'countdownimg_gif_2', 0, 0)
	screenCenter('GIFcount2', 'xy')
    addLuaSprite('GIFcount2', true)
    setObjectCamera('GIFcount2', 'other')
    setProperty('GIFcount2.alpha', 0)

    makeLuaSprite('GIFcount1', 'countdownimg_gif_1', 0, 0)
	screenCenter('GIFcount1', 'xy')
    addLuaSprite('GIFcount1', true)
    setObjectCamera('GIFcount1', 'other')
    setProperty('GIFcount1.alpha', 0)

    makeLuaSprite('GIFcount0', 'countdownimg_gif_0', 0, 0)
	screenCenter('GIFcount0', 'xy')
    addLuaSprite('GIFcount0', true)
    setObjectCamera('GIFcount0', 'other')
    setProperty('GIFcount0.alpha', 0)
    end

end




function onBeatHit()
	if not lowQuality then
		animToPlay = 'danceMOVE';

		if danced then
			animToPlay = 'danceSTOP';
		end

		playAnim('GIFhaatos', animToPlay, true);
		
		danced = not danced;
	end
end