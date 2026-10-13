local night = {'nightsky','nighttrees','nightchurch','nighthills','nighttrees','nightfence','nightbees','nightrails','nightfg'}
function onCreate()
	--background boi
	makeLuaSprite('sky', 'somber/day sky', -600, -295)
	setLuaSpriteScrollFactor('sky', 0, 0)
	scaleObject('sky', 2, 2);

	makeLuaSprite('clouds', 'somber/day clouds', -600, 0)
	setLuaSpriteScrollFactor('clouds', 0.7, 0.7)
	scaleObject('clouds', 2, 2);

	makeLuaSprite('church', 'somber/day church', -600, -335)
	setLuaSpriteScrollFactor('church', 0.5, 0.8)
	scaleObject('church', 2, 2);

	makeLuaSprite('hills', 'somber/day bg', -600, -335)
	setLuaSpriteScrollFactor('hills', 0.6, 0.9)
	scaleObject('hills', 2, 2);

	makeLuaSprite('trees', 'somber/day bg trees', -600, -335)
	setLuaSpriteScrollFactor('trees', 0.7, 1)
	scaleObject('trees', 2, 2);

	makeLuaSprite('fence', 'somber/day fence', -600, -335)
	setLuaSpriteScrollFactor('fence', 0.8, 1)
	scaleObject('fence', 2, 2);

	makeLuaSprite('bees', 'somber/day beehives', -600, -295)
	setLuaSpriteScrollFactor('bees', 1, 1)
	scaleObject('bees', 2, 2);
	
	makeLuaSprite('rails', 'somber/day rails', -600, -295)
	setLuaSpriteScrollFactor('rails', 1, 1)
	scaleObject('rails', 2, 2);

	makeLuaSprite('fg', 'somber/day foreground trees', -900, -295)
	setLuaSpriteScrollFactor('fg', 1.1, 1)
	scaleObject('fg', 2.4, 2.4);

	makeLuaSprite('nightsky', 'somber/nightsky', -600, -295)
	setLuaSpriteScrollFactor('nightsky', 0.4, 0.7)
	scaleObject('nightsky', 2, 2);

	makeLuaSprite('nightchurch', 'somber/nightcastle', -600, -335)
	setLuaSpriteScrollFactor('nightchurch', 0.5, 0.8)
	scaleObject('nightchurch', 2, 2);

	makeLuaSprite('nighthills', 'somber/nightbg', -600, -335)
	setLuaSpriteScrollFactor('nighthills', 0.6, 0.9)
	scaleObject('nighthills', 2, 2);

	makeLuaSprite('nighttrees', 'somber/nightbacktrees', -600, -335)
	setLuaSpriteScrollFactor('nighttrees', 0.7, 1)
	scaleObject('nighttrees', 2, 2);

	makeLuaSprite('nightfence', 'somber/nightfence', -600, -335)
	setLuaSpriteScrollFactor('nightfence', 0.8, 1)
	scaleObject('nightfence', 2, 2);

	makeLuaSprite('nightbees', 'somber/nightbeehives', -600, -295)
	setLuaSpriteScrollFactor('nightbees', 1, 1)
	scaleObject('nightbees', 2, 2);

	makeLuaSprite('nightrails', 'somber/nightrails', -600, -295)
	setLuaSpriteScrollFactor('nightrails', 1, 1)
	scaleObject('nightrails', 2, 2);

	makeLuaSprite('bad day', 'somber/bad day', 250, 100)
	setObjectCamera('bad day', 'other');

	makeLuaSprite('nightfg', 'somber/nightfgtrees', -900, -295)
	setLuaSpriteScrollFactor('nightfg', 1.1, 1)
	scaleObject('nightfg', 2.4, 2.4);

	setObjectOrder('dadGroup', 4)
	setObjectOrder('rails', 3)
	setObjectOrder('nightrails', 2)
	setObjectOrder('boyfriendGroup', 1)

	addLuaSprite('sky', false)
	addLuaSprite('clouds', false)
	addLuaSprite('church', false)
	addLuaSprite('hills', false)
	addLuaSprite('trees', false)
	addLuaSprite('fence', false)
	addLuaSprite('bees', false)
	addLuaSprite('rails', false)
	addLuaSprite('fg', true)
	addLuaSprite('bad day', true)

	addLuaSprite('nightsky', false)
	addLuaSprite('nightchurch', false)
	addLuaSprite('nighthills', false)
	addLuaSprite('nighttrees', false)
	addLuaSprite('nightfence', false)
	addLuaSprite('nightbees', false)
	addLuaSprite('nightrails', false)
	addLuaSprite('nightfg', true)

	setProperty('bad day.visible', false)
	setProperty('nightsky.visible', false)
	setProperty('nightchurch.visible', false)
	setProperty('nighthills.visible', false)
	setProperty('nighttrees.visible', false)
	setProperty('nightfence.visible', false)
	setProperty('nightbees.visible', false)
	setProperty('nightrails.visible', false)
	setProperty('nightfg.visible', false)

	close(true)

end

