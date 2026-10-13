local 2 = 2
local twnspd = 1
local sprint = false

local bad = false
local badending = false
local blackout = false

local begin = true
local forthelowends = false

local currentbg = 'island' -- 'island', 'island-fire', 'ghz', 'knux', 'egg', 'none'

function onCreate()

	setPropertyFromClass('backend.ClientPrefs', 'data.timeBarType', 'Time Elapsed')

--- reusing a lot of code from my take lmao hurray

--	a lot of prechaching sorry lol
	precacheImage('AIfloor')
	precacheImage('AIfront')
	precacheImage('AIleaves')
	precacheImage('spriteAI')
	precacheImage('fireloop')
	precacheImage('fire')
	precacheImage('firebgloop')
	precacheImage('aspect')
	precacheImage('scawy')
	precacheImage('scawy0')
	precacheImage('scawy1')
	precacheImage('scawy2')
	precacheImage('scawy3')
	precacheImage('scawybf')
	precacheImage('gameoversheet')
	
	precacheImage('ghbg')
	precacheImage('ghclouds')
	precacheImage('ghcloudsB')
	precacheImage('ghcloudsC')
	precacheImage('ghfloor')
	precacheImage('ghrocks')
	precacheImage('ghwater')
	
	precacheImage('characters/sonic')
	precacheImage('characters/boyfriend')
	precacheImage('characters/boyfriendalt')
	precacheImage('characters/boyfriendpanic')
	precacheImage('characters/bflegs')
	precacheImage('characters/xenoCY')
	precacheImage('characters/sonicpeelout')
	precacheImage('characters/peeloutlegs')
	
	precacheImage('bg/kbg1')
	precacheImage('bg/kbg2')
	precacheImage('bg/kbg3')
	precacheImage('bg/kbg4')
	precacheImage('bg/knux1')

	precacheImage('bg/eggbg')
	precacheImage('bg/eggstageanimated')
	precacheImage('bg/curtainstop')
	precacheImage('bg/curtainsanimated')
	
	precacheImage('spookies/xenocrouch')
	precacheImage('spookies/xenohug')
	precacheImage('spookies/xenoside')
	
	
-- ok no more prechaching

	--setObjectOrder('gf', dadGroup)
	setPropertyFromClass('openfl.Lib', 'application.window.title', "SONIC")
	setProperty('health', 2)
	--doTweenZoom('aspectfix', 'camHUD', 1.1,0.1,'linear')

	setPropertyFromClass('substates.GameOverSubstate', 'characterName', 'nobody');
	setPropertyFromClass('substates.GameOverSubstate', 'deathSoundName', ''); --file goes inside sounds/ folder
	setPropertyFromClass('substates.GameOverSubstate', 'loopSoundName', ''); --file goes inside music/ folder
	setPropertyFromClass('substates.GameOverSubstate', 'endSoundName', 'continue'); --file goes inside music/ folder
	
	makeLuaSprite('blackfull', 'black', -300, -300)
    setProperty('blackfull.antialiasing', false)
    scaleObject('blackfull', 10, 10)
    addLuaSprite('blackfull', false)
	setProperty('blackfull.alpha', 1)
	setObjectCamera('blackfull', 'other')	
	
	makeLuaSprite('confronting', 'titlecard/confronting', 1280, 0)
    setProperty('confronting.antialiasing', false)
    scaleObject('confronting', 3.5, 3.5)
    addLuaSprite('confronting', false)
	setObjectCamera('confronting', 'other')
	
	makeLuaSprite('yourself', 'titlecard/yourself', 1280, 0)
    setProperty('yourself.antialiasing', false)
    scaleObject('yourself', 3.5, 3.5)
    addLuaSprite('yourself', false)
	setObjectCamera('yourself', 'other')
	
	makeLuaSprite('redbar', 'titlecard/redbar', 0, -720)
    setProperty('redbar.antialiasing', false)
    scaleObject('redbar', 3.5, 3.5)
    addLuaSprite('redbar', false)
	setObjectCamera('redbar', 'other')
	
	makeLuaSprite('act1', 'titlecard/act1', 1280, 0)
    setProperty('act1.antialiasing', false)
    scaleObject('act1', 3.5, 3.5)
    addLuaSprite('act1', false)
	setObjectCamera('act1', 'other')	

	makeLuaSprite('aspect', 'aspect', -80, 0)
    setProperty('aspect.antialiasing', false)
    scaleObject('aspect', 1, 1)
    addLuaSprite('aspect', false)
	setObjectCamera('aspect', 'other')
	
	makeLuaSprite('SonicNormal','icons/SonicNormal',0,0)
	makeLuaSprite('SonicPain','icons/SonicPain',0,0)
	setObjectCamera('SonicNormal','hud')
	addLuaSprite('SonicNormal',false)
	setObjectCamera('SonicPain','hud')
	addLuaSprite('SonicPain',false)
	
	makeLuaSprite('black', 'black', -300, -300)
    setProperty('black.antialiasing', false)
    scaleObject('black', 10, 10)
    addLuaSprite('black', false)
	setObjectOrder('black', 'dadGroup+5')
	setProperty('black.alpha', 0)
	
	makeLuaSprite('white', 'white', -300, -300)
    setProperty('white.antialiasing', false)
    scaleObject('white', 10, 10)
    addLuaSprite('white', false)
	setObjectOrder('white', 'dadGroup+5')
	setProperty('white.alpha', 0)

	makeLuaSprite('red', 'red', -300, -300)
    setProperty('red.antialiasing', false)
    scaleObject('red', 10, 10)
    addLuaSprite('red', false)
	setObjectOrder('red', 'dadGroup+5')
	setProperty('red.alpha', 0)
	
	makeLuaSprite('redfilter', 'red', -300, -300)
    setProperty('redfilter.antialiasing', false)
    scaleObject('redfilter', 10, 10)
    addLuaSprite('redfilter', false)
	setObjectOrder('redfilter', 'dadGroup+5')
	setProperty('redfilter.alpha', 0.4)
	setBlendMode('redfilter', 'add')

	scaleObject('SonicNormal', 1.1, 1.1)
	scaleObject('SonicPain', 1.1, 1.1)
	
	makeLuaSprite('run', 'run', 0, 0)
	setProperty('run.antialiasing', false)
	setObjectCamera('run', 'hud')
	addLuaSprite('run', false)
	setProperty('run.alpha', 0)
	
	makeLuaSprite('jumpscare', 'scawy', 120, 0)
	scaleObject('jumpscare', 6, 6)
	setProperty('jumpscare.antialiasing', false)
	setObjectCamera('jumpscare', 'other')
	addLuaSprite('jumpscare', false)
	setProperty('jumpscare.alpha', 0)
	
	makeLuaSprite('eyesjumpscare', 'scawy0', 120, 0)
	scaleObject('eyesjumpscare', 6, 6)
	setProperty('eyesjumpscare.antialiasing', false)
	setObjectCamera('eyesjumpscare', 'other')
	addLuaSprite('eyesjumpscare', false)
	setProperty('eyesjumpscare.alpha', 0)
	
	makeLuaSprite('iamgod', 'scawy2', 120, 0)
	scaleObject('iamgod', 6, 6)
	setProperty('iamgod.antialiasing', false)
	setObjectCamera('iamgod', 'other')
	addLuaSprite('iamgod', false)
	setProperty('iamgod.alpha', 0)
	
	makeLuaSprite('closejumpscare', 'scawy3', 120, 0)
	scaleObject('closejumpscare', 6, 6)
	setProperty('closejumpscare.antialiasing', false)
	setObjectCamera('closejumpscare', 'other')
	addLuaSprite('closejumpscare', false)
	setProperty('closejumpscare.alpha', 0)
	
	makeLuaSprite('bfjumpscare', 'scawybf', 120, 0)
	scaleObject('bfjumpscare', 6, 6)
	setProperty('bfjumpscare.antialiasing', false)
	setObjectCamera('bfjumpscare', 'other')
	addLuaSprite('bfjumpscare', false)
	setProperty('bfjumpscare.alpha', 0)

--- BACKGROUND IMAGES, VERY UNOPTIMISED AND A LOT OF FUCKING MESS AHEAD LOL I HOPE THE GAME CAN HANDLE THIS FROM A SINGLE LUA FILE ---


--- ANGEL ISLAND

-- flashing bg
	makeAnimatedLuaSprite('firecolour', 'firebgloop', -300, -300)
	addAnimationByPrefix('firecolour', 'firebgloop', 'firebgloop', 8, true)
	objectPlayAnimation('firecolour', 'firebgloop')
    setProperty('firecolour.antialiasing', false)
    scaleObject('firecolour', 10, 10)
    addLuaSprite('firecolour', false)

---

--fire background
	makeAnimatedLuaSprite('firebg', 'fireloop', 0, 300)
	addAnimationByPrefix('firebg', 'fireloop', 'fireloop', 8, true)
	objectPlayAnimation('firebg', 'fireloop')
    setProperty('firebg.antialiasing', false)
    scaleObject('firebg', 4, 4)
    addLuaSprite('firebg', false)
    doTweenX('firebgscroll', 'firebg', -320*4, 2*2, 'linear')
	
	makeAnimatedLuaSprite('firebg2', 'fireloop', -320*4, 300)
	addAnimationByPrefix('firebg2', 'fireloop', 'fireloop', 8, true)
	objectPlayAnimation('firebg2', 'fireloop')
    setProperty('firebg2.antialiasing', false)
    scaleObject('firebg2', 4, 4)
    addLuaSprite('firebg2', false)
    doTweenX('firebgscroll2', 'firebg2', -640*4, 2*2, 'linear')
	
	makeAnimatedLuaSprite('firebg3', 'fireloop', 320*4, 300)
	addAnimationByPrefix('firebg3', 'fireloop', 'fireloop', 8, true)
	objectPlayAnimation('firebg3', 'fireloop')
    setProperty('firebg3.antialiasing', false)
    scaleObject('firebg3', 4, 4)
    addLuaSprite('firebg3', false)
    doTweenX('firebgscroll3', 'firebg3', 0, 2*2, 'linear')
	
---

--AI trees
	makeLuaSprite('trees', 'spriteAI', 0, -30)
    setProperty('trees.antialiasing', false)
    scaleObject('trees', 4, 4)
    addLuaSprite('trees', false)
    doTweenX('treesscroll', 'trees', -2670*4, 12*2, 'linear')

    makeLuaSprite('trees2', 'spriteAI', -2670*4, -30)
    setProperty('trees2.antialiasing', false)
    scaleObject('trees2', 4, 4)
    addLuaSprite('trees2', false)
    doTweenX('treesscroll2', 'trees2', -5340*4, 12*2, 'linear')

    makeLuaSprite('trees3', 'spriteAI', 2670*4, -30)
    setProperty('trees3.antialiasing', false)
    scaleObject('trees3', 4, 4)
    addLuaSprite('trees3', false)
    doTweenX('treesscroll3', 'trees3', 0, 12*2, 'linear')
	
---


--AI top
	makeLuaSprite('top', 'AIleaves', 0, 40)
    setProperty('top.antialiasing', false)
    scaleObject('top', 4, 4)
    addLuaSprite('top', false)
    doTweenX('topscroll', 'top', -2670*4, 10*2, 'linear')

    makeLuaSprite('top2', 'AIleaves', -2670*4, 40)
    setProperty('top2.antialiasing', false)
    scaleObject('top2', 4, 4)
    addLuaSprite('top2', false)
    doTweenX('topscroll2', 'top2', -5340*4, 10*2, 'linear')

    makeLuaSprite('top3', 'AIleaves', 2670*4, 40)
    setProperty('top3.antialiasing', false)
    scaleObject('top3', 4, 4)
    addLuaSprite('top3', false)
    doTweenX('topscroll3', 'top3', 0, 10*2, 'linear')
	
---

--AI front
	makeLuaSprite('AIfront', 'AIfront', 0, -30)
    setProperty('AIfront.antialiasing', false)
    scaleObject('AIfront', 4, 4)
    addLuaSprite('AIfront', false)
    doTweenX('AIfrontscroll', 'AIfront', -2670*4, 8*2, 'linear')

    makeLuaSprite('AIfront2', 'AIfront', -2670*4, -30)
    setProperty('AIfront2.antialiasing', false)
    scaleObject('AIfront2', 4, 4)
    addLuaSprite('AIfront2', false)
    doTweenX('AIfrontscroll2', 'AIfront2', -5340*4, 8*2, 'linear')

    makeLuaSprite('AIfront3', 'AIfront', 2670*4, -30)
    setProperty('AIfront3.antialiasing', false)
    scaleObject('AIfront3', 4, 4)
    addLuaSprite('AIfront3', false)
    doTweenX('AIfrontscroll3', 'AIfront3', 0, 8*2, 'linear')
	
---

--floor	
	makeLuaSprite('floor', 'bg/aifloorburn', 0, 90)
    setProperty('floor.antialiasing', false)
    scaleObject('floor', 4, 4)
    addLuaSprite('floor', false)
    doTweenX('floorscroll', 'floor', -512*4, 1.2*2, 'linear')

    makeLuaSprite('floor2', 'bg/aifloorburn', -512*4, 90)
    setProperty('floor2.antialiasing', false)
    scaleObject('floor2', 4, 4)
    addLuaSprite('floor2', false)
    doTweenX('floorscroll2', 'floor2', -1024*4, 1.2*2, 'linear')

    makeLuaSprite('floor3', 'bg/aifloorburn', 512*4, 90)
    setProperty('floor3.antialiasing', false)
    scaleObject('floor3', 4, 4)
    addLuaSprite('floor3', false)
    doTweenX('floorscroll3', 'floor3', 0, 1.2*2, 'linear')
	
	
