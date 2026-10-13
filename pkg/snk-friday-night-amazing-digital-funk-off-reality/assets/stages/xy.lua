function onCreate()
	--background boi
--stage1
	makeLuaSprite('stageback', 'stages/xy/bg', 0, 0);
	setLuaSpriteScrollFactor('stageback', 0.6, 0.6);
    addLuaSprite('stageback', false);
	setProperty('stageback.scale.x',12.2)
	setProperty('stageback.scale.y',12.2)
--stage2
	makeLuaSprite( 'stageback2', 'stageback2', 0, 0);
	setLuaSpriteScrollFactor('stageback2', 0.6, 0.6);
    addLuaSprite('stageback2', false);
    setProperty('stageback2.visible', false);
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == '2' then
			setProperty('stageback.visible', false);
			setProperty('stageback2.visible', true);
		end
		if value1 == '1' then
			setProperty('stageback2.visible', false);
			setProperty('stageback.visible', true);
		end
	end
end
