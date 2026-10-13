function onCreate()
    precacheImage('tfstage6');
	precacheImage('tfstage5');
end

function onStepHit()

	if curStep == 86 then

	makeLuaText('Text',"Did I overhear that someone needs a ...",1000,140,550)
    setTextSize('Text',25)
	addLuaText("Text")

	end

	if curStep == 117 then

		removeLuaText("Text")
		makeLuaText('Text2',"Friend ?",1000,140,550)
		setTextSize('Text2',25)
		addLuaText("Text2")
	
		end

		if curStep == 128 then

			removeLuaText("Text2")
		
			end

			if curStep == 388 then

				makeLuaText('Text',"This is FUN !",1000,140,550)
				setTextSize('Text',25)
				addLuaText("Text")
			
				end
		
			
					if curStep == 408 then
			
						removeLuaText("Text")
					
						end
						if curStep == 913 then

							makeLuaText('Text',"I'm friends with EVERYONE !",1000,140,550)
							setTextSize('Text',25)
							addLuaText("Text")
						
							end

							if curStep == 928 then
						
								removeLuaText("Text")
							
								end
						
							if curStep == 1718 then
						
								removeLuaText("Text")
								makeLuaText('Text2',"This has been REALLY fun !",1000,140,550)
								setTextSize('Text2',25)
								addLuaText("Text2")
							
								end

								if curStep == 1747 then
						
									removeLuaText("Text")
									makeLuaText('Text2',"Would you like to play some more ?",1000,140,550)
									setTextSize('Text2',25)
									addLuaText("Text2")
								
									end
						
								if curStep == 1776 then
						
									removeLuaText("Text2")
								
									end


									if curStep == 912 then
										
										makeAnimatedLuaSprite('tfstage5', 'tfstage5', -200, 50);
										scaleObject('tfstage5', 0.9, 0.9);
								  
										addLuaSprite('tfstage5', false);

										addAnimationByPrefix('tfstage5','tfstage5','idle',24,true);

										makeAnimatedLuaSprite('tfstage6', 'tfstage6', 1400, 130);
										scaleObject('tfstage6', 0.8, 0.8);
								  
										addLuaSprite('tfstage6', false);

										addAnimationByPrefix('tfstage6','tfstage6','idle',24,true);
								  
									 end

end