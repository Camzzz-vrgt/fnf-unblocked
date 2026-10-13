local BFfocus = true
local secondbeat = true
local blackBO = false
local beatsevents = false
local BFY=-40
local DADY=0
noMissActive = false
function onCreate()
    for i = 1,4 do
    makeLuaSprite('backG'.. i, 'old studio/G'..i ,-636.15,-1022.85)
    addLuaSprite('backG'.. i, false)
    end

    makeLuaSprite('papercolor',nil, -636.15, -1022.85)
    makeGraphic('papercolor', getProperty('backG1.width'), getProperty('backG1.height'), "F4C568")
    setProperty('papercolor.alpha', 0)
    addLuaSprite('papercolor', false)

	makeLuaSprite('black screen', nil)
	makeGraphic('black screen', 1, 1, '000000')
	addLuaSprite('black screen')
	setObjectCamera('black screen', 'other')
	setProperty('black screen.alpha', 0)

    makeLuaSprite('black screen2', nil)
	makeGraphic('black screen2', 1, 1, '000000')
	addLuaSprite('black screen2')
	setObjectCamera('black screen2', 'hud')
	setGraphicSize('black screen2', 1285, 725)


    makeAnimatedLuaSprite('title', 'titles/two-face', 520, -240)   
    scaleObject('title', 1.3, 1.3) 
    setProperty('title.alpha', 0)
    addLuaSprite('title')

    makeLuaText('noMissText', "DON'T MISS ANY NOTE!", 1280, 0, screenHeight / 2 - 50)
    setTextSize('noMissText', 60)
    setTextColor('noMissText', 'FF0000') -- Rojo puro
    setTextAlignment('noMissText', 'center')
    setObjectCamera('noMissText', 'hud') -- Mismo layer que la HUD
    addLuaText('noMissText')
    setProperty('noMissText.alpha', 0)

end
function onCreatePost()
    setObjectOrder('black screen2', getObjectOrder('noteGroup') + 1);
    triggerEvent('Camera Follow Pos',837,115)
end

function onSongStart()
    doTweenAlpha('blackscreen', 'blackscreen2', 0, 10, 'circInOut')
    if downscroll then
        for i = 0,7 do noteTweenY("Strum"..i, i, 720, 0.001, "lineal") end
    else
        for i = 0,7 do noteTweenY("Strum"..i, i, -110, 0.001, "lineal") end
    end
end

