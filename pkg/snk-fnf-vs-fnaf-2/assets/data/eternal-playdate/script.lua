function onCreate()
    precacheImage('epbstage');
	precacheImage('epcstage');
	precacheImage('epmstage');
	precacheImage('chicjump');
	precacheImage('characters/special');
	precacheImage('characters/special2');
end

function onStepHit()

	if curStep == 1100 then
		removeLuaSprite('epfstage', false);
		
		makeLuaSprite('epbstage', 'epbstage', 600, -100);
		setLuaSpriteScrollFactor('epbstage', 0.9, 0.9);
		scaleObject('epbstage', 0.55, 0.55);
  
		addLuaSprite('epbstage', false);
  
	 end
  
	 if curStep == 1776 then
	  removeLuaSprite('epbstage', false);
  
	  makeLuaSprite('epcstage', 'epcstage', -350, -150);
	  setLuaSpriteScrollFactor('epcstage', 0.9, 0.9);
	  scaleObject('epcstage', 0.6, 0.6);
  
	  addLuaSprite('epcstage', false);
  
	  end
  
	  if curStep == 2769  then
		  removeLuaSprite('epcstage', false);
	  
		  makeLuaSprite('epmstage', 'epmstage', 200, -300);
		  setLuaSpriteScrollFactor('epmstage', 1, 1);
		  scaleObject('epmstage', 0.65, 0.65);
	  
		  addLuaSprite('epmstage', false);
		  
		  end
  
		  if curStep == 3425  then
			  removeLuaSprite('epmstage', false);
		  
			  makeLuaSprite('ahhh', 'ahhh', 200, -300);
			  setLuaSpriteScrollFactor('ahhh', 1, 1);
			  scaleObject('ahhh', 0.65, 0.65);
		  
			  addLuaSprite('ahhh', false);
			  
			  end

	if curStep == 387 then

	makeLuaText('Text',"You seem nervous ...",1000,140,550)
    setTextSize('Text',25)
	addLuaText("Text")

	end

	if curStep == 409 then

		removeLuaText("Text")
		makeLuaText('Text2',"Would you like me to be your friend ?",1000,140,550)
		setTextSize('Text2',25)
		addLuaText("Text2")
	
		end

		if curStep == 432 then

			removeLuaText("Text2")
		
			end

			if curStep == 1843 then

				makeLuaText('Text',"Where's my beak ?",1000,140,550)
				setTextSize('Text',25)
				addLuaText("Text")
			
				end
			
				if curStep == 1872 then
			
					removeLuaText("Text")
					makeLuaText('Text2',"Lodged in your forehead of course!",1000,140,550)
					setTextSize('Text2',25)
					addLuaText("Text2")
				
					end
			
			if curStep == 1904 then
			
				removeLuaText("Text2")
					
				end
			if curStep == 2135 then

				makeLuaText('Text',"You won't get tired of DYING ...",1000,140,550)
				setTextSize('Text',25)
				addLuaText("Text")
						
				end
						
			if curStep == 2166 then
						
				removeLuaText("Text")
				makeLuaText('Text2',"Will you ?",1000,140,550)
				setTextSize('Text2',25)
				addLuaText("Text2")
							
				end
						
			if curStep == 2176 then
						
				removeLuaText("Text2")
								
				end

			if curStep == 2723 then

				makeLuaText('Text',"It's so much more fun ...",1000,140,550)
				setTextSize('Text',25)
				addLuaText("Text")				
		        end
									
			if curStep == 2749 then
									
				removeLuaText("Text")
				makeLuaText('Text2',"Hanging out in here with you !",1000,140,550)
				setTextSize('Text2',25)
				addLuaText("Text2")
										
				end
									
			if curStep == 2784 then
									
				removeLuaText("Text2")
											
				end

end