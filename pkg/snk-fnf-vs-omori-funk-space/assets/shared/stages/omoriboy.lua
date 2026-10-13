function onCreate()
setProperty('skipArrowStartTween',true)
setProperty('skipCountdown', true)

makeAnimatedLuaSprite('abbi', 'icons/icon-abbi', 0, 0)
	addAnimationByPrefix('abbi', 'normal', 'normal', 24, true)
	addAnimationByPrefix('abbi', 'loss', 'loss', 24, true)
	setObjectCamera('abbi', 'camHUD')
	setProperty('abbi.alpha', 0.000001)
	addLuaSprite('abbi', true)
end
function onCreatePost()
setProperty('gf.visible',false)
makeLuaSprite('white','bonus/images/omoriboyBG/back',0, 0)
addLuaSprite('white')

makeLuaSprite('bulb','bonus/images/omoriboyBG/bulb',200, -50)
addLuaSprite('bulb')

makeLuaSprite('carpet','bonus/images/omoriboyBG/carpet',100, 750)
addLuaSprite('carpet')

makeLuaSprite('laptop','bonus/images/omoriboyBG/laptop',1600, 700)
addLuaSprite('laptop')

makeLuaSprite('window','bonus/images/omoriboyBG/window',1480, 180)
addLuaSprite('window')

makeAnimatedLuaSprite('Mewo','bonus/images/omoriboyBG/Mewo_Omori_Boy_Assets', 150, 600)
addAnimationByPrefix('Mewo', 'Mewo', 'A-Dance', 24, true);
addLuaSprite('Mewo')

makeAnimatedLuaSprite('GF','characters/GF_assets', 580, 160)
addAnimationByPrefix('GF', 'GF', 'GF Dancing Beat0', 24, true);
scaleObject('GF',2,2)
addLuaSprite('GF')
end

function onSongStart()
startVideo('omoriboy')
setProperty('inCutscene', false);
end

function onStepHit()
if curStep == 927 then
startVideo('omoriboyMID')
setProperty('inCutscene', false);
end
if curStep == 976 then
setProperty('abbi.alpha', 1)
setProperty('gf.visible', true)
end
if curStep == 1375 then
makeLuaSprite("blackshit", "", -1050, -500)
	makeGraphic('blackshit', 3400, 2000, '000000')
	addLuaSprite('blackshit', false)
setObjectCamera('blackshit','other')
setProperty('gf.visible', false)
setProperty('abbi.alpha', 0.000001)
end
if curStep == 1377 then
removeLuaSprite('blackshit', true)
end
end

function onUpdate(elapsed)
	if getProperty('health') > 1.61 then
		objectPlayAnimation('abbi', 'loss', false)
		setProperty('abbi.x', getProperty('iconP2.x') -60) -- the number is icon offset
		setProperty('abbi.y', getProperty('iconP2.y') +25)
	elseif getProperty('health') < 1.61 and getProperty('health') > 0.4 then
		objectPlayAnimation('abbi', 'normal', false)
		setProperty('abbi.x', getProperty('iconP2.x') -60)
		setProperty('abbi.y', getProperty('iconP2.y') +25)
end

	setProperty('abbi.scale.x', getProperty('iconP2.scale.x'))
	setProperty('abbi.scale.y', getProperty('iconP2.scale.y'))
end