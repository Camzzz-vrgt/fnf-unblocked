function onCreatePost()
	-- background shit
	
	makeLuaSprite('bg', 'backgrounds/ink/bg', -1530, -730);
	addLuaSprite('bg', false);
	setScrollFactor('bg', 0.3, 0.3);
	
	makeLuaSprite('city', 'backgrounds/ink/buildingsback', -900, -700);
	addLuaSprite('city', false);
    setScrollFactor('city', 0.45, 0.45);
	
	makeLuaSprite('tower', 'backgrounds/ink/tower', -900, -750);
	addLuaSprite('tower', false);
	setScrollFactor('tower', 0.6, 0.6);
	
	makeLuaSprite('left building', 'backgrounds/ink/build', -2100, -600);
	addLuaSprite('left building', false);
	setScrollFactor('left building', 0.9, 0.9);
	
    makeAnimatedLuaSprite('sign','backgrounds/ink/buildings', 960, -430)
	addAnimationByPrefix('sign','idle','buildingsfront',24, false)
	addLuaSprite('sign',false)
	setScrollFactor('sign', 0.8, 0.8);
	
	makeLuaSprite('floor', 'backgrounds/ink/floor', -2400, -300);
	addLuaSprite('floor', false);
	
	makeLuaSprite('shadow dad', 'backgrounds/ink/shadow', -50, 900);
	addLuaSprite('shadow dad', false);
	
	makeLuaSprite('shadow boyfriend', 'backgrounds/ink/shadow', 600, 910);
	addLuaSprite('shadow boyfriend', false);
	
    makeAnimatedLuaSprite('crowd','backgrounds/ink/crowd', -800, 250)
	addAnimationByPrefix('crowd','idle','haru',24, false)
	addLuaSprite('crowd',false)
	
	makeLuaSprite('street lamp left', 'backgrounds/ink/front', 1500, 500);
	addLuaSprite('street lamp left', true);
    setScrollFactor('street lamp left', 1.2, 1.2);
	
	makeLuaSprite('street lamp right', 'backgrounds/ink/front2', -1600, 500);
	addLuaSprite('street lamp right', true);
    setScrollFactor('street lamp right', 1.2, 1.2);
	
	if not lowQuality then
	makeLuaSprite('overlay', 'backgrounds/ink/overlays', -2300, -900);
	addLuaSprite('overlay', true);
	initLuaShader('blend')
    setSpriteShader('overlay', 'blend')
    setProperty('overlay.alpha', 0.5)
    end
end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('crowd','idle', false)
    end
    objectPlayAnimation('sign','idle', false)
end
