function onCreate()

	precacheImage('stages/farlands/farlands')
	precacheImage('stages/farlands/ground')
	precacheImage('stages/farlands/greenUp')
	precacheImage('stages/farlands/grad')
	
	makeLuaSprite('farlands','stages/farlands/farlands',-2000,-600);
	addLuaSprite('farlands',false);
	scaleObject('farlands', 0.9, 0.9)
	setScrollFactor('farlands',0.9,0.9);

	makeLuaSprite('ground','stages/farlands/ground',-2100,-480);
	addLuaSprite('ground',false);
	setScrollFactor('ground',1,1);

	makeLuaSprite('grad','stages/farlands/grad',-1300,-1000)
	setBlendMode('grad', 'add')
	addLuaSprite('grad',true);
	setScrollFactor('grad',1.1,1.1);

	makeLuaSprite('green','stages/farlands/greenUp',-2000,-1000)
	setBlendMode('green', 'multiply')
	addLuaSprite('green',false);
	setProperty('green.alpha', 0)

end