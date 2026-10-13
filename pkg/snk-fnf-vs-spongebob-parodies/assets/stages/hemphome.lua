function onCreate()
	-- background shit
	makeLuaSprite('back', 'stages/hemppants/back', -350, -300);
	setScrollFactor('back', 0.9, 0.9);

	makeLuaSprite('floor', 'stages/hemppants/floor', -350, 400);

	makeLuaSprite('tv', 'stages/hemppants/tv', -350, 150);

        precacheImage('hemppants/Red_Pulse');
	makeAnimatedLuaSprite('thered', 'stages/hemppants/Red_Pulse', 0, 0);
	addAnimationByPrefix('thered', 'idle', 'Red Pulsing', 24, false);
	setGraphicSize('thered', 1280, 720);
	objectPlayAnimation('thered', 'idle');
	setProperty('thered.alpha', '0');
	setObjectCamera('thered', 'other');


	addLuaSprite('back', false);
	addLuaSprite('floor', false);
	addLuaSprite('tv', false);
	addLuaSprite('thered', true);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end