function onCreate()
    makeAnimatedLuaSprite('Sam', 'characters/Sam', 1200, 1350);

    addAnimationByPrefix('Sam', 'idle', 'Pea Idle', 24, true);
    addAnimationByPrefix('Sam', 'singLEFT', 'Pea Left', 24, false);
    addAnimationByPrefix('Sam', 'singDOWN', 'Pea Down', 24, false);
    addAnimationByPrefix('Sam', 'singUP', 'Pea Up', 24, false);
    addAnimationByPrefix('Sam', 'singRIGHT', 'Pea Right', 24, false);
    addAnimationByPrefix('Sam', 'GT', 'Gatling Transformation', 24, false);

    addOffset('Sam', 'idle', 0,0)
    addOffset('Sam', 'singLEFT', 355,76)
    addOffset('Sam', 'singDOWN',194,-31)
    addOffset('Sam', 'singUP', 248,643)
    addOffset('Sam', 'singRIGHT', 40,-20)
    addOffset('Sam', 'GT', 43,567)

    playAnim('Sam', 'idle', false)
    setProperty('Sam.visible',true)
    addLuaSprite('Sam', true);


    makeAnimatedLuaSprite('SamS', 'characters/Sam_gatling', 1190, 1335);

    addAnimationByPrefix('SamS', 'idle', 'Pea Idle', 24, true);
    addAnimationByPrefix('SamS', 'singLEFT', 'Pea Left', 24, false);
    addAnimationByPrefix('SamS', 'singDOWN', 'Pea Down', 24, false);
    addAnimationByPrefix('SamS', 'singUP', 'Pea Up', 24, false);
    addAnimationByPrefix('SamS', 'singRIGHT', 'Pea Right', 24, false);

    addAnimationByPrefix('SamS', 'singLEFT-alt', 'Pea shotLeft', 24, false);
    addAnimationByPrefix('SamS', 'singDOWN-alt', 'Pea shotDown', 24, false);
    addAnimationByPrefix('SamS', 'singUP-alt', 'Pea shotUp', 24, false);
    addAnimationByPrefix('SamS', 'singRIGHT-alt', 'Pea shotRight', 24, false);


    addOffset('SamS', 'idle', 0,0)
    addOffset('SamS', 'singLEFT', 557,150)
    addOffset('SamS', 'singDOWN',174,-51)
    addOffset('SamS', 'singUP', 148,402)
    addOffset('SamS', 'singRIGHT', 70,172)

    addOffset('SamS', 'singLEFT-alt', 436,149)
    addOffset('SamS', 'singDOWN-alt',160,-74)
    addOffset('SamS', 'singUP-alt', 253,249)
    addOffset('SamS', 'singRIGHT-alt', 63,171)


    playAnim('SamS', 'idle', false)
    setProperty('SamS.visible',true)
    addLuaSprite('SamS', true);
end

function opponentNoteHit(id, dir, NT)
    if NT == 'GF Sing' or NT == 'both' or NT == 'bothG' or gfSection then
        runTimer('idle back', 0.55)

        if curStep < 1470 then
            playAnim('Sam', getProperty('singAnimations')[dir + 1], true);
        else
            playAnim('SamS', getProperty('singAnimations')[dir + 1], true);
        end

    end
end

function onTimerCompleted(t)
    if t == 'idle back' then
        if curStep < 1470 then
            playAnim('Sam', 'idle', true);
        else
            playAnim('SamS', 'idle', true);
        end
    end
end