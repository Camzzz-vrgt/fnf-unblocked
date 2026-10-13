
scale = 1.2

function onCreate()
	-- background shit

	makeLuaSprite('bg', 'stage1/stage1', -1500, -380);
	scaleObject('bg', scale,scale);
	addLuaSprite('bg', false);


	makeLuaSprite('c', 'stage1/c', 20, -350);
	setLuaSpriteScrollFactor('c', 0.9,0.9);
	scaleObject('c', scale,scale);
	addLuaSprite('c', true);

end