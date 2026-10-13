function onCreate()

	
	-- background shit

	
	makeAnimatedLuaSprite('kitchen', 'kitchen/floor', -100, -200)
	addAnimationByPrefix('kitchen', 'kitchen/floor', 'kitchen',24,true)
	addLuaSprite('kitchen',false)





	addLuaSprite('floor', false);
	
	

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onCreatePost()
setProperty('dad.danceEveryNumBeats',1);
end
