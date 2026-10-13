local Left_Color = "C353E3"
local Right_Color = "662C77"
local haveAndroidPad = true

function onUpdate()
	 
	if haveAndroidPad == true then
		if (getMouseY('camHUD') > 461 and getMouseY('camHUD') < 593) and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and mousePressed('left') then
			objectPlayAnimation('upPad', 'upP', true)
		else
			objectPlayAnimation('upPad', 'up', true)
		end
		
		if (getMouseY('camHUD') > 593 and getMouseY('camHUD') < 720) and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 132) and mousePressed('left') then
			objectPlayAnimation('leftPad', 'leftP', true)
			objectPlayAnimation('downPad', 'downP', true)
		else
			objectPlayAnimation('leftPad', 'left', true)
			objectPlayAnimation('downPad', 'down', true)
		end
	
		if (getMouseX('other') > 1148 and getMouseX('other') < 2750) and (getMouseY('other') > 580 and getMouseY('other') < 707) and mousePressed('left') then
			objectPlayAnimation('aPad', 'aP', true)
		else
			objectPlayAnimation('aPad', 'a', true)
		end
	
		if (getMouseY('camHUD') > 593 and getMouseY('camHUD') < 720) and (getMouseX('camHUD') > 132 and getMouseX('camHUD') < 264) and mousePressed('left') then
			objectPlayAnimation('rightPad', 'rightP', true)
		else
			objectPlayAnimation('rightPad', 'right', true)
		end
		
		if (getMouseX('camHUD') > 1024 and getMouseX('camHUD') < 1024+130) and (getMouseY('camHUD') > 580 and getMouseY('camHUD') < 580+127) and mousePressed('left') then
			objectPlayAnimation('bPad', 'bP', true)
			blackTween('Mainmenu')
		else
			objectPlayAnimation('bPad', 'b', true)
		end
		
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.B') then
			blackTween('Mainmenu')
		end
		
		setProperty('newMouse.visible', false)
	else
		setProperty('newMouse.visible', true)
	end
end



function onCreate()
if buildTarget == 'android' then
makeAnimatedLuaSprite('leftPad', 'androidcontrols/Android', 0, 593)
			setObjectCamera('leftPad', 'other')
			addLuaSprite('leftPad', true)
			addAnimationByPrefix('leftPad', 'left', 'a1', 24, false)
			addAnimationByPrefix('leftPad', 'leftP', 'a2', 24, false)
			setProperty('leftPad.alpha', 0.7)
			setProperty('leftPad.color',getColorFromHex('FF00FF'))
end
end