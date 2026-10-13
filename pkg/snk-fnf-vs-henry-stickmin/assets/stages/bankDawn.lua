function onCreate()

    makeLuaSprite('BankActualBank', 'henry/bankBehindDawn', -830, -300);
	setProperty('BankActualBank.alpha', 1);
	scaleObject('BankActualBank', 0.8, 0.8);
	setScrollFactor('BankActualBank', 0.8, 0.8);
	addLuaSprite('BankActualBank', false);

    makeLuaSprite('BankFloor', 'henry/bankFrontDawn', -700, 550);
	setProperty('BankFloor.alpha', 1);
	scaleObject('BankFloor', 0.8, 0.8);
	addLuaSprite('BankFloor', false);

end