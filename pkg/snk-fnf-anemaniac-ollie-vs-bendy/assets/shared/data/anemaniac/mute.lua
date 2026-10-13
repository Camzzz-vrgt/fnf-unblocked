local ollie = true;
local bendy = true;
function onCreate()
ollie = true;
bendy = true;
end

function onStepHit()
    if curStep == 220 then
        if not ollie then
            triggerEvent('Alt Idle Animation', 'dad', "cutout")
            playAnim('dad', 'cutout', true)
        end
        if not bendy then
            triggerEvent('Alt Idle Animation', 'bf', "cutout")
            playAnim('boyfriend', 'cutout', true)
        end
        if ollie then
            triggerEvent('Alt Idle Animation', 'dad', "")
            playAnim('dad', 'idle', true)
        end
        if bendy then
            triggerEvent('Alt Idle Animation', 'bf', "")
            playAnim('boyfriend', 'idle', true)
        end
    end
    if curStep >= 207 and curStep <= 220 and curStep % 2 == 0 and ollie then
        playAnim('dad', 'laugh-alt', true)
    end
    if curStep == 1180 or curStep == 1181 then
        runTimer('blackoutChar', 3)
    end
end
function onCountdownTick(swagCounter)
    if swagCounter == 1 then
        if getRandomInt(0, 50) == 50 and isAchievementUnlocked("Cutout") then
            ollie = false;
        end
        if getRandomInt(0, 50) == 50 and isAchievementUnlocked("Cutout") then
            bendy = false;
        end
    end
    if swagCounter == 2 then
    if ollie then
        triggerEvent('Alt Idle Animation', 'dad', "-alt")
    end
    if not ollie then
        triggerEvent('Alt Idle Animation', 'dad', "cutout-alt")
        playAnim('dad', 'cutout-alt', true)
        if not lowQuality then
            removeLuaSprite('extra', true)
        end
    end
end
    if swagCounter == 3 then
        if bendy then
            triggerEvent('Alt Idle Animation', 'bf', "-alt")
        end
        if not bendy then
            triggerEvent('Alt Idle Animation', 'bf', "cutout-alt")
            playAnim('boyfriend', 'cutout-alt', true)
            if not lowQuality then
                removeLuaSprite('extra2', true)
            end
        end
    end
end

function onSongStart()
    if not bendy then
        unlockAchievement("Bendy")
    end
    if not ollie then
        unlockAchievement("Ollie")
    end
end

local cheater = false;
function onUpdate()
    setProperty('allowDebugKeys', false);
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') or getPropertyFromClass('flixel.FlxG', 'keys.justPressed.EIGHT') and not getPropertyFromClass('PlayState', 'chartingMode') then
        cheater = true;
        runTimer('finished', 1)
        playSound('ollie', 1)
        setProperty('camera.visible', false)
        setProperty('camHUD.visible', false)
        cameraShake('other', 0.01, 1)
        removeLuaSprite('countdown', false)
        setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', true)
        runHaxeCode([[FlxG.autoPause = false;]])
        setPropertyFromClass("openfl.Lib", "application.window.title", "WANDERING IS A SIN.")
    end
    if cheater then
        setProperty('END.alpha', 1)
        setProperty('opponentVocals.volume', 0)
        setProperty('vocals.volume', 0)
        setSoundVolume(nil, 0)
    end
    if not ollie then
        setProperty('opponentVocals.volume', 0)
        for i = 0, getProperty('notes.length')-1 do
            if not getPropertyFromGroup('notes', i, 'mustPress') then
                removeFromGroup('notes', i)
            end
        end
    end
    if not bendy then
        setProperty('vocals.volume', 0)
        for i = 0, getProperty('notes.length')-1 do
            if getPropertyFromGroup('notes', i, 'mustPress') then
                removeFromGroup('notes', i)
            end
        end
    end
end

function onTimerCompleted(tag)
    if tag == 'finished' then
        setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
        setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Psych Engine")
        runHaxeCode([[FlxG.autoPause = false;]])
        exitSong(true)
    end
    if tag == 'blackoutChar' then
        if not bendy then
            triggerEvent('Alt Idle Animation', 'bf', "cutout-alt")
            playAnim('boyfriend', 'cutout-alt', true)
        else
            triggerEvent('Alt Idle Animation', 'bf', "-alt")
            playAnim('boyfriend', 'idle-alt', true)
        end
        if not ollie then
            triggerEvent('Alt Idle Animation', 'dad', "cutout-alt")
            playAnim('dad', 'cutout-alt', true)
        else
            triggerEvent('Alt Idle Animation', 'dad', "-alt")
            playAnim('dad', 'idle-alt', true)
        end
    end
end

function onEndSong()
    if achievementExists("Cutout") then
        unlockAchievement("Cutout")
    end
end