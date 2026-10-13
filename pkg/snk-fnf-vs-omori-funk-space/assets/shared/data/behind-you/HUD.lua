uigay = {'base healt dad','scoreTxt','timeTxt','botplayTxt'}
function getHealthColor(arg)
    return "0xFF" ..
        rgbToHex(getProperty(arg .. ".healthColorArray[0]"), getProperty(arg .. ".healthColorArray[1]"),
            getProperty(arg .. ".healthColorArray[2]"));
end

function rgbToHex(r, g, b)
    return string.format("%02X%02X%02X", r, g, b)
end

function onCreatePost()
flip = true
setProperty('healthBarBG.visible', false)
setProperty('healthBar.visible', false)

if not hideHud then
makeLuaSprite('UpperBar(With HUD)', 'empty', -110, -240)
	makeGraphic('UpperBar(With HUD)', 1500, 350, '000000')
	setObjectCamera('UpperBar(With HUD)', 'HUD')
	addLuaSprite('UpperBar(With HUD)', false)

    makeLuaSprite('LowerBar(With HUD)', 'empty', -110, 630)
	makeGraphic('LowerBar(With HUD)', 1500, 350, '000000')
	setObjectCamera('LowerBar(With HUD)', 'HUD')
	
	addLuaSprite('LowerBar(With HUD)', false)

    UpperBar = getProperty('UpperBar(With HUD).y')
	LowerBar = getProperty('LowerBar(With HUD).y')

    for Notes = 0,7 do 
        StrumY = getPropertyFromGroup('strumLineNotes', Notes, 'y')
        
makeLuaSprite('base healt bf', 'healthBar/healthBar_crae',0,0)
setObjectCamera('base healt bf', 'hud')
addLuaSprite('base healt bf', false)
setProperty('base healt bf.flipX',true)
setProperty('base healt bf.y', getProperty('healthBar.y') - 30)
setProperty('base healt bf.x', getProperty('healthBar.x') - 60)
scaleObject('base healt bf', 0.97, 0.97)

makeLuaSprite('base healt dad', 'healthBar/healthBar_crae',0,0)
setObjectCamera('base healt dad', 'hud')
addLuaSprite('base healt dad', false)
setProperty('base healt dad.flipX',true)
setProperty('base healt dad.y', getProperty('healthBar.y') - 30)
setProperty('base healt dad.x', getProperty('healthBar.x') - 60)
scaleObject('base healt dad', 0.97, 0.97)
end
end
setTextSize('scoreTxt', 20)

doTweenColor('bf bar', 'base healt bf',getHealthColor('boyfriend'), 0.001, 'linear')
setTimeBarColors(getHealthColor('dad'), '404040')
for _, u in pairs(uigay) do
doTweenAlpha('fading'..u,u,0.0001,0.0001)
doTweenColor('colorgay'..u,u,getHealthColor('dad'), 0.001, 'linear')
end
end
function Colorkpro()
doTweenColor('bf bar', 'base healt bf',getHealthColor('boyfriend'), 0.001, 'linear')
setTimeBarColors(getHealthColor('dad'), '404040')
for _, u in pairs(uigay) do
doTweenAlpha('fading'..u,u,0.0001,0.0001)
doTweenColor('colorgay'..u,u,getHealthColor('dad'), 0.001, 'linear')
end
end

function onUpdatePost()--logica de la barra
--flip--  
   		P1Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
   
		   P2Mult = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
		
		   setProperty('iconP1.x',P1Mult - 110)
   
		   setProperty('iconP1.origin.x',240)
   
		   setProperty('iconP1.flipX',true)
		
		   setProperty('iconP2.x',P2Mult + 110)
   
		   setProperty('iconP2.origin.x',-100)
   
		   setProperty('iconP2.flipX',true)
   
		   setProperty('healthBar.flipX',true)
		
local barWidth = (1 - (getHealth() / 2)) * getProperty('base healt bf.width')
setProperty('base healt dad._frame.frame.width', barWidth)
end
function onEvent(n)
if n == 'Change Character' then
Colorkpro()
end
end
--themaxwellcassidywashere(pinchescriptculero)--
--                                  el hizo la healhtBar                                                             --