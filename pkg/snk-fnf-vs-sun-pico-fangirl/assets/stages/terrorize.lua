function onCreate()



	-- background shit

	makeLuaSprite('Sky', 'vs_sun/stage_night/Sky', -1000, -600);
	setScrollFactor('Sky', 1, 1);
        scaleObject('Sky', 1.5, 1.5);

	makeLuaSprite('Buildings', 'vs_sun/stage_night/Buildings', -600, -360);
	setScrollFactor('Buildings', 1.02, 1.02);
        scaleObject('Buildings', 0.9, 0.9);

	makeLuaSprite('Bushes', 'vs_sun/stage_night/Bushes', -600, -110);
	setScrollFactor('Bushes', 1, 1);
        scaleObject('Bushes', 0.9, 0.9);

	makeLuaSprite('Floor', 'vs_sun/stage_night/Floor', -600, -110);
	setScrollFactor('Floor', 1, 1);
        scaleObject('Floor', 0.9, 0.9);


        makeLuaSprite('solo31masasi', 'vs_sun/stage_night/Table_Top', -600, -251);
	setScrollFactor('solo31masasi', 1, 1);
        scaleObject('solo31masasi', 1, 1);

        makeLuaSprite('solo69masasi', 'vs_sun/stage_night/Table', -662, -222);
	setScrollFactor('solo69masasi', 1, 1);
        scaleObject('solo69masasi', 1, 1);

        makeLuaSprite('tabel', 'vs_sun/stage_night/Table1', -815, -222);
	setScrollFactor('tabel', 1, 1);
        scaleObject('tabel', 1, 1);


        makeLuaSprite('tabel1', 'vs_sun/stage_night/Table2', -870, -222);
	setScrollFactor('tabel1', 1, 1);
        scaleObject('tabel1', 1, 1);



	makeAnimatedLuaSprite('hoparlor', 'vs_sun/stage_night/Speaker', 837, 670);
        addAnimationByPrefix('hoparlor', 'Speaker', 'Speaker')
	setLuaSpriteScrollFactor('hoparlor', 1, 1);

	makeAnimatedLuaSprite('elektrik', 'vs_sun/stage_night/groundeffect', -800, -200);
        addAnimationByPrefix('elektrik', 'groundeffect', 'idle')
	setLuaSpriteScrollFactor('elektrik', 1, 1);
        scaleObject('elektrik', 1, 1);



	addLuaSprite('Sky', false);
	addLuaSprite('Buildings', false);
	addLuaSprite('Bushes', false);
	addLuaSprite('Floor', false);
	addLuaSprite('solo69masasi', false);
	addLuaSprite('tabel', false);
	addLuaSprite('tabel1', false);
	addLuaSprite('elektrik', false);
	addLuaSprite('hoparlor', false);
	addLuaSprite('solo31masasi', false);
	
	close(true);
end