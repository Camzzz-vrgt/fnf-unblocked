function onCreate()
	makeLuaSprite('skyGH', 'Sky', -600, -300);
	setScrollFactor('skyGH', 0.3, 0.3);

	makeLuaSprite('tree2', 'Trees_2', -600, -300);
	setScrollFactor('tree2', 0.5, 0.5);

	makeLuaSprite('tree1', 'Trees_1', -600, -300);
	setScrollFactor('tree1', 0.7, 0.7);

	makeLuaSprite('bush', 'Bushes', -600, -300);
	setScrollFactor('bush', 0.85, 0.9);

	makeLuaSprite('grass', 'Grass', -600, -300);
	setScrollFactor('grass', 1, 1);

	makeLuaSprite('palm', 'PalmTrees', -600, -300);
	setScrollFactor('palm', 1.12, 1);

	makeLuaSprite('tails', 'Tails', -600, -300);
	setScrollFactor('tails', 1.05, 1);


	addLuaSprite('skyGH', false);
	addLuaSprite('tree2', false);
	addLuaSprite('tree1', false);
	addLuaSprite('bush', false);
	addLuaSprite('grass', false);
	addLuaSprite('palm', false);
	addLuaSprite('tails', false);
end

