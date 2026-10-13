function onEvent(name, value1, value2)
	if name == "scary" then
		cameraShake('game', '0.009', '0.009');
		playSound('Boom', 2.5);
		makeLuaSprite('image', value1, 0, 0);
		addLuaSprite('image', true);
		doTweenColor('hello', 'image', 'FFFFFFFF', 0.05, 'quartIn');
		setObjectCamera('image', 'other');
		runTimer('wait', value2);
	end
end

function onTimerCompleted(tag, loops, loopsleft)
	if tag == 'wait' then
		doTweenAlpha('byebye', 'image', 0, 0.01, 'linear');
	end
end

function onTweenCompleted(tag)
	if tag == 'byebye' then
		removeLuaSprite('image', true);
	end
           end