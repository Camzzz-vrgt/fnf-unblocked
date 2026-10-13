function onCreate()

     --blackscreen lol
     makeLuaSprite('blackscreen', nil, -460, -260)
     makeGraphic('blackscreen', 4000, 3000, '000000')
     setLuaSpriteScrollFactor('blackscreen', 0, 0);
     scaleObject('blackscreen', 1.7, 1.7);
     setObjectCamera('blackscreen', 'camOther')

    --Rexy Animated Icon

    if dadName == 'rexy' then
       makeAnimatedLuaSprite('animatedicon', 'icons/RexyIcon', getProperty('iconP2.x'), getProperty('iconP2.y'))
       addAnimationByPrefix('animatedicon', 'normal', 'RexyIconBop', 24, true)
       setScrollFactor('animatedicon', 0, 0)
       setObjectCamera('animatedicon', 'Other')
         setObjectOrder('animatedicon', getObjectOrder("iconP2"))
       objectPlayAnimation('animatedicon', 'normal', false)
       setProperty('animatedicon.visible', false)
    end

    --Alan Grant Animated Icon

    if boyfriendName == 'alan' then
       makeAnimatedLuaSprite('animatedicon2', 'icons/AlanIcon', getProperty('iconP1.x'), getProperty('iconP1.y'))
       addAnimationByPrefix('animatedicon2', 'normal', 'AlanIconBop', 24, true)
       addAnimationByPrefix('animatedicon2', 'losing', 'AlanDeadBop', 24, true)
       setScrollFactor('animatedicon2', 0, 0)
       setObjectCamera('animatedicon2', 'Other')
       setObjectOrder('animatedicon2', getObjectOrder("iconP1"))
       objectPlayAnimation('animatedicon2', 'normal', false)
       setProperty('animatedicon2.visible', false)
    end

    addLuaSprite('animatedicon', true)
    addLuaSprite('animatedicon2', true)
    addLuaSprite('blackscreen', true)
end

function onUpdate()
     
    if curStep >= 0 then

    --Icon Stuff--

    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    setProperty('animatedicon2.visible', true)
    setProperty('animatedicon.visible', true)
    else
    setProperty('iconP1.alpha', 1)
    setProperty('iconP2.alpha', 1)
    end

    --Rexy Shit--

    if dadName == 'rexy' then
         if getProperty('health') > 1.6 then
              objectPlayAnimation('animatedicon', 'normal', false)
         end
    end
    setProperty('animatedicon.x', getProperty('iconP2.x') + 20)
    setProperty('animatedicon.angle', getProperty('iconP2.angle'))
    setProperty('animatedicon.y', getProperty('iconP2.y') + -20)
    setProperty('animatedicon.scale.x', getProperty('iconP2.scale.x'))
    setProperty('animatedicon.scale.y', getProperty('iconP2.scale.y'))

    --Alan Grant Shit--

    if boyfriendName == 'alan' then
         if getProperty('health') > 0.5 then
              objectPlayAnimation('animatedicon2', 'normal', false)
         else
              objectPlayAnimation('animatedicon2', 'losing', false)
         end
    end
    setProperty('animatedicon2.x', getProperty('iconP1.x') + 0)
    setProperty('animatedicon2.angle', getProperty('iconP1.angle'))
    setProperty('animatedicon2.y', getProperty('iconP1.y') + 0)
    setProperty('animatedicon2.scale.x', getProperty('iconP1.scale.x'))
    setProperty('animatedicon2.scale.y', getProperty('iconP1.scale.y'))

    --uhhhhhhhh goofy ah stuff--

    if curStep == 2 then
        doTweenAlpha('blackscreen', 'blackscreen', 0, 11)
    end 

    if curStep == 20 then
        camZoom = true;
    end

    if curStep == 768 then
       doTweenAlpha('blackscreen', 'blackscreen', 1, 0.7)
    end
    
    if curStep == 780 then
       doTweenAlpha('blackscreen', 'blackscreen', 0, 8)
    end
    
    if curStep == 1017 then
       triggerEvent('Camera Follow Pos', 410, 310)
    end

    if curStep == 1019 then
       triggerEvent('Play Animation', 'roar', 'rexy')
       triggerEvent('Screen Shake', 4, 0.50)
       setProperty('defaultCamZoom', 0.8)
       doTweenAlpha('camgone', 'camHUD', 0, 0.4, 'linear')
       doTweenAlpha('icon1', 'animatedicon2', 0, 0.4)
       doTweenAlpha('icon2', 'animatedicon', 0, 0.4)
       doTweenAlpha('thing', 'thing', 0, 0.4)
    end
    
    if curStep == 1057 then
       doTweenAlpha('thing', 'thing', 1, 0.3)
       doTweenAlpha('icon1', 'animatedicon2', 1, 0.4)
       doTweenAlpha('icon2', 'animatedicon', 1, 0.4)
       doTweenAlpha('cambak', 'camHUD', 1, 0.3, 'linear')
       setProperty('defaultCamZoom', 0.48)
       triggerEvent('Camera Follow Pos')
    end 
end