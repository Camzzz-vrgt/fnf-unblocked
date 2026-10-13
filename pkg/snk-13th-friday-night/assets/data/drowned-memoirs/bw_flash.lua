function onCreate()
	--precacheSound('thunder-sfx');
end

function onCreatePost()
	if (not shadersEnabled) then
		return;
	end
	initLuaShader("BWflash");
	makeLuaSprite("BWflash") makeGraphic("BWflash", screenWidth, screenHeight);
	setSpriteShader("BWflash", "bw_flash");

	setShaderBool('BWflash', 'enabled', false); -- Enables the BW effect
	setShaderFloat('BWflash', 'threshold', 0.30); -- Luminance threshold / cutoff for bw. 0 to 1 range.

	addHaxeLibrary("ShaderFilter", "openfl.filters");

	runHaxeCode([[trace(ShaderFilter);
		game.camGame.setFilters([new ShaderFilter(game.getLuaObject("BWflash").shader)]);
		game.camHUD.setFilters([new ShaderFilter(game.getLuaObject("BWflash").shader)]);
		//game.camOther.setFilters([new ShaderFilter(game.getLuaObject("BWflash").shader)]);
	]]); -- Game, HUD, Pause menu
end

function onEvent(name, value1, value2)
	if (name == 'Thunder Flash') then
		if (shadersEnabled) then
			local duration = nil;
			if (value1:len() > 0) then
				duration = tonumber(value1);
			end
			duration = duration or 0.2;
			setShaderBool('BWflash', 'enabled', true);
			runTimer('shdFlashOff', duration);
		end
		--playSound('thunder-sfx', 1.0);
	end
end

function onTimerCompleted(name, loops, loopsLeft)
	if (name == 'shdFlashOff') then
		setShaderBool('BWflash', 'enabled', false);
	end
end

function onStepHit()

	if curStep == 572 then
		triggerEvent('Thunder Flash', '0.05', '');
    end
	
end