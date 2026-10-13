function onCreate()
	makeLuaSprite('sbstage', 'sbstage', -1500, -450);
	setLuaSpriteScrollFactor('sbstage', 1, 1);
	scaleObject('sbstage', 0.7, 0.7);

	makeAnimatedLuaSprite('wfstage5', 'wfstage5', 250, 250);
	setLuaSpriteScrollFactor('wfstage5', 1.3, 1.3);
	scaleObject('wfstage5', 0.7, 0.7);

	addAnimationByPrefix('wfstage5','wfstage5','idle',24,true);

	makeLuaSprite('black','black', 0, 0);
    setObjectCamera('black', 'hud')

	addLuaSprite('sbstage', false);
	addLuaSprite('wfstage5', true);
	addLuaSprite('black', true);
	
	close(true);
end