function onEvent(name, v1, v2)
    if name == 'Play Animation' then 
        if v1 == 'title' then
            doTweenAlpha('titleal', 'title', 1, 1, 'circInOut')
            addAnimationByPrefix('title', 'title', 'title', 24, false)
        end
        if v1 == 'bye title' then
            doTweenAlpha('titleal', 'title', 0, 1, 'cirIn')
        end
        if v1 == 'welcome' then
            doTweenY("bfy", "boyfriend", BFY, 0.84, "circIn")
            doTweenY("dady", "dad", DADY, 0.84, "circIn")
        end
        if v1 == 'welcome2' then
            beatsevents= true
            if downscroll then
                for i = 0,7 do noteTweenY("Strum"..i, i, 568, 0.5, "circout") end
            else
                for i = 0,7 do noteTweenY("Strum"..i, i, 51, 0.5, "circout") end
            end
        end
        if v1 == 'calm down' then
            secondbeat = false
            blackBO = true
            cameraFlash('game', 'FFFFFF', 0.4, true)
            for i = 1,4 do
            doTweenColor('BGcolor'..i, 'backG'..i, '616161', 1, 'circOut')
            end
        end
        if v1 == 'un calm down' then
            secondbeat = false
            blackBO = false
            camxlol = getProperty("camFollow.x")
			camylol = getProperty("camFollow.y")
            triggerEvent('Camera Follow Pos',camxlol,camylol)
            doTweenY("camFollowYsd", 'camFollow', 115, 0.5, "circOut")
            doTweenX("camFollowxsd", 'camFollow', 837, 0.5, "circOut")
            doTweenColor('olliecolor', 'dad', 'FFFFFF', 0.91, 'circOut')
            doTweenColor('bendycolor', 'boyfriend', 'FFFFFF', 0.91, 'circOut')
            doTweenZoom('zoomcam', 'camGame', 0.9, 0.91, 'circOut')
            if downscroll then
                for i = 0,3 do noteTweenY("Strum"..i, i, 568, 0.5, "circout") end
                for i = 4,7 do noteTweenY("Strum"..i, i, 570, 0.5, "circout") end
            else
                for i = 0,3 do noteTweenY("Strum"..i, i, 51, 0.5, "circout") end
                for i = 4,7 do noteTweenY("Strum"..i, i, 50, 0.5, "circout") end
            end

        end
        if v1 == 'red' then
            cameraFlash('game', 'FFFFFF', 0.4, true)
            doTweenColor('bendycolor', 'boyfriend', 'FF0000', 1, 'circOut')
            doTweenColor('olliecolor', 'dad', 'FF0000', 1, 'circOut')
            doTweenZoom('zoomcam', 'camGame', 0.5, 1, 'circOut')
            doTweenY("camFollowYsd", 'camFollow', 65, 1, "circOut")
            secondbeat = true

            for i = 1,4 do doTweenColor('BGcolor'..i, 'backG'..i, '4d0000', 1, 'circOut') end

            for i = 0,7 do noteTweenAngle("Strum"..i, i, 360, 1, "circout") end

            for i = 0, getProperty('playerStrums.length')-1 do
                setPropertyFromGroup('opponentStrums', i, 'color', 0xFF0000)
                setPropertyFromGroup('playerStrums', i, 'color', 0xFF0000)
            end
            for i = 0, getProperty('unspawnNotes.length')-1 do setPropertyFromGroup('unspawnNotes', i, 'color', 0xFF0000) end
            for i = 0, getProperty('notes.length')-1 do setPropertyFromGroup('notes', i, 'color', 0xFF0000) end

            doTweenAlpha('healthBarFadeOut', 'healthBar', 0, 0.7, 'linear')
            doTweenAlpha('iconP1FadeOut', 'iconP1', 0, 0.7, 'linear')
            doTweenAlpha('iconP2FadeOut', 'iconP2', 0, 0.7, 'linear')
            doTweenAlpha('scoreFadeOut', 'scoreTxt', 0, 0.7, 'linear')
            doTweenAlpha('timeBarFadeOut', 'timeBar', 0, 0.7, 'linear')
            doTweenAlpha('timeTxtFadeOut', 'timeTxt', 0, 0.7, 'linear')

        end
        if v1 == 'red out' then
            doTweenColor('bendycolor', 'boyfriend', 'FFFFFF', 1, 'circIn')
            doTweenColor('olliecolor', 'dad', 'FFFFFF', 1, 'circIn')
            for i = 1,4 do doTweenColor('BGcolor'..i, 'backG'..i, 'FFFFFF', 1, 'circIn') end
            doTweenAlpha('healthBarFadeIn', 'healthBar', 1, 0.7, 'linear')
            doTweenAlpha('iconP1FadeIn', 'iconP1', 1, 0.7, 'linear')
            doTweenAlpha('iconP2FadeIn', 'iconP2', 1, 0.7, 'linear')
            doTweenAlpha('scoreFadeIn', 'scoreTxt', 1, 0.7, 'linear')
            doTweenAlpha('timeBarFadeIn', 'timeBar', 1, 0.7, 'linear')
            doTweenAlpha('timeTxtFadeIn', 'timeTxt', 1, 0.7, 'linear')
        end
        if v1 == 'blackscreen2' then
            setProperty('black screen.alpha', 1)
        end
        if v1 == 'blackscreen3' then
            setProperty('black screen2.alpha', 1)
        end
        if v1 == 'back to normal' then
            camxlol = getProperty("camFollow.x")
			camylol = getProperty("camFollow.y")
            triggerEvent('Camera Follow Pos',camxlol,camylol)
            setProperty('boyfriend.color', 0xffffff)
            setProperty('dad.color', 0xffffff)
            setProperty('black screen.alpha', 0)
            cameraFlash('game', 'FFFFFF', 0.4, true)
            doTweenY("camFollowYsd", 'camFollow', 115, 0.5, "circOut")
            doTweenX("camFollowxsd", 'camFollow', 837, 0.5, "circOut")
            doTweenZoom('zoomcam', 'camGame', 0.6, 1, 'circOut')
            for i = 1,4 do doTweenColor('BGcolor'..i, 'backG'..i, 'FFFFFF', 1, 'circOut') end
            for i = 0,7 do noteTweenAngle("Strum"..i, i, 720, 1, "circOut") end

            for i = 0, getProperty('playerStrums.length')-1 do
                setPropertyFromGroup('opponentStrums', i, 'color', 0xF4C568)
                setPropertyFromGroup('playerStrums', i, 'color', 0xF4C568)
            end
            for i = 0, getProperty('unspawnNotes.length')-1 do setPropertyFromGroup('unspawnNotes', i, 'color', 0xF4C568) end
            for i = 0, getProperty('notes.length')-1 do setPropertyFromGroup('notes', i, 'color', 0xF4C568) end
                        doTweenAlpha('healthBarFadeIn', 'healthBar', 1, 0.7, 'linear')
            doTweenAlpha('iconP1FadeIn', 'iconP1', 1, 0.7, 'linear')
            doTweenAlpha('iconP2FadeIn', 'iconP2', 1, 0.7, 'linear')
            doTweenAlpha('scoreFadeIn', 'scoreTxt', 1, 0.7, 'linear')
            doTweenAlpha('timeBarFadeIn', 'timeBar', 1, 0.7, 'linear')
            doTweenAlpha('timeTxtFadeIn', 'timeTxt', 1, 0.7, 'linear')
        end
        if v1 == 'halfdarkollie' then
            setProperty('boyfriend.color', 0x616161)
            doTweenZoom('zoomcam', 'camGame', 0.9, 0.5, 'circOut')
            for i = 1,4 do doTweenColor('BGcolor'..i, 'backG'..i, '000000', 0.5, 'circOut') end
        end
        if v1 == 'halfdarkbendy' then
            setProperty('dad.color', 0x616161)
            doTweenZoom('zoomcam', 'camGame', 0.9, 0.5, 'circOut')
            for i = 1,4 do doTweenColor('BGcolor'..i, 'backG'..i, '000000', 0.5, 'circOut') end
        end
        if v1 == "paperOllie" then
            setProperty('dad.color', 0x000000)
            setProperty('boyfriend.alpha', 0)
            doTweenZoom('zoomcam', 'camGame', 0.9, 0.5, 'circOut')
            setProperty('papercolor.alpha', 1)
            for i = 0, getProperty('playerStrums.length')-1 do
                setPropertyFromGroup('playerStrums', i, 'color', 0x000000)
                setPropertyFromGroup('playerStrums', i, 'alpha', 0.5)
            end
            for i = 0, getProperty('unspawnNotes.length')-1 do
                if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                    setPropertyFromGroup('unspawnNotes', i, 'color', 0x000000)
                    setPropertyFromGroup('unspawnNotes', i, 'alpha', 0.5)
                end
            end
            for i = 0, getProperty('notes.length')-1 do
                if getPropertyFromGroup('notes', i, 'mustPress') then
                    setPropertyFromGroup('notes', i, 'color', 0x000000)
                    setPropertyFromGroup('notes', i, 'alpha', 0.5)
                end
            end
        end
        if v1 == 'paperBendy' then
            setProperty('boyfriend.color', 0x000000)
            setProperty('dad.alpha', 0)
            doTweenZoom('zoomcam', 'camGame', 0.9, 0.5, 'circOut')
            setProperty('papercolor.alpha', 1)
            for i = 0, getProperty('playerStrums.length')-1 do
                setPropertyFromGroup('opponentStrums', i, 'color', 0x000000)
                setPropertyFromGroup('opponentStrums', i, 'alpha', 0)
            end
            for i = 0, getProperty('unspawnNotes.length')-1 do
                if not getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
                    setPropertyFromGroup('unspawnNotes', i, 'color', 0x000000)
                    setPropertyFromGroup('unspawnNotes', i, 'alpha', 0)
                end
            end
            for i = 0, getProperty('notes.length')-1 do
                if not getPropertyFromGroup('notes', i, 'mustPress') then
                    setPropertyFromGroup('notes', i, 'color', 0x000000)
                    setPropertyFromGroup('notes', i, 'alpha', 0)
                end
            end
        end
        if v1 == 'unpaper' then
            setProperty('boyfriend.color', 0xFFFFFF)
            setProperty('boyfriend.alpha', 1)
            setProperty('dad.color', 0xFFFFFF)
            setProperty('dad.alpha', 1)
            doTweenZoom('zoomcam', 'camGame', 0.6, 1, 'quadOut')
            setProperty('papercolor.alpha', 0)
            for i = 0, getProperty('playerStrums.length')-1 do
                setPropertyFromGroup('opponentStrums', i, 'color', 0xF4C568)
                setPropertyFromGroup('playerStrums', i, 'color', 0xF4C568)
                setPropertyFromGroup('playerStrums', i, 'alpha', 1)
                setPropertyFromGroup('opponentStrums', i, 'alpha', 1)
            end
            for i = 0, getProperty('unspawnNotes.length')-1 do
                setPropertyFromGroup('unspawnNotes', i, 'color', 0xF4C568)
                setPropertyFromGroup('unspawnNotes', i, 'alpha', 1)
            end
            for i = 0, getProperty('notes.length')-1 do
                setPropertyFromGroup('notes', i, 'color', 0xF4C568)
                setPropertyFromGroup('notes', i, 'alpha', 1)
            end
            camxlol = getProperty("camFollow.x")
			camylol = getProperty("camFollow.y")
            triggerEvent('Camera Follow Pos',camxlol,camylol)
            doTweenY("camFollowYsd", 'camFollow', 115, 0.5, "circOut")
            doTweenX("camFollowxsd", 'camFollow', 837, 0.5, "circOut")
        end
    end
