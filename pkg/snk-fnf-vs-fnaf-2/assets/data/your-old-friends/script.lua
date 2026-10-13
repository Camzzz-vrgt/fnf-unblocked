function onCreate()
    precacheImage('yofcstage');
	precacheImage('yoffoxstage');
	precacheImage('yoffstage');
	precacheImage('yoffreddystage');
end


function onStepHit()


	if curStep == 768 then

		makeLuaText('Text',"I never thought i'd make it through that vent.",1000,140,550)
		setTextSize('Text',25)
		addLuaText("Text")
	
		end

		if curStep == 800 then

			removeLuaText("Text")
		
			end



	if curStep == 800 then

		removeLuaSprite('yofbstage', false);

		makeLuaSprite('yofcstage', 'yofcstage', -1400, -350);
		setLuaSpriteScrollFactor('yofcstage', 0.8, 0.8);
		scaleObject('yofcstage', 0.6, 0.6);
	
		addLuaSprite('yofcstage', false);
	
		end

		if curStep == 1538 then

			makeLuaText('Text',"Argh... you scurvy land lubber!",1000,140,550)
			setTextSize('Text',25)
			addLuaText("Text")
		
			end
	
			if curStep == 1568 then
	
				removeLuaText("Text")

				makeLuaText('Text',"Never stood a chance!",1000,140,550)
			setTextSize('Text',25)
			addLuaText("Text")
			
				end


		if curStep == 1584 then

			removeLuaText("Text")

			removeLuaSprite('yofcstage', false);
		
			makeLuaSprite('yoffoxstage', 'yoffoxstage', -1400, -350);
			setLuaSpriteScrollFactor('yoffoxstage', 0.8, 0.8);
			scaleObject('yoffoxstage', 0.6, 0.6);

			addLuaSprite('yoffoxstage', false);

		end

		if curStep == 2224 then

			makeLuaText('Text',"We---",1000,140,550)
			setTextSize('Text',25)
			addLuaText("Text")
		
			end

				if curStep == 2229 then

					makeLuaText('Text',"Welcome to the Fazbear family...",1000,140,550)
					setTextSize('Text',25)
					addLuaText("Text")
				
					end

			if curStep == 2256 then

				removeLuaText("Text")

		removeLuaSprite('yoffoxstage', false);
	
		makeLuaSprite('yoffstage', 'yoffstage', -1400, -350);
		setLuaSpriteScrollFactor('yoffstage', 0.8, 0.8);
		scaleObject('yoffstage', 0.6, 0.6);

		addLuaSprite('yoffstage', false);
	
		end		

		if curStep == 2816 then

			makeLuaText('Text',"You'll never be alone again...",1000,140,550)
			setTextSize('Text',25)
			addLuaText("Text")
		
			end
	
			if curStep == 2864 then
	
				removeLuaText("Text")
			
				end
		
		if curStep == 2896 then

			removeLuaSprite('yoffstage', false);
		
			makeLuaSprite('yoffreddystage', 'yoffreddystage', -1900, -480);
			setLuaSpriteScrollFactor('yoffreddystage', 1, 1);
			scaleObject('yoffreddystage', 0.8, 0.8);
	
			addLuaSprite('yoffreddystage', false);
		
			end		

end