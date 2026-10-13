local xx = 300 --dad x
local yy = 250 --dad y
local xx2 = 400 --bf x
local yy2 = 300 --bf y
local ofs = 50
local followchars = true

function onCreate()
	makeLuaSprite('pared', 'backgrounds/exe/phase1/pared', -600, -300)
	addLuaSprite('pared', false)	
	
	makeLuaSprite('suelo', 'backgrounds/exe/phase1/suelo', -600, -300)
	addLuaSprite('suelo', false)	
	
	makeLuaSprite('trex', 'backgrounds/exe/phase1/trex', -600, -300)
	addLuaSprite('trex', false)	
	
	makeLuaSprite('marcianitos', 'backgrounds/exe/phase1/marcianitos', -600, -300)
	addLuaSprite('marcianitos', false)	
	
	--PHASE 2
	makeLuaSprite('toybed', 'backgrounds/exe/phase2/toybed', -925, -380)
	setProperty('toybed.visible', false)
	addLuaSprite('toybed', false)	
	
	--PHASE 3
	makeLuaSprite('toybedbad', 'backgrounds/exe/phase3/toybedbad', -925, -380) -- -351, 120
	setProperty('toybedbad.visible', false)
	addLuaSprite('toybedbad', false)		
	
	-- EXTRAS	
	
	makeLuaSprite('iluminacion', 'backgrounds/exe/phase1/iluminacion', -600, -300)
	setBlendMode('iluminacion', 'add')
	addLuaSprite('iluminacion', true)	
	
	makeLuaSprite('oscuridad', 'backgrounds/exe/phase1/oscuridad', -600, -300)
	addLuaSprite('oscuridad', true)		
	
	doTweenY('marcianitos0', 'marcianitos', -300, 0.1)		
	
	
	makeLuaSprite('black', nil, -500, 0)
	makeGraphic('black', 2750, 1320, '000000')
	setObjectCamera('black', 'other')	
	addLuaSprite('black', true)
	
	makeLuaSprite('whita', nil, -500, 0)
	makeGraphic('whita', 2750, 1320, 'FFFFFF')
	setObjectCamera('whita', 'other')	
	doTweenAlpha('whitta', 'whita', 0, 0.1)
	addLuaSprite('whita', true)				
end
function onTweenCompleted(t)
	if t == 'marcianitos0' then
	doTweenY('marcianitos5', 'marcianitos', -350, 5)
	end
	if t == 'marcianitos5' then
	doTweenY('marcianitos0', 'marcianitos', -300, 5)
	end	
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
