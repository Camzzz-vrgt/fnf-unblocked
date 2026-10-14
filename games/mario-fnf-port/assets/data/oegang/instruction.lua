local allowCountdown = false
local waitThing = false
local confirmed = 0



function onCreate()

makeLuaSprite('instructionmenu', 'oegang_in',0,0)

setObjectCamera('instructionmenu','other')


addLuaSprite('instructionmenu',true)


end




function onStartCountdown()

    if not allowCountdown then
        return Function_Stop
    end
    if allowCountdown then
        return Function_Continue
    end
    return Function_Continue;
end




function onUpdate()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and confirmed == 0 then
        allowCountdown = true
        startCountdown();
        doTweenAlpha('fadeout', 'instructionmenu', 0, 0.6, quadOut);
		
		
        playSound('confirmMenu');
        confirmed = 1
    end
end