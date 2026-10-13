
function onCreate()
    precacheImage('wfoxystage2');
	precacheImage('wfoxystage3');
	precacheImage('wfoxyrun');
	precacheImage('bfrun');
end


function onStepHit()


	if curStep == 33 then

		makeLuaText('Text',"Arghhh... You scared yet ?",1000,140,550)
		setTextSize('Text',25)
		addLuaText("Text")
	
		end

		if curStep == 64 then

			removeLuaText("Text")
		
			end



	if curStep == 448 then

		removeLuaSprite('wfoxystage', false);

		setProperty('boyfriend.y', 550);
	
		makeAnimatedLuaSprite('wfoxystage2', 'wfoxystage2', -1400, -300);
		setLuaSpriteScrollFactor('wfoxystage2', 1, 1);
		scaleObject('wfoxystage2', 1.7, 1.7);
		addAnimationByPrefix('wfoxystage2','wfoxystage2','idle',24,true);

		makeAnimatedLuaSprite('bfrun', 'bfrun', -1170, 475);
		setLuaSpriteScrollFactor('bfrun', 1, 1);
		scaleObject('bfrun', 1, 1);
		addAnimationByPrefix('bfrun','bfrun','idle',24,true);

		makeAnimatedLuaSprite('wfoxyrun', 'wfoxyrun', -230, 400);
		setLuaSpriteScrollFactor('wfoxyrun', 1, 1);
		scaleObject('wfoxyrun', 0.8, 0.8);
		addAnimationByPrefix('wfoxyrun','wfoxyrun','idle',24,true);
	
		addLuaSprite('wfoxystage2', false);
		addLuaSprite('bfrun', false);
		addLuaSprite('wfoxyrun', false);
	
		end

		if curStep == 530 then

			makeLuaText('Text',"Yer time's almost OUT!",1000,140,550)
			setTextSize('Text',25)
			addLuaText("Text")
		
			end
	
			if curStep == 544 then
	
				removeLuaText("Text")
			
				end

		if curStep == 1120 then

			removeLuaSprite('wfoxystage2', false);
			removeLuaSprite('wfoxyrun', false);
			removeLuaSprite('bfrun', false);
		
			makeLuaSprite('wfoxystage3', 'wfoxystage3', -1500, -350);
			setLuaSpriteScrollFactor('wfoxystage3', 1, 1);
			scaleObject('wfoxystage3', 0.7, 0.7);

			addLuaSprite('wfoxystage3', false);

		end

		if curStep == 1369 then

			makeLuaText('Text',"Avast ye!",1000,140,550)
			setTextSize('Text',25)
			addLuaText("Text")
		
			end

				if curStep == 1379 then

					removeLuaText("Text")

					makeLuaText('Text',"Your time...",1000,140,550)
					setTextSize('Text',25)
					addLuaText("Text")
				
					end
			
					if curStep == 1388 then
			
						removeLuaText("Text")

						makeLuaText('Text',"Is just about to run out.",1000,140,550)
						setTextSize('Text',25)
						addLuaText("Text")
					
						end	

						if curStep == 1408 then
			
							removeLuaText("Text")
						
							end	
			if curStep == 1600 then

		removeLuaSprite('wfoxystage3', false);
	
		makeAnimatedLuaSprite('wfoxystage2', 'wfoxystage2', -1400, -300);
		setLuaSpriteScrollFactor('wfoxystage2', 1, 1);
		scaleObject('wfoxystage2', 1.7, 1.7);
		addAnimationByPrefix('wfoxystage2','wfoxystage2','idle',24,true);

		makeAnimatedLuaSprite('bfrun', 'bfrun', -1170, 475);
		setLuaSpriteScrollFactor('bfrun', 1, 1);
		scaleObject('bfrun', 1, 1);
		addAnimationByPrefix('bfrun','bfrun','idle',24,true);

		makeAnimatedLuaSprite('wfoxyrun', 'wfoxyrun', -230, 400);
		setLuaSpriteScrollFactor('wfoxyrun', 1, 1);
		scaleObject('wfoxyrun', 0.8, 0.8);
		addAnimationByPrefix('wfoxyrun','wfoxyrun','idle',24,true);
	
		addLuaSprite('wfoxystage2', false);
		addLuaSprite('bfrun', false);
		addLuaSprite('wfoxyrun', false);
	
		end				

end