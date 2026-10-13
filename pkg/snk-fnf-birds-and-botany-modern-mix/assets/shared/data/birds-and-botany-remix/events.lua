
local hideHud = {'iconP1', 'iconP2', 'scoreTxt', 'healthBar', 'healthBarBG', 'timeBar', 'timeBarBG', 'timeTxt'}
function onEvent(n,v1,v2)
    if n == 'camera_target' then
        if v1 == 'all' then
            folowcam = true
        else
            folowcam = false
        end
    end

    if n == 'hud' then
        for i = 1,#hideHud do
            if v1 == '1' then
                setProperty(hideHud[i]..'.visible', false)
            else
                setProperty(hideHud[i]..'.visible', true)
            end
        end
    end
end



folowcam = false
camX = 2450
camY = 1500
function onUpdate()
    if folowcam then
        setProperty('camFollow.x', camX)
        setProperty('camFollow.y', camY)
    end
end


function onCreatePost()
    triggerEvent('hud','1')
    setProperty('camHUD.alpha',0)
    setProperty('camGame.alpha',0)

    for i = 1,9 do
        setProperty('bg'..i..'.visible',false)
    end

    setProperty("boyfriend.colorTransform.color", 0xffffff)
    setProperty('dad.visible',false)
    setProperty("dad.colorTransform.color", 0xffffff)

    makeLuaSprite('vig', 'vig')
    setObjectCamera('vig', 'other')
    setProperty('vig.alpha',0)
    addLuaSprite('vig')
end


function onStepHit()
    if curStep == 5 then
        doTweenAlpha('1','camHUD',1,1.1,'quadIn')
        playAnim('Sam', 'Left', false)
        playAnim('SamS', 'Left', false)

    elseif curStep == 136 then
        doTweenAlpha('1','vig',1,0.8,'expoIn')
        setProperty('SamS.visible',false)
        setProperty('Sam.visible',false)
        setProperty('fg.alpha',0)

    elseif curStep == 144 then
        doTweenAlpha('1','vig',0,0.01)
        removeLuaSprite('vig')

    elseif curStep == 272 then
        doTweenAlpha('1','camGame',0,1.6,'sineInOut')

    elseif curStep == 288 then
        setProperty('dad.visible',true)

        setProperty("boyfriend.colorTransform", nil)
        setProperty("boyfriend.alpha", 0)
        setProperty("boyfriend.alpha", 1)
        setProperty('boyfriend.visible',false)

        doTweenAlpha('1','camGame',1,0.01)
        doTweenAlpha('2','camHUD',0,0.01)

    elseif curStep == 400 then
        setProperty('S2.x',0.1)

    elseif curStep == 410 then
        setProperty('S2.x',0.2)
        setProperty("dad.colorTransform", nil)
        setProperty("dad.alpha", 0)
        setProperty("dad.alpha", 1)
        setProperty('boyfriend.visible',true)


    elseif curStep == 416 then
        setProperty('camHUD.alpha',1)

        triggerEvent('hud','0')

        for i = 1,9 do
            setProperty('bg'..i..'.visible',true)
        end

    elseif curStep == 672 then
        doTweenColor('oen','Sam','ffffff',1)

    elseif curStep == 928 then
        for i = 1,9 do
            setProperty('bg'..i..'.visible',false)
        end
        setObjectCamera('boyfriend', 'hud')
        setProperty('boyfriend.x', 1300)
        setProperty('boyfriend.y', 200)
        setProperty('boyfriend.alpha', 0)
        setProperty('boyfriend.velocity.x', -100)
        doTweenAlpha('ieeh','boyfriend',0.6,2,'sineInOut')

    elseif curStep == 1056 then
        for i = 1,9 do
            setProperty('bg'..i..'.visible',true)
        end

        setObjectCamera('boyfriend', 'game')
        setProperty('boyfriend.velocity.x', 0)
        setProperty('boyfriend.alpha', 1)

        setProperty('boyfriend.x', defaultBoyfriendX)
        setProperty('boyfriend.y', defaultBoyfriendY)

    elseif curStep == 1312 then
        playAnim('fg','idle',true)
        setProperty('fg.alpha',1)

    elseif curStep == 1447 then
        for i = 1,9 do
            setProperty('bg'..i..'.visible',false)
            setProperty('fg.visible',false)
        end
        setProperty('boyfriend.visible',false)

        doTweenAlpha('do','camGame',1,0.6)

    elseif curStep == 1472 then
        for i = 1,9 do
            setProperty('bg'..i..'.visible',true)
            setProperty('fg.visible',true)
        end
        setProperty('boyfriend.visible',true)
        setProperty('camHUD.alpha',1)

    elseif curStep == 1688 then
        setProperty('camGame.alpha',0)

    elseif curStep == 1694 then
        for i = 1,9 do
            setProperty('bg'..i..'.visible',false)
            setProperty('fg.visible',false)
        end
            setProperty('dad.visible',false)

    elseif curStep == 1696 then
        setProperty('camGame.alpha',1)

    elseif curStep == 1720 then
        doTweenAlpha('osb','camGame',0,0.8,'sineInOut')
        doTweenAlpha('osfb','camHUD',0,0.8,'sineInOut')

    elseif curStep == 1758 then
        setProperty('dad.visible',true)
        setProperty('SamS.visible',false)

    elseif curStep == 1760 then
        setProperty('camGame.alpha',1)

    elseif curStep == 1792 then
        for i = 1,9 do
            setProperty('bg'..i..'.visible',true)
            setProperty('fg.visible',true)
        end
        setProperty('SamS.visible',true)
        setProperty('camHUD.alpha',1)

    elseif curStep == 2048 then
        playAnim('fg','die',true)

    elseif curStep == 2080 then
        removeLuaSprite('fg')

    elseif curStep == 2320 then
        for i = 1,9 do
            removeLuaSprite('bg'..i)
        end
        triggerEvent('hud','1')
        setProperty('dad.visible',false)
        removeLuaSprite('SamS')


    end
end
