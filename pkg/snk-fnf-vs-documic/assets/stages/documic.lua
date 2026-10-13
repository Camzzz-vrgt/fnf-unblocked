function onCreate()
	makeLuaSprite('background', 'documicmain/background', -595, -306);
	addLuaSprite('background', false);

	makeLuaSprite('stars', 'documicmain/stars', -595, -306);
	setScrollFactor('stars', 0.95, 1);
	addLuaSprite('stars', false)

	makeLuaSprite('sun', 'documicmain/sun', -595, -306);
	addLuaSprite('sun', false);
	setScrollFactor('sun', 0.80, 0.75);

	makeLuaSprite('hills', 'documicmain/hills', -620, -306);
	addLuaSprite('hills', false);
	setScrollFactor('hills', 0.69, 0.89);


	makeLuaSprite('hillzone', 'documicmain/hillzone', -595, -306);
	addLuaSprite('hillzone', false);
	setScrollFactor('hillzone', 0.78, 1);

	makeLuaSprite('floor', 'documicmain/floor', -595, -306);
	addLuaSprite('floor', false);
	setScrollFactor('floor', 0.79, 1);

   	makeAnimatedLuaSprite('Documic3DBG2','documicmain/Documic3DBG2', -300, -200)
    	addAnimationByPrefix('Documic3DBG2','Documic3DBG2','sway',12,true);
    	objectPlayAnimation('Documic3DBG2','Documic3DBG2',false);

	addLuaSprite('Documic3DBG2', false);

  	makeAnimatedLuaSprite('Documic3DBG1','documicmain/Documic3DBG1', -650, -200)
    	addAnimationByPrefix('Documic3DBG1','Documic3DBG1','sway',12,true);
    	objectPlayAnimation('Documic3DBG1','Documic3DBG1',false);

	addLuaSprite('Documic3DBG1', false);

	close(true);
end