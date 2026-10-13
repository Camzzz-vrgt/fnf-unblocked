-- dear person who is reading my code
-- i am just as shocked as you are on how i did this shit
-- this is NOT made well at all, but it looks fucking sick
-- the sprites and shit were in Lua but I did NOT wanna port that :skull:
-- From: Alice (@sillycodergirl) <3

phase2 = false
speaking = false

function onCreatePost()
    setProperty('gf.alpha',0)

    addToStage("sky", -400, -200, 0.4,0.4,false)
    addToStage("back1", 0, 0, 0.9,0.9,false)
    addToStage("back2", 0, 0, 1,1,false)
    addToStage("front1", 0, 0, 1.2,1.2,true)
    addToStage("front2", -100, 100, 1.2,1.2,true)
    addToStage("filter", -500, -150, 0.2,0.2,true)

    addToStage2("red",-200, -200, 0.4,0.4,false)
    addToStage2("fore",-190, 350, 0.4,0.4, true)
    setProperty("red.scale.x", 1.5)
    setProperty("red.scale.y", 1.5)
    setProperty("fore.scale.x", 1.13)
    setProperty("fore.scale.y", 1.13)

    setObjectOrder("back2",10)
    setObjectOrder("dadGroup",getObjectOrder("back2")-1)
    setObjectOrder("boyfriendGroup",getObjectOrder("back2")+2)

    setProperty("red.alpha", 0.000001) -- NEED ALPHA HERE SO GAME DOESNT LAG TERRIBLY!
    setProperty("fore.alpha", 0.000001)

    makeAnimatedLuaSprite("SKHealthBar", "SKhelf",0,0)
    addAnimationByPrefix("SKHealthBar", "chomp", "Helf")
    setObjectCamera("SKHealthBar", 'hud')
    setProperty("SKHealthBar.scale.x", 0.6)
    setProperty("SKHealthBar.scale.y", 0.6)
    screenCenter("SKHealthBar", 'x')
    setObjectOrder("SKHealthBar", 17)
    addLuaSprite("SKHealthBar", true)

    addToStage('bfshadow', 950, 825,1,1, true)
    setObjectCamera('bfshadow', 'game')
    setProperty('bfshadow.scale.x', 0.2)
    setProperty('bfshadow.scale.y', 0.2)
    setProperty('bfshadow.alpha', 0.7)
    setObjectOrder("bfshadow",getObjectOrder("back2")+1)


    if downscroll then
        setProperty("SKHealthBar.y", -100)
    else
        setProperty("SKHealthBar.y", screenHeight-250)
    end

    phase2 = false

    setProperty("sky.scale.x", 1.05)
    setProperty("sky.scale.y", 1.05)
    setProperty('defaultCamZoom', 1)

end

function addToStage(name, x, y, scrollx, scrolly, front) 
    stagething = "scarletking"
    makeLuaSprite(name, stagething.."/"..name, x, y);
	setScrollFactor(name, scrollx, scrolly);
    addLuaSprite(name, front)
end

function opponentNoteHit()
    if not sustainNote then
        if getProperty('health') > 0.3 then
            setProperty('health',getProperty('health')-0.015)
        end
    end
    if not speaking or curBeat >= 684 then
        triggerEvent('Screen Shake', "0.5, 0.0025", "0.5, 0.0015")
    end
end

function onSectionHit()
    playAnim("SKHealthBar", "chomp", false, false, 0)

    if not mustHitSection and not phase2 then
        setProperty('defaultCamZoom', 0.85)
    elseif phase2 then
        setProperty('defaultCamZoom', 0.6)
    else
        setProperty('defaultCamZoom', 1)
    end
end

function onBeatHit()
    if curBeat == 68 then -- singing starts
        setProperty('defaultCamZoom', 0.85)
        updateBars(false)
    end
    if curBeat == 404 then -- voice line not found?
        updateBars(true)
    end
    if curBeat == 475 then -- 2nd voice line is over
        letMeCook()
    end
    if curBeat == 479 then -- phase 2
        onCreate2()
        updateBars(false)
    end
    if curBeat == 544 then -- switch to nevada again (I NOW SENTENCE YOU TO GO TO NEVADA)
        removeItAll()
    end
    if curBeat == 684 then
        updateBars(true)
        triggerEvent("Change Scroll Speed", "1.15")
    end
    if curBeat == 750 then -- ending
        weCookingAgain()
    end
