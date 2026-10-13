function onCreate() 
	makeAnimatedLuaSprite('Calm', 'botones/Calm', 1150, 582.5);
	addAnimationByPrefix('Calm', 'nonPress', 'nonPress', 24, false);
	addAnimationByPrefix('Calm', 'Pressed', 'Pressed', 12, false);
	addLuaSprite('Calm', false);
	setObjectCamera('Calm', 'other');
end

function onUpdate(elapsed)
	if (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or keyPressed('space') then
		objectPlayAnimation('Calm', 'Pressed', false);
	else
		objectPlayAnimation('Calm', 'nonPress', false);
	end
end

