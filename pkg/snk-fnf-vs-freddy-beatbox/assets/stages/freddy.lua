function onCreate()
	-- background shit
	makeLuaSprite('freddy', 'freddy', -500, -300);
	setLuaSpriteScrollFactor('freddy', 0.9, 0.9);
	
	makeLuaSprite('blank', 'blank', -650, 600);
	setLuaSpriteScrollFactor('blank', 0.9, 0.9);
	scaleObject('blank', 1.1, 1.1);

	makeAnimatedLuaSprite('gregory','gregory',770,100)addAnimationByPrefix('gregory','dance','dance',24,true)
	objectPlayAnimation('gregory','dance',false)
	setScrollFactor('gregory', 0.9, 0.9);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
		makeLuaSprite('empty', 'stage_light', -125, -100);
		setLuaSpriteScrollFactor('empty', 0.9, 0.9);
		scaleObject('empty', 1.1, 1.1);
		
		makeLuaSprite('stagelight_right', 'stage_light', 1225, -100);
		setLuaSpriteScrollFactor('stagelight_right', 0.9, 0.9);
		scaleObject('stagelight_right', 1.1, 1.1);
		setPropertyLuaSprite('stagelight_right', 'flipX', true); --mirror sprite horizontally

		makeLuaSprite('stagecurtains', 'stagecurtains', -500, -300);
		setLuaSpriteScrollFactor('stagecurtains', 1.3, 1.3);
		scaleObject('stagecurtains', 0.9, 0.9);
	end

	addLuaSprite('freddy', false);
	addLuaSprite('blank', false);
	addLuaSprite('empty', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end