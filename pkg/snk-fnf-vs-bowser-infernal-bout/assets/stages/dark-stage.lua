function onCreate()
	-- background shit

	-3000 = -3000;
	0 = 0;
	-7000 = -7000;
	1008 = 1008;
	1792 = 1792;
	is1008 = false;
	fawful = false;

	makeLuaSprite('Background', 'stages/dark-stage/Background', -1000, -400);
	makeAnimatedLuaSprite('back_tornado', 'stages/dark-stage/tornado/back_tornado', 100, -300);
	addAnimationByPrefix('back_tornado','morbius','back_tornado idle',15,true);
	scaleObject("back_tornado", 2, 2);
	makeLuaSprite('floor', 'stages/dark-stage/floor', 0, 0);
	makeLuaSprite('Foreground', 'stages/dark-stage/Foreground', 180, 0);
	makeAnimatedLuaSprite('front_tornado', 'stages/dark-stage/tornado/front_tornado', 0, -150);
	addAnimationByPrefix('front_tornado','morbius','front_tornado idle',15,true);
	scaleObject("front_tornado", 2, 2)

	
	makeLuaSprite('punchbg', 'stages/dark-stage/punch_bg', 600, 150);
	makeAnimatedLuaSprite('punchfx','stages/dark-stage/punch', 300, 0);
	addAnimationByPrefix('punchfx','hit','punch idle',15,false);
	makeAnimatedLuaSprite('trocket','stages/dark-stage/team_rocket', 1400, -200);
	addAnimationByPrefix('trocket','ding','team_rocket idle',15,false);

	setScrollFactor('punchfx', 1, 1);
	setScrollFactor('punchbg', 1, 1);
	setScrollFactor('trocket', 1, 1);


	addLuaSprite('Background', false);
	addLuaSprite('back_tornado', false);
	objectPlayAnimation('back_tornado','morbius',false);
	addLuaSprite('floor', false);
	addLuaSprite('Foreground', false);
	addLuaSprite('front_tornado', true);
	objectPlayAnimation('front_tornado','morbius',false);
	setProperty('back_tornado.visible', false);
	setProperty('front_tornado.visible', false);
	

	setScrollFactor("Background", 0.0, 0.0);
	setScrollFactor("floor", 1, 1);
	setScrollFactor("Foreground", 1.2, 1.2);
	setScrollFactor("punchbg", 1, 1);

	makeLuaSprite('InsideBackground', 'stages/inside/Background', 0, -3000);
	makeLuaSprite('InsideLayer1', 'stages/inside/Layer 1', -500, -3000 + -300);
	makeLuaSprite('InsideLayer2', 'stages/inside/Layer 2', -200, -3000 + -310);
	makeLuaSprite('InsideFloor', 'stages/inside/floor', 0, -3000);
	makeLuaSprite('InsideForeground', 'stages/inside/Foreground', 0, -3000);

	makeLuaSprite('InsideOverlay', 'stages/inside/Overlayinside', 0, 0);
	scaleObject("InsideOverlay", 0.7, 0.7);
	setBlendMode("InsideOverlay", "ADD");
	
	makeLuaSprite('Black', 'stages/inside/Black', -800, -400);
	makeLuaSprite('BlackBack', 'stages/inside/Black', -800, -400);

	addLuaSprite('Black', true);
	setScrollFactor("Black", 0, 0);

	addLuaSprite('BlackBack', false);
	setScrollFactor("BlackBack", 0, 0);

	makeAnimatedLuaSprite('bowowpopup', 'stages/dark-stage/snoozetime', 0, 0);
	addAnimationByPrefix('bowowpopup','persona 5','snoozetime idle',15,false);
	scaleObject("bowowpopup", 0.6, 0.6);
	addLuaSprite('bowowpopup', true);
	setObjectCamera('bowowpopup', 'other');
	setProperty('bowowpopup.alpha', 0);
end

