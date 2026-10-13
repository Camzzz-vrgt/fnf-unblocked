local zoom1 = 0.035
local zoom2 = 0.045
function onCreate()
	--startVideo('intro')



	makeLuaSprite('black','black')
	makeGraphic('black',2000,2000,'000000')
	setObjectCamera('black','other')
	addLuaSprite('black',true)


	setProperty('camHUD.alpha', 0)
end


function onUpdate()
if curStep < 310 then
if mustHitSection == false then
setProperty("defaultCamZoom", 1.0)
else
setProperty("defaultCamZoom", 0.8)
end
end
if curStep > 310 and curStep < 580 then
if mustHitSection == false then
setProperty("defaultCamZoom", 0.4)
else
setProperty("defaultCamZoom", 0.8)
end
end
if curStep > 580 and curStep < 1102 then
if mustHitSection == false then
 setProperty("defaultCamZoom", 0.6)
else
  setProperty("defaultCamZoom", 1.2)
end
end
if curStep > 1103 and curStep < 2384 then
	if mustHitSection == false then
	setProperty("defaultCamZoom", 0.4)
	else
	setProperty("defaultCamZoom", 0.8)
	end
  end

	



if curStep == 30 then
		doTweenAlpha('1','black',0,1)
		doTweenAlpha('2','camHUD',1,1)
		setProperty('camHUD.zoom',0.8)
		doTweenZoom('3','camHUD',1,1,'quadInOut')
	end
	
	if curStep == 576 then
doTweenZoom('camm', 'camGame', 7 , 1, 'quintOut');
doTweenAlpha('boyfriend', 'boyfriend', 0, 1, 'circOut');
end
	
if curStep == 592 then
doTweenAlpha('boyfriend', 'boyfriend', 1, 1, 'circOut');
end

  if curStep == 2384 then
	setProperty("defaultCamZoom", 0.7)
	end
	if curStep == 576 then
		noteTweenX("x5", 4, 410, 0.6, "quartInOut");
		noteTweenAngle("r5", 4, 360, 0.6, "quartInOut");
		noteTweenAlpha("o5", 4, 1, 0.6,"quartInOut");
		noteTweenX("x6", 5, 522, 0.6, "quartInOut");
		noteTweenAngle("r6", 5, 360, 0.6, "quartInOut");
		noteTweenAlpha("o6", 5, 1, 0.6, "quartInOut");
		noteTweenX("x7", 6, 633, 0.6, "quartInOut");
		noteTweenAngle("r7", 6, 360, 0.6, "quartInOut");
		noteTweenAlpha("o7", 6, 1, 0.6, "quartInOut");
		noteTweenX("x8", 7, 745, 0.6, "quartInOut");
		noteTweenAngle("r8", 7, 360, 0.6, "quartInOut");
		noteTweenAlpha("o8", 7, 1, 0.6, "quartInOut");



		noteTweenAlpha("o1", 0, 0, 0.6);
		noteTweenAlpha("o2", 1, 0, 0.6);
		noteTweenAlpha("o3", 2, 0, 0.6);
		noteTweenAlpha("o4", 3, 0, 0.6);

	end
	if curStep == 1072 then

		 noteTweenX("backx5", 4, 740, 0.6, "quartInOut");
		 noteTweenAngle("backr5", 4, -360, 0.6, "quartInOut");
		 noteTweenAlpha("backo5", 4, 1, 0.6,"quartInOut");

		 noteTweenX("backx6", 5, 852, 0.6, "quartInOut");
		 noteTweenAngle("backr6", 5, -360, 0.6, "quartInOut");
		 noteTweenAlpha("backo6", 5, 1, 0.6, "quartInOut");

		 noteTweenX("backx7", 6, 963, 0.6, "quartInOut");
		 noteTweenAngle("backr7", 6, -360, 0.6, "quartInOut");
		 noteTweenAlpha("backo7", 6, 1, 0.6, "quartInOut");

		 noteTweenX("backx8", 7, 1075, 0.6, "quartInOut");
		 noteTweenAngle("backr8", 7, -360, 0.6, "quartInOut");
		 noteTweenAlpha("backo8", 7, 1, 0.6, "quartInOut");


		noteTweenAlpha("o1", 0, 1, 0.6);
		noteTweenAlpha("o2", 1, 1, 0.6);
		noteTweenAlpha("o3", 2, 1, 0.6);
		noteTweenAlpha("o4", 3, 1, 0.6);

	end
	if curStep ==2384 then
		noteTweenX("x5", 4, 410, 0.6, "quartInOut");
		noteTweenAngle("r5", 4, 360, 0.6, "quartInOut");
		noteTweenAlpha("o5", 4, 1, 0.6,"quartInOut");

		noteTweenX("x6", 5, 522, 0.6, "quartInOut");
		noteTweenAngle("r6", 5, 360, 0.6, "quartInOut");
		noteTweenAlpha("o6", 5, 1, 0.6, "quartInOut");

		noteTweenX("x7", 6, 633, 0.6, "quartInOut");
		noteTweenAngle("r7", 6, 360, 0.6, "quartInOut");
		noteTweenAlpha("o7", 6, 1, 0.6, "quartInOut");

		noteTweenX("x8", 7, 745, 0.6, "quartInOut");
		noteTweenAngle("r8", 7, 360, 0.6, "quartInOut");
		noteTweenAlpha("o8", 7, 1, 0.6, "quartInOut");



		noteTweenAlpha("o1", 0, 0, 0.6);
		noteTweenAlpha("o2", 1, 0, 0.6);
		noteTweenAlpha("o3", 2, 0, 0.6);
		noteTweenAlpha("o4", 3, 0, 0.6);
	end
	if curStep == 4208 then
		
		noteTweenAlpha("o1", 0, 0, 2.6);
		noteTweenAlpha("o2", 1, 0, 2.6);
		noteTweenAlpha("o3", 2, 0, 2.6);
		noteTweenAlpha("o4", 3, 0, 2.6);
		
		noteTweenAlpha("o5", 4, 0, 2.6);
		noteTweenAlpha("o6", 5, 0, 2.6);
		noteTweenAlpha("o7", 6, 0, 2.6);
		noteTweenAlpha("o8", 7, 0, 2.6);
	end
end

function onBeatHit()
	if (curBeat % 4 == 0 ) then
	if curBeat >= 40 and curBeat < 999 then
		triggerEvent('Add Camera Zoom', zoom1,zoom2);
	    end
    end
end

function opponentNoteHit(id,data,type,sus)
if curStep > 848 then
triggerEvent('Screen Shake','0.1,0.007','0.1,0.007')
end
end