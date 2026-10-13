function onCreate()
    precacheImage('stagepup2');
end

function onStepHit()

	if curStep == 881 then

	makeLuaText('Text',"I don't hate you...",1000,140,550)
    setTextSize('Text',25)
	addLuaText("Text")

	end

	if curStep == 912 then

		removeLuaText("Text")
	
		end

			if curStep == 946 then

				makeLuaText('Text',"But you need to stay out of my way!",1000,140,550)
				setTextSize('Text',25)
				addLuaText("Text")
			
				end
			
				if curStep == 984 then
			
					removeLuaText("Text")
				
					end
			
	if curStep == 896 then
      removeLuaSprite('pupstage', false);
      
      makeLuaSprite('pupstage2', 'pupstage2', -570, -350);
	  setLuaSpriteScrollFactor('pupstage2', 0.8, 0.8);
      scaleObject('pupstage2', 1, 1);

      addLuaSprite('pupstage2', false);

   end

   if curStep == 2280 then
    removeLuaSprite('pupstage2', false);

    makeLuaSprite('pupstage', 'pupstage', -1720, -800);
	setLuaSpriteScrollFactor('pupstage', 1, 1);
	scaleObject('pupstage', 0.78, 0.78);

	addLuaSprite('pupstage', false);

	close(true);

	end
end