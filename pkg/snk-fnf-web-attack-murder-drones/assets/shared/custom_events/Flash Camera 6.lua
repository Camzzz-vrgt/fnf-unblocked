function onEvent(n,v1,v2)


	if n == 'Flash Camera 6' then

	   makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'450080')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',2)
	      setProperty('flash.scale.y',2)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,v1,'linear')
	end



end