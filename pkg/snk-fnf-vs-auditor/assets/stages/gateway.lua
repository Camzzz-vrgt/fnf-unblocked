local bigaudishit = 0

local fullchains = {112, 121, 162, 210, 226, 242, 714, 876, 966, 1356, 1404, 1452, 1676, 1802, 1948, 1955};
local halfchains = {302, 370, 737, 761, 786, 1020, 1068, 1476, 1500, 1524, 1740, 1772, 1858, 1886, 1914, 1930}

local oppx = -364.5;
local oppy = 249.5;
local camoffs = 140;
local followchars = false;

function onCreate()

	-- background shit

	makeLuaSprite('light', 'gateway/bglight', -2700, 2000);
	addLuaSprite('light', false);
	scaleObject('light', 1.7, 1.7);
	setScrollFactor('rocks', 0.7, 0.7);

	makeLuaSprite('beam2', 'gateway/beam2', -4000, -1900);
	addLuaSprite('beam2', false);
	scaleObject('beam2', 2.6, 2.6);
	setScrollFactor('beam2', 0.7, 0.7);

	makeAnimatedLuaSprite('trail1', 'gateway/trail', 1100, -1500);
	addAnimationByPrefix('trail1', 'idle', 'trail', 24, true)
	addLuaSprite('trail1', false);
	scaleObject('trail1', 1.7, 1.7);
	setProperty('trail1.alpha', 0);

	makeAnimatedLuaSprite('trail2', 'gateway/trail', -2650, -1500);
	addAnimationByPrefix('trail2', 'idle', 'trail', 24, true)
	addLuaSprite('trail2', false);
	scaleObject('trail2', -1.7, 1.7);
	setProperty('trail2.alpha', 0);

	makeLuaSprite('rocks', 'gateway/rocks', -1350, -650);
	addLuaSprite('rocks', false);
	scaleObject('rocks', 1.7, 1.7);
	setScrollFactor('rocks', 0.8, 0.8);

	makeAnimatedLuaSprite('hanford', 'gateway/hanford', 1200, 0);
	addAnimationByPrefix('hanford', 'idle', 'hank_sanford', 24, true)
	addLuaSprite('hanford', false);
	setScrollFactor('hanford', 0.875, 0.875);
	scaleObject('hanford', 1.7, 1.7);

	makeLuaSprite('stage', 'gateway/gatewaybg', -3500, -575);
	addLuaSprite('stage', false);
	scaleObject('stage', 1.7, 1.7);

	makeLuaSprite('rails', 'gateway/rails', -1210, 575);
	addLuaSprite('rails', true);
	scaleObject('rails', 1.7, 1.7);

	makeLuaSprite('black', 'gateway/black', 0, 0);
	setObjectCamera('black', 'camOther');
	addLuaSprite('black', true);
	setProperty('black.alpha', 0);

	makeLuaSprite('blackvg', 'supremacy/blackvg', 0, 0);
	setObjectCamera('blackvg', 'camOther');
	addLuaSprite('blackvg', true);
	setProperty('blackvg.alpha', 0);

	--caching shit so the game doesnt explode like normandy

	addCharacterToList('bigaudiidle', 'dad')
	addCharacterToList('bigaudileft', 'dad')
	addCharacterToList('bigaudiup', 'dad')
	addCharacterToList('bigaudidown', 'dad')
	addCharacterToList('bigaudiright', 'dad')

	doTweenY('lighttween','light', -300, 20, 'quadOut')
	doTweenY('rocksup','rocks', -900, 8, 'quadInOut')
	doTweenY('hanfordup','hanford', -800, 8, 'quadInOut')
end

function onSongStart()
	followchars = true;
end

--these functions move the rocks slowly up and down throughout the song
function onTweenCompleted(tag)

	if tag == 'rocksdown' then
		--debugPrint('rocksup');
		doTweenY('rocksup','rocks', -900, 8, 'quadInOut');
		doTweenY('hanfordup','hanford', -800, 8, 'quadInOut')
	end

	if tag == 'rocksup' then
		--debugPrint('rocksdown');
		doTweenY('rocksdown','rocks', -400, 8, 'quadInOut');
		doTweenY('hanforddown','hanford', -500, 8, 'quadInOut')
	end
end


