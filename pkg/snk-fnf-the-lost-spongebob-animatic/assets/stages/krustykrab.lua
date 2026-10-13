function onCreate()


	makeLuaSprite('krustykrab', 'krustykrab', -450, 0);
	setLuaSpriteScrollFactor('krustykrab', 1.0, 1.0);
	scaleObject('krustykrab', 4, 4)
	addLuaSprite('krustykrab', false);

        makeAnimatedLuaSprite('Squilvia', 'Squilvia', 350, 445);
        addAnimationByPrefix('Squilvia', 'idle', 'idle', 20, true)
        setLuaSpriteScrollFactor('Squilvia', 1.0, 1.0);
        scaleObject('Squilvia', 0.75, 0.75)
        addLuaSprite('Squilvia', false);

        close(true)

end
