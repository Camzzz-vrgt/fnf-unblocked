function onCreate()
    makeAnimatedLuaSprite('fake bf', 'characters/Boyfriend_Rain', 0, 0)
    addAnimationByPrefix('fake bf', 'dodge', 'boyfriend dodge', 24, false)
    addAnimationByPrefix('fake bf', 'attack', '0BF attack', 24, false)
    setProperty('fake bf.y', getProperty('boyfriend.y'))
    setProperty('fake bf.x', getProperty('boyfriend.x'))
    setProperty('fake bf.alpha', 0)
    addLuaSprite('fake bf', true)

    makeAnimatedLuaSprite('fake bf2', 'characters/Boyfriend_Rain', 0, 0)
	addAnimationByPrefix('fake bf2', 'attack', '0BF attack', 24, false)
	setProperty('fake bf2.y', getProperty('boyfriend.y'))
	setProperty('fake bf2.x', getProperty('boyfriend.x'))
	setProperty('fake bf2.alpha', 0)
	addLuaSprite('fake bf2', true)


    --variables
    Dodged = false;
    canDodge = false;
    DodgeTime = 0;

    Attack = false;
    canAttack = false;
    AttackTime = 0;
end

function onEvent(name, value1, value2)
    if name == "DodgeEvent" then
    --Get Dodge time
    DodgeTime = (value1);

        --if canDodge == true then
            --Dodged = true
            --runTimer('spacepressauto', 0.48, 1)
            --runTimer('appear2', 1.8, 1)
        --end

        runTimer('Died', DodgeTime)

        runTimer('doevent', 0.3, 1)
        canDodge = true;
        Dodged = false
    --Set values so you can dodge

    end
end

function onUpdate()

    if canDodge == true and keyJustPressed('space') then
        objectPlayAnimation('dodgebutton', 'dodgeclick')
        Dodged = true;
        canDodge = false        
    end
                if canAttack == true and getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SHIFT') then
                                
                        objectPlayAnimation('fake bf2', 'attack', false)
                        setProperty('fake bf2.offset.x', 1090)
                        setProperty('fake bf2.offset.y', -10)
                        setProperty('boyfriend.alpha', 0)
                        setProperty('fake bf2.alpha', 1)
                        runTimer('attack', 1, 1)
                    Attack = true;
                    canAttack = false  
            end

end

function onTimerCompleted(tag, loops, loopsLeft)

    if tag == 'doevent' then
        runTimer('dodge', 0.4, 1)
    end

    if tag == 'dodge' then
        if songName == 'technicolor tussle' then
            canDodge = false
        else
            playSound('Dodged', 0.7);

            objectPlayAnimation('fake bf', 'dodge', false)
            setProperty('fake bf.offset.x', -20)
            setProperty('fake bf.offset.y', -6)
            setProperty('boyfriend.alpha', 0)
            setProperty('fake bf.alpha', 1)
            runTimer('appear2', 1, 1)
            playSound('pre_shoot', 1)

        canDodge = false
        end
    end


    if tag == 'spacepressauto' then

    end

    if tag == 'Died' and Dodged == false then
    setProperty('health', 0);

    elseif tag == 'Died' and Dodged == true then
    Dodged = false
    end

    if tag == 'appear2' then
            setProperty('boyfriend.alpha', 1)
            setProperty('fake bf.alpha', 0)
        end

        if tag == 'Died2' and Attack == false then
            
            elseif tag == 'Died2' and Attack == true then
            Attack = false
            end
    
        if tag == 'attack' then
            setProperty('boyfriend.alpha', 1)
            setProperty('fake bf.alpha', 0)	
        end
end