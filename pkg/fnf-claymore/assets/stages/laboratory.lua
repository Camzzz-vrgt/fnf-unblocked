function onCreate()
	-- Ð£Ð Ð ÐÐÐ¯Ð¢Ð¬ Ð¯ Ð­Ð¢Ð Ð¡ÐÐÐÐÐ
	makeLuaSprite('1', 'laboratory/1', -1010, -400);
	setLuaSpriteScrollFactor('1', 0.9, 0.9);
	addLuaSprite('1', false);
	
	makeLuaSprite('2', 'laboratory/2', -1010, -400);
	setLuaSpriteScrollFactor('2', 0.9, 0.9);
        addLuaSprite('2', false);
	
	makeLuaSprite('3', 'laboratory/3', -1010, -400);
	setLuaSpriteScrollFactor('3', 0.9, 0.9);
	addLuaSprite('3', false);

	makeLuaSprite('4', 'laboratory/4', -1010, -400);
	setLuaSpriteScrollFactor('4', 0.9, 0.9);
	addLuaSprite('4', false);
	
	makeLuaSprite('5', 'laboratory/5', -1010, -400);
	setLuaSpriteScrollFactor('5', 0.9, 0.9);
        addLuaSprite('5', false);
	
	makeLuaSprite('6', 'laboratory/6', -1010, -400);
	setLuaSpriteScrollFactor('6', 0.9, 0.9);
	addLuaSprite('6', false);

        setScrollFactor('1', 1, 0)
        setScrollFactor('3', 1, 0)      
        setScrollFactor('4', 1, 0)
        setScrollFactor('6', 1, 0)
    	
	setProperty('1.visible', true)
	setProperty('2.visible', true)	
        setProperty('3.visible', true)
      	setProperty('4.visible', false)
       	setProperty('5.visible', false)
	setProperty('6.visible', false)
            
end
function onEvent(name,value1,value2)
	if name == 'Play Animation' then 

		if value1 == '3' then
			setProperty('1.visible', false);
			setProperty('2.visible', false);
			setProperty('3.visible', false);	
		        setProperty('4.visible', false);
			setProperty('5.visible', false);
			setProperty('6.visible', false);
end
		
		if value1 == '2' then
			setProperty('1.visible', false);
			setProperty('2.visible', false);
			setProperty('3.visible', false);	
		        setProperty('4.visible', true);
			setProperty('5.visible', true);
			setProperty('6.visible', true);
		
		end

		if value1 == '1' then
	                setProperty('1.visible', true);
			setProperty('2.visible', true);
			setProperty('3.visible', true);			
                        setProperty('4.visible', false);
			setProperty('5.visible', false);
			setProperty('6.visible', false);
		end
	end
end