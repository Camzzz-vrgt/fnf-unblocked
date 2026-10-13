function onCreate()
	--Calamardo Suicida
dir3 = 'Calamardo/Stagues/Phase final/'
images3 = {'BGfinal','Sucio','BV'}
for _,f in ipairs(images3) do
	makeLuaSprite(f,dir3..f,485,400)
	addLuaSprite(f,false)
    setProperty(f..'.visible', false)
end
scaleObject('BGfinal', 2.1,2.1,false)

scaleObject('Sucio', 3.36,3.36,false)
setObjectCamera('Sucio','other')
setProperty('Sucio.alpha', 0)
screenCenter('Sucio')

scaleObject('BV', 0.94,0.94,false)
setObjectCamera('BV','other')
screenCenter('BV')
	-- Calamardo con Escopeta
dir2 = 'Calamardo/Stagues/Phase1 y 3/'
images2 = {'BG','Luz','Black'}
for _,i in ipairs(images2) do
	makeLuaSprite(i,dir2..i,-200,-80)
	addLuaSprite(i,i == 'Luz' and true or false)
	setObjectCamera(i,i == 'Black' and 'camOther')
	--setProperty(i..'.alpha', 0)
end
setProperty('P2.x', 1570)
setProperty('P2.y', 140)
scaleObject('P2', 1.08,1.08,false)
setProperty('Black.x', 0)
setProperty('Black.y', 0)
scaleObject('BG', 2, 2);
scaleObject('Black', 2, 2);
scaleObject('Luz', 2, 2);

-- Calamardo en el escenario
dir1 = 'Calamardo/Stagues/Phase2/'
images1 = {'FloorStague'}
for _,j in ipairs(images1) do
	makeLuaSprite(j,dir1..j,0,0)
	addLuaSprite(j,false)
	setProperty(j..'.alpha', 0)
end
scaleObject('FloorStague', 2, 2);

-- Publico del escenario
makeAnimatedLuaSprite('Publico','Calamardo/Stagues/Phase2/pipol-1', 237, 688);
addAnimationByPrefix('Publico','bop','publico0',24, true);
scaleObject('Publico', 2, 2);
setScrollFactor('Publico', 1.13, 1.1)
addLuaSprite('Publico',true);
setProperty('Publico.alpha', 0)

makeAnimatedLuaSprite('NICK','Calamardo/nick_glichetd-2', 810, 320);
addAnimationByPrefix('NICK','beep','glitch anim',24, true);
scaleObject('NICK', 0.42, 0.42, false);
setProperty('NICK.alpha', 0.65)
setObjectCamera('NICK','camOther')
addLuaSprite('NICK',false);

makeLuaSprite('Bar','Calamardo/HealthBar',263,520)
setObjectCamera('Bar', 'camHUD')
addLuaSprite('Bar',true)

if downscroll then
setProperty('NICK.y',-420)
setProperty('Bar.y',-40)
end
end
function onCreatePost()
	runHaxeCode([[
		game.gf.kill();
	]])
scaleObject('healthBar', 0.935, 1.3, false)
end

