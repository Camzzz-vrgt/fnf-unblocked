function onUpdate()
	if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then
             makeAnimatedLuaSprite('crashgame','num0', -1000, -1000) --this crashes the game because theres no xml file with the image 'num0'
	end
end