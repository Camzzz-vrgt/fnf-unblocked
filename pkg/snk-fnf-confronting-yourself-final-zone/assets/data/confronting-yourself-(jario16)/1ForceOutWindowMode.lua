local widescreen = false

function onCreate()
	if difficulty == 0 then
		widescreen = false
	else
		widescreen = true
	end
	
	if widescreen == false then
		setPropertyFromClass("openfl.Lib", "application.window.resizable", false)
	end
end