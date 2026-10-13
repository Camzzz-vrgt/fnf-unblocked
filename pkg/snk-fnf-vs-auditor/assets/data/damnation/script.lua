function onCreate()

    setProperty('gf.visible', false)

    addCharacterToList('spikeDeath', 'boyfriend');

    makeAnimatedLuaSprite('spikeDeath', 'spikeDeath');
    luaSpriteAddAnimationByPrefix('spikeDeath', 'bfDies', 'BF dies', 24, false);
    luaSpriteAddAnimationByPrefix('spikeDeath', 'bfDeadLoop', 'BF Dead Loop', 24, true);
    luaSpriteAddAnimationByPrefix('spikeDeath', 'bfDeadConfirm', 'BF Dead confirm', 24, false);

    setPropertyFromClass('GameOverSubstate', 'characterName', 'spikeDeath')


    makeAnimatedLuaSprite('AuditorStrings', 'hellbg/AuditorEXStrings', 0, 275);
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Tired Of This', 'Strings', 0)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Disappear', 'Strings', 1)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Menace', 'Strings', 2)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'I Hate You', 'Strings', 3)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'This Is Over', 'Strings', 4)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Sick Of This Game', 'Strings', 5)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'End Of The Line', 'Strings', 6)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Out Of My Sight', 'Strings', 7)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'In My Way', 'Strings', 8)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Freak', 'Strings', 9)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Coward', 'Strings', 10)
    scaleLuaSprite('AuditorStrings', 1, 1)
    addLuaSprite('AuditorStrings', true)
    setPropertyLuaSprite('AuditorStrings', 'alpha', 0)

    makeAnimatedLuaSprite('AuditorMissStrings', 'hellbg/AuditorEXStrings', -200, 200);
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Appalling', 'Strings', 11)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Expected', 'Strings', 12)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Failure', 'Strings', 13)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Just Die', 'Strings', 14)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Atrocious', 'Strings', 15)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Idiotic', 'Strings', 16)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Preconceived', 'Strings', 17)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Unsurprising', 'Strings', 18)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Hilarious', 'Strings', 19)
    scaleLuaSprite('AuditorMissStrings', 1, 1)
    addLuaSprite('AuditorMissStrings', true)
    setPropertyLuaSprite('AuditorMissStrings', 'alpha', 0)

end

function goodNoteHit(id, direction, noteType, isSustainNote)
    runTimer('AuditorAlpha2', 0.3, 1)
end

function noteMiss()
    runTimer('AuditorAlpha2', 0.3, 1)
    local unluckyRoll = math.random(1, 70)
    if unluckyRoll >= 65 then
        runTimer('AuditorMissString', 0, 1)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)

    local luckyRoll = math.random(1, 100)

    if (luckyRoll >= 90 and isSustainNote == false) then
        runTimer('AuditorStringTime', 0, 1)
        runTimer('AuditorAlpha', 0.3, 1)
	end
end

AuditorStrings = {
    [0] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Tired Of This')
        runTimer('stringAngles', 0.02, 90)
    end,

    [1] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Disappear')
        runTimer('stringAngles', 0.02, 90)
    end,

    [2] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Menace')
        runTimer('stringAngles', 0.02, 90)
    end,

    [3] = function()
        luaSpritePlayAnimation('AuditorStrings', 'I Hate You')
        runTimer('stringAngles', 0.02, 90)
    end,

    [4] = function()
        luaSpritePlayAnimation('AuditorStrings', 'This Is Over')
        runTimer('stringAngles', 0.02, 90)
    end,

    [5] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Sick Of This Game')
        runTimer('stringAngles', 0.02, 90)
    end,

    [6] = function()
        luaSpritePlayAnimation('AuditorStrings', 'End Of The Line')
        runTimer('stringAngles', 0.02, 90)
    end,

    [7] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Out Of My Sight')
        runTimer('stringAngles', 0.02, 90)
    end,

    [8] = function()
        luaSpritePlayAnimation('AuditorStrings', 'In My Way')
        runTimer('stringAngles', 0.02, 90)
    end,

    [9] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Freak')
        runTimer('stringAngles', 0.02, 90)
    end,

    [10] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Coward')
        runTimer('stringAngles', 0.02, 90)
    end,
}

AuditorMissStrings = {
    [0] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Appalling')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [1] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Expected')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [2] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Failure')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [3] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Just Die')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [4] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Atrocious')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [5] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Idiotic')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [6] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Preconceived')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [7] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Unsurprising')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [8] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Hilarious')
        runTimer('stringMissAngles', 0.02, 90)
    end,
}

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'AuditorStringTime' then
        playSound('staticSound', 1)
        setPropertyLuaSprite('AuditorStrings', 'alpha', 1)
        counter = math.random(0, 10)
        stringY = math.random(250,325)
        setPropertyLuaSprite('AuditorStrings', 'y', stringY)
        AuditorStrings[counter]()
	end

    if tag == 'AuditorMissString' then
        playSound('staticSound')
        setPropertyLuaSprite('AuditorMissStrings', 'alpha', 1)
        misscounter = math.random(0, 8)
        stringY = math.random(75,150)
        setPropertyLuaSprite('AuditorStrings', 'y', stringY)
        AuditorMissStrings[misscounter]()
        runTimer('AuditorMissAlpha', 0.33, 1)
	end

    if tag == 'stringAngles' then
        setStringAngle = math.random(-5,5)
        setProperty('AuditorStrings.angle', setStringAngle)
    end

    if tag == 'stringMissAngles' then
        setStringAngle = math.random(-5,5)
        setProperty('AuditorMissStrings.angle', setStringAngle)
    end

    if tag == 'AuditorMissAlpha' then
        setPropertyLuaSprite('AuditorMissStrings', 'alpha', 0)
    end

    if tag == 'AuditorAlpha' then
        setPropertyLuaSprite('AuditorStrings', 'alpha', 0)
    end
    
    if tag == 'AuditorAlpha2' then
        setPropertyLuaSprite('AuditorStrings', 'alpha', 0)
    end

end

function onGameOver()
	-- You died! Called every single frame your health is lower (or equal to) zero
	-- return Function_Stop if you want to stop the player from going into the game over screen
    setProperty('boyfriend.curCharacter', 'spikeDeath')
    playSound('fnf_loss_sfx')
    playSound('spikedeathsound')
    playMusic('gameOver', 1, true)
	return Function_Continue;
end

function onGameOverConfirm(retry)
	-- Called when you Press Enter/Esc on Game Over
	-- If you've pressed Esc, value "retry" will be false
    setProperty('boyfriend.curCharacter', 'spikeDeath')
    luaSpritePlayAnimation('bfDeadConfirm')
    playMusic('gameOverEnd', 1, true)
end