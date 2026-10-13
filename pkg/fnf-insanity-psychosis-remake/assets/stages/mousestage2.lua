function onCreate()
	-- background shit
	makeLuaSprite('mousestage2', 'mousestage2', -490, -490);
	setLuaSpriteScrollFactor('mousestage2', 0.7, 0.7);

	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	--add any other image you want ingame,that can only be used while low quality is off
	end
	
	addLuaSprite('mousestage2', false);
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

--IMAGE SCRIPT NOTES FOR HELPING:	
	--makeLuaSprite:The numbers (-490, -490) are the X and Y values. you can change them to fit your own bg.
	--setLuaSpriteScrollFactor:The numbers(0.7, 0,7) are used for the X and Y Scroll Factors,you can change them to whatever number you want!
	--addLuaSprite:The boolean value is used to either add the image for the bg in front of the characters(true), or behind the characters(false). 