function onCreate()
	-- background shit
	makeLuaSprite('patricks-wall', 'stages/panchito/patricks-wall', -600, -300);
	setScrollFactor('patricks-wall', 0.9, 0.9);
	
	makeLuaSprite('patricks-floor', 'stages/panchito/patricks-floor', -650, 600);
	setScrollFactor('patricks-floor', 0.9, 0.9);
	scaleObject('patricks-floor', 1.1, 1.1);

        makeLuaSprite('old style', 'stages/panchito/old style', -500, -700)
	scaleObject('old style', 0.8, 0.8);
	objectPlayAnimation('old style', 'stages/panchito/old style', true)
	setLuaSpriteScrollFactor('old style', 0, 0)

        makeLuaSprite('2old style', 'stages/panchito/old style', -500, -900)
	scaleObject('2old style', 0.8, 0.8);
	objectPlayAnimation('2old style', 'stages/panchito/old style', true)
	setLuaSpriteScrollFactor('2old style', 0, 0)


	addLuaSprite('patricks-wall', false);
	addLuaSprite('patricks-floor', false);
	addLuaSprite('old style', true);
	addLuaSprite('2old style', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end