end

function onUpdate()
    if curBeat >= 480 and curBeat < 544 then
        onUpdate2()
    end
end

function onSongStart()
    createBars()
    updateBars(true)
    setProperty('defaultCamZoom', 0.85)
    triggerEvent("Subtitle", "You should be kneeling before me.")
end

---===================================== CUSTOM P2 SHIT!

function onCreate2() -- call when p2 time!

    phase2 = true
    setProperty("sky.visible",false)
    setProperty("back1.visible", false)
    setProperty("back2.visible",false)
    setProperty("front1.visible", false)
    setProperty("front2.visible", false)
    setProperty("filter.visible", false)

    setProperty('boyfriend.visible', false)

    byebyeUI()

    setProperty("red.alpha", 1)
    setProperty("fore.alpha", 1)
    setProperty("dad.scale.x", 1.2)
    setProperty("dad.scale.y", 1.2)
    setProperty("dad.y", getProperty("dad.y")-100)

    triggerEvent("Change Character", "dad", "SKBadApple")

    setProperty('defaultCamZoom', 0.6)

    nvmWeAintCooking()
    -- if i have to type setProperty one for fucking time im killing myself

    setObjectOrder("fore", 10)
end

function removeItAll()
    cameraFlash("camGame", 'ffffff', 0.8, true)
    setProperty("red.alpha", 0.000001)
    setProperty("fore.alpha", 0.000001)
    setProperty('boyfriend.visible', true)
    setProperty("sky.visible",true)
    setProperty("back1.visible", true)
    setProperty("back2.visible",true)
    setProperty("front1.visible", true)
    setProperty("front2.visible", true)
    setProperty("filter.visible", true)
    triggerEvent("Change Character", "dad", "SK")
    setProperty('defaultCamZoom', 0.85)
    helloMario()
    phase2 = false
end

function addToStage2(name, x, y, scrollx, scrolly, front) -- uh thank you to whoever wrote this before ilysm  <3
    stagething = "scarletking/phase2"
    makeLuaSprite(name, stagething.."/"..name, x, y);
	setScrollFactor(name, scrollx, scrolly);
    addLuaSprite(name, front)
end

function onUpdate2()
    setProperty('camFollow.x', 980) 
	setProperty('camFollow.y', 450) 
end

-- =============== bars and ui shit yay!

function letMeCook() -- fade black
    makeLuaSprite('black', 'empty', 0,0)
	makeGraphic('black', 1920, 1080, '000000')
	setObjectCamera('black', 'other')
	setProperty('black.alpha', 0.00001)
    setObjectOrder("black", 10000) -- teehee
	addLuaSprite('black', true)
    doTweenAlpha('blackTween', 'black', 1, 0.4, 'sineIn')
end

function nvmWeAintCooking()
    doTweenAlpha('blackTween', 'black', 0, 0.2, 'sineIn')
end

function weCookingAgain()
    doTweenAlpha('blackTween2', 'black', 1, 0.5, 'sineIn')
end

function createBars()
    makeLuaSprite('Topblack', 'empty', 0,0)
	makeGraphic('Topblack', screenWidth*1.3, 130, '000000')
    setProperty('Topblack.scale.x', '1.3')
    setObjectCamera('Topblack', 'hud')
    screenCenter('Topblack', 'xy')
    setProperty('Topblack.y', 0-130)
    addLuaSprite('Topblack')

    makeLuaSprite('Botblack', 'empty', 0,0)
	makeGraphic('Botblack', screenWidth*1.3, 130, '000000')
    setObjectCamera('Botblack', 'hud')
    setProperty('Botblack.scale.x', '1.3')
    screenCenter('Botblack', 'xy')
    setProperty('Botblack.y', screenHeight)
    addLuaSprite('Botblack')

    setProperty('Botblack.alpha', 0.000001)
    setProperty('Topblack.alpha', 0.000001)

    setObjectOrder("Topblack", 1)
    setObjectOrder("Botblack", 1)
end