--fire foreground
	makeAnimatedLuaSprite('fire', 'fireloop', 0, 670)
	addAnimationByPrefix('fire', 'fireloop', 'fireloop', 8, true)
	objectPlayAnimation('fire', 'fireloop')
    setProperty('fire.antialiasing', false)
	setProperty('fire.alpha', 0.05)
    scaleObject('fire', 4, 4)
    addLuaSprite('fire', false)
    doTweenX('firescroll', 'fire', -320*4, 1, 'linear')
	
	makeAnimatedLuaSprite('fire2', 'firelopp', -320*4, 670)
	addAnimationByPrefix('fire2', 'fireloop', 'fireloop', 8, true)
	objectPlayAnimation('fire2', 'fireloop')
    setProperty('fire2.antialiasing', false)
    scaleObject('fire2', 4, 4)
	setProperty('fire2.alpha', 0.05)
    addLuaSprite('fire2', false)
    doTweenX('firescroll2', 'fire2', -640*4, 1, 'linear')
	
	makeAnimatedLuaSprite('fire3', 'fireloop', 320*4, 670)
	addAnimationByPrefix('fire3', 'fireloop', 'fireloop', 8, true)
	objectPlayAnimation('fire3', 'fireloop')
    setProperty('fire3.antialiasing', false)
    scaleObject('fire3', 4, 4)
	setProperty('fire3.alpha', 0.05)
    addLuaSprite('fire3', false)
    doTweenX('firescroll3', 'fire3', 0, 1, 'linear')
	
	setBlendMode('fire', 'add')
	setBlendMode('fire2', 'add')
	setBlendMode('fire3', 'add')
	
---GREEN HILL ZONE

--top clouds	
	makeLuaSprite('ghclouds', 'ghclouds', 0, 40)
    setProperty('ghclouds.antialiasing', false)
    scaleObject('ghclouds', 4, 4)
    addLuaSprite('ghclouds', false)
    doTweenX('ghcloudsscroll', 'ghclouds', -3840*4, 40, 'linear')

    makeLuaSprite('ghclouds2', 'ghclouds', -3840*4, 40)
    setProperty('ghclouds2.antialiasing', false)
    scaleObject('ghclouds2', 4, 4)
    addLuaSprite('ghclouds2', false)
    doTweenX('ghcloudsscroll2', 'ghclouds2', -7680*4, 40, 'linear')

    makeLuaSprite('ghclouds3', 'ghclouds', 3840*4, 40)
    setProperty('ghclouds3.antialiasing', false)
    scaleObject('ghclouds3', 4, 4)
    addLuaSprite('ghclouds3', false)
    doTweenX('ghcloudsscroll3', 'ghclouds3', 0, 40, 'linear')
	
	setProperty('ghclouds.alpha', 0)
	setProperty('ghclouds2.alpha', 0)
	setProperty('ghclouds3.alpha', 0)
	
--mid clouds	
	makeLuaSprite('ghcloudsB', 'ghcloudsB', 0, 168)
    setProperty('ghcloudsB.antialiasing', false)
    scaleObject('ghcloudsB', 4, 4)
    addLuaSprite('ghcloudsB', false)
    doTweenX('ghcloudsBscroll', 'ghcloudsB', -3840*4, 30, 'linear')

    makeLuaSprite('ghcloudsB2', 'ghcloudsB', -3840*4, 168)
    setProperty('ghcloudsB2.antialiasing', false)
    scaleObject('ghcloudsB2', 4, 4)
    addLuaSprite('ghcloudsB2', false)
    doTweenX('ghcloudsBscroll2', 'ghcloudsB2', -7680*4, 30, 'linear')

    makeLuaSprite('ghcloudsB3', 'ghcloudsB', 3840*4, 168)
    setProperty('ghcloudsB3.antialiasing', false)
    scaleObject('ghcloudsB3', 4, 4)
    addLuaSprite('ghcloudsB3', false)
    doTweenX('ghcloudsBscroll3', 'ghcloudsB3', 0, 30, 'linear')
	
	setProperty('ghcloudsB.alpha', 0)
	setProperty('ghcloudsB2.alpha', 0)
	setProperty('ghcloudsB3.alpha', 0)

--bottom clouds	
	makeLuaSprite('ghcloudsC', 'ghcloudsC', 0, 232)
    setProperty('ghcloudsC.antialiasing', false)
    scaleObject('ghcloudsC', 4, 4)
    addLuaSprite('ghcloudsC', false)
    doTweenX('ghcloudsCscroll', 'ghcloudsC', -3840*4, 25, 'linear')

    makeLuaSprite('ghcloudsC2', 'ghcloudsC', -3840*4, 232)
    setProperty('ghcloudsC2.antialiasing', false)
    scaleObject('ghcloudsC2', 4, 4)
    addLuaSprite('ghcloudsC2', false)
    doTweenX('ghcloudsCscroll2', 'ghcloudsC2', -7680*4, 25, 'linear')

    makeLuaSprite('ghcloudsC3', 'ghcloudsC', 3840*4, 232)
    setProperty('ghcloudsC3.antialiasing', false)
    scaleObject('ghcloudsC3', 4, 4)
    addLuaSprite('ghcloudsC3', false)
    doTweenX('ghcloudsCscroll3', 'ghcloudsC3', 0, 25, 'linear')
	
	setProperty('ghcloudsC.alpha', 0)
	setProperty('ghcloudsC2.alpha', 0)
	setProperty('ghcloudsC3.alpha', 0)
	
-- rocks bg	
	makeLuaSprite('ghrocks', 'ghrocks', 0, 296)
    setProperty('ghrocks.antialiasing', false)
    scaleObject('ghrocks', 4, 4)
    addLuaSprite('ghrocks', false)
    doTweenX('ghrocksscroll', 'ghrocks', -8192*4, 45, 'linear')

    makeLuaSprite('ghrocks2', 'ghrocks', -8192*4, 296)
    setProperty('ghrocks2.antialiasing', false)
    scaleObject('ghrocks2', 4, 4)
    addLuaSprite('ghrocks2', false)
    doTweenX('ghrocksscroll2', 'ghrocks2', -16384*4, 45, 'linear')

    makeLuaSprite('ghrocks3', 'ghrocks', 8192*4, 296)
    setProperty('ghrocks3.antialiasing', false)
    scaleObject('ghrocks3', 4, 4)
    addLuaSprite('ghrocks3', false)
    doTweenX('ghrocksscroll3', 'ghrocks3', 0, 45, 'linear')
	
	setProperty('ghrocks.alpha', 0)
	setProperty('ghrocks2.alpha', 0)
	setProperty('ghrocks3.alpha', 0)
	
	
-- ghz bg
	makeAnimatedLuaSprite('ghbg', 'ghbg', 0, 488)
	addAnimationByPrefix('ghbg', 'ghbg', 'ghbg', 8, true)
	objectPlayAnimation('ghbg', 'ghbg')
    setProperty('ghbg.antialiasing', false)
    scaleObject('ghbg', 4, 4)
    addLuaSprite('ghbg', false)
    doTweenX('ghbgscroll', 'ghbg', -8192*4, 30, 'linear')
	
	makeAnimatedLuaSprite('ghbg2', 'ghbg', -8192*4, 488)
	addAnimationByPrefix('ghbg2', 'ghbg', 'ghbg', 8, true)
	objectPlayAnimation('ghbg2', 'ghbg')
    setProperty('ghbg2.antialiasing', false)
    scaleObject('ghbg2', 4, 4)
    addLuaSprite('ghbg2', false)
    doTweenX('ghbgscroll2', 'ghbg2', -16384*4, 30, 'linear')
	
	makeAnimatedLuaSprite('ghbg3', 'ghbg', 8192*4, 488)
	addAnimationByPrefix('ghbg3', 'ghbg', 'ghbg', 8, true)
	objectPlayAnimation('ghbg3', 'ghbg')
    setProperty('ghbg3.antialiasing', false)
    scaleObject('ghbg3', 4, 4)
    addLuaSprite('ghbg3', false)
    doTweenX('ghbgscroll3', 'ghbg3', 0, 30, 'linear')

	setProperty('ghbg.alpha', 0)
	setProperty('ghbg2.alpha', 0)
	setProperty('ghbg3.alpha', 0)

--- WATER
	makeAnimatedLuaSprite('ghwater', 'ghwater', 0, 648)
	addAnimationByPrefix('ghwater', 'ghwater', 'ghwater', 8, true)
	objectPlayAnimation('ghwater', 'ghwater')
    setProperty('ghwater.antialiasing', false)
    scaleObject('ghwater', 4, 4)
    addLuaSprite('ghwater', false)
    doTweenX('ghwaterscroll', 'ghwater', -3840*4, 10, 'linear')
	
	makeAnimatedLuaSprite('ghwater2', 'ghwater', -3840*4, 648)
	addAnimationByPrefix('ghwater2', 'ghwater', 'ghwater', 8, true)
	objectPlayAnimation('ghwater2', 'ghwater')
    setProperty('ghwater2.antialiasing', false)
    scaleObject('ghwater2', 4, 4)
    addLuaSprite('ghwater2', false)
    doTweenX('ghwaterscroll2', 'ghwater2', -7680*4, 10, 'linear')
	
	makeAnimatedLuaSprite('ghwater3', 'ghwater', 3840*4, 648)
	addAnimationByPrefix('ghwater3', 'ghwater', 'ghwater', 8, true)
	objectPlayAnimation('ghwater3', 'ghwater')
    setProperty('ghwater3.antialiasing', false)
    scaleObject('ghwater3', 4, 4)
    addLuaSprite('ghwater3', false)
    doTweenX('ghwaterscroll3', 'ghwater3', 0, 10, 'linear')
	
	setProperty('ghwater.alpha', 0)
	setProperty('ghwater2.alpha', 0)
	setProperty('ghwater3.alpha', 0)
	
--floor	
	makeLuaSprite('ghfloor', 'ghfloor', 0, 330)
    setProperty('ghfloor.antialiasing', false)
    scaleObject('ghfloor', 4, 4)
    addLuaSprite('ghfloor', false)
    doTweenX('ghfloorscroll', 'ghfloor', -3417*4, 8, 'linear')

    makeLuaSprite('ghfloor2', 'ghfloor', -3417*4, 330)
    setProperty('ghfloor2.antialiasing', false)
    scaleObject('ghfloor2', 4, 4)
    addLuaSprite('ghfloor2', false)
    doTweenX('ghfloorscroll2', 'ghfloor2', -6834*4, 8, 'linear')

    makeLuaSprite('ghfloor3', 'ghfloor', 3417*4, 330)
    setProperty('ghfloor3.antialiasing', false)
    scaleObject('ghfloor3', 4, 4)
    addLuaSprite('ghfloor3', false)
    doTweenX('ghfloorscroll3', 'ghfloor3', 0, 8, 'linear')
	
	setProperty('ghfloor.alpha', 0)
	setProperty('ghfloor2.alpha', 0)
	setProperty('ghfloor3.alpha', 0)
	
--- KNUCKLES STAGE

--kbg1
	makeLuaSprite('kbg1', 'bg/kbg1', 0, 50)
    setProperty('kbg1.antialiasing', false)
    scaleObject('kbg1', 4, 4)
    addLuaSprite('kbg1', false)
    doTweenX('kbg1scroll', 'kbg1', -512*4, 4*2, 'linear')

	makeLuaSprite('kbg1-2', 'bg/kbg1', -512*4, 50)
    setProperty('kbg1-2.antialiasing', false)
    scaleObject('kbg1-2', 4, 4)
    addLuaSprite('kbg1-2', false)
    doTweenX('kbg1scroll2', 'kbg1-2', -1024*4, 4*2, 'linear')
	
	makeLuaSprite('kbg1-3', 'bg/kbg1', 512*4, 50)
    setProperty('kbg1-3.antialiasing', false)
    scaleObject('kbg1-3', 4, 4)
    addLuaSprite('kbg1-3', false)
    doTweenX('kbg1scroll3', 'kbg1-3', 0, 4*2, 'linear')

--kbg2	
	makeLuaSprite('kbg2', 'bg/kbg2', 0, 305)
    setProperty('kbg2.antialiasing', false)
    scaleObject('kbg2', 4, 4)
    addLuaSprite('kbg2', false)
    doTweenX('kbg2scroll', 'kbg2', -512*4, 6*2, 'linear')

	makeLuaSprite('kbg2-2', 'bg/kbg2', -512*4, 305)
    setProperty('kbg2-2.antialiasing', false)
    scaleObject('kbg2-2', 4, 4)
    addLuaSprite('kbg2-2', false)
    doTweenX('kbg2scroll2', 'kbg2-2', -1024*4, 6*2, 'linear')
	
	makeLuaSprite('kbg2-3', 'bg/kbg2', 512*4, 305)
    setProperty('kbg2-3.antialiasing', false)
    scaleObject('kbg2-3', 4, 4)
    addLuaSprite('kbg2-3', false)
    doTweenX('kbg2scroll3', 'kbg2-3', 0, 6*2, 'linear')
	
--kbg3	
	makeLuaSprite('kbg3', 'bg/kbg3', 0, 430)
    setProperty('kbg3.antialiasing', false)
    scaleObject('kbg3', 4, 4)
    addLuaSprite('kbg3', false)
    doTweenX('kbg3scroll', 'kbg3', -512*4, 8*2, 'linear')

	makeLuaSprite('kbg3-2', 'bg/kbg3', -512*4, 430)
    setProperty('kbg3-2.antialiasing', false)
    scaleObject('kbg3-2', 4, 4)
    addLuaSprite('kbg3-2', false)
    doTweenX('kbg3scroll2', 'kbg3-2', -1024*4, 8, 'linear')
	
	makeLuaSprite('kbg3-3', 'bg/kbg3', 512*4, 430)
    setProperty('kbg3-3.antialiasing', false)
    scaleObject('kbg3-3', 4, 4)
    addLuaSprite('kbg3-3', false)
    doTweenX('kbg3scroll3', 'kbg3-3', 0, 8*2, 'linear')
		
--kbg4	
	makeLuaSprite('kbg4', 'bg/kbg4', 0, 620)
    setProperty('kbg4.antialiasing', false)
    scaleObject('kbg4', 4, 4)
    addLuaSprite('kbg4', false)
    doTweenX('kbg4scroll', 'kbg4', -512*4, 10*2, 'linear')

	makeLuaSprite('kbg4-2', 'bg/kbg4', -512*4, 620)
    setProperty('kbg4-2.antialiasing', false)
    scaleObject('kbg4-2', 4, 4)
    addLuaSprite('kbg4-2', false)
    doTweenX('kbg4scroll2', 'kbg4-2', -1024*4, 10*2, 'linear')
	
	makeLuaSprite('kbg4-3', 'bg/kbg4', 512*4, 620)
    setProperty('kbg4-3.antialiasing', false)
    scaleObject('kbg4-3', 4, 4)
    addLuaSprite('kbg4-3', false)
    doTweenX('kbg4scroll3', 'kbg4-3', 0, 10*2, 'linear')
	
