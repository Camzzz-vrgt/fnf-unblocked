function onCreate()
	-- background shit
	makeLuaSprite('sky', 'stages/birthday party/sky', -650, -300);
	setScrollFactor('sky', 0.7, 0.7);

	makeLuaSprite('building', 'stages/birthday party/building', -600, -300);
	setScrollFactor('building', 0.9, 0.9);

	makeLuaSprite('clouds', 'stages/birthday party/clouds', -300, -200);
	setScrollFactor('clouds', 0.5, 0.5);

	makeLuaSprite('fence back', 'stages/birthday party/fence back', -560, -300);

	makeLuaSprite('fence front', 'stages/birthday party/fence front', -800, 100);
	setScrollFactor('fence front', 0.8, 0.8);

	makeLuaSprite('bfs_birthday_cake', 'stages/birthday party/bfs_birthday_cake', 1300, 770);
	scaleObject('bfs_birthday_cake', 0.5, 0.5);

	makeLuaSprite('grass', 'stages/birthday party/grass', -600, -200);
	makeLuaSprite('grass2', 'stages/birthday party/grass', -600, 100);

        makeAnimatedLuaSprite('member 2','stages/birthday party/bg characters/member 2',2700,700)addAnimationByPrefix('member 2','dance','member 2 idle',14,true)
        objectPlayAnimation('member 2','dance',false)
	scaleObject('member 2', 0.2, 0.2);

        makeAnimatedLuaSprite('member 3','stages/birthday party/bg characters/member 3',2500,900)addAnimationByPrefix('member 3','dance','member 3 idle',14,true)
        objectPlayAnimation('member 3','dance',false)
	scaleObject('member 3', 0.4, 0.4);

        makeAnimatedLuaSprite('member 4','stages/birthday party/bg characters/member 4',1800,900)addAnimationByPrefix('member 4','dance','member 4 idle',14,true)
        objectPlayAnimation('member 4','dance',false)
	scaleObject('member 4', 0.8, 0.8);

        makeAnimatedLuaSprite('member 5','stages/birthday party/bg characters/member 5',1300,1120)addAnimationByPrefix('member 5','dance','member 5 idle',14,true)
        objectPlayAnimation('member 5','dance',false)
	scaleObject('member 5', 0.1, 0.1);

        makeAnimatedLuaSprite('member 6','stages/birthday party/bg characters/member 6',2700,600)addAnimationByPrefix('member 6','dance','member 6 idle',14,true)
        objectPlayAnimation('member 6','dance',false)
	scaleObject('member 6', 0.2, 0.2);

        makeAnimatedLuaSprite('member 10','stages/birthday party/bg characters/member 10',300,1300)addAnimationByPrefix('member 10','dance','member 10 idle',14,true)
        objectPlayAnimation('member 10','dance',false)
	scaleObject('member 10', 0.1, 0.1);

        makeAnimatedLuaSprite('member 11','stages/birthday party/bg characters/member 11',-150,1050)addAnimationByPrefix('member 11','dance','member 11 idle',14,true)
        objectPlayAnimation('member 11','dance',false)
	scaleObject('member 11', 1.1, 1.1);

        makeAnimatedLuaSprite('member 13','stages/birthday party/bg characters/member 13',3250,700)addAnimationByPrefix('member 13','dance','member 13 idle',14,true)
        objectPlayAnimation('member 13','dance',false)
	scaleObject('member 13', 0.8, 0.8);

        makeAnimatedLuaSprite('member 7','stages/birthday party/bg characters/member 7',2700,1090)addAnimationByPrefix('member 7','dance','member 7 idle',14,true)
        objectPlayAnimation('member 7','dance',false)
	scaleObject('member 7', 0.2, 0.2);

        makeAnimatedLuaSprite('member 8','stages/birthday party/bg characters/member 8',3350,1090)addAnimationByPrefix('member 8','dance','member 8 idle',14,true)
        objectPlayAnimation('member 8','dance',false)
	scaleObject('member 8', 0.1, 0.1);

        makeAnimatedLuaSprite('member 9','stages/birthday party/bg characters/member 9',-350,1300)addAnimationByPrefix('member 9','dance','member 9 idle',14,true)
        objectPlayAnimation('member 9','dance',false)
	scaleObject('member 9', 0.1, 0.1);

        makeAnimatedLuaSprite('member 15','stages/birthday party/bg characters/member 15',1460,1070)addAnimationByPrefix('member 15','dance','member 15 idle',14,true)
        objectPlayAnimation('member 15','dance',false)
	scaleObject('member 15', 0.9, 0.9);

        makeAnimatedLuaSprite('member 14','stages/birthday party/bg characters/member 14',100,1170)addAnimationByPrefix('member 14','dance','member 14 idle',14,true)
        objectPlayAnimation('member 14','dance',false)
	scaleObject('member 14', 1.5, 1.5);
	setScrollFactor('member 14', 0.7, 0.7);

        makeAnimatedLuaSprite('member 1','stages/birthday party/bg characters/member 1',1400,970)addAnimationByPrefix('member 1','dance','member 1 idle',14,true)
        objectPlayAnimation('member 1','dance',false)
	scaleObject('member 1', 1.5, 1.5);
	setScrollFactor('member 1', 0.7, 0.7);

	addLuaSprite('sky', false);
	addLuaSprite('clouds', false);
	addLuaSprite('building', false);
	addLuaSprite('fence back', false);
	addLuaSprite('grass2', false);
	addLuaSprite('grass', false);
	addLuaSprite('bfs_birthday_cake', false);
	addLuaSprite('fence front', true);
end