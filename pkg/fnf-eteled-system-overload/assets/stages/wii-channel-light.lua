function onCreate()
	-- background shit
	makeLuaSprite('wii-channel-light', 'wiichannelassets/wii-channel-light', -900, -300);
	setScrollFactor('wii-channel-light', 1, 1);
	scaleObject('wii-channel-light', 1.6, 1.6);

	addLuaSprite('wii-channel-light', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end