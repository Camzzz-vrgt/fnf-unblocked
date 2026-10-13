function onCreate()

	makeLuaSprite('skyfull','sky full', -1500, -425)
	addLuaSprite('skyfull',false)
	setLuaSpriteScrollFactor('skyfull', 0.2, 0.2)
	
	makeLuaSprite('landBG','land', -2000, -900)
	addLuaSprite('landBG',false)
	setLuaSpriteScrollFactor('landBG', .8, 1.2)

	makeLuaSprite('land2','2nd_terrain', -2100, -800)
	addLuaSprite('land2',false)
	setLuaSpriteScrollFactor('land2', .98, 1.5)

	makeLuaSprite('land1','1nd_terrain', -2300, -900)
	addLuaSprite('land1',false)
	setLuaSpriteScrollFactor('land1', .98, 1.5)

	makeAnimatedLuaSprite('1st_clouds', 'clouds1', -5500, -3140);
	addAnimationByPrefix('1st_clouds','moving_clouds','clouds1',32,true);
	setLuaSpriteScrollFactor('1st_clouds', 1, 3);
	addLuaSprite('1st_clouds', true);

	makeAnimatedLuaSprite('2nd_clouds', 'clouds2', -5500, -3400);
	addAnimationByPrefix('2nd_clouds','moving_clouds','clouds2',30,true);
	setLuaSpriteScrollFactor('2nd_clouds', 1, 3);
	addLuaSprite('2nd_clouds', false);

	makeAnimatedLuaSprite('3rd_clouds', 'clouds3', -5900, -3700);
	addAnimationByPrefix('3rd_clouds','moving_clouds','clouds3',26,true);
	setLuaSpriteScrollFactor('3rd_clouds', 1, 3);
	addLuaSprite('3rd_clouds', false);

	makeAnimatedLuaSprite('aura', 'aura', -1900, -1110);
	addAnimationByPrefix('aura','charge_idle','aura',24,true);
	addAnimationByPrefix('aura','charge_release','aura relase',24,false);
	addAnimationByPrefix('aura','charge_enter','aura intro',24,false);
	setLuaSpriteScrollFactor('aura', 1, 1);
	addLuaSprite('aura', false);
	setProperty('aura.visible', false)

	makeAnimatedLuaSprite('baura', 'baura', 102, -830);
	addAnimationByPrefix('baura','baura_idle','baura',24,true);
	addAnimationByPrefix('baura','baura_release','barua release',24,false);
	addAnimationByPrefix('baura','baura_enter','barua intro',24,false);
	setLuaSpriteScrollFactor('baura', 1, 1);
	addLuaSprite('baura', false);
	setProperty('baura.visible', false)


	makeLuaSprite('blackout','blackout', -2300, -850)
	addLuaSprite('blackout',false)
	setLuaSpriteScrollFactor('blackout', 0, 0)
	setProperty('blackout.visible',false)
	setObjectOrder('blackout', 6)

	

	close(true)

end

function onBeatHit()
	if curBeat == 16 then
		objectPlayAnimation('aura', 'charge_release', false);
	end
end


function onStepHit( ... )-- for every step
	-- body
end

function onUdate( ... )
	-- body
end