function updateBars(thing)
    if thing then
        -- tween in
        speaking = true
        doTweenAlpha("TopAlphaTweenIn", "Topblack", 1, 0.3, "quartOut")
        doTweenAlpha("BotAlphaTweenIn", "Botblack", 1, 0.3, "quartOut")
        doTweenY("TopblackTweenIn", "Topblack", 0, 0.6, "quartOut")
        doTweenY("TBotblackTweenIn", "Botblack", screenHeight-130, 0.6, "quartOut")
    else
        -- tween out
        speaking = false
        doTweenAlpha("TopAlphaTweenOut", "Topblack", 1, 0.7, "quartOut")
        doTweenAlpha("BotAlphaTweenOut", "Botblack", 1, 0.7, "quartOut")
        doTweenY("TopblackTweenOut", "Topblack", 0-130, 0.6, "quartOut")
        doTweenY("TBotblackTweenOut", "Botblack", screenHeight, 0.6, "quartOut")
    end
end

function byebyeUI()
    setProperty("SKHealthBar.alpha", 0.00001)
    setProperty("timeBar.alpha", 0.00001)
    setProperty("timeBarBG.alpha", 0.00001)
    setProperty("healthBar.alpha", 0.00001)
    setProperty("healthBarBG.alpha", 0.00001)
    setProperty("timeTxt.alpha", 0.00001)
    setProperty("scoreTxt.alpha", 0.00001)
    setProperty("iconP1.alpha", 0.00001)
    setProperty("iconP2.alpha", 0.00001)
    setProperty("botplayTxt.visible", false)
end

function helloMario()
    setProperty("SKHealthBar.alpha", 1)
    setProperty("timeBar.alpha", 1)
    setProperty("timeBarBG.alpha", 1)
    setProperty("healthBar.alpha", 1)
    setProperty("healthBarBG.alpha", 1)
    setProperty("timeTxt.alpha", 1)
    setProperty("scoreTxt.alpha", 1)
    setProperty("iconP1.alpha", 1)
    setProperty("iconP2.alpha", 1)
    if botPlay then
        setProperty("botplayTxt.visible", true)
    end
end

function onStepHit()
    if curStep == 49 then
        triggerEvent("Subtitle", "FOR I")
    elseif curStep == 70 then
        triggerEvent("Subtitle", "AM")
    elseif curStep == 86 then
        triggerEvent("Subtitle", "THE")
    elseif curStep == 95 then
        triggerEvent("Subtitle", "SCARLET")
    elseif curStep == 109 then
        triggerEvent("Subtitle", "KING!")
    elseif curStep == 112 then
        triggerEvent("Subtitle", "")
    elseif curStep == 124 then
        triggerEvent("Subtitle", "Huh?") 
    elseif curStep == 135 then
        triggerEvent("Subtitle", "")
    elseif curStep == 147 then
        triggerEvent("Subtitle", "So you want to battle...")
    elseif curStep == 190 then
        triggerEvent("Subtitle", "")  
    elseif curStep == 201 then
        triggerEvent("Subtitle", "Let's")
    elseif curStep == 221 then
        triggerEvent("Subtitle", "Let's Battle...") 
    elseif curStep == 247 then
        triggerEvent("Subtitle", "") 
    elseif curStep == 1615 then
        triggerEvent("Subtitle", "You insuffient FUCK.")
    elseif curStep == 1659 then
        triggerEvent("Subtitle", "Do you not understand?")
    elseif curStep == 1696 then
        triggerEvent("Subtitle", "You are weaker than a")
    elseif curStep == 1718 then
        triggerEvent("Subtitle", "pawn to me.")
    elseif curStep == 1739 then
        triggerEvent("Subtitle", "")
    elseif curStep == 1745 then
        triggerEvent("Subtitle", "Let me lay it out for you.")
    elseif curStep == 1782 then
        triggerEvent("Subtitle", "My guards are gonna handle ya")
    elseif curStep == 1826 then
        triggerEvent("Subtitle", "AND I'M GONNA PLAY HOPSCOTCH")
    elseif curStep == 1872 then
        triggerEvent("Subtitle", "IN YOUR")
    elseif curStep == 1886 then
        triggerEvent("Subtitle", "CHEST CAVITY")
    elseif curStep == 1910 then
        triggerEvent("Subtitle", "")

    end
end

luaDebugMode = true