function onCreate()
	-- background shit
	makeLuaSprite('wii-channel-dark', 'wiichannelassets/wii-channel-dark', -900, -300);
	setScrollFactor('wii-channel-dark', 1, 1);
	scaleObject('wii-channel-dark', 1.6, 1.6);

	addLuaSprite('wii-channel-dark', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end