
function onCreate()
	-- background shit
	makeLuaSprite('roomback', 'roomback', -600, -540);
	setScrollFactor('roomback', 0.9, 0.9);
	scaleObject('roomfront', 0.8, 0.8);
	
	makeLuaSprite('roomfront', 'roomfront', -650, 400);
	setScrollFactor('roomfront', 0.9, 0.9);
	scaleObject('roomfront', 1.1, 1.1);

	makeLuaSprite('couch', 'couch', 220, 68);
	setScrollFactor('couch', 0.9, 0.9);
	scaleObject('couch', 1.1, 1.1);

	makeLuaSprite('redbear', 'redbear', 800, 88);
	setScrollFactor('redbear', 0.9, 0.9);
	scaleObject('redbear', 1.3, 1.3);
	
	makeLuaSprite('greenbun', 'greenbun', -100, 88);
	setScrollFactor('greenbun', 0.9, 0.9);
	scaleObject('greenbun', 1.3, 1.3);

	addLuaSprite('roomback', false);
	addLuaSprite('roomfront', false);
	addLuaSprite('couch', false);
	addLuaSprite('redbear', false);
	addLuaSprite('greenbun', false);
end