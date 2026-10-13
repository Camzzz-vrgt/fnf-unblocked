function onCreate()
	makeLuaSprite('base', 'kawaii/BgJP1', -300, -800);
	makeLuaSprite('clouds', 'kawaii/BgJP2', -300, -800);
	scaleObject('base', 0.80, 0.80);
	doTweenX('idkhowtotween', 'clouds', -2700, 25, 'linear'); 


	addLuaSprite('base', false);
	addLuaSprite('clouds', false);
	
end

function onTweenCompleted(tag)
	if tag == 'idkhowtotween' then
		setProperty("clouds.x", 1500)
		doTweenX('idkhowtotween', 'clouds', -2700, 25, 'linear'); 
	end
end

function onUpdate(tag)
	if tag == ('idkhowtotween') then
	setProperty("clouds.x", 1500)
	end
end