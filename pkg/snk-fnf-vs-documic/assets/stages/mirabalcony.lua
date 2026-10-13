function onCreate()
	makeLuaSprite('mira', 'mirabalcony/mira', -595, -306);
	addLuaSprite('mira', false);

	makeLuaSprite('cafe', 'mirabalcony/cafe', -560, -300);
	setScrollFactor('cafe', 0.75, 1);
	addLuaSprite('cafe', false)

	makeLuaSprite('main', 'mirabalcony/main', -600, -300);
	addLuaSprite('main', false);

	makeLuaSprite('frontglasss', 'mirabalcony/frontglasss', -600, -425);
	setScrollFactor('frontglasss', 0.9, 0.8);
	addLuaSprite('frontglasss', true);

	makeLuaSprite('bloom', 'mirabalcony/bloom', -595, -35);
	addLuaSprite('bloom', false);

	close(true);
end

function onCreatePost()--this thing happens once the characters are spawned

    setProperty("gf.alpha", 0)

end
