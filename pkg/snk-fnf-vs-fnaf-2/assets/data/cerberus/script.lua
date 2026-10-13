function onStepHit()

      if curStep == 1 then

            makeLuaText('Text',"Don't be afraid,",1000,140,550)
          setTextSize('Text',25)
            addLuaText("Text")
      
            end
      
            if curStep == 21 then
      
                  removeLuaText("Text")
                  makeLuaText('Text2',"Soon you will look just like me...",1000,140,550)
                  setTextSize('Text2',25)
                  addLuaText("Text2")
            
                  end

                  if curStep == 54 then
      
                        removeLuaText("Text2")
                        makeLuaText('Text',"BEAUTIFUL!",1000,140,550)
                        setTextSize('Text',25)
                        addLuaText("Text")
                  
                        end
      
                  if curStep == 64 then
      
                        removeLuaText("Text")
                  
                        end

                        if curStep == 637 then

                              makeLuaText('Text',"Now i get to play ''Take a Part and Put Back together'' ...",1000,140,550)
                            setTextSize('Text',25)
                              addLuaText("Text")
                        
                              end
                        
                              if curStep == 685 then
                        
                                    removeLuaText("Text")
                                    makeLuaText('Text2',"You won't feel a thing",1000,140,550)
                                    setTextSize('Text2',25)
                                    addLuaText("Text2")
                              
                                    end
                  

	if curStep == 704 then
            removeLuaText("Text2")
            
      removeLuaSprite('manglestage', false);
      
      makeLuaSprite('manglestage2', 'manglestage2', -800, -700);
	setLuaSpriteScrollFactor('manglestage2', 1, 1);
	scaleObject('manglestage2', 0.9, 0.9);


	addLuaSprite('manglestage2', false);

   end

   if curStep == 1024 then

      removeLuaSprite('manglestage2', false);

	end
end