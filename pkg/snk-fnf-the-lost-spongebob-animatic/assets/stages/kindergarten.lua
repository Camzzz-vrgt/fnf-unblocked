function onCreate()

	makeLuaSprite('Kindergarten', 'Kindergarten', 620, 30);
	setLuaSpriteScrollFactor('Kindergarten', 1.0, 1.0);
	scaleObject('Kindergarten', 1, 1)
	addLuaSprite('Kindergarten', false);
	
	makeLuaSprite('Sponge BG', 'Sponge BG', 720, 30);
	setLuaSpriteScrollFactor('Sponge BG', 1.0, 1.0);
	scaleObject('Sponge BG', 1, 1)
	addLuaSprite('Sponge BG', false);
	
	makeLuaSprite('Squid BG', 'Squid BG', 520, 30);
	setLuaSpriteScrollFactor('Squid BG', 1.0, 1.0);
	scaleObject('Squid BG', 1, 1)
	addLuaSprite('Squid BG', false);
	
	makeLuaSprite('KindergartenLayer', 'KindergartenLayer', 620, 30);
	setLuaSpriteScrollFactor('KindergartenLayer', 1.0, 1.0);
	scaleObject('KindergartenLayer', 1, 1)
	addLuaSprite('KindergartenLayer', true);
	
	makeLuaSprite('Sponge Light', 'Sponge Light', 720, 30);
	setLuaSpriteScrollFactor('Sponge Light', 1.0, 1.0);
	scaleObject('Sponge Light', 1, 1)
	addLuaSprite('Sponge Light', true);
	
	makeLuaSprite('Squid Light', 'Squid Light', 520, 30);
	setLuaSpriteScrollFactor('Squid Light', 1.0, 1.0);
	scaleObject('Squid Light', 1, 1)
	addLuaSprite('Squid Light', true);
	
	makeLuaSprite('Filter', 'Filter', 620, 30);
	setLuaSpriteScrollFactor('Filter', 1.0, 1.0);
	scaleObject('Filter', 1, 1)
	addLuaSprite('Filter', true);

	setObjectOrder('dadGroup', getObjectOrder('Squid Light')+1)
end

function onUpdate()
 setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - 320)
 setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - 320)
 setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - 320)
 setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - 320)

 for i = 0,3 do
    setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
 end
end