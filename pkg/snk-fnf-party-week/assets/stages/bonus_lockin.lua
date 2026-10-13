function onCreate()
	makeLuaSprite('otherlayer', 'bg/bonus/lockin', 0, 0)
	makeLuaSprite('truebg', 'bg/bonus/lockin', 0, 0)
	if not downscroll then
		makeLuaSprite('lane', 'lane', 730, 0)
	else
		makeLuaSprite('lane', 'lane', 405, 0)
	end
	
	setObjectCamera('otherlayer', 'other')
	setObjectCamera('truebg', 'hud')
	setObjectCamera('lane', 'hud')
	
	setProperty('lane.alpha', 0.6)
	
	addLuaSprite('otherlayer', false)
	addLuaSprite('truebg', false)
	addLuaSprite('lane', false)
end

function onCreatePost()
	doTweenAlpha('yeah', 'otherlayer', 0, 0.5, 'linear')
	noteTweenX('dadTween1', 0, -150, 0.3, 'linear')
	noteTweenX('dadTween2', 1, -150, 0.3, 'linear')
	noteTweenX('dadTween3', 2, -150, 0.3, 'linear')
	noteTweenX('dadTween4', 3, -150, 0.3, 'linear')
end