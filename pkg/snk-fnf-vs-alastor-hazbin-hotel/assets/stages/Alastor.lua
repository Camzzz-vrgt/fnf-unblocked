function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'stageback', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
	addLuaSprite('stageback', false);
	
	makeLuaSprite('stagefront', 'stagefront', -650, 600);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);
	addLuaSprite('stagefront', false);

	makeLuaSprite('Alastor', 'Alastor', 120, -40);
	setScrollFactor('Alastor', 0.9, 0.9);
	addLuaSprite('Alastor', false);

	makeLuaSprite('bartop', 'bar 1', 0, -170);
	setScrollFactor('bartop', 0.9, 0.9);
	addLuaSprite('bartop', true);
	
	makeLuaSprite('barb', 'bar 1', 0, 485);
	setScrollFactor('barb', 0.9, 0.9);
	addLuaSprite('barb', true);

end

function OnStepHit()
	if curstep == 320 then
		doTweenY('www', 'bartop', 300, 1.5, 'cubeOut');
	end
end