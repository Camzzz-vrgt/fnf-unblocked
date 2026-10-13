
local allowCountdown = false
function onStartCountdown()
    if not allowCountdown and isStoryMode and not seenCutscene then
        setProperty('camHUD.visible', false);
        setProperty('camGame.visible', false);
        runTimer('lowEnd',2,1);

        allowCountdown = true;
        return Function_Stop;
    end
    return Function_Continue;
end

function onCreate()

    seenCutscene = false;

    addCharacterToList('spikeDeath', 'boyfriend');

    makeAnimatedLuaSprite('spikeDeath', 'spikeDeath');
    luaSpriteAddAnimationByPrefix('spikeDeath', 'bfDies', 'BF dies', 24, false);
    luaSpriteAddAnimationByPrefix('spikeDeath', 'bfDeadLoop', 'BF Dead Loop', 24, true);
    luaSpriteAddAnimationByPrefix('spikeDeath', 'bfDeadConfirm', 'BF Dead confirm', 24, false);

    setPropertyFromClass('GameOverSubstate', 'characterName', 'spikeDeath')


    makeAnimatedLuaSprite('AuditorStrings', 'AuditorStrings', 200, 275);
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Give Up', 'Strings', 0)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Ugh', 'Strings', 1)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Gaaahhh', 'Strings', 2)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Incompetent', 'Strings', 3)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Suffer', 'Strings', 4)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Goodbye', 'Strings', 5)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Die', 'Strings', 6)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Futile', 'Strings', 7)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Worthless', 'Strings', 8)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'All In Vain', 'Strings', 9)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Haha', 'Strings', 10)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Worm', 'Strings', 11)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Youre Nothing', 'Strings', 12)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Get Out', 'Strings', 13)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Go Away', 'Strings', 14)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Parasite', 'Strings', 15)
    luaSpriteAddAnimationByIndices('AuditorStrings', 'Insignificant', 'Strings', 16)
    scaleLuaSprite('AuditorStrings', 1, 1)
    addLuaSprite('AuditorStrings', true)
    setPropertyLuaSprite('AuditorStrings', 'alpha', 0)

    makeAnimatedLuaSprite('AuditorMissStrings', 'AuditorStrings', 0, 200);
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Failure', 'Strings', 17)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Waste Of Space', 'Strings', 18)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Pathetic', 'Strings', 19)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Get Out', 'Strings', 13)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Awful', 'Strings', 20)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Incorrect', 'Strings', 21)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Hilarious', 'Strings', 22)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Die Already', 'Strings', 23)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Do That Again', 'Strings', 24)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Ha', 'Strings', 25)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Unbelievable', 'Strings', 26)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'How Sad', 'Strings', 27)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Disappointing', 'Strings', 28)
    luaSpriteAddAnimationByIndices('AuditorMissStrings', 'Idiotic', 'Strings', 29)
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
    if unluckyRoll >= 60 then
        runTimer('AuditorMissString', 0, 1)
    end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)

    local luckyRoll = math.random(1, 100)

    if (luckyRoll >= 70 and isSustainNote == false) then
        runTimer('AuditorStringTime', 0, 1)
        runTimer('AuditorAlpha', 0.3, 1)
	end
end

AuditorStrings = {
    [0] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Give Up')
        runTimer('stringAngles', 0.02, 90)
    end,

    [1] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Ugh')
        runTimer('stringAngles', 0.02, 90)
    end,

    [2] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Gaaahhh')
        runTimer('stringAngles', 0.02, 90)
    end,

    [3] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Incompetent')
        runTimer('stringAngles', 0.02, 90)
    end,

    [4] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Suffer')
        runTimer('stringAngles', 0.02, 90)
    end,

    [5] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Goodbye')
        runTimer('stringAngles', 0.02, 90)
    end,

    [6] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Die')
        runTimer('stringAngles', 0.02, 90)
    end,

    [7] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Futile')
        runTimer('stringAngles', 0.02, 90)
    end,

    [8] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Worthless')
        runTimer('stringAngles', 0.02, 90)
    end,

    [9] = function()
        luaSpritePlayAnimation('AuditorStrings', 'All In Vain')
        runTimer('stringAngles', 0.02, 90)
    end,

    [10] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Haha')
        runTimer('stringAngles', 0.02, 90)
    end,

    [11] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Worm')
        runTimer('stringAngles', 0.02, 90)
    end,

    [12] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Youre Nothing')
        runTimer('stringAngles', 0.02, 90)
    end,

    [13] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Get Out')
        runTimer('stringAngles', 0.02, 90)
    end,

    [14] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Go Away')
        runTimer('stringAngles', 0.02, 90)
    end,

    [15] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Parasite')
        runTimer('stringAngles', 0.02, 90)
    end,

    [16] = function()
        luaSpritePlayAnimation('AuditorStrings', 'Insignificant')
        runTimer('stringAngles', 0.02, 90)
    end,
}

AuditorMissStrings = {
    [0] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Failure')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [1] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Waste Of Space')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [2] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Pathetic')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [3] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Get Out')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [4] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Awful')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [5] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Incorrect')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [6] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Hilarious')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [7] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Die Already')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [8] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Do That Again')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [9] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Ha')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [10] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Unbelievable')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [11] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'How Sad')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [12] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Disappointing')
        runTimer('stringMissAngles', 0.02, 90)
    end,

    [13] = function()
        luaSpritePlayAnimation('AuditorMissStrings', 'Idiotic')
        runTimer('stringMissAngles', 0.02, 90)
    end,

}

function onTimerCompleted(tag, loops, loopsLeft)
    
    if tag == 'lowEnd' then
        startVideo('cut1');
        setProperty('camHUD.visible', true);
        setProperty('camGame.visible', true);
    end

    if tag == 'AuditorStringTime' then
        playSound('staticSound', 1)
        setPropertyLuaSprite('AuditorStrings', 'alpha', 1)
        counter = math.random(0, 16)
        stringY = math.random(250,325)
        setPropertyLuaSprite('AuditorStrings', 'y', stringY)
        AuditorStrings[counter]()
	end

    if tag == 'AuditorMissString' then
        playSound('staticSound')
        setPropertyLuaSprite('AuditorMissStrings', 'alpha', 1)
        misscounter = math.random(0, 13)
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

function onEndSong()
    if isStoryMode and not seenCutscene then
        startVideo('cut2')
        seenCutscene = true
        return Function_Stop
    end
    return Function_Continue
end