function onCreate()

	-- background shit

	makeLuaSprite('sand', 'background/beach/sand', -200, -150);
	scaleObject('sand', 1.36, 1.2);
	
	
	makeLuaSprite('sea', 'background/beach/ocean', -200, -150);
	scaleObject('sea', 1.36, 1.2);
	
	
	makeAnimatedLuaSprite('wave','background/beach/Sea', -200, -150)
	addAnimationByPrefix('wave','background/beach/Sea','sea',10,true);
	objectPlayAnimation('wave','background/beach/Sea',false);
	scaleObject('wave', 1.36, 1.2);
	
	
	makeLuaSprite('sun', 'background/beach/sun', -1150, -400);
	scaleObject('sun', 2, 2);
	

	makeLuaSprite('stone3', 'background/beach/stone3', -100, -300);
	scaleObject('stone3', 1.3, 1.3);

	
	makeLuaSprite('stone2', 'background/beach/stone2', 250, 50);
	scaleObject('stone2', 1, 1);
	
	
	makeLuaSprite('stone1', 'background/beach/stone1', 400, 0);
	scaleObject('stone1', 1.3, 1.3);
	setScrollFactor('stone1', 1.5, 1.5);


	makeLuaSprite('sky', 'background/beach/sky', 0, 0);
	setScrollFactor('sky', 1.2, 1.2);
	scaleObject('sky', 4, 2);
	
	makeLuaSprite('cloud', 'background/beach/Clouds', 100, 250);
	setScrollFactor('cloud', 1.1, 1.1);
	scaleObject('cloud', 0.9, 0.9);
	
	
	makeAnimatedLuaSprite('gf','characters/GF_assets', 1250, 400)
	addAnimationByPrefix('gf','characters/GF_assets','GF Dancing Beat0',24,true);
	objectPlayAnimation('gf','characters/GF_assets',false);
	
	
    makeAnimatedLuaSprite('brain','background/beach/Brainnrots', 250, 100)
	addAnimationByPrefix('brain','background/beach/Brainnrots','brains',20,true);
	objectPlayAnimation('brain','background/beach/Brainnrots',false);
	
	
	makeAnimatedLuaSprite('crocodilo','background/beach/Bombardilo', 150, 0)
	addAnimationByPrefix('crocodilo','background/beach/Bombardilo','bombardilo',20,true);
	objectPlayAnimation('crocodilo','background/beach/Bombardilo',false);
	
	
	makeAnimatedLuaSprite('tt','background/beach/Tralaleritos', 1250, 550)
	addAnimationByPrefix('tt','background/beach/Tralaleritos','tralaleritos',20,true);
	scaleObject('tt', 0.5, 0.5);
	objectPlayAnimation('tt','background/beach/Tralaleritos',false);
	

	addLuaSprite('sky', false);
	addLuaSprite('sun', false);
	addLuaSprite('stone2', false);
	addLuaSprite('sea', false);
	addLuaSprite('sand', false);
	addLuaSprite('wave', false);
	addLuaSprite('stone3', false);
	addLuaSprite('crocodilo', false);
	addLuaSprite('brain', false);
	addLuaSprite('gf', false);
	addLuaSprite('tt', false);
	addLuaSprite('stone1', true);

	close(true);

end