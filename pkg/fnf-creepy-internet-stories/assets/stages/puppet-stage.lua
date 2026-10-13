local mult

function onCreatePost()
    setProperty('healthBar.scale.y', 3)

    loadGraphic('healthBarBG', 'stages/set/gilded')
    setObjectOrder('healthBarBG', getObjectOrder('iconP1') - 1)

    setProperty('healthBarBG.xAdd', -64)
    setProperty('healthBarBG.yAdd', -86)

    mult = (downscroll and -1 or 1)

    for i = 0, 7 do
        setPropertyFromGroup('strumLineNotes', i, 'acceleration.y', 2000 * mult)

        makeLuaSprite('string' .. i, 'stages/set/stringy', getMidpointX('strumLineNotes.members[' .. i .. ']') - 5)
        setObjectCamera('string' .. i, 'camHUD')

        addLuaSprite('string' .. i)
    end

	makeLuaSprite('hitbox', '', 0, defaultOpponentStrumY0 + (downscroll and -50 or getPropertyFromGroup('strumLineNotes', 0, 'height')))
	makeGraphic('hitbox', 1280, 50, '000000')
	setProperty('hitbox.immovable', true)
    
	addLuaSprite('hitbox')

    for i, objs in pairs({'stage', 'curtain', 'trees'}) do
        makeLuaSprite(objs, 'stages/set/' .. objs)
        addLuaSprite(objs)
    end

    makeLuaSprite('intro', 'stages/set/introCard')
    setObjectCamera('intro', 'other')

    setProperty('camHUD.alpha', 0)
    cameraFade('camGame', '000000', 0)
    
    setProperty('introSoundsSuffix', nil)

    --for i, things in pairs({'timeBar', 'timeBarBG', 'timeTxt', 'scoreTxt'}) do setProperty(things .. '.visible', false) end
end

function onStartCountdown() runTimer('start', 1) end

function onSoundFinished(tag) if tag == 'intro' then removeLuaSprite('intro', true) end end

function onTimerCompleted(tag)
    if tag == 'start' then
        playSound('coveIntro', 1, 'intro')
        
        addLuaSprite('intro')
    end
end

function onUpdatePost(elapsed)
    for i = 0, 7 do
        local grounded = runHaxeCode('return FlxG.collide(game.strumLineNotes.members[' .. i .. '], game.getLuaObject("hitbox"));')

        if getRandomBool(elapsed * 60) and grounded then setPropertyFromGroup('strumLineNotes', i, 'velocity.y', -400 * mult) end

        setProperty('string' .. i .. '.y', getPropertyFromGroup('strumLineNotes', i, 'y') - (downscroll and -25 or 175))
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    if getProperty('gf.idleSuffix') ~= '' then return end

    playAnim('gf', getProperty('singAnimations')[direction + 1], true)
    
	setProperty('gf.holdTimer', 0)
end