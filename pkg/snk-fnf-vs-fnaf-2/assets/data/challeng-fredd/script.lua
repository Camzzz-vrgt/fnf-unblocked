
function onCreate()
    precacheImage('challengbonnie');
	precacheImage('challengchic');
	precacheImage('challengchicnotice');
	precacheImage('challengfrednotice');
	precacheImage('cmanglefall');
	precacheImage('tmangstage');
	precacheImage('tmangstage2');
	precacheImage('cbon');
	precacheImage('cchic');
	precacheImage('cfred');
	precacheImage('cmang');
	precacheImage('cbf');
	setProperty('dad.y', -20);
	setProperty('dad.x', -400);
end


function onStepHit()



	if curStep == 1984 then

		removeLuaSprite('tmangstage', false);
	
		makeLuaSprite('tmangstage2', 'tmangstage2', -300, -400);
		setLuaSpriteScrollFactor('tmangstage2', 1, 1);
		scaleObject('tmangstage2', 0.6, 0.6);

		makeLuaSprite('cfred', 'cfred', 100, 70);
		setLuaSpriteScrollFactor('cfred', 1, 1);
		scaleObject('cfred', 1, 1);

		makeAnimatedLuaSprite('gf', 'characters/gf3', 900, 200);
		setLuaSpriteScrollFactor('gf', 1, 1);
		scaleObject('gf', 0.72, 0.72);
		addAnimationByPrefix('gf','gf','GF Dancing Beat',24,true);

		makeLuaSprite('cchic', 'cchic', 100, 120);
		setLuaSpriteScrollFactor('cchic', 1, 1);
		scaleObject('cchic', 0.7, 0.7);

		makeLuaSprite('cmang', 'cmang', 530, -80);
		setLuaSpriteScrollFactor('cmang', 1, 1);
		scaleObject('cmang', 1, 1);

		makeLuaSprite('cbon', 'cbon', 900, 120);
		setLuaSpriteScrollFactor('cbon', 1, 1);
		scaleObject('cbon', 1.1, 1.1);

		makeLuaSprite('cbf', 'cbf', 1350, 450);
		setLuaSpriteScrollFactor('cbf', 1, 1);
		scaleObject('cbf', 0.55, 0.55);
	
		addLuaSprite('tmangstage2', true);
		addLuaSprite('cmang', true);
		addLuaSprite('cchic', true);
		addLuaSprite('gf', true);
		addLuaSprite('cbf', true);
		addLuaSprite('cfred', true);
		addLuaSprite('cbon', true);
	
		end

		if curStep == 2072 then

			removeLuaSprite('cfred', false);
	
			makeAnimatedLuaSprite('challengfrednotice', 'challengfrednotice', 100, 70);
			setLuaSpriteScrollFactor('challengfrednotice', 1, 1);
			scaleObject('challengfrednotice', 1, 1);
			addAnimationByPrefix('challengfrednotice','challengfrednotice','idle',24,true);

			addLuaSprite('challengfrednotice', true);
		
			end

			if curStep == 2004 then

				removeLuaSprite('cmang', false);
				removeLuaSprite('gf', false);
				removeLuaSprite('cbf', false);

				makeAnimatedLuaSprite('cmanglefall', 'cmanglefall', 530, -80);
				setLuaSpriteScrollFactor('cmanglefall', 1, 1);
				scaleObject('cmanglefall', 1, 1);
				addAnimationByPrefix('cmanglefall','cmanglefall','idle',24,true);

				makeAnimatedLuaSprite('gf', 'characters/gf3', 900, 200);
		setLuaSpriteScrollFactor('gf', 1, 1);
		scaleObject('gf', 0.72, 0.72);
		addAnimationByPrefix('gf','gf','GF Dancing Beat',24,true);

		makeLuaSprite('cbf', 'cbf', 1350, 450);
		setLuaSpriteScrollFactor('cbf', 1, 1);
		scaleObject('cbf', 0.55, 0.55);
		
				addLuaSprite('cmanglefall', true);
				addLuaSprite('gf', true);
				addLuaSprite('cbf', true);

			
				end

				if curStep == 2083 then

					removeLuaSprite('cbon', false);
					removeLuaSprite('cchic', false);

					makeAnimatedLuaSprite('challengchicnotice', 'challengchicnotice', 100, 120);
					setLuaSpriteScrollFactor('challengchicnotice', 1, 1);
					scaleObject('challengchicnotice', 0.7, 0.7);
					addAnimationByPrefix('challengchicnotice','challengchicnotice','idle',24,true);

					makeAnimatedLuaSprite('challengbonnie', 'challengbonnie', 900, 120);
					setLuaSpriteScrollFactor('challengbonnie', 1, 1);
					scaleObject('challengbonnie', 1.1, 1.1);
					addAnimationByPrefix('challengbonnie','challengbonnie','idle',24,false);
				
					addLuaSprite('challengchicnotice', true);
					addLuaSprite('challengbonnie', true);
			
				
					end

					


	if curStep == 912 then

		removeLuaSprite('presents', false);
		removeLuaSprite('table', false);
		removeLuaSprite('stars', false);
	
		makeLuaSprite('tmangstage', 'tmangstage', -500, -500);
		setLuaSpriteScrollFactor('tmangstage', 1, 1);
		scaleObject('tmangstage', 0.6, 0.6);
	
		addLuaSprite('tmangstage', false);
	
		setProperty('dad.y', 1000);
		setProperty('dad.x', -200);
		setProperty('boyfriend.y', 700);
		setProperty('boyfriend.x', 1000);
		setProperty('gf.y', 90);
		setProperty('gf.x', 150);
	
		end


		if curStep == 928 then

			doTweenY('dadTweenY', 'dad', 300, 1, 'cubeIn');
	
			end
	
			if curStep == 938 then
	
				doTweenY('dadTweenY', 'dad', 1000, 1, 'cubeIn');
		
				end
	
			if curStep == 928 then
	
				doTweenY('bfTweenY', 'boyfriend', 220, 1, 'cubeIn');
		
				end
	
				if curStep == 938 then
	
					doTweenY('bfTweenY', 'boyfriend', 700, 1, 'cubeIn');
			
					end

		if curStep == 1136 then

		doTweenY('dadTweenY', 'dad', 300, 1, 'cubeIn');

		end

		if curStep == 1200 then

			doTweenY('dadTweenY', 'dad', 1000, 1, 'cubeIn');
	
			end

		if curStep == 1264 then

			doTweenY('bfTweenY', 'boyfriend', 220, 1, 'cubeIn');
	
			end

			if curStep == 1326 then

				doTweenY('bfTweenY', 'boyfriend', 700, 1, 'cubeIn');
		
				end

				if curStep == 1408 then

					doTweenY('dadTweenY', 'dad', 300, 1, 'cubeIn');
			
					end
			
					if curStep == 1468 then
			
						doTweenY('dadTweenY', 'dad', 1000, 1, 'cubeIn');
				
						end
			
					if curStep == 1536 then
			
						doTweenY('bfTweenY', 'boyfriend', 220, 1, 'cubeIn');
				
						end
			
						if curStep == 1596 then
			
							doTweenY('bfTweenY', 'boyfriend', 700, 1, 'cubeIn');
					
							end

							if curStep == 1632 then

								doTweenY('dadTweenY', 'dad', 300, 1, 'cubeIn');
						
								end
						
								if curStep == 1656 then
						
									doTweenY('dadTweenY', 'dad', 1000, 1, 'cubeIn');
							
									end
						
								if curStep == 1696 then
						
									doTweenY('bfTweenY', 'boyfriend', 220, 1, 'cubeIn');
							
									end
						
									if curStep == 1724 then
						
										doTweenY('bfTweenY', 'boyfriend', 700, 1, 'cubeIn');
								
										end

										if curStep == 1760 then

											doTweenY('dadTweenY', 'dad', 300, 1, 'cubeIn');
									
											end
									
											if curStep == 1792 then
									
												doTweenY('bfTweenY', 'boyfriend', 220, 1, 'cubeIn');
										
												end
									
												if curStep == 1856 then
									
													doTweenY('bfTweenY', 'boyfriend', 700, 1, 'cubeIn');
											
													end

													if curStep == 1856 then
									
														doTweenY('dadTweenY', 'dad', 1000, 1, 'cubeIn');
												
														end

										if curStep == 1920 then

											doTweenY('dadTweenY', 'dad', 300, 1, 'cubeIn');
									
											end
									
											if curStep == 1920 then
									
												doTweenY('bfTweenY', 'boyfriend', 220, 1, 'cubeIn');
												
										
												end

												if curStep == 1984 then

												doTweenX('bfTweenX', 'boyfriend', 2000, 0.1, 'cubeIn');

												end




	if curStep == 264 then
      
		makeAnimatedLuaSprite('challengchic', 'challengchic', -600, 50);
		setLuaSpriteScrollFactor('challengchic', 1, 1);
		scaleObject('challengchic', 0.9, 0.9);
	
		addAnimationByPrefix('challengchic','challengchic','idle',24,true);

		addLuaSprite('challengchic', false);

   end

	if curStep == 998 then

	makeLuaText('Text',"I wanted to wait until JUST the right moment to drop in!",1000,140,550)
    setTextSize('Text',25)
	addLuaText("Text")

	end

		if curStep == 1056 then

			removeLuaText("Text")
		
			end

   if curStep == 912 then

	removeLuaSprite('presents', false);
	removeLuaSprite('table', false);
	removeLuaSprite('stars', false);

    makeLuaSprite('tmangstage', 'tmangstage', -500, -500);
	setLuaSpriteScrollFactor('tmangstage', 1, 1);
	scaleObject('tmangstage', 0.6, 0.6);

	addLuaSprite('tmangstage', false);

	setProperty('dad.y', 300);
	setProperty('dad.x', -200);
	setProperty('boyfriend.y', 200);
	setProperty('boyfriend.x', 1000);
	setProperty('gf.y', 90);
	setProperty('gf.x', 150);

	end

	if curStep == 1336 and not downscroll and not upscroll then
      
		makeAnimatedLuaSprite('Target', 'Target', 630, 40);
		setLuaSpriteScrollFactor('Target', 1, 1);
		scaleObject('Target', 0.7, 0.7);
		setObjectCamera('Target', 'hud')
		addAnimationByPrefix('Target','Target','Target',24,true);
	
		addLuaSprite('Target', true);
	
	end
	
	if curStep == 1336 and not middlescroll and not upscroll then
		  
		makeAnimatedLuaSprite('Target', 'Target', 950, 550);
		setLuaSpriteScrollFactor('Target', 1, 1);
		scaleObject('Target', 0.7, 0.7);
		setObjectCamera('Target', 'hud')
		addAnimationByPrefix('Target','Target','Target',24,true);
	
		addLuaSprite('Target', true);
	
	end
	
	if curStep == 1336 and not middlescroll and not downscroll then
		  
		makeAnimatedLuaSprite('Target', 'Target', 950, 40);
		setLuaSpriteScrollFactor('Target', 1, 1);
		scaleObject('Target', 0.7, 0.7);
		setObjectCamera('Target', 'hud')
		addAnimationByPrefix('Target','Target','Target',24,true);
	
		addLuaSprite('Target', true);
	
	end

   if curStep == 1344 then
      
	removeLuaSprite('Target', true);

