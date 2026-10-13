function onCreate()
    precacheImage('bbappear');
	precacheImage('tcstage2');
end

function onStepHit()

	if curStep == 860 then
	makeAnimatedLuaSprite('bbappear','bbappear', 400, 100);
	addAnimationByPrefix('bbappear','bbappear','idle',24,true);
	addLuaSprite('bbappear', false);

	end

	if curStep == 896 then
	 removeLuaSprite('tcstage1', false);
	 removeLuaSprite('wire', false);
	 removeLuaSprite('bbappear', false);
 
	 makeLuaSprite('tcstage2', 'tcstage2', -800, -1000);
	 setLuaSpriteScrollFactor('tcstage2', 1, 1);
	 scaleObject('tcstage2', 0.8, 0.8);
 
 
	 addLuaSprite('tcstage2', false);
 
	 close(true);
 
	 end
 
	 if curStep == 1488 then
 
		 makeLuaText('Text',"You won't get tired of my voice...",1000,140,550)
		 setTextSize('Text',25)
		 addLuaText("Text")
	 
		 end
	 
		 if curStep == 1500 then
	 
			 removeLuaText("Text")
			 makeLuaText('Text2',"Will you ?",1000,140,550)
			 setTextSize('Text2',25)
			 addLuaText("Text2")
		 
			 end
	 
			 if curStep == 1504 then
	 
				 removeLuaText("Text2")
			 
				 end
 end