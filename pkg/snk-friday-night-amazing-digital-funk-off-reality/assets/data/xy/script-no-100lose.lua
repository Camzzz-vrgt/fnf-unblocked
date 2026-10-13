function onUpdate()
	if ratingName == 'Perfect!!' or ratingName == '?' then
	else
		makeLuaText('textoxd', 'You lost the perfect, loser HA! HA!', 0, 65, 615);
		setTextSize('textoxd', 64);
		setProperty('textoxd' ..'.borderSize', 2);
		addLuaText('textoxd', true);
		setProperty('health', -1);
	end
end