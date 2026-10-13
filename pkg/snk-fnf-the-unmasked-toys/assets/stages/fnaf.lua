local xx = 725 --dad x
local yy = 500 --dad y
local xx2 = 725 --bf x
local yy2 = 700 --bf y
local ofs = 50
local followchars = true
function onCreate()
	makeLuaSprite('pared', 'backgrounds/fnaf/pared', -600, -300)
	addLuaSprite('pared', false)	

	makeLuaSprite('computadora', 'backgrounds/fnaf/computadora', -600, -300)
	addLuaSprite('computadora', false)	
	
	makeLuaSprite('cama', 'backgrounds/fnaf/cama', -600, -300)
	addLuaSprite('cama', false)	
	
	makeLuaSprite('iluminacion', 'backgrounds/fnaf/iluminacion', -600, -300)
	setBlendMode('iluminacion', 'add')
	addLuaSprite('iluminacion', true)	
	
	makeLuaSprite('vignette', 'backgrounds/fnaf/vignette', -600, -300)
	addLuaSprite('vignette', true)	
	
	setProperty('boyfriend.visible', false)		
	setProperty('gf.visible', false)				
end
function onUpdate()
	for i=0,7 do
	setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.65)
	setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.65)
	setPropertyFromGroup('unspawnNotes', i, 'scale.x', 0.65)
	setPropertyFromGroup('unspawnNotes', i, 'scale.y', 0.65)	
	end
	
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
