
function onCreate()
	
	--BARN BACKGROUND FILES
	makeLuaSprite('floor', 'barn/floor', 100, -20);
	setLuaSpriteScrollFactor('floor', 1, 1);
	
	makeLuaSprite('fence', 'barn/fence', 20, 350);
	setLuaSpriteScrollFactor('fence', 1, 1);

	makeLuaSprite('sky', 'barn/sky', 150, -200);
	setLuaSpriteScrollFactor('sky', 1, 1);

	makeAnimatedLuaSprite('sheep0', 'barn/sheep', 100, 500)
	addAnimationByPrefix('sheep0', 'sheep', 'sheep',24,true)




	makeLuaSprite('pig', 'barn/pig_lol', 0, 0);

	--FUNNY TEXT 0 PUSSY
	makeAnimatedLuaSprite('pussy', 'kitchen/funny0', 90, 100)
	addAnimationByPrefix('pussy', 'pussy', 'pussy',24,true)
	doTweenAlpha('appear', 'pussy', 0, 1, 'lineal')

	--FUNNY TEXT 1 KNIFW
	makeAnimatedLuaSprite('knife', 'kitchen/funny1', 90, 100)
	addAnimationByPrefix('knife', 'knifw', 'knifw',24,true)
	doTweenAlpha('knife', 'pussy', 0, 1, 'lineal')

	--FUNNY TEXT 2 KNIFE
	makeAnimatedLuaSprite('knife1', 'kitchen/knife', 90, 100)
	addAnimationByPrefix('knife1', 'knife', 'knife',24,true)
	doTweenAlpha('knife1', 'pussy', 0, 1, 'lineal')

	--STATIC
	makeAnimatedLuaSprite('static', 'kitchen/static', 90, 100)
	addAnimationByPrefix('static', 'static', 'static',24,true)


	--CURSORS


	makeAnimatedLuaSprite('cursor0', 'cursor0', 300, 480)
	addAnimationByPrefix('cursor0','cursor', 'cursor',16, true);
	setLuaSpriteScrollFactor('cursor0', 0, 0);




	setLuaSpriteScrollFactor('pig', 0, 0);
	setLuaSpriteScrollFactor('pussy', 0, 0);
	setLuaSpriteScrollFactor('knife', 0, 0);
	setLuaSpriteScrollFactor('knife1', 0, 0);


end





function onUpdate(elapsed)
	
	noteTweenX("NoteMove5", 4, 410, 0.5, cubeInOut)
    noteTweenX("NoteMove6", 5, 520, 0.5, cubeInOut)
    noteTweenX("NoteMove7", 6, 630, 0.5, cubeInOut)
    noteTweenX("NoteMove8", 7, 740, 0.5, cubeInOut)

	noteTweenX("NoteMove1", 0, -1000, 0.1, cubeInOut)
	noteTweenX("NoteMove2", 1, -1000, 0.1, cubeInOut)
	noteTweenX("NoteMove3", 2, -1000, 0.1, cubeInOut)
	noteTweenX("NoteMove4", 3, -1000, 0.1, cubeInOut)

		--IMAGENES
	if curStep == 2208 then
    addLuaSprite('pig', true);
	setObjectCamera('pig', 'other')
	scaleObject('pig', 0.7 , 0.7)
	end
	if curStep == 2213 then
    removeLuaSprite('pig', false);
	end


	--CURSOR DE MIERDA APARECE
	if curStep == 2213 then
	addLuaSprite('cursor0', true)
	setObjectCamera('cursor0', 'other')
	scaleObject('cursor0', 1.6 , 1.6)
	doTweenX('movecursorX', 'cursor0', 860, 1, 'cubeInOut')
	end


	if curStep == 2212 then
		if getPropertyFromClass('ClientPrefs', 'downScroll')==true then
		doTweenY('moveY2', 'cursor0', 2000, 1.5, 'lineal')
		end

		if getPropertyFromClass('ClientPrefs', 'downScroll')==false then
		doTweenY('moveY', 'cursor0', 60, 1.5, 'lineal')
		end
	end

	

	if curStep == 2242 then
	doTweenX('movecursorX', 'cursor0', 100000, 5, 'cubeInOut')
	end
	if curStep == 2242 then
	doTweenY('moveY', 'cursor0', -600, 1.5, 'lineal')
	end

	if curStep == 2242 then
	noteTweenAngle(0, 4, 90, 2, 'cubeOut')
	noteTweenAngle(1, 5, 90, 2, 'cubeOut')
	noteTweenAngle(2, 6, 90, 2, 'cubeOut')
	noteTweenAngle(3, 7, 90, 2, 'cubeOut')
	end


	--BACKGROUND CHANGE!!!
	if curStep == 928 then
	addLuaSprite('sky', false)
	addLuaSprite('floor', false)
	addLuaSprite('sheep0', false)
	addLuaSprite('fence', false)
	cameraFlash('camGame', 'ff0000', 1,false)
	end

	if curStep == 1952 then
	cameraFlash('camGame', 'ff0000', 1,false)
	end






	--INVISIBLE HUD INTRO
	if curStep == 1 then
	doTweenAlpha('intro', 'camHUD', 0, 0.5, 'lineal')
	end
	if curStep == 160 then
	doTweenAlpha('intro', 'camHUD', 1, 0.5, 'lineal')
	end

	--INVISIBLE HUD ROTS
	if curStep == 1440 then
	doTweenAlpha('intro', 'camHUD', 0, 0.5, 'lineal')
	end
	if curStep == 1696 then
	doTweenAlpha('intro', 'camHUD', 1, 0.5, 'lineal')
	end

	--EVENTOS
	if curStep == 719 then
	addLuaSprite('pussy',true)
	doTweenAlpha('appear', 'pussy', 10, 1, 'lineal')
	end
	if curStep == 738 then
	doTweenAlpha('disappear', 'pussy', 0, 1, 'lineal')
	end


	if curStep == 782 then
	addLuaSprite('knife',true)
	doTweenAlpha('appear', 'knife', 10, 1, 'lineal')
	end
	if curStep == 802 then
	doTweenAlpha('disappear', 'knife', 0, 1, 'lineal')
	end

	if curStep == 848 then
	addLuaSprite('static',true)
	addLuaSprite('knife1',true)
	scaleObject('static', 4, 4)

	doTweenAlpha('appear', 'knife1', 10, 1, 'lineal')
	end
	if curStep == 864 then
	removeLuaSprite('static',true)
	doTweenAlpha('disappear', 'knife1', 0, 1, 'lineal')
	end
	

	if curStep == 2720 then
	cameraFade('camHUD', '000000',0,true);
	cameraFade('camGame', '000000',0,true);
	end


	if curStep == 2832 then
	cameraFade('camHUD', '000000',0,true);
	cameraFade('camGame', '000000',0,true);
	end




	







end


function onBeatHit( )
		objectPlayAnimation('kitchen','kitchen',false)
		objectPlayAnimation('sheep','sheep',false)
end



