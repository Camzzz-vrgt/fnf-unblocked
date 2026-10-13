function onCreate()

	makeLuaSprite('Arena', 'arena-bg', 0, 1500)
	addLuaSprite('Arena', false)

	makeAnimatedLuaSprite('people', 'arena-characters', 0, 1864)
	addAnimationByPrefix('people', 'bounce', 'bg-characters', 24, true)
	addLuaSprite('people', false)
	objectPlayAnimation('people', 'bounce', true)

	makeLuaSprite('railingpeople', 'railing', 0, 2020)
	addLuaSprite('railingpeople', false)

	makeLuaSprite('lights', 'lights', 1600, 2300);
	addLuaSprite('lights', true);
	setLuaSpriteScrollFactor('lights', 2, 1.8);

	makeLuaSprite('ruido2', 'ruido2', -500, -600);
	addLuaSprite('ruido2', true);
	setLuaSpriteScrollFactor('ruido2', 0, 0);

end



