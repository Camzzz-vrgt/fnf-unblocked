function onCreatePost()
    makeLuaSprite('trees', 'SnowForest/Trees', -800, -700);
    addLuaSprite('trees', false);
    setScrollFactor('bg1', 0.9, 0.9);

    makeLuaSprite('floor', 'SnowForest/Floor', -600, 600);
    addLuaSprite('floor', false);
    setScrollFactor('bg1', 0.9, 0.9);

    makeLuaSprite('bgdark', 'SnowForest/BG-Dark', -600, -200);
    scaleObject('bgdark', 1.2, 1);
    setProperty('bgdark.visible',false);
    addLuaSprite('bgdark', false)
    setScrollFactor('bg1', 0.9, 0.9);

    makeAnimatedLuaSprite('snow', 'SnowForest/Snow-Storm', -600, 0);
	addAnimationByPrefix('snow', 'dance','tormenta',24,true);
    scaleObject('snow', 1.3, 1);
    objectPlayAnimation('snow','dance',false);
    setScrollFactor('snow', 0.9, 0.9);

    makeLuaSprite('foreground', 'SnowForest/Black-Overlay', 0,0);
    setScrollFactor('foreground', 0.9, 0.9);
    addLuaSprite('foreground', false);
    setObjectCamera('foreground', 'other');
    setProperty('foreground.visible', false);
    
    addLuaSprite('trees', false);
    addLuaSprite('floor', false);
    addLuaSprite('bgdark', false);
    addLuaSprite('snow', false);

end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == '1' then
			setProperty('trees.visible', false);
			setProperty('floor.visible', false);
			setProperty('bgdark.visible', true);
		
	       end
                        if value1 == '2' then
			setProperty('trees.visible', true);
			setProperty('floor.visible', true);
			setProperty('bgdark.visible',false);

                end

                        if value1 == '3' then
			setProperty('foreground.visible', true);
              
                end

                        if value1 == '4' then
			setProperty('foreground.visible', false);

		end
	end
end

              