--floor	
	makeLuaSprite('knux1', 'bg/knux1', 0, 670)
    setProperty('knux1.antialiasing', false)
    scaleObject('knux1', 4, 4)
    addLuaSprite('knux1', false)
    doTweenX('knux1scroll', 'knux1', -1504*4, 5*2, 'linear')

	makeLuaSprite('knux1-2', 'bg/knux1', -1504*4, 670)
    setProperty('knux1-2.antialiasing', false)
    scaleObject('knux1-2', 4, 4)
    addLuaSprite('knux1-2', false)
    doTweenX('knux1scroll2', 'knux1-2', -3008*4, 5*2, 'linear')
	
	makeLuaSprite('knux1-3', 'bg/knux1', 1504*4, 670)
    setProperty('knux1-3.antialiasing', false)
    scaleObject('knux1-3', 4, 4)
    addLuaSprite('knux1-3', false)
    doTweenX('knux1scroll3', 'knux1-3', 0, 5*2, 'linear')
	
---EGG
	makeLuaSprite('eggbg', 'bg/eggbg', 0, 50)
    setProperty('eggbg.antialiasing', false)
    scaleObject('eggbg', 4, 4)
    addLuaSprite('eggbg', false)
    doTweenX('eggbgscroll', 'eggbg', -512*4, 3*2, 'linear')
	
	makeLuaSprite('eggbg2', 'bg/eggbg', -512*4, 50)
    setProperty('eggbg2.antialiasing', false)
    scaleObject('eggbg2', 4, 4)
    addLuaSprite('eggbg2', false)
    doTweenX('eggbgscroll2', 'eggbg2', -1024*4, 3*2, 'linear')

	makeLuaSprite('eggbg3', 'bg/eggbg', 512*4, 50)
    setProperty('eggbg3.antialiasing', false)
    scaleObject('eggbg3', 4, 4)
    addLuaSprite('eggbg3', false)
    doTweenX('eggbgscroll3', 'eggbg3', 0, 2*2, 'linear')
	
	makeAnimatedLuaSprite('eggfloor', 'bg/eggstageanimated', 0, 420)
	addAnimationByPrefix('eggfloor', 'eggstageanimated', 'idle', 12, true)
	objectPlayAnimation('eggfloor', 'eggstageanimated')
    setProperty('eggfloor.antialiasing', false)
    scaleObject('eggfloor', 4, 4)
    addLuaSprite('eggfloor', false)
    doTweenX('eggfloorscroll', 'eggfloor', -512*4, 2*2, 'linear')
	
	makeAnimatedLuaSprite('eggfloor2', 'bg/eggstageanimated', -512*4, 420)
	addAnimationByPrefix('eggfloor2', 'eggstageanimated', 'idle', 12, true)
	objectPlayAnimation('eggfloor2', 'eggstageanimated')
    setProperty('eggfloor2.antialiasing', false)
    scaleObject('eggfloor2', 4, 4)
    addLuaSprite('eggfloor2', false)
    doTweenX('eggfloorscroll2', 'eggfloor2', -1024*4, 2*2, 'linear')
	
	makeAnimatedLuaSprite('eggfloor3', 'bg/eggstageanimated', 512*4, 420)
	addAnimationByPrefix('eggfloor3', 'eggstageanimated', 'idle', 12, true)
	objectPlayAnimation('eggfloor3', 'eggstageanimated')
    setProperty('eggfloor3.antialiasing', false)
    scaleObject('eggfloor3', 4, 4)
    addLuaSprite('eggfloor3', false)
    doTweenX('eggfloorscroll3', 'eggfloor3', 0, 2*2, 'linear')
	
	makeAnimatedLuaSprite('curtains', 'bg/curtainsanimated', 0, 0)
	addAnimationByPrefix('curtains', 'curtain', 'idle', 12, true)
	objectPlayAnimation('curtains', 'curtain')
    setProperty('curtains.antialiasing', false)
    scaleObject('curtains', 4, 4)
    addLuaSprite('curtains', false)
	setObjectCamera('curtains', 'HUD')
	setProperty('curtains.alpha', 0)
	
	makeLuaSprite('curtainstop', 'bg/curtainstop', 0, 0)
    setProperty('curtainstop.antialiasing', false)
    scaleObject('curtainstop', 4, 4)
    addLuaSprite('curtainstop', false)
	setObjectCamera('curtainstop', 'HUD')
	setProperty('curtainstop.alpha', 0)
	
---AI NORMAL

--SKY
	makeLuaSprite('back', 'bg/aiback', 0, 112)
    setProperty('back.antialiasing', false)
    scaleObject('back', 3, 3)
    addLuaSprite('back', false)
    doTweenX('backscroll', 'back', -512*3, 4*2, 'linear')

    makeLuaSprite('back2', 'bg/aiback', -512*3, 112)
    setProperty('back2.antialiasing', false)
    scaleObject('back2', 3, 3)
    addLuaSprite('back2', false)
    doTweenX('backscroll2', 'back2', -1024*3, 4*2, 'linear')

    makeLuaSprite('back3', 'bg/aiback', 512*3, 112)
    setProperty('back3.antialiasing', false)
    scaleObject('back3', 3, 3)
    addLuaSprite('back3', false)
    doTweenX('backscroll3', 'back3', 0, 4*2, 'linear')
	
--SKY
	makeLuaSprite('green', 'bg/aigreen', 0, 400)
    setProperty('green.antialiasing', false)
    scaleObject('green', 3, 3)
    addLuaSprite('green', false)
    doTweenX('greenscroll', 'green', -512*3, 2*2, 'linear')

    makeLuaSprite('green2', 'bg/aigreen', -512*3, 400)
    setProperty('green2.antialiasing', false)
    scaleObject('green2', 3, 3)
    addLuaSprite('green2', false)
    doTweenX('greenscroll2', 'green2', -1024*3, 2*2, 'linear')

    makeLuaSprite('green3', 'bg/aigreen', 512*3, 400)
    setProperty('green3.antialiasing', false)
    scaleObject('green3', 3, 3)
    addLuaSprite('green3', false)
    doTweenX('greenscroll3', 'green3', 0, 2*2, 'linear')
	
--floor	
	makeLuaSprite('floorn', 'bg/aifloor', 0, 20)
    setProperty('floorn.antialiasing', false)
    scaleObject('floorn', 4, 4)
    addLuaSprite('floorn', false)
    doTweenX('floornscroll', 'floorn', -512*4, 1.2*2, 'linear')

    makeLuaSprite('floorn2', 'bg/aifloor', -512*4, 20)
    setProperty('floorn2.antialiasing', false)
    scaleObject('floorn2', 4, 4)
    addLuaSprite('floorn2', false)
    doTweenX('floornscroll2', 'floorn2', -1024*4, 1.2*2, 'linear')

    makeLuaSprite('floorn3', 'bg/aifloor', 512*4, 20)
    setProperty('floorn3.antialiasing', false)
    scaleObject('floorn3', 4, 4)
    addLuaSprite('floorn3', false)
    doTweenX('floornscroll3', 'floorn3', 0, 1.2*2, 'linear')
	
	makeLuaSprite('blackbg', 'black', -300, -300)
    setProperty('blackbg.antialiasing', false)
    scaleObject('blackbg', 10, 10)
    addLuaSprite('blackbg', false)
	--setObjectOrder('blackbg', getObjectOrder('gfGroup')-1)
	setProperty('blackbg.alpha', 0)
	
	makeLuaSprite('score','hud/score', 200, 25)
	setScrollFactor('score', 0, 0)
	setObjectCamera('score', 'hud')
	setProperty('score.antialiasing', false)
	scaleObject('score', 4, 4)
	addLuaSprite('score',false)
	setProperty('score.alpha',0)
	
	makeLuaSprite('time','hud/time', 200, 90)
	setScrollFactor('time', 0, 0)
	setObjectCamera('time', 'hud')
	setProperty('time.antialiasing', false)
	scaleObject('time', 4, 4)
	addLuaSprite('time',false)
	setProperty('time.alpha',0)
	
	makeLuaSprite('misses','hud/misses', 200, 155)
	setScrollFactor('misses', 0, 0)
	setObjectCamera('misses', 'hud')
	setProperty('misses.antialiasing', false)
	scaleObject('misses', 4, 4)
	addLuaSprite('misses',false)
	setProperty('misses.alpha',0)
	
	makeLuaSprite('hud2', 'hud/hudlife', 135, 620)
    scaleObject('hud2', 4, 4)
    setProperty('hud2.antialiasing', false)
    setObjectCamera('hud2', 'hud')
    addLuaSprite('hud2')
	setProperty('hud2.alpha', 0)
	
    makeLuaSprite('hud3', 'hud/hudlifelosing', 135, 620)
    scaleObject('hud3', 4, 4)
    setProperty('hud3.antialiasing', false)
    setObjectCamera('hud3', 'hud')
    addLuaSprite('hud3')
    setProperty('hud3.visible', false)
	
	makeLuaText('sonicscoreblack', '000000', 0, 389, 16)
	setProperty('sonicscoreblack.borderSize', 0)
	setProperty('sonicscoreblack.antialiasing', false)
	setTextFont('sonicscoreblack', 'sonichud.ttf')
	setTextSize('sonicscoreblack', 8*8, 8*8)
	setScrollFactor('sonicscoreblack', 0, 0)
	setTextColor('sonicscoreblack' , '000000')
	addLuaText('sonicscoreblack')
	setProperty('sonicscoreblack.alpha',0)
	
	makeLuaText('sonicscore', '000000', 0, 385, 12)
	setProperty('sonicscore.borderSize', 0)
	setProperty('sonicscore.antialiasing', false)
	setTextFont('sonicscore', 'sonichud.ttf')
	setTextSize('sonicscore', 8*8, 8*8)
	setScrollFactor('sonicscore', 0, 0)
	addLuaText('sonicscore')
	setProperty('sonicscore.alpha',0)
	
	makeLuaText('sonicmissesblack', '0', 0, 454, 144)
	setProperty('sonicmissesblack.borderSize', 0)
	setProperty('sonicmissesblack.antialiasing', false)
	setTextFont('sonicmissesblack', 'sonichud.ttf')
	setTextSize('sonicmissesblack', 8*8, 8*8)
	setScrollFactor('sonicmissesblack', 0, 0)
	setTextColor('sonicmissesblack' , '000000')
	setTextAlignment('sonicmissesblack','right')
	addLuaText('sonicmissesblack')
	setProperty('sonicmissesblack.alpha',0)
	
	makeLuaText('sonicmisses', '0', 0, 450, 140)
	setProperty('sonicmisses.borderSize', 0)
	setProperty('sonicmisses.antialiasing', false)
	setTextFont('sonicmisses', 'sonichud.ttf')
	setTextSize('sonicmisses', 8*8, 8*8)
	setScrollFactor('sonicmisses', 0, 0)
	setTextAlignment('sonicmisses','right')
	addLuaText('sonicmisses')
	setProperty('sonicmisses.alpha',0)
	
	makeLuaText('sonictimeblack', '0', 0, 357, 79)
	setProperty('sonictimeblack.borderSize', 0)
	setProperty('sonictimeblack.antialiasing', false)
	setTextFont('sonictimeblack', 'sonichud.ttf')
	setTextSize('sonictimeblack', 8*8, 8*8)
	setScrollFactor('sonictimeblack', 0, 0)
	setTextColor('sonictimeblack' , '000000')
	setTextAlignment('sonictimeblack','right')
	addLuaText('sonictimeblack')
	setProperty('sonictimeblack.alpha',0)
	
	makeLuaText('sonictime', '0', 0, 353, 75)
	setProperty('sonictime.borderSize', 0)
	setProperty('sonictime.antialiasing', false)
	setTextFont('sonictime', 'sonichud.ttf')
	setTextSize('sonictime', 8*8, 8*8)
	setScrollFactor('sonictime', 0, 0)
	setTextAlignment('sonictime','right')
	addLuaText('sonictime')
	setProperty('sonictime.alpha',0)
	
--- BAD ENDING STUFF

	makeAnimatedLuaSprite('sonicrunnin', 'characters/sonic', 480, 500)
	addAnimationByPrefix('sonicrunnin', 'sonicrunnin', 'sonic idle', 19, true)
	objectPlayAnimation('sonicrunnin', 'sonicrunnin')
	setProperty('sonicrunnin.antialiasing', false)
	setProperty('sonicrunnin.flipX', true) 
	scaleObject('sonicrunnin', 4, 4)
	addLuaSprite('sonicrunnin', false)
	setProperty('sonicrunnin.alpha', 0)
end

