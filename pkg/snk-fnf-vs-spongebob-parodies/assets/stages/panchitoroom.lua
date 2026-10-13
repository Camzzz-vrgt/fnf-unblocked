function onCreate()
	-- background shit
	makeLuaSprite('sponges-wall', 'stages/panchito/sponges-wall', -600, -300);
	setScrollFactor('sponges-wall', 0.9, 0.9);
	
	makeLuaSprite('sponges-floor', 'stages/panchito/sponges-floor', -650, 600);
	setScrollFactor('sponges-floor', 0.9, 0.9);
	scaleObject('sponges-floor', 1.1, 1.1);

        makeLuaSprite('old style', 'stages/panchito/old style', -500, -700)
	scaleObject('old style', 0.8, 0.8);
	objectPlayAnimation('old style', 'stages/panchito/old style', true)
	setLuaSpriteScrollFactor('old style', 0, 0)

        makeLuaSprite('2old style', 'stages/panchito/old style', -500, -900)
	scaleObject('2old style', 0.8, 0.8);
	objectPlayAnimation('2old style', 'stages/panchito/old style', true)
	setLuaSpriteScrollFactor('2old style', 0, 0)

	makeLuaSprite('rock instrument', 'stages/panchito/rock instrument', -400, 180);

	makeLuaSprite('wallpaper 1', 'stages/panchito/wallpaper 1', 200, 50);

	makeLuaSprite('wallpaper 2', 'stages/panchito/wallpaper 2', 1500, 50);

	addLuaSprite('sponges-wall', false);
	addLuaSprite('sponges-floor', false);
	addLuaSprite('wallpaper 1', false);
	addLuaSprite('wallpaper 2', false);
	addLuaSprite('rock instrument', false);
	addLuaSprite('old style', true);
	addLuaSprite('2old style', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end