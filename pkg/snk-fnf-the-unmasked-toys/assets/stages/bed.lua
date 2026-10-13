local xx = 1250 --dad x
local yy = 1000 --dad y
local xx2 = 1300 --bf x
local yy2 = 1100 --bf y
local ofs = 50
local followchars = true

local Notes_Texture_P = 'ARROW_BFR'
local Notes_Texture_O = 'ARROW_BFR'

local Strums_Texture_O = 'ARROW_BFR'
local Strums_Texture_P = 'ARROW_BFR'

local Splashes_Texture = 'noteSplashes'

function onCreate()
	makeLuaSprite('bed', 'backgrounds/bfr/bed', 35, 400)
	--makeLuaSprite('bed', 'image-146', 35, 400)
	addLuaSprite('bed', false)
	
	makeAnimatedLuaSprite('slinky', 'characters/slinky', 740, 850)
	addAnimationByPrefix('slinky', 'SLINKY ', 'SLINKY ', 24, true)
	objectPlayAnimation('slinky', 'SLINKY ', false)
	scaleObject('slinky', 1.15, 1.15)	
	addLuaSprite('slinky', false)		

	makeAnimatedLuaSprite('rex', 'characters/rex', 1675, 825)
	addAnimationByPrefix('rex', 'rex', 'rex', 24, true)
	objectPlayAnimation('rex', 'rex', false)
	scaleObject('rex', 1.65, 1.65)
	addLuaSprite('rex', false)

	makeAnimatedLuaSprite('ham', 'characters/ham', 1600, 1125)
	addAnimationByPrefix('ham', 'ham', 'ham', 24, true)
	objectPlayAnimation('ham', 'ham', false)
	scaleObject('ham', 1.25, 1.25)	
	addLuaSprite('ham', false)
	
	makeAnimatedLuaSprite('potato', 'characters/potato', 725, 1175)
	addAnimationByPrefix('potato', 'potato', 'potato', 24, true)
	objectPlayAnimation('potato', 'potato', false)
	scaleObject('potato', 1.25, 1.25)		
	setProperty('potato.flipX', true)
	addLuaSprite('potato', true)
	
	makeAnimatedLuaSprite('serpiente', 'characters/serpiente', 150, 1000)
	addAnimationByPrefix('serpiente', 'serpiente', 'serpiente', 24, true)
	objectPlayAnimation('serpiente', 'serpiente', false)
	scaleObject('serpiente', 1.5, 1.5)		
	addLuaSprite('serpiente', true)
	
	makeLuaSprite('design', 'visuals/BFRhealthBar-design', 0, 0)
	setObjectCamera('design', 'hud')
	addLuaSprite('design', false)	
end

function onCreatePost()
	setProperty('design.alpha', getPropertyFromClass('ClientPrefs', 'healthBarAlpha'))
	setProperty('design.x', getProperty('healthBar.x') - 269)
	setProperty('design.y', getProperty('healthBar.y') - 127)
	
	setProperty('boyfriend.scale.x', 1.3)
	setProperty('boyfriend.scale.y', 1.3)
end
  
function onUpdate()
	for i=0,7 do
	setPropertyFromGroup('strumLineNotes', i, 'scale.x', 0.6)
	setPropertyFromGroup('strumLineNotes', i, 'scale.y', 0.6)
	setPropertyFromGroup('unspawnNotes', i, 'scale.x', 0.6)
	setPropertyFromGroup('unspawnNotes', i, 'scale.y', 0.6)	
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
	
	for i = 0, getProperty('opponentStrums.length')-1 do
	setPropertyFromGroup('opponentStrums', i, 'texture', Strums_Texture_O)
if not getPropertyFromGroup('notes', i, 'mustPress') and getPropertyFromGroup('notes', i, 'noteType') == ('' or 'Hey!' or 'No Animation' or 'GF Sing' or 'Alt Animation') then
	setPropertyFromGroup('notes', i, 'texture', Notes_Texture_O)
	end
	end
	
	for i = 0, getProperty('playerStrums.length')-1 do
	setPropertyFromGroup('playerStrums', i, 'texture', Strums_Texture_P)
if getPropertyFromGroup('notes', i, 'mustPress') and getPropertyFromGroup('notes', i, 'noteType') == ('' or 'Hey!' or 'No Animation' or 'GF Sing' or 'Alt Animation') then
	setPropertyFromGroup('notes', i, 'texture', Notes_Texture_P)
	setPropertyFromGroup('notes', i, 'noteSplashTexture', Splashes_Texture)
	end
	end	
end
