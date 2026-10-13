function onCreate()

	precacheImage('stages/sexOnTV/bg')
	
	makeLuaSprite('bg','stages/sexOnTV/bg',-1200,-500);
	addLuaSprite('bg',false);
	scaleObject('bg',1.25,1.25);
	setScrollFactor('bg',1,1);

end