function onUpdate()

	if curStep == 0 then
		doTweenAlpha('InitBlackFadeOut', 'Black', 0, 0.2, 'linear');
		doTweenAlpha('InitBlackBackFadeOut', 'BlackBack', 0, 0.2, 'linear');
		fawful = false;
	end

	if curStep > 1008 and curStep < 1151 then
		if getProperty('health') < 0.1 then
			setProperty('health', 0.1)
		end
	end


	if curStep == 352 then
		doTweenAlpha('BackBlackShowtimeIn', 'BlackBack', 0.5, 0.2, 'linear');
		setProperty('bowowpopup.alpha', 1)
		objectPlayAnimation('bowowpopup','persona 5', true)
		doTweenAlpha("nuhuhhud", "camHUD", 0, 0.3, "linear")
	end

	if curStep == 358 then
		doTweenAlpha("nuhuhhud", "camHUD", 0.5, 0.2, "linear")
	end

	if curStep == 368 then
		doTweenAlpha("actuallyyeahhud", "camHUD", 1, 0.1, "linear")
		doTweenAlpha('BackBlackShowtimeOut', 'BlackBack', 0, 0.2, 'linear');
		cameraFlash("game", "FFFFFF", 0.5, true)
		setProperty('bowowpopup.alpha', 0)
	end



	if curStep == 1136 then
		doTweenAlpha('BlackOkieDokieIn', 'Black', 1, 0.01, 'linear');
	end

	if curStep == 1152 then
		doTweenAlpha('BlackOkieDokieOut', 'Black', 0, 0.01, 'linear');
	end




	if curStep == 1008 then

		fawful = true;

		triggerEvent("Camera Follow Pos", 1500, -2230)

		cameraFlash("game", "FFFFFF", 1, true)

		--doTweenAlpha("hudFunne", "camHUD", 0, 0.3, "linear")
		setProperty('healthBar.alpha', 0);
		setProperty('iconP1.alpha', 0);
		setProperty('iconP2.alpha', 0);
		setProperty('castleP1.alpha', 0);
		setProperty('castleP2.alpha', 0);
		setProperty('scoreTxt.alpha', 0);
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
		end

		if difficulty == 1 then
			for i = 4,7 do
				setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
			end
		end

		if difficulty == 0 then
			for i = 4,7 do
				setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
			end
		end

		addLuaSprite('InsideBackground', false);
		addLuaSprite('InsideLayer1', false);
		addLuaSprite('InsideLayer2', false);
		addLuaSprite('InsideFloor', false);
		addLuaSprite('InsideForeground', false);

		addLuaSprite('Black', true);
		doTweenAlpha('BlackFadeOut', 'Black', 1, 0.01, 'linear')

		setScrollFactor("InsideLayer1", 0.6, 0.6);
		setScrollFactor("InsideLayer2", 0.8, 0.8);
		setScrollFactor("InsideFloor", 1, 1);

	end

	if curStep == 1071 then

		doTweenY('camFollowY', 'camFollow', 400.0, 5, 'linear')
		doTweenAlpha('BlackFadeOut', 'Black', 0, 6, 'linear')
	
	end

	if curStep == 1151 then
		--1151
		triggerEvent("Camera Follow Pos", "", "");
		cameraFlash("game", "FFFFFF", 1, true);
		setProperty('healthBar.alpha', 1);
		setProperty('iconP1.alpha', 1);
		setProperty('iconP2.alpha', 1);
		setProperty('castleP1.alpha', 1);
		setProperty('castleP2.alpha', 1);
		setProperty('scoreTxt.alpha', 1);
		for i = 0,3 do
			setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
		end

		if difficulty == 1 then
			for i = 4,7 do
				setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
			end
		end

		if difficulty == 0 then
			for i = 4,7 do
				setPropertyFromGroup('strumLineNotes', i, 'alpha', 1)
			end
		end

		Pulsing = true
		--doTweenAlpha("hudFunne", "camHUD", 1, 0.3, "linear")
		addLuaSprite('InsideOverlay', true);
		setObjectCamera("InsideOverlay", "hud");
		
	end

	if curStep == 2380 then
		doTweenAlpha("backhud", "camHUD", 1, 0.5, "linear")
	end

	if curStep == 1792 then

		fawful = false;

		cameraFlash("game", "FFFFFF", 1, true)

		removeLuaSprite("InsideBackground", true)
		removeLuaSprite("InsideLayer1", true)
		removeLuaSprite("InsideLayer2", true)
		removeLuaSprite("InsideFloor", true)
		removeLuaSprite("InsideForeground", true)
		removeLuaSprite("InsideOverlay", true)
		setProperty('back_tornado.visible', true)
		setProperty('front_tornado.visible', true)

	end

	if curStep == 2287 then
		doTweenAlpha("hudFunne", "camHUD", 0, 0.5, "linear")
		triggerEvent("Camera Follow Pos", "1600", "600");
		doTweenAlpha('BackBlackShowtimeIn', 'BlackBack', 0.5, 0.2, 'linear');
	end


	if curStep == 2332 then
			doTweenX("Bowserslide", "boyfriend", 650, 0.2, "linear" )
			doTweenAlpha('BackBlackShowtimeIn', 'BlackBack', 0, 0.2, 'linear');
	end

	if curStep == 2336 then
			cameraFlash("game", "FFFFFF", 1, true)
			addLuaSprite('punchbg', false);
			addLuaSprite('punchfx', true);
			objectPlayAnimation('punchfx','hit',false)
			triggerEvent("Camera Follow Pos", "2100", "800");
			doTweenX("Bowserhit", "boyfriend", 700, 0.5, "linear" )
			setProperty('back_tornado.visible', false)
			setProperty('front_tornado.visible', false)
	end

	if curStep == 2344 then
			doTweenAlpha("punchbyebye", "punchbg", 0, 0.5, "linear" )
			doTweenX("Bowserslide", "boyfriend", 750, 0.1, "linear" )
			doTweenX("darkfastbowserflyx", "dad", 3000, 0.1, "linear" )
			doTweenY("darkbowserfastflyy", "dad", -900, 0.1, "linear" )
	end

	if curStep == 2368 then
		addLuaSprite('trocket', true);
		objectPlayAnimation('trocket','ding',false)
	end

	function onBeatHit()

			doTweenAlpha('pulseIn', 'InsideOverlay', 0.8,  0.05, 'linear')

			if curBeat % 2 == 0 then

				doTweenAlpha('pulseIn', 'InsideOverlay', 0.5,  0.5, 'linear')

			end
	end	
		
end


function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)

    if fawful == false then

		if noteData == 1 then
        	triggerEvent('Screen Shake', '0.05, 0.005', '0, 0')
		end

    end

	if fawful == true then
		triggerEvent("Screen Shake", "0.05, 0.005", "0, 0")
	end

end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)

    if fawful == false then

		if noteData == 1 then
        	triggerEvent('Screen Shake', '0.05, 0.005', '0, 0')
		end

    end

end