end
function onBeatHit()
    if beatsevents then
        if curBeat % 2== 0 then
                setProperty("boyfriend.y", BFY+30)
                setProperty("dad.y", DADY+50)
                doTweenY("bfy", "boyfriend", BFY, 0.5, "circOut")
                doTweenY("dady", "dad", DADY, 0.5, "circOut")
        end
        if secondbeat then
            if curBeat % 2== 1 then
                setProperty("boyfriend.y", BFY+20)
                doTweenY("bfy", "boyfriend", BFY, 0.5, "circOut")

                setProperty("dad.y", DADY+30)
                doTweenY("dady", "dad", DADY, 0.5, "circOut")
            end
        end
    end
    if curBeat % 4 == 0 then 
        setProperty('backG1.alpha', 1)
        setProperty('backG2.alpha', 0)
        setProperty('backG3.alpha', 0)
        setProperty('backG4.alpha', 0)
    end
        if curBeat % 4 == 1 then 
        setProperty('backG1.alpha', 0)
        setProperty('backG2.alpha', 1)
        setProperty('backG3.alpha', 0)
        setProperty('backG4.alpha', 0)
    end
        if curBeat % 4 == 2 then 
        setProperty('backG1.alpha', 0)
        setProperty('backG2.alpha', 0)
        setProperty('backG3.alpha', 1)
        setProperty('backG4.alpha', 0)
    end
        if curBeat % 4 == 3 then 
        setProperty('backG1.alpha', 0)
        setProperty('backG2.alpha', 0)
        setProperty('backG3.alpha', 0)
        setProperty('backG4.alpha', 1)
    end
