function onCreate()

	precacheImage('stages/theSkeld/p1bg')
	
	precacheImage('stages/theSkeld/p2bg')
	
	precacheImage('stages/theSkeld/p3bg')
	precacheImage('stages/theSkeld/p3table')
	precacheImage('stages/theSkeld/p3add')
	precacheImage('stages/theSkeld/p3multiply')
	
	precacheImage('stages/theSkeld/p4bg')
	precacheImage('stages/theSkeld/p4add')
	precacheImage('stages/theSkeld/p4topoftable')
	
	precacheImage('stages/theSkeld/stars')

	makeLuaSprite('p1bg','stages/theSkeld/p1bg',-2100,-480);
	addLuaSprite('p1bg',false);
	setScrollFactor('p1bg',1,1);
	
	makeLuaSprite('p2bg','stages/theSkeld/p2bg',-2100,-480);
	setScrollFactor('p2bg',1,1);
	
	makeLuaSprite('p3bg','stages/theSkeld/p3bg',-2900,-700);
	setScrollFactor('p3bg',1,1);
	
	makeLuaSprite('p3table','stages/theSkeld/p3table',-2100, 820);
	setScrollFactor('p3table',1,1);
	
	makeLuaSprite('p3multiply','stages/theSkeld/p3multiply',-2000,-1000)
	setBlendMode('p3multiply', 'multiply')
	setProperty('p3multiply.alpha', 0)
	
	makeLuaSprite('p3add','stages/theSkeld/p3add',-2000,-1000)
	setBlendMode('p3add', 'add')
	
	makeLuaSprite('p4bg','stages/theSkeld/p4bg',-2500,-480);
	setScrollFactor('p4bg',1,1);
	
	makeLuaSprite('purp','stages/theSkeld/purp',-1625, 0);
	setScrollFactor('purp',1,1);
	
	makeLuaSprite('p4topoftable','stages/theSkeld/p4topoftable',-1825,350);
	setScrollFactor('p4topoftable',1,1);
	
	makeLuaSprite('p4add','stages/theSkeld/p4add',-800,-500)
	setBlendMode('p4add', 'add')
	setScrollFactor('p4add',0,0);
	scaleObject('p4add', 1.2, 1.2)
	
	makeLuaSprite('stars','stages/theSkeld/stars',-1000,-200);
	setScrollFactor('stars',0.3,0.3);
	scaleObject('stars', 1.6, 1.6)
	
	makeLuaSprite('stars2','stages/theSkeld/stars',1500,-200);
	setScrollFactor('stars2',0.3,0.3);
	scaleObject('stars2', 1.6, 1.6)

end