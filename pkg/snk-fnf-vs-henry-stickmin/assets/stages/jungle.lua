function onCreate()
    makeLuaSprite('bsky', 'charlie/bsky', 0, -650)
	scaleObject('bsky', 0.8, 0.8);
    addLuaSprite('bsky', false)

    makeLuaSprite('jungle', 'charlie/jungle', 0, -650)
	scaleObject('jungle', 0.8, 0.8);
    addLuaSprite('jungle', false)

    makeLuaSprite('rockfront', 'charlie/rockfront', -400, -650)
	scaleObject('rockfront', 0.8, 0.8);
	setScrollFactor('rockfront', 0.5, 0.8);
    addLuaSprite('rockfront', true)
end