function opponentNoteHit(id, noteData, noteType, isSustainNote)

	if getProperty('dad.curCharacter') == 'bigaudiidle' then
		bigaudishit = 1
	end

	if bigaudishit == 1 then
		cameraShake('camGame', 0.0225, 0.15);
		--every time auditor hits a note the game will check what direction it was 
		--based on that it switches auditor to the character with the respective animation

		--a timer is also set to .4s each time that if it reaches 0 it will reset auditor back to idle

		if noteData == 0 then
			--debugPrint("left")
			triggerEvent('Change Character', '1', 'bigaudileft')
			runTimer('idletimer',0.4,1)
		end
		if noteData == 1 then
			--debugPrint("down")
			triggerEvent('Change Character', '1', 'bigaudidown')
			runTimer('idletimer',0.4,1)
		end
		if noteData == 2 then
			--debugPrint("up")
			triggerEvent('Change Character', '1', 'bigaudiup')
			runTimer('idletimer',0.4,1)
		end
		if noteData == 3 then
			--debugPrint("right")
			triggerEvent('Change Character', '1', 'bigaudiright')
			runTimer('idletimer',0.4,1)
		end
	end
end

function onTimerCompleted(tag)
	--debugPrint('idle-ize him')
	if tag == 'idletimer' then
		triggerEvent('Change Character', '1', 'bigaudiidle')
	end
end

function onUpdate()
	if getProperty('health') >= 1 then
		setProperty('boyfriend.idleSuffix', '');
	else
		if getProperty('health') < 0.5 then
			setProperty('boyfriend.idleSuffix', '-alt2');
		else
			setProperty('boyfriend.idleSuffix', '-alt1');
		end
	end

	-- if keyJustPressed('space') == true then
	-- 	debugPrint(getProperty('camFollow.x'), getProperty('camFollow.y'));
	-- end

	if followchars == true then
		if mustHitSection == false then
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',oppx-camoffs,oppy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',oppx+camoffs,oppy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',oppx,oppy-camoffs)
			end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',oppx,oppy+camoffs)
			end
			if getProperty('dad.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',oppx,oppy);
			end
		else
			triggerEvent('Camera Follow Pos','','');
		end
	else
		triggerEvent('Camera Follow Pos','','');
	end
end

function onStepHit()
	for i = 1, 16 do
		if curStep == fullchains[i] then
			--debugPrint('full', fullchains[i])
			triggerEvent('notemove', '', '');
		end
	end

	for i = 1, 16 do
		if curStep == halfchains[i] then
			--debugPrint('half', halfchains[i])
			triggerEvent('notemove', 'true', '');
		end
	end

	if curStep == 474 then
		doTweenAlpha('camhudalpha', 'camHUD', 0, 0.7, 'quadInOut');
		doTweenAlpha('blackalpha', 'black', 1, 0.8, 'quadInOut');
	end

	if curStep == 490 then
		setProperty('light.visible', false);
		setProperty('beam2.visible', false);
		setProperty('hanford.alpha', 0.4);
		setProperty('rocks.alpha', 0.4);
		setProperty('rails.alpha', 0.4);
		setProperty('stage.alpha', 0.4);
		setProperty('blackvg.alpha', 0.8);
	end

	if curStep == 518 then
		doTweenAlpha('blackalpha', 'black', 0, 0.5, 'quadInOut');
	end

	if curStep == 530 then
		doTweenZoom('camzoomtween', 'camGame', 0.45, 1.8, 'quadInOut')
		setProperty('defaultCamZoom', 0.45);
	end

	if curStep == 591 then
		doTweenAlpha('camhudalpha', 'camHUD', 1, 2, 'quadInOut');
	end

	if curStep == 810 then
		cameraFlash('camother', '000000', 0.5, true);

		triggerEvent('notedefault', '', '');
		setProperty('defaultCamZoom', 0.3);
		setProperty('light.visible', true);
		setProperty('beam2.visible', true);
		setProperty('hanford.alpha', 1);
		setProperty('rocks.alpha', 1);
		setProperty('rails.alpha', 1);
		setProperty('stage.alpha', 1);
		setProperty('blackvg.alpha', 0);
	end

	if curStep == 1551 then
		doTweenAlpha('camhudalpha', 'camHUD', 0, 1, 'quadInOut');
	end

	if curStep == 1648 then
		doTweenAlpha('camhudalpha', 'camHUD', 1, 1, 'quadInOut');
	end

	if curStep == 1772 then
		doTweenZoom('camzoomtween', 'camGame', 0.35, 1, 'quadInOut')
		setProperty('defaultCamZoom', 0.35);
		doTweenAlpha('trailalpha1', 'trail1', 0.4, 0.5, 'quadInOut');
		doTweenAlpha('trailalpha2', 'trail2', 0.4, 0.5, 'quadInOut');
		doTweenY('beamfinal', 'beam2', -1400, 17.5, 'quadInOut');
	end

	if curStep == 1948 then
		doTweenAlpha('trailalpha1', 'trail1', 0, 0.5, 'quadInOut');
		doTweenAlpha('trailalpha2', 'trail2', 0, 0.5, 'quadInOut');
	end
end