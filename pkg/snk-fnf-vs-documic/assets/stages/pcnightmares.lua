function onCreate()
	makeLuaSprite('gradient', 'pcnightmares/gradient', -595, -306);
	addLuaSprite('gradient', false);

	makeLuaSprite('shapes', 'pcnightmares/shapes', -560, -300);
	setScrollFactor('shapes', 0.75, 1);
	addLuaSprite('shapes', false)

	makeLuaSprite('fore', 'pcnightmares/fore', -600, -300);
	addLuaSprite('fore', false);

	makeLuaSprite('forepillars', 'pcnightmares/forepillars', -600, -450);
	setScrollFactor('forepillars', 0.8, 0.8);
	addLuaSprite('forepillars', true);

	close(true);
end

function onCreatePost()--this thing happens once the characters are spawned

    setProperty("gf.alpha", 0)

end
