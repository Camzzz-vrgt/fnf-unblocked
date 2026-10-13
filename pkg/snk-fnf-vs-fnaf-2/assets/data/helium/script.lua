function onCreate()
    precacheImage('theballoon');
	precacheImage('theballoon2');
	precacheImage('theballoon3');
	precacheImage('theballoon4');
	precacheImage('jj');
	precacheImage('jjhead');
	precacheImage('sign');
end


function onStepHit()


	if curStep == 378 then
      makeAnimatedLuaSprite('jj', 'jj', 150, 200);
      scaleObject('jj', 0.9, 0.9);

      addLuaSprite('jj', false);

	  addAnimationByPrefix('jj','jj','idle',24,true);

   end

	if curStep == 656 then

	removeLuaSprite('jj', false);

	end

	if curStep == 1164 then
		makeAnimatedLuaSprite('jj', 'jj', 150, 200);
		scaleObject('jj', 0.9, 0.9);
  
		addLuaSprite('jj', false);
  
		addAnimationByPrefix('jj','jj','idle',24,true);


	end
end
