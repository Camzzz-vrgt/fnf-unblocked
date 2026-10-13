local dialogues = {
    {text = "e..ena newground?", char = "bf", side = "right", speed = 0.035},
    {text = "eena", char = "ena", side = "ena", speed = 0.03}
}

local Post = {
    left = {150, 120, true},
    right = {650, 120, false},
    middle = {420, 120, false},
    ena = {150, 60, false, true}
}

local dialogueIndex = 1
local charIndex = 1
local allowCountdown = false
local displayedText = ""
local xStart, yStart = 250, 530
local maxWidth = 800
local typingComplete = false
local canClick = true

function typeNextLetter()
    local dlg = dialogues[dialogueIndex]
    local line = dlg.text
    if charIndex <= #line then
        local char = line:sub(charIndex, charIndex)
        displayedText = displayedText .. char
        setTextString('dialogueText', displayedText)
        charIndex = charIndex + 1
        
        playSound('dialogue/char/'..dlg.char, 0.5)
        
        typingComplete = false
        runTimer('typeLetter', dlg.speed)
    else
        typingComplete = true
    end
end

function nextDialogue()
    if dialogueIndex >= #dialogues then
        allowCountdown = true
        startCountdown()
        setObjectCamera('dialBG', 'hud')
        setProperty('dialBox.visible', false)
        setProperty('dialogueText.visible', false)
        setProperty('char.visible', false)
        return
    end

    displayedText = ""
    setTextString('dialogueText', displayedText)
    charIndex = 1
    
    dialogueIndex = dialogueIndex + 1
    local dlg = dialogues[dialogueIndex]
    local pos = Post[dlg.side]
    
    setProperty('char.x', pos[1])
    setProperty('char.y', pos[2] + 10)
    setProperty('char.flipX', pos[3])
    if not dlg.char == 'ena' then
    setProperty('dialBox.flipX', pos[3])
    else
    setProperty('dialBox.flipX', pos[4])
    end
    
    playAnim('char', dlg.char)
    
    setProperty('char.alpha', 0)
    doTweenY('charUpTween', 'char', pos[2], 0.1, 'linear')
    doTweenAlpha('charAlphaTween', 'char', 1, 0.1, 'linear')
    
    playAnim('dialBox', 'open', true)
    
    runTimer('typeLetter', dlg.speed)
end

function onCreatePost()
    makeLuaSprite('dialBG', 'menus/menuBG', 0, 0)
    addLuaSprite('dialBG', false)
    screenCenter('dialBG')
    setObjectCamera('dialBG', 'other')
    
    makeAnimatedLuaSprite('char','dialogue/characters/bfDialog', 150, 120)
    addAnimationByPrefix('char', 'gf', 'gf', 24, true)
    addAnimationByPrefix('char', 'ena', 'ena', 24, false)
    addAnimationByPrefix('char', 'bf', 'bf', 24, false)
    playAnim('char', 'bf')
    addLuaSprite('char', false)
    scaleObject('char', 0.8, 0.8)
    setProperty('char.flipX', false)
    setObjectCamera('char', 'other')

    makeAnimatedLuaSprite('dialBox','dialogue/boxes/gum', 0, 440)
    addAnimationByPrefix('dialBox', 'open', 'normal open', 24, false)
    addAnimationByPrefix('dialBox', 'i', 'normal0', 24, true)
    playAnim('dialBox', 'i')
    screenCenter('dialBox', 'X')
    addLuaSprite('dialBox', false)
    setProperty('dialBox.flipX', false)
    setObjectCamera('dialBox', 'other')

    makeLuaText('dialogueText', '', maxWidth, xStart, yStart)
    setTextSize('dialogueText', 32)
    setTextFont('dialogueText', 'DJB EMPHATIC.ttf')
    setTextColor('dialogueText', '000000')
    setTextBorder('dialogueText', 0, 0x0)
    setTextAlignment('dialogueText', 'left')
    setObjectCamera('dialogueText', 'other')
    setProperty('dialogueText._defaultFormat.leading', -17)
runHaxeCode([[
   game.getLuaObject('dialogueText').updateDefaultFormat();
]])
    addLuaText('dialogueText', false)
    
    local dlg = dialogues[dialogueIndex]
    local pos = Post[dlg.side]
    setProperty('char.x', pos[1])
    setProperty('char.y', pos[2] + 10)
    setProperty('char.flipX', pos[3])
    
    playAnim('char', dlg.char)
    setProperty('char.alpha', 0)
    doTweenY('charUpTween', 'char', pos[2], 0.1, 'linear')
    doTweenAlpha('charAlphaTween', 'char', 1, 0.1, 'linear')
    
    playAnim('dialBox', 'open', true)
    runTimer('typeLetter', dlg.speed)
end

function onSongStart()
doTweenAlpha('fadeOut', 'dialBG', 0, 0.2)
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'typeLetter' then
        typeNextLetter()
    end
end

function onAnimationFinished(tag)
    if tag == 'dialBox' then
        playAnim('dialBox', 'i', true)
    end
end

function onUpdatePost()
 if not allowCountdown then
    if mousePressed('left') and canClick then
        canClick = false
        playSound('dialogue/next', 1)
        if not typingComplete then
            displayedText = dialogues[dialogueIndex].text
            setTextString('dialogueText', displayedText)
            charIndex = #displayedText + 1
            typingComplete = true
        else
            nextDialogue()
        end
    end

    if not mousePressed('left') then
        canClick = true
    end
  end
end

function onStartCountdown()
    if not allowCountdown then
        return Function_Stop
    end
    return Function_Continue
end