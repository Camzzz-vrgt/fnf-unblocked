function onCreate()
	-- background shit

	makeLuaSprite('sky', 'stagesans-Papyrus/sky', -300, 100);
	scaleObject('sky', 1.3, 1.3);
                addLuaSprite('sky',false)

	makeLuaSprite('Trees', 'stagesans-Papyrus/Trees', -300, -300);
	scaleObject('Trees', 1.2, 1.2);
                addLuaSprite('Trees',false)

	makeLuaSprite('bg', 'stagesans-Papyrus/bg', -200, -220);
	scaleObject('bg', 1.2, 1.2);
                addLuaSprite('bg',false)

end