function onCreatePost()
	setProperty('dad.x', -250)
	setProperty('gf.x', -310)
	setProperty('boyfriend.alpha',0)
	
	setProperty('iconP2.alpha', 0)
	setProperty('health', 2)
	for i = 0, getProperty('opponentStrums.length') do
		setPropertyFromGroup('opponentStrums', 0, 'x', 0);
		setPropertyFromGroup('opponentStrums', 1, 'x', 0);
		setPropertyFromGroup('opponentStrums', 2, 'x', 0);
		setPropertyFromGroup('opponentStrums', 3, 'x', 0);
	end
	
    for i = 0,7 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
    end
	
	for i = 0, getProperty('opponentStrums.length') do -- do unvisible a opponent strumline
		setPropertyFromGroup('opponentStrums', i, 'visible', false);
	end

	setProperty('SonicNormal.alpha', 0)
	setProperty('SonicPain.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('healthBar.alpha', 0)
	setProperty('healthBarBG.alpha', 0)
	setProperty('scoreTxt.alpha', 0)	
	
	---sonic's legs
	makeAnimatedLuaSprite('soniclegs', 'characters/soniclegs', getProperty('boyfriend.x')-63, getProperty('boyfriend.y')+3)
	addAnimationByPrefix('soniclegs', 'soniclegs', 'soniclegs', 24, true)
	setProperty('soniclegs.antialiasing', false)
	scaleObject('soniclegs', 4, 4)
	addLuaSprite('soniclegs', false)
	setObjectOrder('soniclegs', dadGroup-0.1)
	setProperty('soniclegs.flipX',true)
	setProperty('soniclegs.visible', false)

	makeAnimatedLuaSprite('soniclegsoverlay', 'characters/soniclegsoverlay', getProperty('soniclegs.x'), getProperty('soniclegs.y'))
	addAnimationByPrefix('soniclegsoverlay', 'soniclegsoverlay', 'soniclegsoverlay', 24, true)
	objectPlayAnimation('soniclegsoverlay', 'soniclegsoverlay')
	objectPlayAnimation('soniclegs', 'soniclegs')
	setProperty('soniclegsoverlay.antialiasing', false)
	scaleObject('soniclegsoverlay', 4, 4)
	addLuaSprite('soniclegsoverlay', false)
	setObjectOrder('soniclegsoverlay', dadGroup+2)
	setProperty('soniclegsoverlay.flipX',true)
	setProperty('soniclegsoverlay.visible', false)

	makeAnimatedLuaSprite('peeloutlegs', 'characters/sonicpeelout', getProperty('boyfriend.x')-24*4, getProperty('boyfriend.y')+4)
	addAnimationByPrefix('peeloutlegs', 'peeloutlegs', 'legs', 24, true)
	objectPlayAnimation('peeloutlegs', 'peeloutlegs')
	setProperty('peeloutlegs.antialiasing', false)
	scaleObject('peeloutlegs', 4, 4)
	setProperty('peeloutlegs.visible', false)
	setObjectOrder('peeloutlegs', dadGroup+2)
	addLuaSprite('peeloutlegs', false)
	
	---bf's legs
	makeAnimatedLuaSprite('bflegs', 'characters/bflegs', getProperty('gf.x')-60, getProperty('gf.y')+3)
	addAnimationByPrefix('bflegs', 'slow', 'runfire', 10, true)
	addAnimationByPrefix('bflegs', 'normal', 'run', 12, true)
	addAnimationByPrefix('bflegs', 'fast', 'runsmall', 24, true)
	objectPlayAnimation('bflegs', 'slow')
	setProperty('bflegs.antialiasing', false)
	scaleObject('bflegs', 4, 4)
	addLuaSprite('bflegs', false)
	setProperty('bflegs.flipX',true)
	setProperty('bflegs.visible', false)

	
	---exe flying
	doTweenY('startfly','dad', getProperty('dad.y')+10, 0.5, 'quadOut')
end

function onTweenCompleted(tag, elapsed)
    if tag == 'startfly' then
		doTweenY('updown','dad', getProperty('dad.y')-40, 0.5, 'quadInOut')
    end
	
    if tag == 'updown' then
		doTweenY('downup','dad', getProperty('dad.y')+20, 0.5*twnspd, 'quadInOut')
    end
	
    if tag == 'downup' then
		doTweenY('updown','dad', getProperty('dad.y')-20, 0.5*twnspd, 'quadInOut')
    end
	
	--SCROLL
    if tag == 'floorscroll2' then
        setProperty('floor.x', 0)
        setProperty('floor2.x', -512*4)
        setProperty('floor3.x', 512*4)
		doTweenX('floorscroll', 'floor', -512*4, 1.2*2, 'linear')
		doTweenX('floorscroll2', 'floor2', -1024*4, 1.2*2, 'linear')
		doTweenX('floorscroll3', 'floor3', 0, 1.2*2, 'linear')
    end
	
    if tag == 'floornscroll2' then
        setProperty('floorn.x', 0)
        setProperty('floorn2.x', -512*4)
        setProperty('floorn3.x', 512*4)
		doTweenX('floornscroll', 'floorn', -512*4, 1.2*2, 'linear')
		doTweenX('floornscroll2', 'floorn2', -1024*4, 1.2*2, 'linear')
		doTweenX('floornscroll3', 'floorn3', 0, 1.2*2, 'linear')
    end
	
    if tag == 'backscroll2' then
        setProperty('back.x', 0)
        setProperty('back2.x', -512*3)
        setProperty('back3.x', 512*3)
		doTweenX('backscroll', 'back', -512*3, 4*2, 'linear')
		doTweenX('backscroll2', 'back2', -1024*3, 4*2, 'linear')
		doTweenX('backscroll3', 'back3', 0, 4*2, 'linear')
    end
	
    if tag == 'greenscroll2' then
        setProperty('green.x', 0)
        setProperty('green2.x', -512*3)
        setProperty('green3.x', 512*3)
		doTweenX('greenscroll', 'green', -512*3, 2*2, 'linear')
		doTweenX('greenscroll2', 'green2', -1024*3, 2*2, 'linear')
		doTweenX('greenscroll3', 'green3', 0, 2*2, 'linear')
    end
	
    if tag == 'firebgscroll2' then
        setProperty('firebg.x', 0)
        setProperty('firebg2.x', -320*4)
        setProperty('firebg3.x', 320*4)
        doTweenX('firebgscroll', 'firebg', -320*4, 2*2, 'linear')
        doTweenX('firebgscroll2', 'firebg2', -640*4, 2*2, 'linear')
        doTweenX('firebgscroll3', 'firebg3', 0, 2*2, 'linear')
    end
	
    if tag == 'firescroll2' then
        setProperty('fire.x', 0-50)
        setProperty('fire2.x', (-320*4)-50)
        setProperty('fire3.x', (320*4-50))
        doTweenX('firescroll', 'fire', (-320*4)-50, 0.5*2, 'linear')
        doTweenX('firescroll2', 'fire2', (-640*4)-50, 0.5*2, 'linear')
        doTweenX('firescroll3', 'fire3', 0-50, 0.5*2, 'linear')
    end
	
    if tag == 'AIfrontscroll2' then
        setProperty('AIfront.x', 0)
        setProperty('AIfront2.x', -2670*4)
        setProperty('AIfront3.x', 2670*4)
        doTweenX('AIfrontscroll', 'AIfront', -2670*4, 8*2, 'linear')
        doTweenX('AIfrontscroll2', 'AIfront2', -5340*4, 8*2, 'linear')
        doTweenX('AIfrontscroll3', 'AIfront3', 0, 8*2, 'linear')
    end

    if tag == 'treesscroll2' then
        setProperty('trees.x', 0)
        setProperty('trees2.x', -2670*4)
        setProperty('trees3.x', 2670*4)
        doTweenX('treesscroll', 'trees', -2670*4, 12*2, 'linear')
        doTweenX('treesscroll2', 'trees2', -5340*4, 12*2, 'linear')
        doTweenX('treesscroll3', 'trees3', 0, 12*2, 'linear')
    end
	
    if tag == 'topscroll2' then
        setProperty('top.x', 0)
        setProperty('top2.x', -2670*4)
        setProperty('top3.x', 2670*4)
        doTweenX('topscroll', 'top', -2670*4, 10*2, 'linear')
        doTweenX('topscroll2', 'top2', -5340*4, 10*2, 'linear')
        doTweenX('topscroll3', 'top3', 0, 10*2, 'linear')
    end
	
	---GREEN HILL
    if tag == 'ghfloorscroll2' then
        setProperty('ghfloor.x', 0)
        setProperty('ghfloor2.x', -3417*4)
        setProperty('ghfloor3.x', 3417*4)
		doTweenX('ghfloorscroll', 'ghfloor', -3417*4, 8*2, 'linear')
		doTweenX('ghfloorscroll2', 'ghfloor2', -6834*4, 8*2, 'linear')
		doTweenX('ghfloorscroll3', 'ghfloor3', 0, 8*2, 'linear')
    end
	
    if tag == 'ghwaterscroll2' then
        setProperty('ghwater.x', 0)
        setProperty('ghwater2.x', -3840*4)
        setProperty('ghwater3.x', 3840*4)
        doTweenX('ghwaterscroll', 'ghwater', -3840*4, 8*2, 'linear')
        doTweenX('ghwaterscroll2', 'ghwater2', -7680*4, 8*2, 'linear')
        doTweenX('ghwaterscroll3', 'ghwater3', 0, 8*2, 'linear')
    end

    if tag == 'ghcloudsscroll2' then
        setProperty('ghclouds.x', 0)
        setProperty('ghclouds2.x', -3840*4)
        setProperty('ghclouds3.x', 3840*4)
        doTweenX('ghcloudsscroll', 'ghclouds', -3840*4, 40*2, 'linear')
        doTweenX('ghcloudsscroll2', 'ghclouds2', -7680*4, 40*2, 'linear')
        doTweenX('ghcloudsscroll3', 'ghclouds3', 0, 40*2, 'linear')
    end
	
    if tag == 'ghcloudsBscroll2' then
        setProperty('ghcloudsB.x', 0)
        setProperty('ghcloudsB2.x', -3840*4)
        setProperty('ghcloudsB3.x', 3840*4)
        doTweenX('ghcloudsBscroll', 'ghcloudsB', -3840*4, 30*2, 'linear')
        doTweenX('ghcloudsBscroll2', 'ghcloudsB2', -7680*4, 30*2, 'linear')
        doTweenX('ghcloudsBscroll3', 'ghcloudsB3', 0, 30*2, 'linear')
    end
	
    if tag == 'ghcloudsCscroll2' then
        setProperty('ghcloudsC.x', 0)
        setProperty('ghcloudsC2.x', -3840*4)
        setProperty('ghcloudsC3.x', 3840*4)
        doTweenX('ghcloudsCscroll', 'ghcloudsC', -3840*4, 25*2, 'linear')
        doTweenX('ghcloudsCscroll2', 'ghcloudsC2', -7680*4, 25*2, 'linear')
        doTweenX('ghcloudsCscroll3', 'ghcloudsC3', 0, 25*2, 'linear')
    end
	
    if tag == 'ghrocksscroll2' then
        setProperty('ghrocks.x', 0)
        setProperty('ghrocks2.x', -8192*4)
        setProperty('ghrocks3.x', 8192*4)
        doTweenX('ghrocksscroll', 'ghrocks', -8192*4, 45*2, 'linear')
        doTweenX('ghrocksscroll2', 'ghrocks2', -16384*4, 45*2, 'linear')
        doTweenX('ghrocksscroll3', 'ghrocks3', 0, 45*2, 'linear')
    end

    if tag == 'ghbgscroll2' then
        setProperty('ghbg.x', 0)
        setProperty('ghbg2.x', -8192*4)
        setProperty('ghbg3.x', 8192*4)
        doTweenX('ghbgscroll', 'ghbg', -8192*4, 30*2, 'linear')
        doTweenX('ghbgscroll2', 'ghbg2', -16384*4, 30*2, 'linear')
        doTweenX('ghbgscroll3', 'ghbg3', 0, 30*2, 'linear')
    end
	
	---KNUCKLES STAGE
    if tag == 'kbg1scroll2' then
        setProperty('kbg1.x', 0)
        setProperty('kbg1-2.x', -512*4)
        setProperty('kbg1-3.x', 512*4)
        doTweenX('kbg1scroll', 'kbg1', -512*4, 4*2, 'linear')
        doTweenX('kbg1scroll2', 'kbg1-2', -1024*4, 4*2, 'linear')
        doTweenX('kbg1scroll3', 'kbg1-3', 0, 4*2, 'linear')
    end
	
    if tag == 'kbg2scroll2' then
        setProperty('kbg2.x', 0)
        setProperty('kbg2-2.x', -512*4)
        setProperty('kbg2-3.x', 512*4)
        doTweenX('kbg2scroll', 'kbg2', -512*4, 6*2, 'linear')
        doTweenX('kbg2scroll2', 'kbg2-2', -1024*4, 6*2, 'linear')
        doTweenX('kbg2scroll3', 'kbg2-3', 0, 6*2, 'linear')
    end
	
    if tag == 'kbg3scroll2' then
        setProperty('kbg3.x', 0)
        setProperty('kbg3-2.x', -512*4)
        setProperty('kbg3-3.x', 512*4)
        doTweenX('kbg3scroll', 'kbg3', -512*4, 8*2, 'linear')
        doTweenX('kbg3scroll2', 'kbg3-2', -1024*4, 8*2, 'linear')
        doTweenX('kbg3scroll3', 'kbg3-3', 0, 8*2, 'linear')
    end
	
    if tag == 'kbg4scroll2' then
        setProperty('kbg4.x', 0)
        setProperty('kbg4-2.x', -512*4)
        setProperty('kbg4-3.x', 512*4)
        doTweenX('kbg4scroll', 'kbg4', -512*4, 10*2, 'linear')
        doTweenX('kbg4scroll2', 'kbg4-2', -1024*4, 10*2, 'linear')
        doTweenX('kbg4scroll3', 'kbg4-3', 0, 10*2, 'linear')
    end
	
    if tag == 'knux1scroll2' then
        setProperty('knux1.x', 0)
        setProperty('knux1-2.x', -1504*4)
        setProperty('knux1-3.x', 1504*4)
        doTweenX('knux1scroll', 'knux1', -1504*4, 4*2, 'linear')
        doTweenX('knux1scroll2', 'knux1-2', -3008*4, 4*2, 'linear')
        doTweenX('knux1scroll3', 'knux1-3', 0, 4*2, 'linear')
    end
	
	if tag == 'eggbgscroll2' then
        setProperty('eggbg.x', 0)
        setProperty('eggbg2.x', -512*4)
        setProperty('eggbg3.x', 512*4)
        doTweenX('eggbgscroll', 'eggbg', -512*4, 1.5*2, 'linear')
        doTweenX('eggbgscroll2', 'eggbg2', -1024*4, 1.5*2, 'linear')
        doTweenX('eggbgscroll3', 'eggbg3', 0, 1.5*2, 'linear')
	end

	if tag == 'eggfloorscroll2' then
        setProperty('eggfloor.x', 0)
        setProperty('eggfloor2.x', -512*4)
        setProperty('eggfloor3.x', 512*4)
        doTweenX('eggfloorscroll', 'eggfloor', -512*4, 1.5*2, 'linear')
        doTweenX('eggfloorscroll2', 'eggfloor2', -1024*4, 1.5*2, 'linear')
        doTweenX('eggfloorscroll3', 'eggfloor3', 0, 1.5*2, 'linear')
	end
	
	if tag =='goodendingfade1' then
		doTweenAlpha('goodendingfade2', 'dad', 0.25, 0.4, 'linear')
	end
		
	if tag =='goodendingfade2' then
		doTweenAlpha('goodendingfade1', 'dad', 0.5, 0.4, 'linear')
	end
	
--- BAD ENDING
		if tag == 'smaltimer' then
			makeAnimatedLuaSprite('xeno', 'gameoversheet', 1080, 500)
			addAnimationByPrefix('xeno', 'xeno1', 'didyouforgetaboutME', 14, true)
			addAnimationByPrefix('xeno', 'xeno2', 'gotcha', 14, true)
			objectPlayAnimation('xeno', 'xeno1')
			setProperty('xeno.antialiasing', false)
			scaleObject('xeno', 4, 4)
			addLuaSprite('xeno', true)
			doTweenX('slidin', 'xeno', 540, 0.4, 'quadOut')
			removeLuaSprite('sonicrunnin')
			makeAnimatedLuaSprite('sonicskid', 'gameoversheet', 480, 500)
			addAnimationByPrefix('sonicskid', 'sonicskid', 'skid', 15, false)
			addAnimationByPrefix('sonicskid', 'turns', 'turns', 15, false)
			addAnimationByPrefix('sonicskid', 'death', 'death', 15, false)
			objectPlayAnimation('sonicskid', 'sonicskid')
			setProperty('sonicskid.antialiasing', false)
			scaleObject('sonicskid', 4, 4)
			addLuaSprite('sonicskid', true)
			doTweenX('anotherliltimer', 'sonicskid', 480, 0.19)
		end
		if tag == 'anotherliltimer' then
			objectPlayAnimation('sonicskid', 'turns')	
		end
		if tag == 'slidin' then
			objectPlayAnimation('xeno', 'xeno2')
			objectPlayAnimation('sonicskid', 'death')
			doTweenX('sillytimer', 'sonicskid', 480, 0.09)	
		end
		if tag == 'sillytimer' then
			makeLuaSprite('red', 'red', -100, -100)
			scaleObject('red', 6, 6)
			addLuaSprite('red', false)
			setProperty('sonicskid.color', 000000)
			setProperty('xeno.color', 000000)
			setProperty('AIfloor.color', 000000)
			doTweenAlpha('red', 'red', 0, 0.55, sineIn)	
			doTweenX('guesswhatwhatchickenbutt', 'aspect', -80, 1)	
		end
		if tag == 'guesswhatwhatchickenbutt' then
			removeLuaSprite('xeno')
			removeLuaSprite('sonicskid')
			makeAnimatedLuaSprite('games', 'gameoversheet', -670, 550)
			addAnimationByPrefix('games', 'games', 'game1', 15, false)
			objectPlayAnimation('games', 'games')
			setProperty('games.antialiasing', false)
			scaleObject('games', 4, 4)
			addLuaSprite('games', true)
			doTweenX('gameslide', 'games', 300, 0.7)

			makeAnimatedLuaSprite('over', 'gameoversheet', 1570, 550)
			addAnimationByPrefix('over', 'over', 'over', 15, false)
			objectPlayAnimation('over', 'over')
			setProperty('over.antialiasing', false)
			scaleObject('over', 4, 4)
			addLuaSprite('over', true)
			doTweenX('overslide', 'over', 580, 0.7)
		end
end

function onUpdate(elapsed)


	setProperty('camZooming', false)
--failed code that lets bf bounce while singing, commented out to maybe come back to it
--[[
    bfLegFrame = getProperty("bflegs.animation.curAnim.curFrame")
    if getProperty("bflegs.visible") == true then
        if bfLegFrame == 0 then
            setProperty("gf.offset.y", 4)
            setProperty("gf.offset.x", 4)
        elseif bfLegFrame == 1 then
            setProperty("gf.offset.y", 0)
            setProperty("gf.offset.x", 0)
        elseif bfLegFrame == 2 then
            setProperty("gf.offset.y", -4)
            setProperty("gf.offset.x", -4)
        elseif bfLegFrame == 3 then
            setProperty("gf.offset.y", 4)
            setProperty("gf.offset.x", 4)
        elseif bfLegFrame == 4 then
            setProperty("gf.offset.y", 0)
            setProperty("gf.offset.x", 0)
        elseif bfLegFrame == 5 then
            setProperty("gf.offset.y", -4)
            setProperty("gf.offset.x", -4)
        end
    end
--]]

	if curStep == 143 then
		doTweenAlpha('score', 'score', 1, 0.7, 'linear')
		doTweenAlpha('time', 'time', 1, 0.7, 'linear')
		doTweenAlpha('misses', 'misses', 1, 0.7, 'linear')
		doTweenAlpha('hud2', 'hud2', 1, 0.7, 'linear')
		doTweenAlpha('sonicscore', 'sonicscore', 1, 0.7, 'linear')
		doTweenAlpha('sonicscoreblack', 'sonicscoreblack', 1, 0.7, 'linear')
		doTweenAlpha('sonictime', 'sonictime', 1, 0.7, 'linear')
		doTweenAlpha('sonictimeblack', 'sonictimeblack', 1, 0.7, 'linear')
		doTweenAlpha('sonicmisses', 'sonicmisses', 1, 0.7, 'linear')
		doTweenAlpha('sonicmissesblack', 'sonicmissesblack', 1, 0.7, 'linear')
	end
	
	if misses < 99 then
		setTextString('sonicmisses', misses)
		setTextString('sonicmissesblack', misses)
	else
		setTextString('sonicmisses', 99)
		setTextString('sonicmissesblack', 99)
	end
	
	if misses >= 20 and badending == false and blackout == false then
		runTimer('blink1', 0.5)
		setProperty('misses.alpha', 0)
		if curStep < 2959 then
			setProperty('hud3.visible', true)
		end
		badending = true
	end
	
	if curStep >= 255 and curStep < 287 then
		cancelTimer('blink1')
		cancelTimer('blink2')
		setProperty('misses.alpha', 0)
		setProperty('time.alpha', 0)
		setProperty('score.alpha', 0)
		setProperty('hud2.alpha', 0)
		setProperty('hud3.alpha', 0)
		setProperty('sonicmisses.alpha', 0)
		setProperty('sonicmissesblack.alpha', 0)
		setProperty('sonictime.alpha', 0)
		setProperty('sonictimeblack.alpha', 0)
		setProperty('sonicscore.alpha', 0)
		setProperty('sonicscoreblack.alpha', 0)
		blackout = true
	end
	
	if curStep == 287 then
		setProperty('misses.alpha', 1)
		setProperty('time.alpha', 1)
		setProperty('score.alpha', 1)
		setProperty('hud2.alpha', 1)
		setProperty('hud3.alpha', 1)
		setProperty('sonicmisses.alpha', 1)
		setProperty('sonicmissesblack.alpha', 1)
		setProperty('sonictime.alpha', 1)
		setProperty('sonictimeblack.alpha', 1)
		setProperty('sonicscore.alpha', 1)
		setProperty('sonicscoreblack.alpha', 1)
		blackout = false
		badending = false
	end
	
	if curStep >= 2960 and curStep < 3263 then
		cancelTimer('blink1')
		cancelTimer('blink2')
		setProperty('misses.alpha', 0)
		setProperty('time.alpha', 0)
		setProperty('score.alpha', 0)
		setProperty('hud2.alpha', 0)
		setProperty('hud3.alpha', 0)
		setProperty('sonicmisses.alpha', 0)
		setProperty('sonicmissesblack.alpha', 0)
		setProperty('sonictime.alpha', 0)
		setProperty('sonictimeblack.alpha', 0)
		setProperty('sonicscore.alpha', 0)
		setProperty('sonicscoreblack.alpha', 0)
		blackout = true
	end
	
	if curStep == 3263 then
		setProperty('misses.alpha', 1)
		setProperty('time.alpha', 1)
		setProperty('score.alpha', 1)
		setProperty('hud2.alpha', 1)
		setProperty('hud3.alpha', 1)
		setProperty('sonicmisses.alpha', 1)
		setProperty('sonicmissesblack.alpha', 1)
		setProperty('sonictime.alpha', 1)
		setProperty('sonictimeblack.alpha', 1)
		setProperty('sonicscore.alpha', 1)
		setProperty('sonicscoreblack.alpha', 1)
		blackout = false
		badending = false
	end
	
	if curStep >= 3775 then
		cancelTimer('blink1')
		cancelTimer('blink2')
		setProperty('misses.alpha', 0)
		setProperty('time.alpha', 0)
		setProperty('score.alpha', 0)
		setProperty('hud2.alpha', 0)
		setProperty('hud3.alpha', 0)
		setProperty('sonicmisses.alpha', 0)
		setProperty('sonicmissesblack.alpha', 0)
		setProperty('sonictime.alpha', 0)
		setProperty('sonictimeblack.alpha', 0)
		setProperty('sonicscore.alpha', 0)
		setProperty('sonicscoreblack.alpha', 0)
		blackout = true
	end
	
	setTextString('sonictime', getTextString('timeTxt'))
	setTextString('sonictimeblack', getTextString('timeTxt'))

	setTextString('sonicscore', score)
	if getProperty('sonicscore.text.length') == 1 then
		setTextString('sonicscore', "00000"..getProperty('sonicscore.text'))
	elseif getProperty('sonicscore.text.length') == 2 then
		setTextString('sonicscore', "0000"..getProperty('sonicscore.text'))
	elseif getProperty('sonicscore.text.length') == 3 then
		setTextString('sonicscore', "000"..getProperty('sonicscore.text'))
	elseif getProperty('sonicscore.text.length') == 4 then
		setTextString('sonicscore', "00"..getProperty('sonicscore.text'))
	elseif getProperty('sonicscore.text.length') == 5 then
		setTextString('sonicscore', "0"..getProperty('sonicscore.text'))
	end
	
	setTextString('sonicscoreblack', score)
	if getProperty('sonicscoreblack.text.length') == 1 then
		setTextString('sonicscoreblack', "00000"..getProperty('sonicscoreblack.text'))
	elseif getProperty('sonicscoreblack.text.length') == 2 then
		setTextString('sonicscoreblack', "0000"..getProperty('sonicscoreblack.text'))
	elseif getProperty('sonicscoreblack.text.length') == 3 then
		setTextString('sonicscoreblack', "000"..getProperty('sonicscoreblack.text'))
	elseif getProperty('sonicscoreblack.text.length') == 4 then
		setTextString('sonicscoreblack', "00"..getProperty('sonicscoreblack.text'))
	elseif getProperty('sonicscoreblack.text.length') == 5 then
		setTextString('sonicscoreblack', "0"..getProperty('sonicscoreblack.text'))
	end

	setProperty('timeBar.alpha', 0)
	setProperty('timeBarBG.alpha', 0)
	setProperty('timeTxt.alpha', 0)
	setTextString("botplayTxt", "")
	
--misses = 25
--REMEMBER TO TURN THIS OFF LATER THIS IS FOR TESTING LOL

	--bad ending trigger
	if curStep < 2447 and misses >= 20 then
		bad = true
	end
	

	for i = 0, getProperty('playerStrums.length') do
		setPropertyFromGroup('playerStrums', 0, 'x', 655);
		setPropertyFromGroup('playerStrums', 1, 'x', 763);
		setPropertyFromGroup('playerStrums', 2, 'x', 871);
		setPropertyFromGroup('playerStrums', 3, 'x', 979);
		if not downscroll then
			setPropertyFromGroup('playerStrums', 0, 'y', 20);
			setPropertyFromGroup('playerStrums', 1, 'y', 20);
			setPropertyFromGroup('playerStrums', 2, 'y', 20);
			setPropertyFromGroup('playerStrums', 3, 'y', 20);
		else
			setPropertyFromGroup('playerStrums', 0, 'y', 600);
			setPropertyFromGroup('playerStrums', 1, 'y', 600);
			setPropertyFromGroup('playerStrums', 2, 'y', 600);
			setPropertyFromGroup('playerStrums', 3, 'y', 600);
		end
	end

	for i = 0, getProperty('opponentStrums.length') do
	
		setPropertyFromGroup('opponentStrums', 0, 'x', 0);
		setPropertyFromGroup('opponentStrums', 1, 'x', 0);
		setPropertyFromGroup('opponentStrums', 2, 'x', 0);
		setPropertyFromGroup('opponentStrums', 3, 'x', 0);
		if not downscroll then
			setPropertyFromGroup('opponentStrums', 0, 'y', 20);
			setPropertyFromGroup('opponentStrums', 1, 'y', 20);
			setPropertyFromGroup('opponentStrums', 2, 'y', 20);
			setPropertyFromGroup('opponentStrums', 3, 'y', 20);
		else
			setPropertyFromGroup('opponentStrums', 0, 'y', 600);
			setPropertyFromGroup('opponentStrums', 1, 'y', 600);
			setPropertyFromGroup('opponentStrums', 2, 'y', 600);
			setPropertyFromGroup('opponentStrums', 3, 'y', 600);
		end
	end

	--sonic's legs bs
	

	if sprint == false then
		if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			setProperty('soniclegs.visible', false)
			setProperty('soniclegsoverlay.visible', false)
			setProperty('peeloutlegs.visible', false)
		else
			setProperty('soniclegs.visible', true)
			setProperty('soniclegsoverlay.visible', true)
			setProperty('peeloutlegs.visible', false)
		end
		
	else
	
		if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			setProperty('soniclegs.visible', false)
			setProperty('soniclegsoverlay.visible', false)
			setProperty('peeloutlegs.visible', false)
		else
			setProperty('soniclegs.visible', false)
			setProperty('soniclegsoverlay.visible', false)
			setProperty('peeloutlegs.visible', true)
		end
	end
	
	--bf's legs bs
	if getProperty('gf.animation.curAnim.name') == 'idle' then
		setProperty('bflegs.visible', false)
	else
		setProperty('bflegs.visible', true)
	end
		
		
	-- CHANGE BACKGROUND

	if currentbg == 'island-fire' then
	
		setProperty('redfilter.alpha', 0.3)
		
		setProperty('floor.alpha', 1)
		setProperty('floor2.alpha', 1)
		setProperty('floor3.alpha', 1)
		setProperty('AIfront.alpha', 1)
		setProperty('AIfront2.alpha', 1)
		setProperty('AIfront3.alpha', 1)
		setProperty('trees.alpha', 1)
		setProperty('trees2.alpha', 1)
		setProperty('trees3.alpha', 1)
		setProperty('top.alpha', 1)
		setProperty('top2.alpha', 1)
		setProperty('top3.alpha', 1)
		setProperty('firebg.alpha', 1)
		setProperty('firebg2.alpha', 1)
		setProperty('firebg3.alpha', 1)
		setProperty('fire.alpha', 0.4)
		setProperty('fire2.alpha', 0.4)
		setProperty('fire3.alpha', 0.4)
		setProperty('firecolour.alpha', 1)
---		
		setProperty('ghfloor.alpha', 0)
		setProperty('ghfloor2.alpha', 0)
		setProperty('ghfloor3.alpha', 0)
		
		setProperty('ghclouds.alpha', 0)
		setProperty('ghclouds2.alpha', 0)
		setProperty('ghclouds3.alpha', 0)
		
		setProperty('ghcloudsB.alpha', 0)
		setProperty('ghcloudsB2.alpha', 0)
		setProperty('ghcloudsB3.alpha', 0)

		setProperty('ghcloudsC.alpha', 0)
		setProperty('ghcloudsC2.alpha', 0)
		setProperty('ghcloudsC3.alpha', 0)
		
		setProperty('ghrocks.alpha', 0)
		setProperty('ghrocks2.alpha', 0)
		setProperty('ghrocks3.alpha', 0)
		
		setProperty('ghbg.alpha', 0)
		setProperty('ghbg2.alpha', 0)
		setProperty('ghbg3.alpha', 0)
		
		setProperty('ghwater.alpha', 0)
		setProperty('ghwater2.alpha', 0)
		setProperty('ghwater3.alpha', 0)
---
		setProperty('kbg1.alpha', 0)
		setProperty('kbg1-2.alpha', 0)
		setProperty('kbg1-3.alpha', 0)

		setProperty('kbg2.alpha', 0)
		setProperty('kbg2-2.alpha', 0)
		setProperty('kbg2-3.alpha', 0)
		
		setProperty('kbg3.alpha', 0)
		setProperty('kbg3-2.alpha', 0)
		setProperty('kbg3-3.alpha', 0)

		setProperty('kbg4.alpha', 0)
		setProperty('kbg4-2.alpha', 0)
		setProperty('kbg4-3.alpha', 0)
		
		setProperty('knux1.alpha', 0)
		setProperty('knux1-2.alpha', 0)
		setProperty('knux1-3.alpha', 0)
---
		setProperty('eggbg.alpha', 0)
		setProperty('eggbg2.alpha', 0)
		setProperty('eggbg3.alpha', 0)
		
		setProperty('eggfloor.alpha', 0)
		setProperty('eggfloor2.alpha', 0)
		setProperty('eggfloor3.alpha', 0)
		
		setProperty('curtains.alpha', 0)
		setProperty('curtainstop.alpha', 0)
		
---

		setProperty('floorn.alpha', 0)
		setProperty('floorn2.alpha', 0)
		setProperty('floorn3.alpha', 0)
		
		setProperty('green.alpha', 0)
		setProperty('green2.alpha', 0)
		setProperty('green3.alpha', 0)
		
		setProperty('back.alpha', 0)
		setProperty('back2.alpha', 0)
		setProperty('back3.alpha', 0)
		
	elseif currentbg == 'ghz' then
	
		setProperty('redfilter.alpha',0)
		
		setProperty('floor.alpha', 0)
		setProperty('floor2.alpha', 0)
		setProperty('floor3.alpha', 0)
		setProperty('AIfront.alpha', 0)
		setProperty('AIfront2.alpha', 0)
		setProperty('AIfront3.alpha', 0)
		setProperty('trees.alpha', 0)
		setProperty('trees2.alpha', 0)
		setProperty('trees3.alpha', 0)
		setProperty('top.alpha', 0)
		setProperty('top2.alpha', 0)
		setProperty('top3.alpha', 0)
		setProperty('firebg.alpha', 0)
		setProperty('firebg2.alpha', 0)
		setProperty('firebg3.alpha', 0)
		setProperty('fire.alpha', 0)
		setProperty('fire2.alpha', 0)
		setProperty('fire3.alpha', 0)
		setProperty('firecolour.alpha', 0)
---		
		setProperty('ghfloor.alpha', 1)
		setProperty('ghfloor2.alpha', 1)
		setProperty('ghfloor3.alpha', 1)
		
		setProperty('ghclouds.alpha', 1)
		setProperty('ghclouds2.alpha', 1)
		setProperty('ghclouds3.alpha', 1)
		
		setProperty('ghcloudsB.alpha', 1)
		setProperty('ghcloudsB2.alpha', 1)
		setProperty('ghcloudsB3.alpha', 1)

		setProperty('ghcloudsC.alpha', 1)
		setProperty('ghcloudsC2.alpha', 1)
		setProperty('ghcloudsC3.alpha', 1)
		
		setProperty('ghrocks.alpha', 1)
		setProperty('ghrocks2.alpha', 1)
		setProperty('ghrocks3.alpha', 1)
		
		setProperty('ghbg.alpha', 1)
		setProperty('ghbg2.alpha', 1)
		setProperty('ghbg3.alpha', 1)
		
		setProperty('ghwater.alpha', 1)
		setProperty('ghwater2.alpha', 1)
		setProperty('ghwater3.alpha', 1)
---
		setProperty('kbg1.alpha', 0)
		setProperty('kbg1-2.alpha', 0)
		setProperty('kbg1-3.alpha', 0)

		setProperty('kbg2.alpha', 0)
		setProperty('kbg2-2.alpha', 0)
		setProperty('kbg2-3.alpha', 0)
		
		setProperty('kbg3.alpha', 0)
		setProperty('kbg3-2.alpha', 0)
		setProperty('kbg3-3.alpha', 0)

		setProperty('kbg4.alpha', 0)
		setProperty('kbg4-2.alpha', 0)
		setProperty('kbg4-3.alpha', 0)
		
		setProperty('knux1.alpha', 0)
		setProperty('knux1-2.alpha', 0)
		setProperty('knux1-3.alpha', 0)
---
		setProperty('eggbg.alpha', 0)
		setProperty('eggbg2.alpha', 0)
		setProperty('eggbg3.alpha', 0)
		
		setProperty('eggfloor.alpha', 0)
		setProperty('eggfloor2.alpha', 0)
		setProperty('eggfloor3.alpha', 0)
		
		setProperty('curtains.alpha', 0)
		setProperty('curtainstop.alpha', 0)
		
---

		setProperty('floorn.alpha', 0)
		setProperty('floorn2.alpha', 0)
		setProperty('floorn3.alpha', 0)
		
		setProperty('green.alpha', 0)
		setProperty('green2.alpha', 0)
		setProperty('green3.alpha', 0)
		
		setProperty('back.alpha', 0)
		setProperty('back2.alpha', 0)
		setProperty('back3.alpha', 0)
		
	elseif currentbg == 'knux' then
	
		setProperty('redfilter.alpha',0)
		
		setProperty('floor.alpha', 0)
		setProperty('floor2.alpha', 0)
		setProperty('floor3.alpha', 0)
		setProperty('AIfront.alpha', 0)
		setProperty('AIfront2.alpha', 0)
		setProperty('AIfront3.alpha', 0)
		setProperty('trees.alpha', 0)
		setProperty('trees2.alpha', 0)
		setProperty('trees3.alpha', 0)
		setProperty('top.alpha', 0)
		setProperty('top2.alpha', 0)
		setProperty('top3.alpha', 0)
		setProperty('firebg.alpha', 0)
		setProperty('firebg2.alpha', 0)
		setProperty('firebg3.alpha', 0)
		setProperty('fire.alpha', 0)
		setProperty('fire2.alpha', 0)
		setProperty('fire3.alpha', 0)
		setProperty('firecolour.alpha', 0)
---		
		setProperty('ghfloor.alpha', 0)
		setProperty('ghfloor2.alpha', 0)
		setProperty('ghfloor3.alpha', 0)
		
		setProperty('ghclouds.alpha', 0)
		setProperty('ghclouds2.alpha', 0)
		setProperty('ghclouds3.alpha', 0)
		
		setProperty('ghcloudsB.alpha', 0)
		setProperty('ghcloudsB2.alpha', 0)
		setProperty('ghcloudsB3.alpha', 0)

		setProperty('ghcloudsC.alpha', 0)
		setProperty('ghcloudsC2.alpha', 0)
		setProperty('ghcloudsC3.alpha', 0)
		
		setProperty('ghrocks.alpha', 0)
		setProperty('ghrocks2.alpha', 0)
		setProperty('ghrocks3.alpha', 0)
		
		setProperty('ghbg.alpha', 0)
		setProperty('ghbg2.alpha', 0)
		setProperty('ghbg3.alpha', 0)
		
		setProperty('ghwater.alpha', 0)
		setProperty('ghwater2.alpha', 0)
		setProperty('ghwater3.alpha', 0)
---
		setProperty('kbg1.alpha', 1)
		setProperty('kbg1-2.alpha', 1)
		setProperty('kbg1-3.alpha', 1)

		setProperty('kbg2.alpha', 1)
		setProperty('kbg2-2.alpha', 1)
		setProperty('kbg2-3.alpha', 1)
		
		setProperty('kbg3.alpha', 1)
		setProperty('kbg3-2.alpha', 1)
		setProperty('kbg3-3.alpha', 1)

		setProperty('kbg4.alpha', 1)
		setProperty('kbg4-2.alpha', 1)
		setProperty('kbg4-3.alpha', 1)
		
		setProperty('knux1.alpha', 1)
		setProperty('knux1-2.alpha', 1)
		setProperty('knux1-3.alpha', 1)
---
		setProperty('eggbg.alpha', 0)
		setProperty('eggbg2.alpha', 0)
		setProperty('eggbg3.alpha', 0)
		
		setProperty('eggfloor.alpha', 0)
		setProperty('eggfloor2.alpha', 0)
		setProperty('eggfloor3.alpha', 0)
		
		setProperty('curtains.alpha', 0)
		setProperty('curtainstop.alpha', 0)
		
---

		setProperty('floorn.alpha', 0)
		setProperty('floorn2.alpha', 0)
		setProperty('floorn3.alpha', 0)
		
		setProperty('green.alpha', 0)
		setProperty('green2.alpha', 0)
		setProperty('green3.alpha', 0)
		
		setProperty('back.alpha', 0)
		setProperty('back2.alpha', 0)
		setProperty('back3.alpha', 0)
		
	elseif currentbg == 'egg' then
	
		setProperty('redfilter.alpha',0)
		
		setProperty('floor.alpha', 0)
		setProperty('floor2.alpha', 0)
		setProperty('floor3.alpha', 0)
		setProperty('AIfront.alpha', 0)
		setProperty('AIfront2.alpha', 0)
		setProperty('AIfront3.alpha', 0)
		setProperty('trees.alpha', 0)
		setProperty('trees2.alpha', 0)
		setProperty('trees3.alpha', 0)
		setProperty('top.alpha', 0)
		setProperty('top2.alpha', 0)
		setProperty('top3.alpha', 0)
		setProperty('firebg.alpha', 0)
		setProperty('firebg2.alpha', 0)
		setProperty('firebg3.alpha', 0)
		setProperty('fire.alpha', 0)
		setProperty('fire2.alpha', 0)
		setProperty('fire3.alpha', 0)
		setProperty('firecolour.alpha', 0)
---		
		setProperty('ghfloor.alpha', 0)
		setProperty('ghfloor2.alpha', 0)
		setProperty('ghfloor3.alpha', 0)
		
		setProperty('ghclouds.alpha', 0)
		setProperty('ghclouds2.alpha', 0)
		setProperty('ghclouds3.alpha', 0)
		
		setProperty('ghcloudsB.alpha', 0)
		setProperty('ghcloudsB2.alpha', 0)
		setProperty('ghcloudsB3.alpha', 0)

		setProperty('ghcloudsC.alpha', 0)
		setProperty('ghcloudsC2.alpha', 0)
		setProperty('ghcloudsC3.alpha', 0)
		
		setProperty('ghrocks.alpha', 0)
		setProperty('ghrocks2.alpha', 0)
		setProperty('ghrocks3.alpha', 0)
		
		setProperty('ghbg.alpha', 0)
		setProperty('ghbg2.alpha', 0)
		setProperty('ghbg3.alpha', 0)
		
		setProperty('ghwater.alpha', 0)
		setProperty('ghwater2.alpha', 0)
		setProperty('ghwater3.alpha', 0)
---
		setProperty('kbg0.alpha', 0)
		setProperty('kbg0-2.alpha', 0)
		setProperty('kbg0-3.alpha', 0)

		setProperty('kbg2.alpha', 0)
		setProperty('kbg2-2.alpha', 0)
		setProperty('kbg2-3.alpha', 0)
		
		setProperty('kbg3.alpha', 0)
		setProperty('kbg3-2.alpha', 0)
		setProperty('kbg3-3.alpha', 0)

		setProperty('kbg4.alpha', 0)
		setProperty('kbg4-2.alpha', 0)
		setProperty('kbg4-3.alpha', 0)
		
		setProperty('knux1.alpha', 0)
		setProperty('knux1-2.alpha', 0)
		setProperty('knux1-3.alpha', 0)
---
		doTweenAlpha('eggbglol', 'eggbg', 1, 0.7, 'quadOut')
		doTweenAlpha('eggbg2lol', 'eggbg2', 1, 0.7, 'quadOut')
		doTweenAlpha('eggbg3lol', 'eggbg3', 1, 0.7, 'quadOut')

		doTweenAlpha('eggfloorlol', 'eggfloor', 1, 0.7, 'quadOut')		
		doTweenAlpha('eggfloor2lol', 'eggfloor2', 1, 0.7, 'quadOut')
		doTweenAlpha('eggfloor3lol', 'eggfloor3', 1, 0.7, 'quadOut')
		
		doTweenAlpha('curtainslol', 'curtains', 1, 0.7, 'quadOut')
		doTweenAlpha('curtainstoplol', 'curtainstop', 1, 0.7, 'quadOut')
		
---

		setProperty('floorn.alpha', 0)
		setProperty('floorn2.alpha', 0)
		setProperty('floorn3.alpha', 0)
		
		setProperty('green.alpha', 0)
		setProperty('green2.alpha', 0)
		setProperty('green3.alpha', 0)
		
		setProperty('back.alpha', 0)
		setProperty('back2.alpha', 0)
		setProperty('back3.alpha', 0)
		
	elseif currentbg == 'none' then
	
		setProperty('redfilter.alpha',0)
	
		setProperty('floor.alpha', 0)
		setProperty('floor2.alpha', 0)
		setProperty('floor3.alpha', 0)
		setProperty('AIfront.alpha', 0)
		setProperty('AIfront2.alpha', 0)
		setProperty('AIfront3.alpha', 0)
		setProperty('trees.alpha', 0)
		setProperty('trees2.alpha', 0)
		setProperty('trees3.alpha', 0)
		setProperty('top.alpha', 0)
		setProperty('top2.alpha', 0)
		setProperty('top3.alpha', 0)
		setProperty('firebg.alpha', 0)
		setProperty('firebg2.alpha', 0)
		setProperty('firebg3.alpha', 0)
		setProperty('fire.alpha', 0)
		setProperty('fire2.alpha', 0)
		setProperty('fire3.alpha', 0)
		setProperty('firecolour.alpha', 0)
---		
		setProperty('ghfloor.alpha', 0)
		setProperty('ghfloor2.alpha', 0)
		setProperty('ghfloor3.alpha', 0)
		
		setProperty('ghclouds.alpha', 0)
		setProperty('ghclouds2.alpha', 0)
		setProperty('ghclouds3.alpha', 0)
		
		setProperty('ghcloudsB.alpha', 0)
		setProperty('ghcloudsB2.alpha', 0)
		setProperty('ghcloudsB3.alpha', 0)

		setProperty('ghcloudsC.alpha', 0)
		setProperty('ghcloudsC2.alpha', 0)
		setProperty('ghcloudsC3.alpha', 0)
		
		setProperty('ghrocks.alpha', 0)
		setProperty('ghrocks2.alpha', 0)
		setProperty('ghrocks3.alpha', 0)
		
		setProperty('ghbg.alpha', 0)
		setProperty('ghbg2.alpha', 0)
		setProperty('ghbg3.alpha', 0)
		
		setProperty('ghwater.alpha', 0)
		setProperty('ghwater2.alpha', 0)
		setProperty('ghwater3.alpha', 0)
---
		setProperty('kbg0.alpha', 0)
		setProperty('kbg0-2.alpha', 0)
		setProperty('kbg0-3.alpha', 0)

		setProperty('kbg2.alpha', 0)
		setProperty('kbg2-2.alpha', 0)
		setProperty('kbg2-3.alpha', 0)
		
		setProperty('kbg3.alpha', 0)
		setProperty('kbg3-2.alpha', 0)
		setProperty('kbg3-3.alpha', 0)

		setProperty('kbg4.alpha', 0)
		setProperty('kbg4-2.alpha', 0)
		setProperty('kbg4-3.alpha', 0)
		
		setProperty('knux1.alpha', 0)
		setProperty('knux1-2.alpha', 0)
		setProperty('knux1-3.alpha', 0)
---
		setProperty('eggbg.alpha', 0)
		setProperty('eggbg2.alpha', 0)
		setProperty('eggbg3.alpha', 0)
		
		setProperty('eggfloor.alpha', 0)
		setProperty('eggfloor2.alpha', 0)
		setProperty('eggfloor3.alpha', 0)
		
		setProperty('curtains.alpha', 0)
		setProperty('curtainstop.alpha', 0)
		
---

		setProperty('floorn.alpha', 0)
		setProperty('floorn2.alpha', 0)
		setProperty('floorn3.alpha', 0)
		
		setProperty('green.alpha', 0)
		setProperty('green2.alpha', 0)
		setProperty('green3.alpha', 0)
		
		setProperty('back.alpha', 0)
		setProperty('back2.alpha', 0)
		setProperty('back3.alpha', 0)
		
---

	elseif currentbg == 'island' then
	
	setProperty('redfilter.alpha',0)

		setProperty('floor.alpha', 0)
		setProperty('floor2.alpha', 0)
		setProperty('floor3.alpha', 0)
		setProperty('AIfront.alpha', 0)
		setProperty('AIfront2.alpha', 0)
		setProperty('AIfront3.alpha', 0)
		setProperty('trees.alpha', 0)
		setProperty('trees2.alpha', 0)
		setProperty('trees3.alpha', 0)
		setProperty('top.alpha', 0)
		setProperty('top2.alpha', 0)
		setProperty('top3.alpha', 0)
		setProperty('firebg.alpha', 0)
		setProperty('firebg2.alpha', 0)
		setProperty('firebg3.alpha', 0)
		setProperty('fire.alpha', 0)
		setProperty('fire2.alpha', 0)
		setProperty('fire3.alpha', 0)
		setProperty('firecolour.alpha', 0)
---		
		setProperty('ghfloor.alpha', 0)
		setProperty('ghfloor2.alpha', 0)
		setProperty('ghfloor3.alpha', 0)
		
		setProperty('ghclouds.alpha', 0)
		setProperty('ghclouds2.alpha', 0)
		setProperty('ghclouds3.alpha', 0)
		
		setProperty('ghcloudsB.alpha', 0)
		setProperty('ghcloudsB2.alpha', 0)
		setProperty('ghcloudsB3.alpha', 0)

		setProperty('ghcloudsC.alpha', 0)
		setProperty('ghcloudsC2.alpha', 0)
		setProperty('ghcloudsC3.alpha', 0)
		
		setProperty('ghrocks.alpha', 0)
		setProperty('ghrocks2.alpha', 0)
		setProperty('ghrocks3.alpha', 0)
		
		setProperty('ghbg.alpha', 0)
		setProperty('ghbg2.alpha', 0)
		setProperty('ghbg3.alpha', 0)
		
		setProperty('ghwater.alpha', 0)
		setProperty('ghwater2.alpha', 0)
		setProperty('ghwater3.alpha', 0)
---
		setProperty('kbg1.alpha', 0)
		setProperty('kbg1-2.alpha', 0)
		setProperty('kbg1-3.alpha', 0)

		setProperty('kbg2.alpha', 0)
		setProperty('kbg2-2.alpha', 0)
		setProperty('kbg2-3.alpha', 0)
		
		setProperty('kbg3.alpha', 0)
		setProperty('kbg3-2.alpha', 0)
		setProperty('kbg3-3.alpha', 0)

		setProperty('kbg4.alpha', 0)
		setProperty('kbg4-2.alpha', 0)
		setProperty('kbg4-3.alpha', 0)
		
		setProperty('knux1.alpha', 0)
		setProperty('knux1-2.alpha', 0)
		setProperty('knux1-3.alpha', 0)
---
		setProperty('eggbg.alpha', 0)
		setProperty('eggbg2.alpha', 0)
		setProperty('eggbg3.alpha', 0)
		
		setProperty('eggfloor.alpha', 0)
		setProperty('eggfloor2.alpha', 0)
		setProperty('eggfloor3.alpha', 0)
		
		setProperty('curtains.alpha', 0)
		setProperty('curtainstop.alpha', 0)
		
---

		setProperty('floorn.alpha', 1)
		setProperty('floorn2.alpha', 1)
		setProperty('floorn3.alpha', 1)
		
		setProperty('green.alpha', 1)
		setProperty('green2.alpha', 1)
		setProperty('green3.alpha', 1)
		
		setProperty('back.alpha', 1)
		setProperty('back2.alpha', 1)
		setProperty('back3.alpha', 1)
		
---

	end
	
	
	--STEP EVENTS (MOST IMPORTANT BIT TBH)
	
	-- you can't "die" on this song, just the "bad ending"
	setProperty('health', 2)
	
	if curStep >= 9999 then
		setProperty('cameraSpeed', 1)
	else
		setProperty('cameraSpeed', 99)
	end
	
	if curStep == 1 then
		doTweenY('1st','redbar', 0 , 0.25, 'linear')
		runTimer('stagestart', '0.2')
	end
	
	if curStep == 31 then
        for i = 4,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
		setProperty('white.alpha', 1)
		setProperty('blackfull.alpha', 0)
		doTweenAlpha('whiteflash', 'white', 0, 2, 'quadOut')
		doTweenX('heresbf','gf', 300, 6, 'linear')
	end
	
	if curStep == 47 then
		doTweenY('1st','redbar', -720 , 0.25, 'linear')
		doTweenX('confronting','confronting', 1280 , 0.25, 'linear')
		doTweenX('yourself','yourself', 1280 , 0.25, 'linear')
		doTweenX('act1','act1', 1280 , 0.25, 'linear')
	end
	
	if curStep == 143 then
	    for i = 4,7 do
            noteTweenAlpha(i+16, i, 1, 0.7, 'linear')
        end
	end
	
	if curStep == 160 then
		setProperty('boyfriend.x', -250)
		setProperty('boyfriend.alpha', 1)
	end
	
	if curStep == 255 then
	    for i = 4,7 do
            noteTweenAlpha(i+16, i, 0, 0.1, 'linear')
        end
		setProperty('eyesjumpscare.alpha', 1)
		setProperty('blackbg.alpha', 0.25)
	end
	
	if curStep == 259 then
		setProperty('eyesjumpscare.alpha', 0)
		doTweenX('heressonic','boyfriend', 700, 0.9, 'linear')
		doTweenX('heresxeno','dad', 200, 0.9, 'linear')
	end
	
	if curStep == 263 then
		setProperty('eyesjumpscare.alpha', 1)
		setProperty('blackbg.alpha', 0.75)
	end
	
	if curStep == 267 then
		setProperty('eyesjumpscare.alpha', 0)
	end
	
	if curStep == 271 then
		setProperty('blackfull.alpha', 1)
	end
	
	if curStep == 275 then
		setProperty('blackfull.alpha', 0)
		setProperty('run.alpha', 1)
		setProperty('blackbg.alpha', 0)
	    for i = 4,7 do
            noteTweenAlpha(i+16, i, 1, 0.2, 'linear')
        end
	end
	
	if curStep == 287 then
		setProperty('run.alpha', 0)
		setProperty('red.alpha', 1)
		doTweenAlpha('redflash', 'red', 0, 1, 'quadOut')
		currentbg = 'island-fire'
		objectPlayAnimation('bflegs', 'normal')
		2 = 1

		doTweenX('floorscroll', 'floor', -3417*4, 0.1, 'linear')
		doTweenX('floorscroll2', 'floor2', -6834*4, 0.1, 'linear')
		doTweenX('floorscroll3', 'floor3', 0, 0.1, 'linear')

        doTweenX('firebgscroll', 'firebg', -320*4, 0.1, 'linear')
        doTweenX('firebgscroll2', 'firebg2', -640*4, 0.1, 'linear')
        doTweenX('firebgscroll3', 'firebg3', 0, 0.1, 'linear')

        doTweenX('firescroll', 'fire', -320*4, 0.1, 'linear')
        doTweenX('firescroll2', 'fire2', -640*4, 0.1, 'linear')
        doTweenX('firescroll3', 'fire3', 0, 0.1, 'linear')

        doTweenX('AIfrontscroll', 'AIfront', -2670*4, 0.1, 'linear')
        doTweenX('AIfrontscroll2', 'AIfront2', -5340*4, 0.1, 'linear')
        doTweenX('AIfrontscroll3', 'AIfront3', 0, 0.1, 'linear')

        doTweenX('treesscroll', 'trees', -2670*4, 0.1, 'linear')
        doTweenX('treesscroll2', 'trees2', -5340*4, 0.1, 'linear')
        doTweenX('treesscroll3', 'trees3', 0, 0.1, 'linear')
		
        doTweenX('topscroll', 'top', -2670*4, 0.1, 'linear')
        doTweenX('topscroll2', 'top2', -5340*4, 0.1, 'linear')
        doTweenX('topscroll3', 'top3', 0, 0.1, 'linear')
	end
	
	if curStep == 527 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.25, 'quadOut')
	end
	
	
	if curStep == 543 then
		doTweenAlpha('blackbg', 'blackbg', 0, 0.25, 'quadOut')
	end
	
	if curStep == 1039 then
		currentbg = 'temp'
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
		setProperty('dad.alpha', 0.5)
		setProperty('blackbg.alpha', 0.5)
		setProperty('redfilter.alpha', 0.15)
		setProperty('soniclegs.x', getProperty('boyfriend.x')-73)
		setProperty('soniclegsoverlay.x', getProperty('soniclegs.x'))
	end
		
	if curStep == 1047 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
		setProperty('dad.alpha', 0)
		setProperty('blackbg.alpha', 1)
		setProperty('redfilter.alpha', 0)
	end
	
	if curStep == 1055 then
		setProperty('red.alpha', 1)
		doTweenAlpha('redflash', 'red', 0, 1, 'quadOut')
		currentbg = 'knux'
		setProperty('dad.alpha', 0)
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1063 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1071 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1079 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1087 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1095 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1103 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1111 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1119 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1127 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1135 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1141 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1149 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1157 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1165 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
		
	if curStep == 1173 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1181 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1189 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1197 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1205 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1213 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1221 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1229 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1237 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1245 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1253 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1261 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1269 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1277 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1285 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1293 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep == 1301 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 0.4, 'quadOut')
	end
	
	if curStep == 1309 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 0.4, 'quadOut')
	end
	
	if curStep >= 1311 and forthelowends == false then
		cancelTween('blackbg')
		setProperty('red.alpha', 1)
		doTweenAlpha('redflash', 'red', 0, 1, 'quadOut')
		doTweenAlpha('blackbg', 'blackbg', 0, 0.1, 'quadOut')
		currentbg = 'island-fire'
		setProperty('dad.alpha',1)
		forthelowends = true
		setProperty('soniclegs.x', getProperty('boyfriend.x')-63)
		setProperty('soniclegsoverlay.x', getProperty('soniclegs.x'))
	end
	
	if curStep == 1823 then
		doTweenAlpha('blackbg', 'blackbg', 0.25, 6, 'quadOut')
	end
	
	if curStep == 1951 then
		doTweenAlpha('blackbg', 'blackbg', 0.5, 6, 'quadOut')
	end
	
	if curStep == 2207 then
		doTweenAlpha('blackbg', 'blackbg', 0.75, 4, 'quadOut')
	end
	
	if curStep == 2303 then
		currentbg = 'tempagainpleasegoawayred'
		doTweenAlpha('blackbg', 'blackbg', 1, 1, 'quadOut')
		doTweenAlpha('blackfade', 'black', 1, 1, 'quadOut')
		doTweenAlpha('redfilter', 'redfilter', 0, 1, 'quadOut')
	end
	
	if curStep == 2335 then
		setProperty('black.alpha', 1)
		setProperty('blackbg.alpha', 0)
		setProperty('dad.alpha', 0)
		doTweenAlpha('blackflash', 'black', 0, 2, 'quadOut')
		currentbg = 'none'
		setProperty('soniclegs.x', getProperty('boyfriend.x')-73)
		setProperty('soniclegsoverlay.x', getProperty('soniclegs.x'))
	end
	
	if curStep == 2447 then
		currentbg = 'egg'
	end
	
	
	if bad == false then
