local sonicY = 0

function onCreate() --prepare pixel sprites

	precacheImage('Pixel/bitbf')
	precacheImage('Pixel/bitSonic')
	precacheImage('Pixel/bitbfdeath')

	makeAnimatedLuaSprite('water', 'Pixel/GH_Water', -1000, -700)
	scaleObject('water', 8, 8)
	setLuaSpriteScrollFactor('water', 0.9, 0.9);
	addAnimationByPrefix('water', 'loop', 'loop', 12, true)
	objectPlayAnimation('water', 'loop', true)

	makeAnimatedLuaSprite('bg', 'Pixel/GH_BG', -1000, -700)
	scaleObject('bg', 8, 8)
	setLuaSpriteScrollFactor('bg', 0.7, 0.7);
	addAnimationByPrefix('bg', 'loop', 'loop', 12, true)
	objectPlayAnimation('bg', 'loop', true)

	makeLuaSprite('sky', 'Pixel/GH_Sky', -1000, -700)
	scaleObject('sky', 8, 8)
	setLuaSpriteScrollFactor('sky', 0.5, 0.5);

	makeLuaSprite('ground', 'Pixel/GH_Ground', -1000, -700)
	scaleObject('ground', 8, 8)

	makeAnimatedLuaSprite('flowers', 'Pixel/GH_Detail', -1000, -700)
	scaleObject('flowers', 8, 8);
	addAnimationByPrefix('flowers', 'loop', 'loop', 12, true)
	objectPlayAnimation('flowers', 'loop', true)
	
	setProperty('water.antialiasing',false)
	setProperty('bg.antialiasing',false)
	setProperty('sky.antialiasing',false)
	setProperty('ground.antialiasing',false)
	setProperty('flowers.antialiasing',false)

	-- Sonic HUD
	if downscroll then
		sonicY = 48
	else
		sonicY = 548
	end
		makeLuaText('miss', ': 0', 0, 220, sonicY+111)
	setTextColor('miss', 'FFFFFF')
	setTextFont('miss', 'sonic-hud.ttf')
		makeLuaText('score', ': 0', 0, 200, sonicY-17)
	setTextColor('score', 'FFFFFF')
	setTextFont('score', 'sonic-hud.ttf')
		makeLuaText('time', ':  0:00', 0, 166, sonicY+46)
	setTextColor('time', 'FFFFFF')
	setTextFont('time', 'sonic-hud.ttf')
	setObjectCamera('miss', 'hud')
	setObjectCamera('score', 'hud')
	setObjectCamera('time', 'hud')
	setTextSize('time', 40)
	setTextSize('score', 40)
	setTextSize('miss', 40)
		makeLuaSprite('time', 'Pixel/time', 85, sonicY+65);
	setLuaSpriteScrollFactor('time', 0, 0);
	setProperty('time.scale.x', 3.8)
	setProperty('time.scale.y', 3.8)
	setProperty('time.antialiasing',false)
	setObjectCamera('time','hud')
		makeLuaSprite('misses', 'Pixel/misses', 95, sonicY+130);
	setLuaSpriteScrollFactor('misses', 0, 0);
	setProperty('misses.scale.x', 3.8)
	setProperty('misses.scale.y', 3.8)
	setProperty('misses.antialiasing',false)
	setObjectCamera('misses','hud')
		makeLuaSprite('score', 'Pixel/score', 85, sonicY);
	setLuaSpriteScrollFactor('score', 0, 0);
	setProperty('score.scale.x', 3.8)
	setProperty('score.scale.y', 3.8)
	setProperty('score.antialiasing',false)
	setObjectCamera('score','hud')
end


function onCreatePost()
		setPropertyFromClass('GameOverSubstate', 'characterName', 'bitbf-dead');
		addLuaSprite('water',false)
		addLuaSprite('bg',false)
		addLuaSprite('sky',false)
		addLuaSprite('ground',false)
		addLuaSprite('flowers',false)
		setCharacterX('dad', -650);
		setCharacterY('dad', 20);
		setCharacterX('boyfriend', 970);
		setCharacterY('boyfriend', 170);
		setProperty('cameraSpeed', 0.8);
		setProperty('defaultCamZoom', 0.6);
		for i=0,3 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'Pixel/16Bit_NoteAssets')
			setPropertyFromGroup('opponentStrums', i, 'texture', 'Pixel/16Bit_NoteAssets')
		end

		-- Add Sonic HUD

		for i=0,getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Alt Animation' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'No Animation' then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'Pixel/16Bit_NoteAssets')
			end
		end

		setProperty('scoreTxt.visible', false)
		setProperty("timeTxt.visible", false);
		setProperty("timeBar.visible", false)
		setProperty("timeBarBG.visible", false)
		setProperty('showRating', false)
		setProperty('showCombo', false)
		setProperty('showComboNum', false)
		setProperty('healthBar.x', getProperty'healthBar.x' + 155);
		addLuaSprite('time', true);
		addLuaSprite('misses', true);
		addLuaSprite('score', true);
		addLuaText('time')
		addLuaText('score')
		addLuaText('miss')
end


function onStepHit()
	if curStep == 288 then --begone Pixel!
		setCharacterX('dad', -155);
		setCharacterY('dad', 60);
		setCharacterX('boyfriend', 775);
		setCharacterY('boyfriend', 160);

		setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead');
		removeLuaSprite('water',true)
		removeLuaSprite('bg',true)
		removeLuaSprite('sky',true)
		removeLuaSprite('ground',true)
		removeLuaSprite('flowers',true)
		setProperty('cameraSpeed', 1.6);
		setProperty('defaultCamZoom', 0.7);
		for i=0,3 do
			setPropertyFromGroup('playerStrums', i, 'texture', 'NOTE_assets');
			setPropertyFromGroup('opponentStrums', i, 'texture', 'NOTE_assets');
		end

		-- Remove Sonic HUD
		if getPropertyFromClass('ClientPrefs', 'hideHud') == false then
			setProperty('scoreTxt.visible', true)
			if getPropertyFromClass('ClientPrefs', 'timeBarType') ~= 'Disabled' then
				setProperty('timeTxt.visible', true);
				setProperty('timeBar.visible', true)
				setProperty('timeBarBG.visible', true)
			end
			setProperty('healthBar.x', getProperty'healthBar.x' - 155);
		end
		removeLuaSprite('time');
		removeLuaSprite('misses');
		removeLuaSprite('score');
		removeLuaText('time')
		removeLuaText('score')
		removeLuaText('miss')
	end
	
	if curStep == 290 then --notes back to normal
		for i=0,getProperty('unspawnNotes.length')-1 do
			if getPropertyFromGroup('unspawnNotes', i, 'noteType') == '' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Alt Animation' or getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'No Animation' then
				setPropertyFromGroup('unspawnNotes', i, 'texture', 'NOTE_assets')
			end
		end
	end
end

function onUpdate(enlapsed)

	if curStep > 0 and curStep < 280 then
		setTextString('miss', ': ' .. getProperty('songMisses'))
		setTextString('score', ': ' .. getProperty('songScore'))
		setTextString('time', ': ' .. formatTime(math.floor(getPropertyFromClass('Conductor', 'songPosition') - noteOffset)))
	end
end


function formatTime(milliseconds) --convert into standard time
	if curStep < 280 then
	local totalseconds = math.floor(milliseconds / 1000)
	local seconds = totalseconds % 60
	local minutes = math.floor(totalseconds / 60)
	minutes = minutes % 60
	return string.format("%2d:%02d", minutes, seconds) 
	end 
end