function onCreate()

    makeLuaSprite('SkyVeryCoolCool', 'henryBsides/bank_B_sky', -830, -300);
	setProperty('SkyVeryCoolCool.alpha', 1);
	setScrollFactor('SkyVeryCoolCool', 0.5, 0);
	addLuaSprite('SkyVeryCoolCool', false);


    makeLuaSprite('SandStuffCool', 'henryBsides/bank_B_part_two', -830, -400);
	setProperty('SandStuffCool.alpha', 1);
	setScrollFactor('SandStuffCool', 0.5, 0.5);
	addLuaSprite('SandStuffCool', false);

    makeLuaSprite('BankCool', 'henryBsides/bank_B_part_one', -900, -400);
	setProperty('BankCool.alpha', 1);
	addLuaSprite('BankCool', false);

end