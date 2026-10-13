function onCreate()
	makeLuaSprite('bg', 'bg/bonus/partyweek_ft_teto', 0, 0)
	if not middlescroll then
		makeLuaSprite('lane', 'lane', 730, 0)
	else
		makeLuaSprite('lane', 'lane', 405, 0)
	end
	
	setObjectCamera('bg', 'hud')
	setObjectCamera('lane', 'hud')
	
	setProperty('lane.alpha', 0.6)
	
	addLuaSprite('bg', false)
	addLuaSprite('lane', false)
end

function onCreatePost()
	doTweenAlpha('lol', 'lane', 0.5, 0.5, 'linear')
	noteTweenX('dadTween1', 0, -150, 0.3, 'linear')
	noteTweenX('dadTween2', 1, -150, 0.3, 'linear')
	noteTweenX('dadTween3', 2, -150, 0.3, 'linear')
	noteTweenX('dadTween4', 3, -150, 0.3, 'linear')
end