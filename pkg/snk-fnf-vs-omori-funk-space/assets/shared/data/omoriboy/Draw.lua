function onCreate() 
	makeAnimatedLuaSprite('Draw', 'botones/Draw', 1150, 582.5);
	addAnimationByPrefix('Draw', 'nonPress', 'nonPress', 24, false);
	addAnimationByPrefix('Draw', 'Pressed', 'Pressed', 12, false);
	addLuaSprite('Draw', false);
	setObjectCamera('Draw', 'other');
end

function onUpdate(elapsed)
	if (getMouseX('camHUD') > 1150 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 582.5 and getMouseY('camHUD') < 720 and mousePressed('left')) or keyPressed('space') then
		objectPlayAnimation('Draw', 'Pressed', false);
	else
		objectPlayAnimation('Draw', 'nonPress', false);
	end
end

