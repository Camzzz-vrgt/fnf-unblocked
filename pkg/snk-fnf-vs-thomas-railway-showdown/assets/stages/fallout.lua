function onCreate()

	makeLuaSprite("TheEverything","fallout/everything else lol",-1000,-800)
	addLuaSprite("TheEverything",false)
	setLuaSpriteScrollFactor("TheEverything",1,1)
	scaleObject('TheEverything', 1.7, 1.7)
	close(true)
	
	makeLuaSprite("theArry","fallout/deadarry",-50,-1050)
	addLuaSprite("theArry",false)
	setLuaSpriteScrollFactor("theArry",1,1)
	scaleObject('theArry', 1.7, 1.7)

	makeLuaSprite("shadow arry","fallout/shadow arry",-50,-1050)
	addLuaSprite("shadow arry",false)
	setLuaSpriteScrollFactor("shadow arry",1,1)
	scaleObject('shadow arry', 1.7, 1.7)

        makeAnimatedLuaSprite('lyrics','fallout/lyrics', -0, 0)
        addAnimationByPrefix('lyrics','idle','idle',24,true)
        addAnimationByPrefix('lyrics','emergency','emergency',24,true)
        addAnimationByPrefix('lyrics','clear the','clear the',24,true)
        addAnimationByPrefix('lyrics','area','area',24,true)
        addAnimationByPrefix('lyrics','immediately','immediately',24,true)
        objectPlayAnimation('lyrics','idle',false)
	setProperty('lyrics.visible', false)
	setProperty('camGame.visible', false)
	setProperty('shadow arry.visible', true)
        addLuaSprite('lyrics', true);
	setObjectCamera('lyrics', 'other');
        setScrollFactor('lyrics', 0, 0)

	setObjectOrder('dadGroup', 3)
	setObjectOrder('theArry', 4)
	setObjectOrder('shadow arry', 5)
	setObjectOrder('boyfriendGroup', 6)
	setObjectOrder('girlfriendgroup', 7)
	close(true)

end