local xx = 400 --dad x
local yy = 700 --dad y
local xx2 = 600 --bf x
local yy2 = 700 --bf y
local ofs = 50
local followchars = true

function onCreate()
	makeLuaSprite('cielo', 'backgrounds/misfit/cielo', -600, -300)
	addLuaSprite('cielo', false)	
	
	makeLuaSprite('vallas', 'backgrounds/misfit/vallas', -600, -300)
	addLuaSprite('vallas', false)	
	
	makeLuaSprite('cesped', 'backgrounds/misfit/cesped', -600, -300)
	addLuaSprite('cesped', false)	
	
	makeLuaSprite('vereda', 'backgrounds/misfit/vereda', -600, -300)
	addLuaSprite('vereda', false)		
	
	makeLuaSprite('pasto', 'backgrounds/misfit/pasto', -600, -300)
	addLuaSprite('pasto', false)	
	
	makeLuaSprite('pasto2', 'backgrounds/misfit/pasto2', -600, -300)
	addLuaSprite('pasto2', true)		
	
	makeLuaSprite('pasto3', 'backgrounds/misfit/pasto3', -600, -300)
	addLuaSprite('pasto3', true)	
	
	makeLuaSprite('iluminacion', 'backgrounds/misfit/iluminacion', -600, -300)
	setBlendMode('iluminacion', 'add')
	addLuaSprite('iluminacion', false)	
	
	makeLuaSprite('oscuridad', 'backgrounds/misfit/oscuridad', -600, -300)
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
