function onCreate()

   makeLuaSprite('theBg','Bg',-550,-320)
   addLuaSprite('theBg',false)
   setLuaSpriteScrollFactor('theBg',0.8,0.8);

   close (true)

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end