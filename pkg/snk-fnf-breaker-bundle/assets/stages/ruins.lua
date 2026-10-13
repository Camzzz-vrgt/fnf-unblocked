function onCreate()

	precacheImage('stages/ruins/sky')
	precacheImage('stages/ruins/mountains')
	precacheImage('stages/ruins/trees')
	precacheImage('stages/ruins/grasspillars')
	precacheImage('stages/ruins/grasspillars1')
	precacheImage('stages/ruins/light')
	
	precacheImage('stages/ruins/add')
	precacheImage('stages/ruins/BLUE')
	
	precacheImage('stages/ruins/water')
	precacheImage('stages/ruins/wawa')
	precacheImage('stages/ruins/blak')
	
	precacheImage('stages/ruins/gradient')
	precacheImage('stages/ruins/sky1')
	precacheImage('stages/ruins/SUN')
	precacheImage('stages/ruins/GROUND')
	precacheImage('stages/ruins/CLOUDS')
	precacheImage('stages/ruins/OVERLAY')
	
	precacheImage('stages/ruins/SEXPINK')
	
	makeLuaSprite('sky','stages/ruins/sky',-2000,-1000);	
	addLuaSprite('sky',false);
	setScrollFactor('sky',0.9,0.9);	
	
	makeLuaSprite('mt','stages/ruins/mountains',-2500,-450);	
	addLuaSprite('mt',false);
	setScrollFactor('mt',0.8,0.8);

	makeLuaSprite('trees','stages/ruins/trees',-2500,-100);	
	addLuaSprite('trees',false);
	setScrollFactor('trees',0.9,0.9); 

	makeLuaSprite('floor','stages/ruins/grasspillars',-2100,-480);
	addLuaSprite('floor',false);
	setScrollFactor('floor',1,1);
	
	makeLuaSprite('floor1','stages/ruins/grasspillars1',-2100,-522);
	setScrollFactor('floor1',1,1); 	

	makeLuaSprite('light','stages/ruins/light',-1300,-1000)
	setBlendMode('light', 'add')	
	addLuaSprite('light',true);
	setScrollFactor('light',1.1,1.1);

	makeLuaSprite('add','stages/ruins/add',-800,-500)
	setBlendMode('add', 'add')
	addLuaSprite('add',true);
	setScrollFactor('add',0,0);

	makeLuaSprite('blue','stages/ruins/BLUE',-2000,-1000)
	setBlendMode('blue', 'multiply')
	addLuaSprite('blue',false);
	setProperty('blue.alpha', 0)

	makeLuaSprite("water", "stages/ruins/water", -2500, 8500)
	scaleObject("water", 1.3, 1.3)
	addLuaSprite("water", false)
	
	makeLuaSprite("gun", "stages/ruins/gun", -1200, 5500)
	addLuaSprite("gun", false)
	
	makeLuaSprite("knux", "stages/ruins/knux", 600, 5500)
	addLuaSprite("knux", false)

	makeLuaSprite("wawa", "stages/ruins/wawa", -2500, 8500)
	scaleObject("wawa", 1.3, 1.3)
	addLuaSprite("wawa", true)

	makeLuaSprite("black", "stages/ruins/blak", -2500, 8500)
	scaleObject("black", 1.6, 1.6)
	addLuaSprite("black", true)

	makeLuaSprite('sky1','stages/ruins/sky1',-2500,-1300);	
	scaleObject("sky1", 2, 2)
	setProperty("sky1.visible", false)
	addLuaSprite('sky1',false);
	setScrollFactor('sky1',0.9,0.9);

	makeLuaSprite('sun','stages/ruins/SUN',-1000,-400);	
	scaleObject("sun", 1.4, 1.4)
	setProperty("sun.visible", false)
	addLuaSprite('sun',false);
	setScrollFactor('sun',0.9,0.9);
	
	makeLuaSprite('ground','stages/ruins/GROUND',-2280,-770);
	scaleObject("ground", 1.2, 1.2)
	setProperty("ground.visible", false)
	addLuaSprite('ground',false);
	setScrollFactor('ground',1,1); 	

	makeLuaSprite('cod','stages/ruins/CLOUDS',-2500,-950);
	setProperty("cod.visible", false)
	addLuaSprite('cod',false);
	setScrollFactor('cod',0.8,0.8);

	makeLuaSprite('overlay','stages/ruins/OVERLAY',-1100,-800)
	scaleObject("overlay", 1.5, 1.5)
	setBlendMode('overlay', 'add')
	setProperty("overlay.visible", false)
	addLuaSprite('overlay',true);
	setScrollFactor('overlay',0,0);
	
	makeLuaSprite('pink','stages/ruins/SEXPINK',-2000,-1000)
	setBlendMode('pink', 'multiply')
	scaleObject('pink', 2, 2)
	addLuaSprite('pink',false);
	setProperty('pink.alpha', 0)
	
	makeLuaSprite('gradent','stages/ruins/gradient',-2500,700);	
	scaleObject("gradent", 2, 1)
	setProperty("gradent.visible", false)
	addLuaSprite('gradent',false);
	setScrollFactor('gradent',0.9,0.9);

end