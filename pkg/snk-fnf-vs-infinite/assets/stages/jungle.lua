function onCreate()

	posX = -400;
	posY = -400;
	scale = 1.7;
	-- background shit
	
	makeLuaSprite('ground', 'jungle/mystic_jungle_BG', -400, -400);
	setScrollFactor('ground', 1, 1);
	scaleObject('ground', 1.7, 1.7);
	updateHitbox('ground');
	
	addLuaSprite('ground', false);
end

function onCreatePost()
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end