--GOOD ENDING
		if curStep == 2463 then
			setProperty('dad.alpha', 1)
			setProperty('red.alpha', 1)
			doTweenAlpha('redflash', 'red', 0, 0.7, 'quadOut')
			currentbg = 'island-fire'
			2 = 0.5
			twnspd = 0.5
			sprint = true
			objectPlayAnimation('bflegs', 'fast')

			doTweenX('floorscroll2', 'floor2', -6834*4, 0.1, 'linear')

			doTweenX('firebgscroll2', 'firebg2', -640*4, 0.1, 'linear')

			doTweenX('firescroll2', 'fire2', -640*4, 0.1, 'linear')

			doTweenX('AIfrontscroll2', 'AIfront2', -5340*4, 0.1, 'linear')

			doTweenX('treesscroll2', 'trees2', -5340*4, 0.1, 'linear')

			doTweenX('topscroll2', 'top2', -5340*4, 0.1, 'linear')
		end
		
		if curStep == 2719 then
			setProperty('red.alpha', 1)
			doTweenAlpha('redflash', 'red', 0, 0.7, 'quadOut')
			currentbg = 'ghz'
		
			doTweenX('ghfloorscroll2', 'ghfloor2', -6834*4, 0.01, 'linear')

			doTweenX('ghwaterscroll2', 'ghwater2', -7680*4, 0.01, 'linear')

			doTweenX('ghcloudsscroll2', 'ghclouds2', -7680*4, 0.01, 'linear')

			doTweenX('ghcloudsBscroll2', 'ghcloudsB2', -7680*4, 0.01, 'linear')

			doTweenX('ghcloudsCscroll2', 'ghcloudsC2', -7680*4, 0.01, 'linear')

			doTweenX('ghrocksscroll2', 'ghrocks2', -16384*4, 0.01, 'linear')

			doTweenX('ghbgscroll2', 'ghbg2', -16384*4, 0.01, 'linear')
		end
	
		if curStep == 2959 then
			setProperty('jumpscare.alpha', 1)
			for i = 4,7 do
				noteTweenAlpha(i+16, i, 0, 0.01, 'linear')
			end
		end
	
		if curStep == 2975 then
			setProperty('jumpscare.alpha', 0)
			setProperty('dad.alpha', 0)
			--setProperty('black.alpha', 1)
			--doTweenAlpha('blackflash', 'black', 0, 1, 'quadOut')
			doTweenAlpha('blackbg', 'blackbg', 1, 8, 'linear')
		end
		
		if curStep == 3103 then
			currentbg = 'knux'
			doTweenAlpha('blackbg', 'blackbg', 0, 6, 'linear')
		end
		
		if curStep == 3231 then
			doTweenAlpha('blackflash', 'black', 1, 1.7, 'quadOut')
		end
		
		if curStep == 3263 then
			setProperty('dad.alpha', 0.5)
			doTweenAlpha('blackflash', 'black', 0, 1, 'quadOut')
			currentbg = 'island-fire'
			doTweenAlpha('goodendingfade1', 'dad', 0.25, 0.4, 'linear')
			for i = 4,7 do
				noteTweenAlpha(i+16, i, 1, 1, 'linear')
			end
		end
		
		if curStep == 3519 then
			setProperty('white.alpha', 1)
			doTweenAlpha('whiteflash', 'white', 0, 1, 'quadOut')
			currentbg = 'knux'
		end
		
		if curStep == 3631 then
			doTweenAlpha('blackbg', 'blackbg', 1, 1, 'quadOut')
		end
	
		if curStep == 3647 then
			currentbg = 'egg'
			doTweenAlpha('blackbg', 'blackbg', 0, 0.7, 'quadOut')
		end
		
		if curStep == 3743 then
			currentbg = 'tempsothecurtainscanjustfuckoffplease'
			doTweenAlpha('blackbg', 'blackbg', 1, 1, 'quadOut')
			doTweenX('byexeno','dad', -150, 1.4, 'quadIn')
			doTweenAlpha('curtainslol', 'curtains', 0, 0.7, 'quadOut')
			doTweenAlpha('curtainstoplol', 'curtainstop', 0, 0.7, 'quadOut')
			doTweenAlpha('whiteflash', 'white', 1, 1.4, 'quadOut')
		end
		
		if curStep == 3775 then
			setProperty('blackbg.alpha', 0)
			setProperty('white.alpha', 1)
			doTweenAlpha('whiteflash', 'white', 0, 1, 'quadOut')
			currentbg = 'island'
			2 = 1
			objectPlayAnimation('bflegs','normal')
			setProperty('peeloutlegs.alpha', 0)
			triggerEvent('Change Character', 'gf','boyfriend')
			setProperty('sonicrunnin.alpha', 1)
			setProperty('sonicrunnin.x', 600)
			triggerEvent('Change Character', 'bf','sonicfocus')
			setProperty('peeloutlegs.alpha', 0)
			setProperty('boyfriend.alpha', 0)
			setProperty('soniclegs.alpha', 0)
			setProperty('soniclegsoverlay.alpha', 0)
			
			for i = 4,7 do
				noteTweenAlpha(i+16, i, 0, 0.01, 'linear')
			end
			
			doTweenX('floornscroll2', 'floorn2', -1024*4, 0.01, 'linear')
			doTweenX('backscroll2', 'back2', -1024*3, 0.01, 'linear')
			doTweenX('greenscroll2', 'green2', -1024*3, 0.01, 'linear')
		end
			
		if curStep == 3807 then
			doTweenX('runawaybf','gf', 1500, 1.5, 'quadIn')
			doTweenX('runawaysonic','sonicrunnin', 1700, 1.5, 'quadIn')
		end	
		
		if curStep == 3831 then
			doTweenAlpha('whiteflash', 'white', 1, 0.7, 'quadOut')
		end
		
		if curStep == 3839 then
			setProperty('eyesjumpscare.alpha', 1)
		end
		
		if curStep == 3843 then
		setProperty('eyesjumpscare.alpha', 0)
			setProperty('blackfull.alpha', 1)
		end
