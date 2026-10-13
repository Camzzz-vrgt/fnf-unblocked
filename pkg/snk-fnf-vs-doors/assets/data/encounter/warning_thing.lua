local allowCountdown = false
local confirmed = 0

function onCreate()
	makeLuaSprite('warningimage', 'mechanics/Seek_RUN', 0, 0)
	screenCenter('warningimage', 'xy')
	setObjectCamera('warningimage', 'other')
	
	addLuaSprite('warningimage', true)
end

function onStartCountdown()
	if not allowCountdown then
		return Function_Stop
	end
	if allowCountdown then
		return Function_Continue
	end
end

function onPause()
	if (confirmed == 0) then
		confirmed = 1
		return Function_Stop;
	end
end


function onUpdate()
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ENTER') and confirmed == 0 then
		allowCountdown = true
		doTweenAlpha('nomorewarningimage', 'warningimage', 0, 1, quintOut);
		playSound('lock');
		startCountdown();
	end
end