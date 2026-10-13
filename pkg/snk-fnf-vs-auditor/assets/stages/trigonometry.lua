local boobs = 0

-- This is a test stage where the chain mechanic was originally developed.
-- Yes, the chain mechanic was originally developed in psych, fun fact.
-- That was the main reason for me doing this, it helped us to create a lot
-- of concepts for how the mod should look in the kade engine build.

-- If you're reading this thank you for playing, and thank you for being
-- interested enough to dig around in the code.

function onCreate()
	-- background shit
	makeLuaSprite('stageback', 'stageback', -600, -300);
	setScrollFactor('stageback', 0.9, 0.9);
	
	makeLuaSprite('stagefront', 'stagefront', -650, 600);
	setScrollFactor('stagefront', 0.9, 0.9);
	scaleObject('stagefront', 1.1, 1.1);

	makeLuaSprite('stagecurtains', 'stagecurtains', -500, -300);
	setScrollFactor('stagecurtains', 1.3, 1.3);
	scaleObject('stagecurtains', 0.9, 0.9);
	

	addLuaSprite('stageback', false);
	addLuaSprite('stagefront', false);
	addLuaSprite('stagelight_left', false);
	addLuaSprite('stagelight_right', false);
	addLuaSprite('stagecurtains', false);
	
	setPropertyFromClass('ClientPrefs', 'downScroll', false)

	setProperty('camHUD.zoom', 1)
end

function onUpdate()

	boobs = boobs + 1
	setProperty('dad.angle', boobs)

	if keyJustPressed('space') == true then
		triggerEvent('notemove', 0, 0)
	end

	if keyJustPressed('back') == true then
		triggerEvent('notespin', 0, 0)
	end
end