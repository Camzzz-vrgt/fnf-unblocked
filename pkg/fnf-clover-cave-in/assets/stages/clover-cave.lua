function onCreate()
	makeLuaSprite('bg', 'clover-cave/far-back', -1450, -900);
	setScrollFactor('bg', 0.35, 1);
	setProperty('bg.antialiasing', true);
	setProperty('bg.scale.x', 0.65);
	setProperty('bg.scale.y', 0.65);
	addLuaSprite('bg', false);

	makeLuaSprite('cavebg', 'clover-cave/cave-back', -1450, -900);
	setScrollFactor('cavebg', 0.6, 1);
	setProperty('cavebg.antialiasing', true);
	setProperty('cavebg.scale.x', 0.65);
	setProperty('cavebg.scale.y', 0.65);
	addLuaSprite('cavebg', false);

	makeLuaSprite('ground', 'clover-cave/ground', -1450, -900);
	setScrollFactor('ground', 1, 1);
	setProperty('ground.antialiasing', true);
	setProperty('ground.scale.x', 0.65);
	setProperty('ground.scale.y', 0.65);
	addLuaSprite('ground', false);

	makeLuaSprite('ceilcicles', 'clover-cave/ceilcicles', -1450, -1100);
	setScrollFactor('ceilcicles', 0.6, 0.75);
	setProperty('ceilcicles.antialiasing', true);
	setProperty('ceilcicles.scale.x', 0.65);
	setProperty('ceilcicles.scale.y', 0.65);
	addLuaSprite('ceilcicles', true);
end