-------------------------------------		
-------------------------------------
----------END OF GOOD ENDING---------
-------------------------------------
-------------------------------------
		
	elseif bad == true then
--- BAD ENDING (gotobad)
		if curStep == 2463 then
			setProperty('dad.alpha', 1)
			setProperty('red.alpha', 1)
			doTweenAlpha('redflash', 'red', 0, 0.7, 'quadOut')
			currentbg = 'island-fire'
			2 = 0.5
			twnspd = 0.5
			sprint = true
			objectPlayAnimation('bflegs', 'fast')

			doTweenX('floorscroll2', 'floor2', -6834*4, 0.1, 'linear')

			doTweenX('firebgscroll2', 'firebg2', -640*4, 0.1, 'linear')

			doTweenX('firescroll2', 'fire2', -640*4, 0.1, 'linear')

			doTweenX('AIfrontscroll2', 'AIfront2', -5340*4, 0.1, 'linear')

			doTweenX('treesscroll2', 'trees2', -5340*4, 0.1, 'linear')

			doTweenX('topscroll2', 'top2', -5340*4, 0.1, 'linear')
		end
		
		if curStep == 2719 then
			setProperty('red.alpha', 1)
			doTweenAlpha('redflash', 'red', 0, 0.7, 'quadOut')
			currentbg = 'ghz'
			doTweenX('ohnobfnooooo', 'gf', 220, 16, 'linear')
		
			doTweenX('ghfloorscroll2', 'ghfloor2', -6834*4, 0.01, 'linear')

			doTweenX('ghwaterscroll2', 'ghwater2', -7680*4, 0.01, 'linear')

			doTweenX('ghcloudsscroll2', 'ghclouds2', -7680*4, 0.01, 'linear')

			doTweenX('ghcloudsBscroll2', 'ghcloudsB2', -7680*4, 0.01, 'linear')

			doTweenX('ghcloudsCscroll2', 'ghcloudsC2', -7680*4, 0.01, 'linear')

			doTweenX('ghrocksscroll2', 'ghrocks2', -16384*4, 0.01, 'linear')

			doTweenX('ghbgscroll2', 'ghbg2', -16384*4, 0.01, 'linear')
		end
	
		if curStep == 2959 then
			setProperty('iamgod.alpha', 1)
			setProperty('hud2.visible', false)
			setProperty('hud3.visible', false)
			setProperty('gf.alpha', 0)
			currentbg = 'none'
			runTimer('bfboo', 0.3)
			for i = 4,7 do
				noteTweenAlpha(i+16, i, 0, 0.01, 'linear')
			end
		end
	
		if curStep == 2975 then
			cancelTimer('bfboo')
			cancelTimer('bfboo2')
			setProperty('bfjumpscare.alpha', 0)
			setProperty('iamgod.alpha', 0)
			setProperty('dad.alpha', 0)
			doTweenAlpha('blackbg', 'blackbg', 1, 8, 'linear')
		end
		
		if curStep == 3103 then
			currentbg = 'knux'
			doTweenAlpha('blackbg', 'blackbg', 0, 6, 'linear')
		end
		
		if curStep == 3231 then
			doTweenAlpha('blackflash', 'black', 1, 1.7, 'quadOut')
		end
		
		if curStep == 3263 then
			setProperty('dad.alpha', 1)
			setProperty('eyesjumpscare.alpha', 1)
			doTweenAlpha('jumpscareflash', 'eyesjumpscare', 0, 1, 'quadOut')
			doTweenAlpha('blackflash', 'black', 0, 0.01, 'quadOut')
			currentbg = 'island-fire'
			doTweenX('badendingclosein', 'dad', 600, 30, 'linear')
			for i = 4,7 do
				noteTweenAlpha(i+16, i, 1, 1, 'linear')
			end
		end
		
		if curStep == 3519 then
			setProperty('jumpscare.alpha', 1)
			doTweenAlpha('jumpscareflash', 'jumpscare', 0, 1, 'quadOut')
			currentbg = 'knux'
		end
		
		if curStep == 3631 then
			doTweenAlpha('blackbg', 'blackbg', 1, 1, 'quadOut')
		end
	
		if curStep == 3647 then
			currentbg = 'egg'
			doTweenAlpha('blackbg', 'blackbg', 0, 0.7, 'quadOut')
		end
		
		if curStep == 3743 then
			currentbg = 'tempsothecurtainscanjustfuckoffplease'
			doTweenAlpha('blackbg', 'blackbg', 1, 1, 'quadOut')
			doTweenX('byexeno','dad', -150, 1.4, 'quadIn')
			doTweenAlpha('curtainslol', 'curtains', 0, 0.7, 'quadOut')
			doTweenAlpha('curtainstoplol', 'curtainstop', 0, 0.7, 'quadOut')
		end
		
		if curStep == 3775 then
			setProperty('blackbg.alpha', 1)
			setProperty('iamgod.alpha', 1)
			doTweenAlpha('jumpscareflash', 'iamgod', 0, 0.5, 'quadOut')
			currentbg = 'none'	
			setProperty('boyfriend.alpha', 0)
			setProperty('sonicrunnin.alpha', 1)
			triggerEvent('Change Character', 'bf','sonicfocus')
			setProperty('peeloutlegs.alpha', 0)
			doTweenX('smaltimer', 'sonicrunnin', 480, 0.7)
			for i = 4,7 do
				noteTweenAlpha(i+16, i, 0, 0.01, 'linear')
			end
		end
		
		if curStep == 3843 then
			setProperty('blackfull.alpha', 1)
			setProperty('closejumpscare.alpha', 1)
			doTweenAlpha('jumpscareflash', 'closejumpscare', 0, 1, 'quadOut')
		end
	end
	
