function onCreate()
	-- background shit
	makeLuaSprite('restaurantbg', 'stages/robot chicken/restaurantbg', -700, 70);
	scaleObject('restaurantbg', 1.6, 1.6);

	makeLuaSprite('adult swim logo', 'stages/robot chicken/adult swim logo', 1000, 580);
	setLuaSpriteScrollFactor('adult swim logo', 0, 0)

	addLuaSprite('restaurantbg', false);
	addLuaSprite('adult swim logo', true);

        setObjectCamera("adult swim logo", "hud")
        setObjectCamera("adult swim logo", "hud")

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end