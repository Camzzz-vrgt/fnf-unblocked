function onCreate()
makeAnimatedLuaSprite('Asbel', 'erectBG/ERECT_OMORI_STAGE_ASSETS', -100, 20);
    scaleObject('Asbel', 1.1, 1.1)
    addAnimationByPrefix('Asbel', 'idle', 'A-Background' , 24, true)

makeAnimatedLuaSprite('AAsbel', 'erectBG/ERECT_OMORI_STAGE_ASSETS', -100, 20);
    scaleObject('AAsbel', 1.1, 1.1)
    addAnimationByPrefix('AAsbel', 'idle', 'B-Doors' , 24, true)

makeAnimatedLuaSprite('Asbeel', 'erectBG/ERECT_OMORI_STAGE_ASSETS', -100, 20);
    scaleObject('Asbeel', 1.1, 1.1)
    addAnimationByPrefix('Asbeel', 'idle', 'C-Stage' , 24, true)

makeAnimatedLuaSprite('AAsbeel', 'erectBG/ERECT_OMORI_STAGE_ASSETS', -100, 20);
    scaleObject('AAsbeel', 1.1, 1.1)
    addAnimationByPrefix('AAsbeel', 'idle', 'D-Curtains' , 24, true)

makeAnimatedLuaSprite('eldiablo', 'erectBG/ERECT_OMORI_STAGE_ASSETS', -100, 20);
    scaleObject('eldiablo', 1.1, 1.1)
    addAnimationByPrefix('eldiablo', 'idle', 'E-Overlay' , 24, true)

     addLuaSprite('Asbel', false);
     addLuaSprite('AAsbel', false);
	addLuaSprite('Asbeel', false);
	addLuaSprite('AAsbeel', false);
	addLuaSprite('eldiablo', false);
	makeLuaSprite('cineUwU', 'movieBars', 0, 0);
	addLuaSprite('cineUwU', true);
    setObjectCamera('cineUwU','hud')	
   
makeAnimatedLuaSprite('sans', 'ERECT_Bad_Apple', 800, 350);
    scaleObject('sans', 0.8, 0.8)
    addAnimationByPrefix('sans', 'idle', 'A-Fall' , 24, true)
setProperty('sans.visible', false);
end
function onCreatePost()
    setObjectOrder('sans', 6)
end

function onStepHit()
if curStep == 1160 then
setProperty('sans.visible', true);
setProperty('gf.visible', false);
end
if curStep == 1424 then
setProperty('sans.visible', false);
setProperty('gf.visible', true);
end
end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == '2' then
			setProperty('gf.visible', false);
			setProperty('sans.visible', true);
		end
	
		if value1 == '1' then
			setProperty('stageback.visible', true);
			setProperty('stageback2.visible', false);
			setProperty('stageback3.visible', false);
			setProperty('stageback4.visible', false);
		end
	end
end