end
function onMoveCamera(focus)
    if blackBO then
        if focus == 'boyfriend' then
            doTweenColor('bendycolor', 'boyfriend', 'FFFFFF', 1, 'circOut')
            doTweenColor('olliecolor', 'dad', '000000', 1, 'circOut')
            doTweenZoom('zoomcam', 'camGame', 1.1, 1, 'circOut')
            if downscroll then
                for i = 0,3 do noteTweenY("Strum"..i, i, 720, 0.5, "circIn") end
                for i = 4,7 do noteTweenY("Strum"..i, i, 570, 0.5, "circout") end
            else
                for i = 0,3 do noteTweenY("Strum"..i, i, -110, 0.5, "circIn") end
                for i = 4,7 do noteTweenY("Strum"..i, i, 50, 0.5, "circout") end
            end
        elseif focus == 'dad' then
            doTweenZoom('zoomcam', 'camGame', 0.95, 1, 'circOut')
            doTweenColor('bendycolor', 'boyfriend', '000000', 1, 'circOut')
            doTweenColor('olliecolor', 'dad', 'FFFFFF', 1, 'circOut')
            if downscroll then
                for i = 0,3 do noteTweenY("Strum"..i, i, 568, 0.5, "circout") end
                for i = 4,7 do noteTweenY("Strum"..i, i, 720, 0.5, "circIn") end
            else
                for i = 0,3 do noteTweenY("Strum"..i, i, 51, 0.5, "circout") end
                for i = 4,7 do noteTweenY("Strum"..i, i, -110, 0.5, "circIn") end
            end
        end
    end
end
function onTweenCompleted(tag)
    if tag == 'zoomcam' then
        setProperty("defaultCamZoom",getProperty('camGame.zoom'))
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
    if noMissActive then
        setProperty('health', -500) -- Insta kill
    end
end