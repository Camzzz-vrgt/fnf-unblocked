local creditShown = false

function onStartCountdown()
	if not creditShown then
		setPropertyFromClass('PauseSubState', 'songName', 'bedpauser')
		
		makeAnimatedLuaSprite('creditSchmoovin','songCredits/creditThingAnimation', -1400, -300)
		scaleObject('creditSchmoovin', 1, 1)
		addLuaSprite('creditSchmoovin',true);
		setScrollFactor('creditSchmoovin',0,0);
		setObjectCamera('creditSchmoovin','hud');
		addAnimationByPrefix('creditSchmoovin','schmoove','thing')
		setProperty('creditSchmoovin.angle', -30)
		
		makeLuaSprite('creditSlide','songCredits/slide'..songName, 0, 990)
		scaleObject('creditSlide', 1.1, 1.1)
		addLuaSprite('creditSlide',true);
		setScrollFactor('creditSlide',0,0);
		setObjectCamera('creditSlide','hud');
		
		makeLuaSprite('creditSpikes','songCredits/spikeys', 1900, 0)
		scaleObject('creditSpikes', 1.2, 1.2)
		addLuaSprite('creditSpikes',true);
		setScrollFactor('creditSpikes',0,0);
		setObjectCamera('creditSpikes','hud');
		
		makeLuaSprite('creditCircle','songCredits/circle'..songName, 1800, 200)
		scaleObject('creditCircle', 0.9, 0.9)
		addLuaSprite('creditCircle',true);
		setScrollFactor('creditCircle',0,0);
		setObjectCamera('creditCircle','hud');
		
		doTweenX("credSchmooveTween", "creditSchmoovin", -400, 1.0, "sineOut")
		doTweenY("credSlideTween", "creditSlide", 490, 1.0, "sineOut")
		doTweenX("credSpikeTween", "creditSpikes", 900, 1.5, "sineOut")
		doTweenX("credCircTween", "creditCircle", 800, 1.0, "sineOut")
		
		creditShown = true
	end
end

function onSongStart()
	doTweenX("credSchmooveTween", "creditSchmoovin", -1400, 1, "sineIn")
	doTweenY("credSlideTween", "creditSlide", -400, 0.75, "sineIn")
	doTweenX("credSpikeTween", "creditSpikes", 1900, 1.5, "sineIn")
	doTweenX("credCircTween", "creditCircle", 1750, 1, "sineIn")
	runTimer('credTween', 2)
end

function onTimerCompleted(t)
	if t == 'credTween' then
		removeLuaSprite('creditSchmoovin')
		removeLuaSprite('creditSlide')
		removeLuaSprite('creditSpikes')
		removeLuaSprite('creditCircle')
	end
end