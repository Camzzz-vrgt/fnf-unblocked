function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'defeat1', -590, -330);
	setLuaSpriteScrollFactor('stageback', 0.9, 0.9);
	addLuaSprite('stageback', false);

	makeLuaSprite('stageback3', 'defeat3', -590, -330);
	setLuaSpriteScrollFactor('stageback3', 0.9, 0.9);
	addLuaSprite('stageback3', false);
	
	makeLuaSprite('stageback2', 'defeat2', -590, -180);
	setLuaSpriteScrollFactor('stageback2', 0.9, 0.9);
	addLuaSprite('stageback2', false);
	
	setProperty('stageback2.visible', false)
	setProperty('stageback3.visible', false)

end
function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == '2' then
			setProperty('stageback.visible', false);
			setProperty('stageback3.visible', false);
			setProperty('stageback2.visible', true);
		
		end

		if value1 == '1' then
	        setProperty('stageback.visible', true);
			setProperty('stageback3.visible', false);
			setProperty('stageback2.visible', false);
		end
		
		if value1 == '3' then
	        setProperty('stageback.visible', false);
			setProperty('stageback3.visible', true);
			setProperty('stageback2.visible', false);
		end
	end
end