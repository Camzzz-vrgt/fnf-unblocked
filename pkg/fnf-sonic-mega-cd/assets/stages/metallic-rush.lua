function onCreate()
	makeLuaSprite('ground', 'speedway/speedwaygroundbeeg1', -700, 700);
	makeLuaSprite('ground2', 'speedway/speedwaygroundbeeg2', 4676, 700);
	makeLuaSprite('bg', 'speedway/spookyahbg', -400, -300);
	makeLuaSprite('bg2', 'speedway/spookyahbg2', 2800, -300);
	scaleObject('bg', 0.7, 0.7)
	scaleObject('bg2', 0.7, 0.7)
	doTweenX('backgroundtween', 'bg', -3500, 120, 'linear');
	doTweenX('background2tween', 'bg2', -400, 120, 'linear');
	doTweenX('groundtween1', 'ground', -6076, 1, 'linear');
	doTweenX('groundtween2', 'ground2', -700, 1, 'linear');


	addLuaSprite('ground', true);
	addLuaSprite('ground2', true);
	
	addLuaSprite('bg', false);
	addLuaSprite('bg2', false);
end

function onTweenCompleted(tag)
	if tag == 'groundtween1' then
	setProperty("ground.x", -700)
	doTweenX('groundtween1', 'ground', -6076, 1, 'linear');
	if tag == 'groundtween1' then
	setProperty("ground2.x", 4676)
	doTweenX('groundtween2', 'ground2', -700, 1, 'linear');
	if tag == 'backgroundtween' then
		setProperty("bg.x", -400)
		doTweenX('backgroundtween', 'bg', -3500, 12, 'linear');
		if tag == 'background2tween' then
		setProperty("bg2.x", 2800)
		doTweenX('background2tween', 'bg2', -400, 12, 'linear');
	end
  end
end

function onUpdate(tag)
	if tag == ('groundtween1') then
	setProperty("ground.x", -700)
	doTweenX('groundtween1', 'ground', -6076, 1, 'linear');
	if tag == ('groundtween2') then
	setProperty("ground2.x", 4676)
	doTweenX('groundtween2', 'ground2', -700, 1, 'linear');
	if tag == ('backgroundtween') then
	setProperty("bg.x", -400)
	doTweenX('backgroundtween', 'bg', -3500, 12, 'linear');
	if tag == ('background2tween') then
	setProperty("bg2.x", 2800)
	doTweenX('background2tween', 'bg2', -400, 12, 'linear');
	end
end
end
end
end
end
end

