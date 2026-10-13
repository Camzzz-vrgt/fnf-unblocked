function onCreate()

	makeLuaSprite("splashscreen","effects/warningscreen", 0,0)
	addLuaSprite("splashscreen",true)
	setObjectCamera('splashscreen', 'other');
end
function onUpdate()
if curStep == 0 then

        started = true

    end

songPos = getSongPosition()

local currentBeat = (songPos/9000)*(curBpm/10)

doTweenX('disruptor2', 'disruptor2.scale', 0 - 50*math.sin((currentBeat+1*0.1)*math.pi), 6)

doTweenY('disruptor2', 'disruptor2.scale', 0 - 31*math.sin((currentBeat+1*1)*math.pi), 6)

  if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.ANY') and not allowStartCountdown then
    doTweenAlpha('splashscreentween', 'splashscreen', 0, 1, linear)
    allowStartCountdown = true
    runTimer('startcount', 1)
  end
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    end

function onStartCountdown()
  if not allowStartCountdown then
    return Function_Stop;
  end
  return Function_Continue;
end

function onTimerCompleted(tag)
  if tag == 'startcount' then
    startCountdown()
  end
end