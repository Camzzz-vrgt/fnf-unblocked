function onCreate()

	makeAnimatedLuaSprite('Tantrum_BG', 'Tantrum_Week/Tantrum_BG', -600, -550);
	addAnimationByPrefix('Tantrum_BG', 'idle', 'Tantrum_BG dance', 24, true)
	addLuaSprite('Tantrum_BG', false);
	scaleObject('Tantrum_BG', 4, 4);
	--setProperty('Tantrum_BG.alpha',0)
	
	makeLuaSprite('Tantrum_Post', 'Tantrum_Week/Tantrum_Post', -600, -450);

	--addLuaSprite('Tantrum_Post', true);
	--scaleObject('Tantrum_Post', 0.9, 0.9);

    --close(true); 

	makeAnimatedLuaSprite('Tantrum_BG2', 'Tantrum_Week/Tantrum_BG2', -600, -430);
	addAnimationByPrefix('Tantrum_BG2', 'idle', 'Tantrum_BG2 dance', 24, true)
	addLuaSprite('Tantrum_BG2', false);
	setProperty('Tantrum_BG2.alpha',0)
	scaleObject('Tantrum_BG2', 3.6, 3.6);

end
function onUpdate(elapsed)
	
		--setProperty('defaultCamZoom', 0.1)
       --doTweenZoom('d', 'camGame', 0.1, 1, 'linear')
			
	
end