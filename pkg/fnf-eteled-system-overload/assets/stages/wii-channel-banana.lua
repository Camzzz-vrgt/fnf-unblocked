function onCreate()
	-- background shit
	makeLuaSprite('wii-channel-banana', 'wiichannelassets/wii-channel-banana', -900, -300);
	setScrollFactor('wii-channel-banana', 1, 1);
	scaleObject('wii-channel-banana', 1.6, 1.6);

	addLuaSprite('wii-channel-banana', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end