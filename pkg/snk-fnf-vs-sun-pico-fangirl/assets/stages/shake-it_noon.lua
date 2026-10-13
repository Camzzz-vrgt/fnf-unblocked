function onCreate()
	-- background shit

	makeLuaSprite('Sky', 'vs_sun/stage_noon/Sky', -1000, -600);
	setScrollFactor('Sky', 1, 1);
        scaleObject('Sky', 1.5, 1.5);

	makeLuaSprite('Buildings', 'vs_sun/stage_noon/Buildings', -600, -250);
	setScrollFactor('Buildings', 1.02, 1.02);
        scaleObject('Buildings', 0.9, 0.9);

	makeLuaSprite('Bushes', 'vs_sun/stage_noon/Bushes', -600, -110);
	setScrollFactor('Bushes', 1, 1);
        scaleObject('Bushes', 0.9, 0.9);

	makeLuaSprite('Floor', 'vs_sun/stage_noon/Floor', -600, -110);
	setScrollFactor('Floor', 1, 1);
        scaleObject('Floor', 0.9, 0.9);


	makeAnimatedLuaSprite('masa1', 'vs_sun/stage_noon/Table_1A', -650, -155);
	scaleObject('masa1', 0.9, 0.9)
        addAnimationByPrefix('masa1', 'Table_1A', 'Table_1A')
	setLuaSpriteScrollFactor('masa1', 1, 1);

	makeAnimatedLuaSprite('masa2', 'vs_sun/stage_noon/Table_2A', -790, -470);
        addAnimationByPrefix('masa2', 'Table_2A', 'Table_2A')
	setLuaSpriteScrollFactor('masa2', 1, 1);

	makeAnimatedLuaSprite('masa3', 'vs_sun/stage_noon/Table_3A', -1000, -200);
        addAnimationByPrefix('masa3', 'Table_3A', 'Table_3A')
	setLuaSpriteScrollFactor('masa3', 1, 1);

	makeAnimatedLuaSprite('masa4', 'vs_sun/stage_noon/Table_4A', -690, -490);
        addAnimationByPrefix('masa4', 'Table_4A', 'Table_4A')
	setLuaSpriteScrollFactor('masa4', 1, 1);

	makeAnimatedLuaSprite('ultracocuk0', 'vs_sun/stage_noon/Uberkid_1A', -740, -230);
        addAnimationByPrefix('ultracocuk0', 'Uberkid_1A', 'Uberkid_1A')
	setLuaSpriteScrollFactor('ultracocuk0', 1, 1);

	makeAnimatedLuaSprite('ultracocuk', 'vs_sun/stage_noon/Uberkid_2A', -940, -230);
        addAnimationByPrefix('ultracocuk', 'Uberkid_2A', 'Uberkid_2A')
	setLuaSpriteScrollFactor('ultracocuk', 1, 1);

	makeAnimatedLuaSprite('ultracocuk2', 'vs_sun/stage_noon/Uberkid_3A', -950, -230);
        addAnimationByPrefix('ultracocuk2', 'Uberkid_3A', 'Uberkid_3A')
	setLuaSpriteScrollFactor('ultracocuk2', 1, 1);


	addLuaSprite('Sky', false);
	addLuaSprite('Buildings', false);
	addLuaSprite('Bushes', false);
        addLuaSprite('ultracocuk0', false);
	addLuaSprite('Floor', false);

        addLuaSprite('ultracocuk', false);
        addLuaSprite('ultracocuk1', false);
        addLuaSprite('ultracocuk2', false);
        addLuaSprite('masa1', false);
        addLuaSprite('masa2', false);
        addLuaSprite('masa3', false);
        addLuaSprite('masa4', false);


	close(true);
end