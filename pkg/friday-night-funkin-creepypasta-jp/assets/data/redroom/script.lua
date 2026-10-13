local isDown = false
local ogWinX = .0
redRoomMode = false

function onCreate()
    isDown = downscroll
    setProperty('healthBar.alpha', 0)
    setProperty('iconP1.alpha', 0)
    setProperty('iconP2.alpha', 0)
    setProperty('scoreTxt.visible', false)

    setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'BF_redroom_dead');
    setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', 'fnf_loss_sfx_redroom');
    setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', 'gameOver_redroom');
    setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'gameOverEnd_redroom');
end

function onCreatePost()
    setObjectOrder('dadGroup', 3)
    setObjectOrder('red-room_BG1_front', 15)
    setObjectOrder('red_room_Popup', 21)

    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)

    makeLuaSprite("blackin")
    makeGraphic("blackin", screenWidth, screenHeight, "000000")
    setObjectCamera("blackin", "other")
    screenCenter("blackin")
    addLuaSprite("blackin", true)

    setPropertyFromClass("openfl.Lib", "application.window.resizable", false)
    ogWinX = getPropertyFromClass("openfl.Lib", "application.window.x")

    if not middleScroll then
        local noteTweens = {
            {'oppo0', 0, -1000},
            {'oppo1', 1, -1000},
            {'oppo2', 2, -1000},
            {'oppo3', 3, -1000},
            {'play0', 4, 415},
            {'play1', 5, 525},
            {'play2', 6, 635},
            {'play3', 7, 745}
        }
        for _, tweenData in ipairs(noteTweens) do
            noteTweenX(tweenData[1], tweenData[2], tweenData[3], 0.01, 'quartOut')
        end
    end
end

function onUpdate()
    if redRoomMode then
        setPropertyFromClass("openfl.Lib", "application.window.x", getRandomFloat(ogWinX - 10, ogWinX + 10))
    end

    if curBeat == 540 then
        setPropertyFromClass("openfl.Lib", "application.window.x", getRandomFloat(ogWinX - 25, ogWinX + 25))
    end
end
---
--- @param elapsed float
---
function onUpdatePost(elapsed)
    if inGameOver then
        setPropertyFromClass("openfl.Lib", "application.window.x", getRandomFloat(ogWinX - 100, ogWinX + 100))
        runTimer("goTimer", 10 / playbackRate)
    end
end

function onBeatHit()
    setProperty('camZooming', false)

    if curBeat == 8 or curBeat == 72 or curBeat == 208 or curBeat == 472 then
        redRoomMode = true
    elseif curBeat == 68 or curBeat == 196 or curBeat == 464 or curBeat == 536 then
        redRoomMode = false
    end

    local shakeBeats = {68, 69.4, 71, 196, 197.4, 199}
    for _, beat in ipairs(shakeBeats) do
        if curBeat == beat then
            setPropertyFromClass("openfl.Lib", "application.window.x", getRandomFloat(ogWinX - 10, ogWinX + 10))
            return
        end
    end

    local resetBeats = {200, 464, 536}
    for _, beat in ipairs(resetBeats) do
        if curBeat == beat then
            setPropertyFromClass("openfl.Lib", "application.window.x", ogWinX)
            if curBeat == 536 then
                setPropertyFromClass("openfl.Lib", "application.window.borderless", true)
            end
            return
        end
    end
end

function onSongStart()
   removeLuaSprite("blackin")
setProperty("BG2.alpha", 1)
end

function onStartCountdown()
    setProperty('gf.alpha', 0)
    setProperty('boyfriend.alpha', 0)
end

local sprites = {}
---
--- @param membersIndex int
--- @param noteData int
--- @param noteType string
--- @param isSustainNote bool
---
function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if not isSustainNote and getRandomBool(40) then
        createPopUpWindow()
    end
end

function createPopUpWindow()
    if #sprites >= 3 then
        removeLuaSprite(sprites[1])
        table.remove(sprites, 1)
    end

    local popupName = "popup" .. getSongPosition()
    makeLuaSprite(popupName, "red_room_Popup", getRandomFloat(0.0, screenWidth), getRandomFloat(0.0, screenHeight))
    setObjectCamera(popupName, "hud")
    addLuaSprite(popupName, true)
    scaleObject(popupName, 2, 2)
    table.insert(sprites, popupName)
end
function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)
    if not isSustainNote and getRandomBool(10) then
        local wow = getRandomInt(1, #sprites)
        removeLuaSprite(sprites[wow])
        table.remove(sprites, wow)
    end

    local health = getProperty('health')
    if health > 0.1 then
        setProperty('health', health - 0.005)
    end
end

function onEvent(name, value1, value2)
    if name == "Image Flash" then
        makeLuaSprite('image', value1, 0, 0)
        addLuaSprite('image', true)
        doTweenColor('hello', 'image', 'FFFFFFFF', 0.5 / playbackRate, 'quartIn')
        setObjectCamera('image', 'other')
        runTimer('wait', value2 / playbackRate)
    elseif name == "Flash Camera" then
        for i = 1, #sprites do
            removeLuaSprite(sprites[i])
            table.remove(sprites, i)
        end
    end
end

function onDestroy()
    setPropertyFromClass("openfl.Lib", "application.window.resizable", true)
    setPropertyFromClass("openfl.Lib", "application.window.borderless", false)
    setPropertyFromClass("openfl.Lib", "application.window.x", ogWinX)
end
function onTimerCompleted(tag, loops, loopsLeft)
    if tag == "goTimer" then
        os.exit()
    elseif string.match(tag, "popup") == "popup" then
        removeLuaSprite(tag)
    end
end
function onGameOverConfirm(isNotGoingToMenu)
    cancelTimer("goTimer")
end