setProperty('peeloutlegs.x', getProperty('boyfriend.x')-24*4)
setProperty('peeloutlegs.y', getProperty('boyfriend.y')+4)

	if getProperty('bflegs.animation.curAnim.name') == 'slow' then
		setProperty('bflegs.x', getProperty('gf.x')+185)
		setProperty('bflegs.y', getProperty('gf.y')+25)
	elseif getProperty('bflegs.animation.curAnim.name') == 'normal' then
		setProperty('bflegs.x', getProperty('gf.x')+20)
		setProperty('bflegs.y', getProperty('gf.y')+30)
	elseif getProperty('bflegs.animation.curAnim.name') == 'fast' then
		setProperty('bflegs.x', getProperty('gf.x')+20)
		setProperty('bflegs.y', getProperty('gf.y')+30)
	end
end

function onUpdatePost()
	setProperty('iconP1.alpha', 0)
	setProperty('showRating', false)
	setProperty('showComboNum', false)
end

function onGameOver()

	return Function_Stop;
	
end

function onGameOverStart()

	return Function_Stop;
	
--[[

OLD GAME OVER CODE
	makeLuaSprite('aspect', 'aspect', -80, 0)
    setProperty('aspect.antialiasing', false)
   	scaleObject('aspect', 1, 1)
    addLuaSprite('aspect', false)
	setObjectCamera('aspect', 'other')

	makeLuaSprite('AIfloor', 'AIfloor', 440, 165)
	setProperty('AIfloor.antialiasing', false)
	scaleObject('AIfloor', 4, 4)
	addLuaSprite('AIfloor', true)
	doTweenX('AIfloorscroll', 'AIfloor', -1660, 1.27, 'sineOut')

	playSound('appears')

	--Just a debug thing, delete if its still there lol
	function onUpdate()
		if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.TAB') then
			restartSong(true);
		end	
	end

	function onTweenCompleted(tag)
		if tag == 'endofdaspook' then
			removeLuaSprite('scawy')
			objectPlayAnimation('fake', 'fake3')

		end
	end
--]]
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'bfboo' then
		setProperty('bfjumpscare.alpha', 1)
		runTimer('bfboo2', 0.04)
	end
	
	if tag == 'bfboo2' then
		setProperty('bfjumpscare.alpha', 0)
		runTimer('bfboo', 0.04)
	end

	if tag == 'blink1' then
		runTimer('blink2', 0.5)
		setProperty('misses.alpha', 1)
	end
	
	if tag == 'blink2' then
		runTimer('blink1', 0.5)
		setProperty('misses.alpha', 0)
	end
	
	if tag == 'stagestart' then
		runTimer('2ndtext', '0.05')
		doTweenX('confronting', 'confronting', 0, 0.25, 'linear')
	end
	
	if tag == '2ndtext' then
		runTimer('act', '0.05')
		doTweenX('yourself', 'yourself', 0, 0.25, 'linear')
	end
	
	if tag == 'act' then
		doTweenX('act1', 'act1', 0, 0.25, 'linear')
	end
end
function onDestroy()
	setPropertyFromClass('openfl.Lib', 'application.window.title', "Friday Night Funkin': Psych Engine")
end