end

if curStep == 1376 and not downscroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 630, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1376 and not middlescroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 550);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1376 and not middlescroll and not downscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1392 then
  
removeLuaSprite('Target', true);

end

if curStep == 1488 and not downscroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 630, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1488 and not middlescroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 550);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1488 and not middlescroll and not downscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1504 then
  
removeLuaSprite('Target', true);

end

if curStep == 1648 and not downscroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 630, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1648 and not middlescroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 550);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1648 and not middlescroll and not downscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1660 then
  
removeLuaSprite('Target', true);

end

if curStep == 1680 and not downscroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 630, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1680 and not middlescroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 550);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1680 and not middlescroll and not downscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1688 then
  
removeLuaSprite('Target', true);

end

if curStep == 1744 and not downscroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 630, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1744 and not middlescroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 550);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1744 and not middlescroll and not downscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1752 then
  
removeLuaSprite('Target', true);

end

if curStep == 1840 and not downscroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 630, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1840 and not middlescroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 550);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1840 and not middlescroll and not downscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1856 then
  
removeLuaSprite('Target', true);

end

if curStep == 1872 and not downscroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 630, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1872 and not middlescroll and not upscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 550);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1872 and not middlescroll and not downscroll then
      
	makeAnimatedLuaSprite('Target', 'Target', 950, 40);
	setLuaSpriteScrollFactor('Target', 1, 1);
	scaleObject('Target', 0.7, 0.7);
	setObjectCamera('Target', 'hud')
	addAnimationByPrefix('Target','Target','Target',24,true);

	addLuaSprite('Target', true);

end

if curStep == 1920 then
  
removeLuaSprite('Target', true);

end

	if curStep == 1984 then

		removeLuaSprite('tmangstage', false);
	
		makeLuaSprite('tmangstage2', 'tmangstage2', -500, -500);
		setLuaSpriteScrollFactor('tmangstage2', 1, 1);
		scaleObject('tmangstage2', 0.7, 0.7);
	
		addLuaSprite('tmangstage2', false);
		addLuaSprite('tmangstage2', false);
		addLuaSprite('tmangstage2', false);
		addLuaSprite('tmangstage2', false);
	
		end
end