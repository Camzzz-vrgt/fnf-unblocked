local xx = 450 --dad x
local yy = 600 --dad y
local xx2 = 500 --bf x
local yy2 = 600 --bf y
local ofs = 50
local followchars = true

function onCreate() --backgrounds/lost parts/pared
	makeLuaSprite('pared', 'image-146', -600, 0)
	
	addLuaSprite('pared', false)	
	
	makeLuaSprite('juguetez', 'backgrounds/lost parts/juguetez', -600, -300)
	addLuaSprite('juguetez', false)	
	
	makeLuaSprite('juguetez2', 'backgrounds/lost parts/juguetez2', -600, -300)
	addLuaSprite('juguetez2', false)	
	
	makeLuaSprite('juguetez3', 'backgrounds/lost parts/juguetez3', -600, -300)
	addLuaSprite('juguetez3', true)				

	makeLuaSprite('iluminacion', 'backgrounds/lost parts/iluminacion', -600, -300)
	setBlendMode('iluminacion', 'add')
	addLuaSprite('iluminacion', false)	
	
	makeLuaSprite('whitebg', nil, -600, -300)
	makeGraphic('whitebg', 2048, 1440, '696969')
	addLuaSprite('whitebg', false)
	
	makeLuaSprite('oscuridad', 'backgrounds/lost parts/oscuridad', -600, -300)
	addLuaSprite('oscuridad', true)			
end

function onUpdate()
	if followchars == true then
	if mustHitSection == false then
	if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
		triggerEvent('Camera Follow Pos',xx-ofs,yy)
	end
	if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
		triggerEvent('Camera Follow Pos',xx+ofs,yy)
	end
	if getProperty('dad.animation.curAnim.name') == 'singUP' then
		triggerEvent('Camera Follow Pos',xx,yy-ofs)
	end
	if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
		triggerEvent('Camera Follow Pos',xx,yy+ofs)
	end
	if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
		triggerEvent('Camera Follow Pos',xx-ofs,yy)
	end
	if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
		triggerEvent('Camera Follow Pos',xx+ofs,yy)
	end
	if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
		triggerEvent('Camera Follow Pos',xx,yy-ofs)
	end
	if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
		triggerEvent('Camera Follow Pos',xx,yy+ofs)
	end	
	if getProperty('dad.animation.curAnim.name') == 'idle' then
		triggerEvent('Camera Follow Pos',xx,yy)
	end
	else
	if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
		triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
	end
	if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
	end
	if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
	end
	if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
	end
	if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
		triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
	end
	if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
	end
	if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
	end
	if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
	end	
	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
	end
	end
	else
		triggerEvent('Camera Follow Pos','','')
	end
end
