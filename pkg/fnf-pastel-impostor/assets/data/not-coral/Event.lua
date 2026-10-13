function onCreate()
    if isStoryMode then
        setProperty("skipCountdown", true)
    end
end

function onCreatePost()
    makeLuaSprite('Black','', 0, 0);
    makeGraphic('Black',screenWidth,screenHeight,'000000')
    addLuaSprite('Black')
    setObjectCamera('Black','hud')

    makeLuaSprite('red','', -600, -300);
    makeGraphic('red',4300 * 0.75,3036 * 0.5,'FF0000')
    addLuaSprite('red')
    setObjectCamera('red','game')
    setProperty("red.alpha", 0)

    makeLuaSprite('teiden','', 0, 0);
    makeGraphic('teiden',screenWidth,screenHeight,'000000')
    addLuaSprite('teiden')
    setObjectCamera('teiden','hud')
    setProperty("teiden.alpha", 0)

    setProperty("RED0.alpha", 1)

    if getRandomInt(1,2) == 1 then
        setBlendMode('red','add')
    else
        setBlendMode('red','MULTIPLY')
    end
    setObjectOrder('red',10)

    makeLuaSprite("gradient_2", nil, screenWidth, 0)
    addLuaSprite("gradient_2")
    setObjectCamera("gradient_2", "camHUD")

    setProperty("gradient_2.alpha", 0)

    makeLuaSprite("gradient_1", nil, 0, 0)
    addLuaSprite("gradient_1")
    setObjectCamera("gradient_1", "camHUD")

    setProperty("gradient_1.alpha", 0)

    addHaxeLibrary("FlxGradient", "flixel.util")
    runHaxeCode([[
        var gradient = FlxGradient.createGradientBitmapData(200, FlxG.height, [0x00000000, 0xFFFF0000], 1, 0);
        var luaObject = game.getLuaObject("gradient_2");

        luaObject.x -= 200;
        
        luaObject.pixels = gradient;

        var gradient = FlxGradient.createGradientBitmapData(200, FlxG.height, [0xFFFF0000, 0x00000000], 1, 0);
        var luaObject = game.getLuaObject("gradient_1");
        
        luaObject.pixels = gradient;
    ]])
end
function onSongStart()
	doTweenAlpha('Blackalpha', 'Black', 0, 10, 'linear')
    if not isStoryMode then
        doTweenAlpha('Blackalpha', 'Black', 0, 10, 'linear')
    --alphahud(0,0.01)
    end
end
function onStepHit()
    if curStep == 384 then
        triggerEvent("Change Scroll Speed", "0.75", "1")
    end
    if curStep == 512 then
        if flashingLights then
            cameraFlash("game", "000000",crochet / 1000, false)
        end
        setProperty("RED1.alpha", 1)
        setProperty("RED2.alpha", 1)
        setProperty("boyfriendGroup.color", getColorFromHex("000000"))
        setProperty("dadGroup.color", getColorFromHex("000000"))

        setProperty("RED0.alpha", 0)
        for i = 0,3 do
            setPropertyFromGroup('opponentStrums',i,'color',getColorFromHex('FF0000'))
            setPropertyFromGroup('playerStrums',i,'color',getColorFromHex('FF0000'))
        end
        triggerEvent("Change Scroll Speed", "1.25", "1")
    end
    if curStep == 768 then
        if flashingLights then
            cameraFlash("game", "000000",crochet / 1000, false)
        end
        setProperty("RED1.alpha", 0)
        setProperty("RED2.alpha", 0)
        setProperty("boyfriendGroup.color", getColorFromHex("FFFFFF"))
        setProperty("dadGroup.color", getColorFromHex("FFFFFF"))

        setProperty("RED0.alpha", 1)
        for i = 0,3 do
            setPropertyFromGroup('opponentStrums',i,'color',getColorFromHex('FFFFFF'))
            setPropertyFromGroup('playerStrums',i,'color',getColorFromHex('FFFFFF'))
        end
        triggerEvent("Change Scroll Speed", "1", "0.01")
        setProperty("Black.alpha", 1) runTimer("Black", 0.5)
    end
    if curStep >= 512 and curStep <= 768 then
         triggerEvent('Add Camera Zoom',0.01,0.01)
    end
    if curStep <= 512 then
        if curStep % 4 == 0 then
            triggerEvent('Add Camera Zoom',0.02,0.02)
        end
    end
    if curStep >= 768 and curStep <= 1152 then
        if curStep % 4 == 0 then
            triggerEvent('Add Camera Zoom',0.02,0.02)
        end
    end
end
function onBeatHit()
    if getRandomBool(5) then
        setProperty("teiden.alpha", 1) runTimer("teiden", crochet / 1200)
    end
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'Black' then
        setProperty("Black.alpha", 0)
        cameraFlash("hud", "FFFFFF",crochet / 1000, false)

    end
    if tag == 'teiden' then
        setProperty("teiden.alpha", 0)
    end
end

function alphahud(yep,yea)
    if not hideHud then
        doTweenAlpha('1', 'healthBar', yep, yea, 'linear')
        doTweenAlpha('2', 'healthBarBG', yep, yea, 'linear')
        doTweenAlpha('3', 'iconP1', yep, yea, 'linear')
        doTweenAlpha('4', 'iconP2', yep, yea, 'linear')
        doTweenAlpha('5', 'scoreTxt', yep, yea, 'linear')
        for i = 0,7 do
            noteTweenAlpha('note'..i, i, yep, yea, 'linear')
        end
    end
end
function altFlash()
    cancelTween("gradient_1_twn")
    setProperty("gradient_1.alpha", 1)
    doTweenAlpha("gradient_1_twn", "gradient_1", 0, 0.5)

    cancelTween("gradient_2_twn")
    setProperty("gradient_2.alpha", 1)
    doTweenAlpha("gradient_2_twn", "gradient_2", 0, 0.5)
end
function Flashred()
    setProperty("red.alpha", 1)
    cancelTween("red_twn")
    doTweenAlpha("red_twn", "red", 0, 0.5)
end