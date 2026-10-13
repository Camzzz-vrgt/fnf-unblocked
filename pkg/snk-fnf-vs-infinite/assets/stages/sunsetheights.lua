function onCreate()

	-600 = -600;
	-300 = -300;
	scale = 2;
	-- background shit
	makeLuaSprite('bg', 'SSH/skybox', -600, -300);
	setScrollFactor('bg', 0.2, 1);
	scaleObject('bg', 2, 2);
	updateHitbox('bg');
	
	makeLuaSprite('stageback3', 'SSH/bg3', -600, -300);
	setScrollFactor('stageback3', 0.75, 1);
	scaleObject('stageback3', 2, 2);
	updateHitbox('stageback3');
	
	makeLuaSprite('stageback2', 'SSH/bg2', -600, -300);
	setScrollFactor('stageback2', 0.8, 1);
	scaleObject('stageback2', 2, 2);
	updateHitbox('stageback2');
	
	makeLuaSprite('stageback', 'SSH/bg', -600, -300);
	setScrollFactor('stageback', 0.9, 1);
	scaleObject('stageback', 2, 2);
	updateHitbox('stageback');
	
	makeLuaSprite('ground', 'SSH/main', -600, -300);
	setScrollFactor('ground', 1, 1);
	scaleObject('ground', 2, 2);
	updateHitbox('ground');
	
	makeLuaSprite('foreground', 'SSH/foreground', -600, -300);
	setScrollFactor('foreground', 1.2, 1);
	scaleObject('foreground', 2, 2);
	updateHitbox('foreground');

	
	addLuaSprite('bg', false);
	addLuaSprite('stageback3', false);
	addLuaSprite('stageback2', false);
	addLuaSprite('stageback', false);
	addLuaSprite('ground', false);
	addLuaSprite('foreground', true);
end