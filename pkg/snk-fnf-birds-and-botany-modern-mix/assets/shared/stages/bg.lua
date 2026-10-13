function onCreate()
    setProperty("skipArrowStartTween", true)
    setPropertyFromClass('ClientPrefs', 'hideHud', false);
    setPropertyFromClass('ClientPrefs', 'camZooms', false)
    setPropertyFromClass('ClientPrefs', 'shadersEnabled', true)

	makeLuaSprite('bg1', 'bg/sky',-200,-200);


	makeLuaSprite('bg2', 'bg/clouds',-400,-200);
	setProperty('bg2.velocity.x', 10)


	makeLuaSprite('bg3', 'bg/Castle',2500,400);


    makeAnimatedLuaSprite('bg4','bg/Rifts1',1000,-400)
    addAnimationByPrefix('bg4', 'Idle', 'Rift1', 24, true)


    makeAnimatedLuaSprite('bg5','bg/Rifts2',1700,0)
    addAnimationByPrefix('bg5', 'Idle', 'Rift2', 24, true)


    makeAnimatedLuaSprite('bg6','bg/Rifts3',3000,-200)
    addAnimationByPrefix('bg6', 'Idle', 'Rift3', 24, true)


	makeLuaSprite('bg7', 'bg/Tree',2200,-10);
    setScrollFactor("bg7", 0.85, 0.85);


	makeLuaSprite('bg8', 'bg/mountain',-100,300);
	setScrollFactor("bg8", 0.9, 0.9);


	makeLuaSprite('bg9', 'bg/Front',-200,600);


    for i = 2,6 do
        setScrollFactor("bg"..i, 0.8, 0.8);
    end

    for i = 1,9 do
	    addLuaSprite('bg'..i);
    end

    makeAnimatedLuaSprite('fg','bg/Zombie',0,1100)
    addAnimationByPrefix('fg', 'Idle', 'Idle', 24, true)
    addAnimationByPrefix('fg', 'die', 'die', 24, false)
    scaleObject('fg',1.5,1.5)
    setScrollFactor('fg',0.8,0.8)
    addOffset('fg','die',525,-315)
	addLuaSprite('fg',true);

    for i = 4,6 do
        setSpriteShader('bg'..i,'Glitchy2')
        setShaderFloat('bg'..i,'SPEED',1)
        setShaderFloat('bg'..i,'AMT',0.02)
    end
end



function onCreatePost()
    setObjectOrder('dadGroup', getObjectOrder('bg9') + 2)
    setObjectOrder('boyfriendGroup', getObjectOrder('dadGroup') - 1)
    setObjectOrder('gfGroup', getObjectOrder('dadGroup') + 1)
    setObjectOrder('fg', getObjectOrder('SamS') + 1)
end


function onUpdatePost()
setShaderFloat('bg4','iTime',os.clock())
setShaderFloat('bg5','iTime',os.clock())
setShaderFloat('bg6','iTime',os.clock())


    if getProperty('defaultCamZoom') <= 0.5 and getProperty('fg.alpha') == 0.5 then
        doTweenAlpha('fgHide','fg',1,1,'sineInOut')

    elseif getProperty('defaultCamZoom') > 0.5 and getProperty('fg.alpha') == 1 then
        doTweenAlpha('fgHide','fg',0.5,1,'sineInOut')

    end
end