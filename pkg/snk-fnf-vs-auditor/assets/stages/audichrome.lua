local scarelength = 0

function onCreate()
	-- playsound auditor imdead when we decide what to do for that lol
	makeLuaSprite('jumpscare','monochrome/audi_scare', -500, -350);
	precacheImage('jumpscare');

end

function onEvent(name, value1, value2)

	--screamer image is placed in the middle of the screen and lasts for however many steps value1 was equal to

	if name == 'screamer' then
        addLuaSprite('jumpscare', true)
		scaleObject('jumpscare', 0.6, 0.6)

        setProperty('camHUD.visible', false)
		scarelength = 0
        scarelength = scarelength + value1
	end

	--gruntdie event. value 1 moves the grunt up or down, and value 2 moves the grunt left to right.
	--they get nnamed based on the values so that no two duplicates are made. 

	if name == 'augh' then
		--debugPrint('gruntdie' .. value1 .. value2)
		
		makeAnimatedLuaSprite('gruntdie' .. value1 .. value2, 'monochrome/gruntdie', -50 + (value2 * 125), 200 - (value1 * 50))
		addAnimationByPrefix('gruntdie' .. value1 .. value2,'die','grunt', 24, false)

		addLuaSprite('gruntdie' .. value1 .. value2, false)
	end
end

function onStepHit()
	--this part is for the screamer event timer
	if scarelength >= 1 then
		-- debugPrint('length -1, ', scarelength)
		scarelength = scarelength - 1
		cameraShake(game, 0.02, 0.1)
			if scarelength == 0 then

				removeLuaSprite('jumpscare', false)
				setProperty('camHUD.visible', true)
			end
	end
	--lol
	-- every screamer is here
	-- value1 is length in steps screamer will last

	if curStep == 504 then
		triggerEvent('screamer',8,0);
	end

	if curStep == 952 then
		triggerEvent('screamer',8,0);
	end

	if curStep == 964 then
		triggerEvent('screamer',4,0);
	end

	if curStep == 972 then
		triggerEvent('screamer',4,0);
	end

	if curStep == 980 then
		triggerEvent('screamer',4,0);
	end

	if curStep == 1116 then
		triggerEvent('screamer',4,0);
	end

	if curStep == 1144 then
		triggerEvent('screamer',8,0);
	end

	if curStep == 1208 then
		triggerEvent('screamer',8,0);
	end

	if curStep == 1536 then
		triggerEvent('screamer',16,0);
	end

	if curStep == 1568 then 
		triggerEvent('Play Animation', 'fadeOut', 'Dad');
		doTweenAlpha('hudalphaend', 'camHUD', 0, 0.5, 'linear');	
	end

	-- every gruntdie is below here

	-- gruntdie anim starts 10 steps before he gets shot. epic animator guy natetdom made it that way. 
	-- so if you're looking for a specific one you have to subtract 10 from the step you hear the death sound and then look for that one

	-- the commented group below is a group that i was using for testing. 

	-- if curStep == 128 then
	-- 	triggerEvent('augh',6,0);
	-- end
	-- --
	-- if curStep == 130 then
	-- 	triggerEvent('augh',2,0);
	-- end
	-- --
	-- if curStep == 132 then
	-- 	triggerEvent('augh',-2,0);
	-- end
	-- --
	-- if curStep == 134 then
	-- 	triggerEvent('augh',-6,0);
	-- end
	-- --
	-- if curStep == 136 then
	-- 	triggerEvent('augh',6,1);
	-- end
	-- --
	-- if curStep == 138 then
	-- 	triggerEvent('augh',2,1);
	-- end
	-- --
	-- if curStep == 140 then
	-- 	triggerEvent('augh',-2,1);
	-- end
	-- --
	-- if curStep == 142 then
	-- 	triggerEvent('augh',-6,1);
	-- end
	-- --
	-- if curStep == 144 then
	-- 	triggerEvent('augh',6,-1);
	-- end
	-- --
	-- if curStep == 146 then
	-- 	triggerEvent('augh',2,-1);
	-- end
	-- --
	-- if curStep == 148 then
	-- 	triggerEvent('augh',-2,-1);
	-- end
	-- --
	-- if curStep == 150 then
	-- 	triggerEvent('augh',-6,-1);
	-- end

	if curStep == 370 then
		triggerEvent('augh',0,0);
	end

	if curStep == 506 then
		triggerEvent('augh',3,0);
	end

	if curStep == 522 then
		triggerEvent('augh',-2,0);
	end

	if curStep == 562 then
		triggerEvent('augh',3,0);
	end

	if curStep == 570 then
		triggerEvent('augh',-2,0);
	end

	if curStep == 586 then
		triggerEvent('augh',3,0);
	end

	if curStep == 626 then
		triggerEvent('augh',-1,0);
	end

	if curStep == 658 then
		triggerEvent('augh',-2,0);
	end

	if curStep == 722 then
		triggerEvent('augh',-1,0);
	end

	if curStep == 754 then
		triggerEvent('augh',4,0);
	end

	if curStep == 858 then
		triggerEvent('augh',-3,0);
	end

	if curStep == 866 then
		triggerEvent('augh',3,0);
	end

	if curStep == 890 then
		triggerEvent('augh',-6,1);
	end

	if curStep == 898 then
		triggerEvent('augh',-2,-1);
	end

	if curStep == 906 then
		triggerEvent('augh',2,1);
	end

	if curStep == 914 then
		triggerEvent('augh',6,-1);
	end

	if curStep == 950 then
		triggerEvent('augh',6,1);
	end

	if curStep == 958 then
		triggerEvent('augh',2,-1);
	end

	if curStep == 966 then
		triggerEvent('augh',-2,1);
	end

	if curStep == 974 then
		triggerEvent('augh',-6,-1);
	end

	if curStep == 1014 then
		triggerEvent('augh',-2,0);
	end

	if curStep == 1046 then
		triggerEvent('augh',-2,0);
	end

	if curStep == 1130 then
		triggerEvent('augh',0,0);
	end

	if curStep == 1158 then
		triggerEvent('augh',-4,1);
	end

	if curStep == 1162 then
		triggerEvent('augh',-4,-1);
	end

	if curStep == 1166 then
		triggerEvent('augh',4,1);
	end

	if curStep == 1170 then
		triggerEvent('augh',4,-1);
	end

	if curStep == 1210 then
		triggerEvent('augh',-6,0);
	end

	if curStep == 1218 then
		triggerEvent('augh',-2,0);
	end
	
	if curStep == 1226 then
		triggerEvent('augh',2,0);
	end

	if curStep == 1234 then
		triggerEvent('augh',6,0);
	end

	if curStep == 1254 then
		triggerEvent('augh',-6,-1);
	end

	if curStep == 1258 then
		triggerEvent('augh',-6,1);
	end

	if curStep == 1262 then
		triggerEvent('augh',-2,-1);
	end

	if curStep == 1264 then
		triggerEvent('augh',-2,1);
	end

	if curStep == 1266 then
		triggerEvent('augh',3,1);
	end

	if curStep == 1267 then
		triggerEvent('augh',3,-1);
	end

	if curStep == 1268 then
		triggerEvent('augh',7,1);
	end

	if curStep == 1269 then
		triggerEvent('augh',7,-1);
	end

end