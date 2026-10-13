function onCreate()
BGC = 0xAB6969
size = 0.5
Ssize = 1.6
BG2size = 1.45
dir1 = 'Smile-Dog/stague/'
images1 = {'Sucio','BG2','BG','Table', 'sus', 'Microfono', 'Chair', 'Sucio', 'Dark'}
for _,i in ipairs(images1) do
	makeLuaSprite(i, dir1..i,i == 'Chair' and 330 or i == 'BG2' and 790 or  0,i == 'Chair' and -30 or i == 'BG2' and -230 or 0)
	scaleObject(i ,i == 'Dark' and size or i == 'Sucio' and Ssize or i == 'BG2' and BG2size or 2.2,i == 'Dark' and size or i == 'Sucio' and Ssize or i == 'BG2' and BG2size or 2.2)
	addLuaSprite(i ,i == 'Chair' and true or i == 'sus' and true or i == 'Microfono' and true or false)
	setObjectCamera(i,i == 'Dark' and 'camOther' or i == 'Sucio' and 'camOther')
	setProperty(i..('.color'), BGC)
end
screenCenter('Sucio', 'xy')
setProperty('Dark.x', 0)
setProperty('Dark.y', 0)
scaleObject('Dark', 1, 1);
--setProperty('Dark.visible', false)
setProperty('Sucio.alpha', 0)
setScrollFactor('BG', 0.68,0.93)

makeLuaSprite('Quelico', nil,  1203, 520)
makeGraphic('Quelico', 30,10, 'FF0000')
--setObjectOrder('Quelico', getObjectOrder('boyfriendGroup') + 1)
setObjectCamera('Quelico', 'hud')
addLuaSprite('Quelico')

makeAnimatedLuaSprite('C-Bar','Smile-Dog/SmileBar', 1119, 210);
addAnimationByPrefix('C-Bar','beep','barAnim',24, true);
scaleObject('C-Bar', 1.42, 1.42, false);
setObjectCamera('C-Bar','camHUD')
addLuaSprite('C-Bar',false);
end
function onCreatePost()
	runHaxeCode([[
		game.gf.kill();
	]])
	setProperty('boyfriend.color', BGC)
	setProperty('camHUD.alpha', 0)
--doTweenColor('P1', 'iconP1', 'FF0007', 0.0001, 'linear')
end
function onUpdatePost()
	setProperty('iconP1.x', 940)
	setProperty('iconP2.x', 200)
end