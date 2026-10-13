function onCreate()
	-- background shit
	makeLuaSprite('sky', 'stages/bobbyandbobo/sky', -300, -300);
	setScrollFactor('sky', 0.3, 0.3);
	scaleObject('sky', 1.5, 1.5);

	makeLuaSprite('bobbybobo_mainBG', 'stages/bobbyandbobo/bobbybobo_mainBG', -325, -280);
	scaleObject('bobbybobo_mainBG', 1.0, 1.0);

	makeLuaSprite('bobbybobo_BG2', 'stages/bobbyandbobo/bobbybobo_BG2', -325, -280);
	scaleObject('bobbybobo_BG2', 1.0, 1.0);

	makeLuaSprite('bobbybobo_floor', 'stages/bobbyandbobo/bobbybobo_floor', -325, -380);
	scaleObject('bobbybobo_floor', 1.0, 1.0);

	makeLuaSprite('bobbybobo_table', 'stages/bobbyandbobo/bobbybobo_table', -325, -380);
	scaleObject('bobbybobo_table', 1.0, 1.0);

	makeLuaSprite('bobbybobo_lighting', 'stages/bobbyandbobo/bobbybobo_lighting', -325, -280);
	scaleObject('bobbybobo_lighting', 1.0, 1.0);

	addLuaSprite('sky', false);
	addLuaSprite('bobbybobo_mainBG', false);
	addLuaSprite('bobbybobo_BG2', false);
	addLuaSprite('bobbybobo_floor', false);
	addLuaSprite('bobbybobo_table', false);
	addLuaSprite('bobbybobo_lighting', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end