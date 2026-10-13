function onCreate()
	-- background shit

	makeLuaSprite('Sky', 'vs_sun/stage_day/Sky', -1000, -600);
	setScrollFactor('Sky', 1, 1);
        scaleObject('Sky', 1.5, 1.5);

	makeLuaSprite('Buildings', 'vs_sun/stage_day/Buildings', -600, -250);
	setScrollFactor('Buildings', 1.02, 1.02);
        scaleObject('Buildings', 0.9, 0.9);

	makeLuaSprite('Bushes', 'vs_sun/stage_day/Bushes', -600, -110);
	setScrollFactor('Bushes', 1, 1);
        scaleObject('Bushes', 0.9, 0.9);

	makeLuaSprite('Floor', 'vs_sun/stage_day/Floor', -600, -110);
	setScrollFactor('Floor', 1, 1);
        scaleObject('Floor', 0.9, 0.9);


	makeAnimatedLuaSprite('solosexmasasi', 'vs_sun/stage_day/Table_1A', -750, -305);
	addAnimationByPrefix('solosexmasasi', 'Table_1A', 'Table_1A')
	setScrollFactor('solosexmasasi', 1, 1);
        scaleObject('solosexmasasi', 1, 1);

	makeAnimatedLuaSprite('masa2', 'vs_sun/stage_day/Table_2A', -750, -305);
        addAnimationByPrefix('masa2', 'Table_2A', 'Table_2A')
	setLuaSpriteScrollFactor('masa2', 1, 1);

	makeAnimatedLuaSprite('masa3', 'vs_sun/stage_day/Table_3A', -950, -305);
        addAnimationByPrefix('masa3', 'Table_3A', 'Table_3A')
	setLuaSpriteScrollFactor('masa3', 1, 1);

	makeAnimatedLuaSprite('masa4', 'vs_sun/stage_day/Table_4A', -680, -550);
        addAnimationByPrefix('masa4', 'Table_4A', 'Table_4A')
	setLuaSpriteScrollFactor('masa4', 1, 1);

	makeAnimatedLuaSprite('ultracocuk', 'vs_sun/stage_day/Uberkid_1A', -950, -230);
        addAnimationByPrefix('ultracocuk', 'Uberkid_1A', 'Uberkid_1A')
	setLuaSpriteScrollFactor('ultracocuk', 1, 1);

	makeAnimatedLuaSprite('ultracocuk2', 'vs_sun/stage_day/Uberkid_2A', -950, -230);
        addAnimationByPrefix('ultracocuk2', 'Uberkid_2A', 'Uberkid_2A')
	setLuaSpriteScrollFactor('ultracocuk2', 1, 1);


	addLuaSprite('Sky', false);
	addLuaSprite('Buildings', false);
	addLuaSprite('Bushes', false);
	addLuaSprite('Floor', false);
        addLuaSprite('solosexmasasi', false);
        addLuaSprite('ultracocuk', false);
        addLuaSprite('ultracocuk2', false);
	addLuaSprite('masa2', false);
	addLuaSprite('masa3', false);
	addLuaSprite('masa4', false);
	
	close(true);
end