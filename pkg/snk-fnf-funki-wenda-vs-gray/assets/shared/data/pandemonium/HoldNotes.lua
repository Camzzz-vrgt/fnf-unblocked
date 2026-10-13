local wideNotes = false

function onCreatePost()
	local noteSplashSkin = 'holdCover'
	if getPropertyFromClass('backend.ClientPrefs', 'data.splashSkin'):lower() ~= 'vanilla' then
		noteSplashSkin = 'holdCoverPsych'
	end

	if getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'):lower() == 'future' or getPropertyFromClass('backend.ClientPrefs', 'data.noteSkin'):lower() == 'chip' then
		wideNotes = true
	end


	for i = 0, 3 do
    	makeAnimatedLuaSprite('holdOpponent'..i, noteSplashSkin, getPropertyFromGroup('opponentStrums', i, 'x')-100, getPropertyFromGroup('opponentStrums', i, 'y')-120)
	    addAnimationByPrefix('holdOpponent'..i, 'hold', 'holdCover0', 24, true) --setOffset('holdBlue', 'hold', 'holdCoverBlue', 0, 0)
		addLuaSprite('holdOpponent'..i, true)
		setObjectCamera('holdOpponent'..i, 'hud')
		setProperty('holdOpponent'..i..'.visible', false)
		setProperty('holdOpponent'..i..'.alpha', getPropertyFromClass('backend.ClientPrefs', 'data.splashAlpha'))
		setProperty('holdOpponent'..i..'.scale.x', (wideNotes and 1.45 or 1))
	end

	for i = 0, 3 do
    	makeAnimatedLuaSprite('hold'..i, noteSplashSkin, getPropertyFromGroup('playerStrums', i, 'x')-100, getPropertyFromGroup('playerStrums', i, 'y')-120)
	    addAnimationByPrefix('hold'..i, 'hold', 'holdCover0', 24, true) --setOffset('holdBlue', 'hold', 'holdCoverBlue', 0, 0)
	    addAnimationByPrefix('hold'..i, 'end', 'holdCoverEnd0', 24, false)
		addLuaSprite('hold'..i, true)
		setObjectCamera('hold'..i, 'hud')
		setProperty('hold'..i..'.visible', false)
		setProperty('hold'..i..'.alpha', getPropertyFromClass('backend.ClientPrefs', 'data.splashAlpha'))
		setProperty('hold'..i..'.scale.x', (wideNotes and 1.45 or 1))
	end
end
function onUpdatePost()
	for i = 0, 3 do
		if getProperty('hold'..i..'.animation.curAnim.name') == 'end' and getProperty('hold'..i..'.animation.finished') then
			setProperty('hold'..i..'.visible', false)
		end
	end
end

function opponentNoteHit(i, d, t, s)
	for a = 0, 3 do
		if s and d == a then
			runHaxeCode([[
			    var rgb = new shaders.RGBPalette();
			    game.getLuaObject('holdOpponent]]..a..[[').shader = rgb.shader;
			    setVar('rgb2', rgb);
			]])

			setProperty('rgb2.r', getColorFromHex('DC6162'))
			setProperty('rgb2.g', getColorFromHex('FEDBCE'))				

			setProperty('holdOpponent'..a..'.alpha', getPropertyFromClass('backend.ClientPrefs', 'data.splashAlpha')*getPropertyFromGroup('opponentStrums', a, 'alpha'))
			setProperty('holdOpponent'..a..'.visible', true)
			runTimer('holdOpponent'..a..'Despawn', .1)
		end
	end
end

function goodNoteHit(id, d, t, s)
	for i = 0, 3 do
		if s and d == i then
			runHaxeCode([[
			    var rgb = new shaders.RGBPalette();
			    game.getLuaObject('hold]]..i..[[').shader = rgb.shader;
			    setVar('rgb', rgb);
			]])

			setProperty('rgb.r', getColorFromHex('DC6162'))
			setProperty('rgb.g', getColorFromHex('FEDBCE'))				

			setProperty('hold'..i..'.visible', true)
			if getProperty('hold'..i..'.animation.curAnim.name') ~= 'hold' then
				playAnim('hold'..i, 'hold')
			end

			setProperty('hold'..i..'.alpha', getPropertyFromClass('backend.ClientPrefs', 'data.splashAlpha')*getPropertyFromGroup('playerStrums', i, 'alpha'))
			setProperty('hold'..i..'.scale.x', (wideNotes and 1.45 or 1))
			runTimer('hold'..i..'Despawn', .075)
		end
	end
end

function onTimerCompleted(t)
	for i = 0, 3 do
		if t == 'hold'..i..'Despawn' then
			playAnim('hold'..i, 'end')
			setProperty('hold'..i..'.scale.x', 1)
		end

		if t == 'holdOpponent'..i..'Despawn' then
			setProperty('holdOpponent'..i..'.visible', false)
		end
	end
end