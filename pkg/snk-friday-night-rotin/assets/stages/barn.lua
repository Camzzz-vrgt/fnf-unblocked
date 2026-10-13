function onCreate()

	
	-- background shit
	makeLuaSprite('floor', 'barn/floor', 100, 100);
	setLuaSpriteScrollFactor('floor', 1, 1);
	
	makeLuaSprite('sky', 'barn/sky', 200, 200);
	setLuaSpriteScrollFactor('sky', 1, 1);


	addLuaSprite('sky', false);
	addLuaSprite('floor', false);
	
	


	makeLuaSprite('sky2', 'barn/red', 200, 200);
	setLuaSpriteScrollFactor('sky2', 1, 1);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onCreatePost()
setProperty('dad.danceEveryNumBeats',1);
end
