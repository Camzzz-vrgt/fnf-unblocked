function onStepHit()

	if curStep == 15 then

	makeLuaText('Text',"Let me show you how to BREAK YOUR FACE...",1000,140,550)
    setTextSize('Text',25)
	addLuaText("Text")

	end

	if curStep == 43 then

		removeLuaText("Text")
		makeLuaText('Text2',"And look like me",1000,140,550)
		setTextSize('Text2',25)
		addLuaText("Text2")
	
		end

		if curStep == 64 then

			removeLuaText("Text2")
		
			end

			if curStep == 424 then

				makeLuaText('Text',"I was the first ...",1000,140,550)
				setTextSize('Text',25)
				addLuaText("Text")
			
				end
			
				if curStep == 443 then
			
					removeLuaText("Text")
					makeLuaText('Text2',"I have seen EVERYTHING !",1000,140,550)
					setTextSize('Text2',25)
					addLuaText("Text2")
				
					end
			
					if curStep == 480 then
			
						removeLuaText("Text2")
					
						end
						if curStep == 981 then

							makeLuaText('Text',"Come closer ...",1000,140,550)
							setTextSize('Text',25)
							addLuaText("Text")
						
							end
						
							if curStep == 998 then
						
								removeLuaText("Text")
								makeLuaText('Text2',"Let's SMILE together !",1000,140,550)
								setTextSize('Text2',25)
								addLuaText("Text2")
							
								end
						
								if curStep == 1024 then
						
									removeLuaText("Text2")
								
									end

									if curStep == 1375 then

										makeLuaText('Text',"But now we are...",1000,140,550)
										setTextSize('Text',25)
										addLuaText("Text")
									
										end
									
										if curStep == 1397 then
									
											removeLuaText("Text")
											makeLuaText('Text2',"TOGETHER",1000,140,550)
											setTextSize('Text2',25)
											addLuaText("Text2")
										
											end
									
											if curStep == 1408 then
									
												removeLuaText("Text2")
											
												end

	if curStep == 1024 then
      removeLuaSprite('wcstage', false);
      
      makeLuaSprite('wcstage3', 'wcstage3', -700, -500);
	  setLuaSpriteScrollFactor('wcstage3', 1.1, 1.1);
      scaleObject('wcstage3', 0.6, 0.6);

      addLuaSprite('wcstage3', false);

   end

   if curStep == 1280 then
    removeLuaSprite('wcstage3', false);

    makeLuaSprite('wcstage2', 'wcstage2', -1000, -700);
	setLuaSpriteScrollFactor('wcstage2', 0.8, 0.8);
	scaleObject('wcstage2', 0.6, 0.6);

	addLuaSprite('wcstage2', false);

	close(true);

	end
end