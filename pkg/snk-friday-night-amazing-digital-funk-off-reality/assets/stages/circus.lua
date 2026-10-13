
scale = 1.2

function onCreate()
	-- background shit

	makeLuaSprite('bg', 'stages/circus/stage1', -1500, -380);
	scaleObject('bg', scale,scale);
	addLuaSprite('bg', false);


	makeLuaSprite('c', 'stages/circus/c', 20, -350);
	setLuaSpriteScrollFactor('c', 0.9,0.9);
	scaleObject('c', scale,scale);
	addLuaSprite('c', true);
	
	makeAnimatedLuaSprite('girl', 'stages/circus/stereo', 270, -685);
    addLuaSprite('girl', false);
    addAnimationByPrefix('girl', 'idle', 'beat', 19, true);
	setLuaSpriteScrollFactor('girl', 1, 1);
	scaleObject('girl', 1.5, 1.5);

end

function onEvent(n, v1, v2)
	if n == 'badapplelol' and string.lower(v1) == 'a' then
		doTweenAlpha('wewe', 'c', 0, v2, 'linear')
	end
	if n == 'badapplelol' and string.lower(v1) == 'b' then
		doTweenAlpha('wewe', 'c', 1, v2, 'linear')
	end
end