--[[!!ATTENTION WEBSITES/PEOPLE PORTING TO ANDROID OR WHATEVER THE FUCK YOU'RE DOING!!

Hi, I'm Snow.

--If you're a website trying to port my mod so you can fill it with ads:

don't.
You've done this to me three times and each time you've done it.
I've stated my disapproval, and yet you've somehow fucked it up each time.
You **DO NOT** have my permission to reupload this mod onto any site, or download.
Credit is not enough, you're profiting off me.
Fuck off.

Extra sidenote btw, the whole mod will likely run like garbage on html5 anyway.
but you don't care about that do you
you just want money, lol.

--

--Meanwhile, Android people:

Hey guys, you lot aint that bad cuz you ain't blatantly slapping ads all over.
Plus i do find it kinda cool how my bad code can run on phones so you guys are aight. respect.

But a heads up; this mod is made strictly for PCs in mind.
Porting it over may not work very well, due to some scripts n' shit making videos render mid-song.
If it works, good on you guys ig lol. Just tell people where they can download the original, cool? Cool.

--

--Everyone else:

uh hi guess u wanted to see how shit my code was lol
its bad, im not very good, and frankly, this is all held together by spit and bandages.
feel free to do whatever the fuck u want duh
i just fucking hate website ports they're so fucking low effort and scummy
assholes

anyway have fun pokin' abt :)

--]]

local scrspd = 0.8
local twnspd = 1
local sprint = true

local bad = false
local badending = false
local best = true

local begin = true
local forthelowends = false

local currentbg = 'island' -- 'island', 'island-fire', 'ghz', 'knux', 'egg', 'none'

local widescreen = false
local nohud = false

local walk = false
local fly = false
local canPause = true

local lowendsave1 = false
local lowendsave2 = false
local lowendsave3 = false
local lowendsave4 = false
local lowendsave5 = false
local lowendsave6 = false

function onCreate()
	--preload the sound
	playSound('sonicdeath', 0)

	luaDebugMode = false

	setProperty('gf.alpha', 0)

	if difficulty == 0 then
		widescreen = false
	else
		widescreen = true
	end
	
	setPropertyFromClass('backend.ClientPrefs', 'data.timeBarType', 'Time Elapsed')

--- reusing a lot of code from my take lmao hurray

--	a lot of prechaching sorry lol
	precacheImage('AIfloor')
	precacheImage('AIfront')
	precacheImage('AIleaves')
	precacheImage('spriteAI')
	precacheImage('fireloop')
	precacheImage('firebgloop')
	precacheImage('aspect')
	precacheImage('scawy')
	precacheImage('scawy0')
	precacheImage('scawy2')
	precacheImage('scawy3')
	precacheImage('scawybf')
	precacheImage('gameoversheet')
	precacheImage('screenstatic')
	
	precacheImage('TailsDash')
	precacheImage('TailsRoll')
	precacheImage('TailsRun')
	precacheImage('TailsWalk')
	precacheImage('TailsDeath')
	
	precacheImage('KnuxRoll')
	precacheImage('KnuxWalk')
	precacheImage('KnuxRun')
	precacheImage('KnuxDeath')
	
	precacheImage('EggWalk')
	precacheImage('EggDeath')
	precacheImage('EggFly')
	
	precacheImage('goober1')
	precacheImage('goober2')
	precacheImage('goober3')
	
	precacheImage('ghbg')
	precacheImage('ghclouds')
	precacheImage('ghcloudsB')
	precacheImage('ghcloudsC')
	precacheImage('ghfloor')
	precacheImage('ghrocks')
	precacheImage('ghwater')
	
	precacheImage('characters/sonic')
	precacheImage('characters/supersonicsheet')
	precacheImage('characters/sonictornado')
	precacheImage('characters/sonicpanic')
	precacheImage('characters/xenoCY')
	precacheImage('characters/xenoCYAnger')
	precacheImage('characters/sonicpeelout')
	precacheImage('soncexebadend')
	
	precacheImage('bg/kbg1')
	precacheImage('bg/kbg2')
	precacheImage('bg/kbg3')
	precacheImage('bg/kbg4')
	precacheImage('bg/knux1')
	
	precacheImage('tornado/tornado')
	precacheImage('tornado/sky1')
	precacheImage('tornado/sky2')
	precacheImage('tornado/sky3')
	precacheImage('tornado/sky4')
	precacheImage('tornado/rain')

	precacheImage('bg/eggbg')
	precacheImage('bg/eggstageanimated')
	
	precacheImage('bg/AIbackNEW')
	precacheImage('bg/aileaves')
	precacheImage('bg/aifloorburn')
	
	
-- ok no more prechaching

	setPropertyFromClass('openfl.Lib', 'application.window.title', "SONIC")
	setProperty('health', 2)
	
	makeAnimatedLuaSprite('armssonicwalkfront', 'characters/sonicwalkCY', 0, 0)
	addAnimationByPrefix('armssonicwalkfront', 'armfront', 'armfront', 8, true)
	objectPlayAnimation('armssonicwalkfront', 'armfront')
	setProperty('armssonicwalkfront.antialiasing', false)
	scaleObject('armssonicwalkfront', 4, 4)
	addLuaSprite('armssonicwalkfront')
	setObjectOrder('armssonicwalkfront', getObjectOrder('dadGroup')+4)
	
	makeLuaSprite('blackfull', 'black', -300, -300)
    setProperty('blackfull.antialiasing', false)
    scaleObject('blackfull', 10, 10)
    addLuaSprite('blackfull', false)
	setProperty('blackfull.alpha', 1)
	setObjectCamera('blackfull', 'other')	

	makeLuaSprite('redcircle', 'titlecard/s1/redcircle', 960, 0)
    setProperty('redcircle.antialiasing', false)
    scaleObject('redcircle', 3, 3)
    addLuaSprite('redcircle', false)
	setObjectCamera('redcircle', 'other')
	
	makeLuaSprite('confronting', 'titlecard/s1/confronting', -960, 0)
    setProperty('confronting.antialiasing', false)
    scaleObject('confronting', 3, 3)
    addLuaSprite('confronting', false)
	setObjectCamera('confronting', 'other')
	
	makeLuaSprite('yourself', 'titlecard/s1/yourself', -960, 0)
    setProperty('yourself.antialiasing', false)
    scaleObject('yourself', 3, 3)
    addLuaSprite('yourself', false)
	setObjectCamera('yourself', 'other')
	
	makeLuaSprite('act1', 'titlecard/s1/act1', 960, 0)
    setProperty('act1.antialiasing', false)
    scaleObject('act1', 3, 3)
    addLuaSprite('act1', false)
	setObjectCamera('act1', 'other')	
	
	if widescreen == false then
		makeLuaSprite('ready', 'gameovertext/ready', -960, 0)
	else
		makeLuaSprite('ready', 'gameovertext/ready', -1280, 0)
	end
    setProperty('ready.antialiasing', false)
    scaleObject('ready', 3, 3)
    addLuaSprite('ready', false)
	setObjectCamera('ready', 'other')
	setProperty('ready.alpha', 0)
	
	if widescreen == false then
		makeLuaSprite('orNot', 'gameovertext/or not', 960, 0)
	else
		makeLuaSprite('orNot', 'gameovertext/or not', 1280, 0)
	end
    setProperty('orNot.antialiasing', false)
    scaleObject('orNot', 3, 3)
    addLuaSprite('orNot', false)
	setObjectCamera('orNot', 'other')
	setProperty('orNot.alpha', 0)
	if widescreen == false then
		makeLuaSprite('hereicome', 'gameovertext/here i come', 0, 0)
	else
		makeLuaSprite('hereicome', 'gameovertext/here i come', 160, 0)
	end
    setProperty('hereicome.antialiasing', false)
    scaleObject('hereicome', 3, 3)
    addLuaSprite('hereicome', false)
	setObjectCamera('hereicome', 'other')
	setProperty('hereicome.alpha', 0)
	
--  ANIMATED SONIC WALK
	
---	
	
	makeLuaSprite('black', 'black', -300, -300)
    setProperty('black.antialiasing', false)
    scaleObject('black', 10, 10)
    addLuaSprite('black', false)
	setObjectOrder('black', getObjectOrder('dadGroup')+5)
	setProperty('black.alpha', 0)

	makeLuaSprite('red', 'red', -300, -300)
    setProperty('red.antialiasing', false)
    scaleObject('red', 10, 10)
    addLuaSprite('red', false)
	setObjectOrder('red', getObjectOrder('dadGroup')+5)
	setProperty('red.alpha', 0)
	
	makeLuaSprite('redfilter', 'red', -300, -300)
    setProperty('redfilter.antialiasing', false)
    scaleObject('redfilter', 10, 10)
    addLuaSprite('redfilter', false)
	setObjectOrder('redfilter', getObjectOrder('dadGroup')+5)
	setProperty('redfilter.alpha', 0.4)
	setBlendMode('redfilter', 'add')
	
	
	makeLuaSprite('Vignette', 'Vignette', -225, 170)
    setProperty('Vignette.antialiasing', false)
    addLuaSprite('Vignette', false)
	scaleObject('Vignette', 1.2, 1.2)
	setObjectOrder('Vignette', getObjectOrder('dadGroup')+5)
	setProperty('Vignette.alpha', 0)
	
	makeLuaSprite('Vignette2', 'Vignette2', -225, 170)
    setProperty('Vignette2.antialiasing', false)
    addLuaSprite('Vignette2', false)
	scaleObject('Vignette2', 1.2, 1.2)
	setObjectOrder('Vignette2', getObjectOrder('dadGroup')+5)
	setProperty('Vignette2.alpha', 0)
	--setObjectCamera('Vignette', 'other')	
	
	makeLuaSprite('flashback', 'flashback', -225, 170)
    setProperty('flashback.antialiasing', false)
    addLuaSprite('flashback', false)
	scaleObject('flashback', 1.2, 1.2)
	setObjectOrder('flashback', getObjectOrder('dadGroup')+7)
	setProperty('flashback.alpha', 0)
	
	--makeAnimatedLuaSprite('static', 'screenstatic', -200, 100)
	makeAnimatedLuaSprite('static', 'screenstatic', 0, 0)
	addAnimationByPrefix('static', 'screenstatic', 'screenSTATIC', 24, true)
	objectPlayAnimation('static', 'screenstatic')
    setProperty('static.antialiasing', false)
    scaleObject('static', 1.3, 1.3)
	setObjectCamera('static', 'camOther')
    addLuaSprite('static', false)
	setObjectOrder('static', getObjectOrder('dadGroup')+9)
	setProperty('static.alpha', 0)
	setBlendMode('static', 'add')
	
	makeAnimatedLuaSprite('staticfull', 'screenstatic', 0, 0)
	addAnimationByPrefix('staticfull', 'screenstatic', 'screenSTATIC', 24, true)
	objectPlayAnimation('staticfull', 'screenstatic')
    setProperty('staticfull.antialiasing', false)
    scaleObject('staticfull', 1.3, 1.3)
	setObjectCamera('staticfull', 'camOther')
    addLuaSprite('staticfull', false)
	setObjectOrder('staticfull', getObjectOrder('dadGroup')+9)
	setProperty('staticfull.alpha', 0)
	
	makeLuaSprite('white', 'white', -300, -300)
    setProperty('white.antialiasing', false)
    scaleObject('white', 10, 10)
    addLuaSprite('white', false)
	setObjectOrder('white', getObjectOrder('dadGroup')+8)
	setProperty('white.alpha', 0)
	
	makeLuaSprite('run', 'run', 0, 0)
	setProperty('run.antialiasing', false)
	setObjectCamera('run', 'hud')
	addLuaSprite('run', false)
	setProperty('run.alpha', 0)

  if widescreen == false then
		makeLuaSprite('jumpscare', 'scawy', -210, 0)
	else
		makeLuaSprite('jumpscare', 'scawy', -50, 0)
	end
	scaleObject('jumpscare', 6, 6)
	setProperty('jumpscare.antialiasing', false)
	setObjectCamera('jumpscare', 'other')
	addLuaSprite('jumpscare', true)
	setProperty('jumpscare.alpha', 0)
	
	if widescreen == false then
		makeLuaSprite('eyesjumpscare', 'scawy0', -210, 0)
	else
		makeLuaSprite('eyesjumpscare', 'scawy0', -50, 0)
	end
	scaleObject('eyesjumpscare', 6, 6)
	setProperty('eyesjumpscare.antialiasing', false)
	setObjectCamera('eyesjumpscare', 'other')
	addLuaSprite('eyesjumpscare', true)
	setProperty('eyesjumpscare.alpha', 0)
	
	
	
	if widescreen == false then
		makeLuaSprite('iamgod', 'scawy2', -210, 0)
	else
		makeLuaSprite('iamgod', 'scawy2', -50, 0)
	end
	scaleObject('iamgod', 6, 6)
	setProperty('iamgod.antialiasing', false)
	setObjectCamera('iamgod', 'other')
	addLuaSprite('iamgod', true)
	setProperty('iamgod.alpha', 0)

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
    doTweenX('firebgscroll', 'firebg', -320*4, 2*scrspd, 'linear')

	makeAnimatedLuaSprite('firebg2', 'fireloop', -320*4, 300)
	addAnimationByPrefix('firebg2', 'fireloop', 'fireloop', 8, true)
	objectPlayAnimation('firebg2', 'fireloop')
    setProperty('firebg2.antialiasing', false)
    scaleObject('firebg2', 4, 4)
    addLuaSprite('firebg2', false)
    doTweenX('firebgscroll2', 'firebg2', -640*4, 2*scrspd, 'linear')

	makeAnimatedLuaSprite('firebg3', 'fireloop', 320*4, 300)
	addAnimationByPrefix('firebg3', 'fireloop', 'fireloop', 8, true)
	objectPlayAnimation('firebg3', 'fireloop')
    setProperty('firebg3.antialiasing', false)
    scaleObject('firebg3', 4, 4)
    addLuaSprite('firebg3', false)
    doTweenX('firebgscroll3', 'firebg3', 0, 2*scrspd, 'linear')
---
--
--AI trees
	makeLuaSprite('trees', 'spriteAI', 0, -30)
    setProperty('trees.antialiasing', false)
    scaleObject('trees', 4, 4)
    addLuaSprite('trees', false)
    doTweenX('treesscroll', 'trees', -2670*4, 12*scrspd, 'linear')

    makeLuaSprite('trees2', 'spriteAI', -2670*4, -30)
    setProperty('trees2.antialiasing', false)
    scaleObject('trees2', 4, 4)
    addLuaSprite('trees2', false)
    doTweenX('treesscroll2', 'trees2', -5340*4, 12*scrspd, 'linear')

    makeLuaSprite('trees3', 'spriteAI', 2670*4, -30)
    setProperty('trees3.antialiasing', false)
    scaleObject('trees3', 4, 4)
    addLuaSprite('trees3', false)
    doTweenX('treesscroll3', 'trees3', 0, 12*scrspd, 'linear')
	--]]
---


--AI top
	makeLuaSprite('top', 'AIleaves', 0, 40)
    setProperty('top.antialiasing', false)
    scaleObject('top', 4, 4)
    addLuaSprite('top', false)
    doTweenX('topscroll', 'top', -2670*4, 10*scrspd, 'linear')

    makeLuaSprite('top2', 'AIleaves', -2670*4, 40)
    setProperty('top2.antialiasing', false)
    scaleObject('top2', 4, 4)
    addLuaSprite('top2', false)
    doTweenX('topscroll2', 'top2', -5340*4, 10*scrspd, 'linear')

    makeLuaSprite('top3', 'AIleaves', 2670*4, 40)
    setProperty('top3.antialiasing', false)
    scaleObject('top3', 4, 4)
    addLuaSprite('top3', false)
    doTweenX('topscroll3', 'top3', 0, 10*scrspd, 'linear')
	
---

--AI front
	makeLuaSprite('AIfront', 'AIfront', 0, -30)
    setProperty('AIfront.antialiasing', false)
    scaleObject('AIfront', 4, 4)
    addLuaSprite('AIfront', false)
    doTweenX('AIfrontscroll', 'AIfront', -2670*4, 7*scrspd, 'linear')

    makeLuaSprite('AIfront2', 'AIfront', -2670*4, -30)
    setProperty('AIfront2.antialiasing', false)
    scaleObject('AIfront2', 4, 4)
    addLuaSprite('AIfront2', false)
    doTweenX('AIfrontscroll2', 'AIfront2', -5340*4, 7*scrspd, 'linear')

    makeLuaSprite('AIfront3', 'AIfront', 2670*4, -30)
    setProperty('AIfront3.antialiasing', false)
    scaleObject('AIfront3', 4, 4)
    addLuaSprite('AIfront3', false)
    doTweenX('AIfrontscroll3', 'AIfront3', 0, 7*scrspd, 'linear')
	
---

--ISLAND FIRE 2

	makeAnimatedLuaSprite('AITopA', 'bg/aileaves', 0, 200)
	addAnimationByPrefix('AITopA', 'AITopA', 'AILeaves', 24, true)
	objectPlayAnimation('AITopA', 'AITopA')
    setProperty('AITopA.antialiasing', false)
    scaleObject('AITopA', 3, 3)
    addLuaSprite('AITopA', false)
    doTweenX('AITopAscroll', 'AITopA', -512*3, 6*scrspd, 'linear')
	
    makeAnimatedLuaSprite('AITopA2', 'bg/aileaves', -512*3, 200)
	addAnimationByPrefix('AITopA2', 'AITopA2', 'AILeaves', 24, true)
	objectPlayAnimation('AITopA2', 'AITopA2')
    setProperty('AITopA2.antialiasing', false)
    scaleObject('AITopA2', 3, 3)
    addLuaSprite('AITopA2', false)
    doTweenX('AITopAscroll2', 'AITopA2', -1024*3, 6*scrspd, 'linear')

    makeAnimatedLuaSprite('AITopA3', 'bg/aileaves', 512*3, 200)
	addAnimationByPrefix('AITopA3', 'AITopA3', 'AILeaves', 24, true)
	objectPlayAnimation('AITopA3', 'AITopA3')
    setProperty('AITopA3.antialiasing', false)
    scaleObject('AITopA3', 3, 3)
    addLuaSprite('AITopA3', false)
    doTweenX('AITopAscroll3', 'AITopA3', 0, 6*scrspd, 'linear')

	makeLuaSprite('AIBackA', 'bg/AIBackNEW', 0, 400)
    setProperty('AIBackA.antialiasing', false)
    scaleObject('AIBackA', 3, 3)
    addLuaSprite('AIBackA', false)
    doTweenX('AIBackAscroll', 'AIBackA', -512*3, 4*scrspd, 'linear')
	
    makeLuaSprite('AIBackA2', 'bg/AIBackNEW', -512*3, 400)
    setProperty('AIBackA2.antialiasing', false)
    scaleObject('AIBackA2', 3, 3)
    addLuaSprite('AIBackA2', false)
    doTweenX('AIBackAscroll2', 'AIBackA2', -1024*3, 4*scrspd, 'linear')

    makeLuaSprite('AIBackA3', 'bg/AIBackNEW', 512*3, 400)
    setProperty('AIBackA3.antialiasing', false)
    scaleObject('AIBackA3', 3, 3)
    addLuaSprite('AIBackA3', false)
    doTweenX('AIBackAscroll3', 'AIBackA3', 0, 4*scrspd, 'linear')
	
	
---leeeeaves	

--floor	
	makeLuaSprite('floor', 'bg/aifloorburn', 0, 90)
    setProperty('floor.antialiasing', false)
    scaleObject('floor', 4, 4)
    addLuaSprite('floor', false)
    doTweenX('floorscroll', 'floor', -512*4, 1*scrspd, 'linear')

    makeLuaSprite('floor2', 'bg/aifloorburn', -512*4, 90)
    setProperty('floor2.antialiasing', false)
    scaleObject('floor2', 4, 4)
    addLuaSprite('floor2', false)
    doTweenX('floorscroll2', 'floor2', -1024*4, 1*scrspd, 'linear')

    makeLuaSprite('floor3', 'bg/aifloorburn', 512*4, 90)
    setProperty('floor3.antialiasing', false)
    scaleObject('floor3', 4, 4)
    addLuaSprite('floor3', false)
    doTweenX('floorscroll3', 'floor3', 0, 1*scrspd, 'linear')
	
	
--fire foreground
	makeAnimatedLuaSprite('fire', 'fireloop', 0, 670)
	addAnimationByPrefix('fire', 'fireloop', 'fireloop', 8, true)
	objectPlayAnimation('fire', 'fireloop')
    setProperty('fire.antialiasing', false)
    scaleObject('fire', 4, 4)
    addLuaSprite('fire', false)
    doTweenX('firescroll', 'fire', -320*4, 1, 'linear')

	makeAnimatedLuaSprite('fire2', 'fireloop', -320*4, 670)
	addAnimationByPrefix('fire2', 'fireloop', 'fireloop', 8, true)
	objectPlayAnimation('fire2', 'fireloop')
    setProperty('fire2.antialiasing', false)
    scaleObject('fire2', 4, 4)
    addLuaSprite('fire2', false)
    doTweenX('firescroll2', 'fire2', -640*4, 1, 'linear')

	makeAnimatedLuaSprite('fire3', 'fireloop', 320*4, 670)
	addAnimationByPrefix('fire3', 'fireloop', 'fireloop', 8, true)
	objectPlayAnimation('fire3', 'fireloop')
    setProperty('fire3.antialiasing', false)
    scaleObject('fire3', 4, 4)
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
    doTweenX('kbg1scroll', 'kbg1', -512*4, 4*scrspd, 'linear')

	makeLuaSprite('kbg1-2', 'bg/kbg1', -512*4, 50)
    setProperty('kbg1-2.antialiasing', false)
    scaleObject('kbg1-2', 4, 4)
    addLuaSprite('kbg1-2', false)
    doTweenX('kbg1scroll2', 'kbg1-2', -1024*4, 4*scrspd, 'linear')
	
	makeLuaSprite('kbg1-3', 'bg/kbg1', 512*4, 50)
    setProperty('kbg1-3.antialiasing', false)
    scaleObject('kbg1-3', 4, 4)
    addLuaSprite('kbg1-3', false)
    doTweenX('kbg1scroll3', 'kbg1-3', 0, 4*scrspd, 'linear')

--kbg2	
	makeLuaSprite('kbg2', 'bg/kbg2', 0, 305)
    setProperty('kbg2.antialiasing', false)
    scaleObject('kbg2', 4, 4)
    addLuaSprite('kbg2', false)
    doTweenX('kbg2scroll', 'kbg2', -512*4, 6*scrspd, 'linear')

	makeLuaSprite('kbg2-2', 'bg/kbg2', -512*4, 305)
    setProperty('kbg2-2.antialiasing', false)
    scaleObject('kbg2-2', 4, 4)
    addLuaSprite('kbg2-2', false)
    doTweenX('kbg2scroll2', 'kbg2-2', -1024*4, 6*scrspd, 'linear')
	
	makeLuaSprite('kbg2-3', 'bg/kbg2', 512*4, 305)
    setProperty('kbg2-3.antialiasing', false)
    scaleObject('kbg2-3', 4, 4)
    addLuaSprite('kbg2-3', false)
    doTweenX('kbg2scroll3', 'kbg2-3', 0, 6*scrspd, 'linear')
	
--kbg3	
	makeLuaSprite('kbg3', 'bg/kbg3', 0, 430)
    setProperty('kbg3.antialiasing', false)
    scaleObject('kbg3', 4, 4)
    addLuaSprite('kbg3', false)
    doTweenX('kbg3scroll', 'kbg3', -512*4, 8*scrspd, 'linear')

	makeLuaSprite('kbg3-2', 'bg/kbg3', -512*4, 430)
    setProperty('kbg3-2.antialiasing', false)
    scaleObject('kbg3-2', 4, 4)
    addLuaSprite('kbg3-2', false)
    doTweenX('kbg3scroll2', 'kbg3-2', -1024*4, 8, 'linear')
	
	makeLuaSprite('kbg3-3', 'bg/kbg3', 512*4, 430)
    setProperty('kbg3-3.antialiasing', false)
    scaleObject('kbg3-3', 4, 4)
    addLuaSprite('kbg3-3', false)
    doTweenX('kbg3scroll3', 'kbg3-3', 0, 8*scrspd, 'linear')
		
--kbg4	
	makeLuaSprite('kbg4', 'bg/kbg4', 0, 620)
    setProperty('kbg4.antialiasing', false)
    scaleObject('kbg4', 4, 4)
    addLuaSprite('kbg4', false)
    doTweenX('kbg4scroll', 'kbg4', -512*4, 10*scrspd, 'linear')

	makeLuaSprite('kbg4-2', 'bg/kbg4', -512*4, 620)
    setProperty('kbg4-2.antialiasing', false)
    scaleObject('kbg4-2', 4, 4)
    addLuaSprite('kbg4-2', false)
    doTweenX('kbg4scroll2', 'kbg4-2', -1024*4, 10*scrspd, 'linear')
	
	makeLuaSprite('kbg4-3', 'bg/kbg4', 512*4, 620)
    setProperty('kbg4-3.antialiasing', false)
    scaleObject('kbg4-3', 4, 4)
    addLuaSprite('kbg4-3', false)
    doTweenX('kbg4scroll3', 'kbg4-3', 0, 10*scrspd, 'linear')
	
---sbz

	makeLuaSprite('sbz1', 'bg/sbzsky1', 0, 200)
    setProperty('sbz1.antialiasing', false)
    scaleObject('sbz1', 3, 3)
    addLuaSprite('sbz1', false)
    doTweenX('sbz1scroll', 'sbz1', -1280*3, 8*scrspd, 'linear')

	makeLuaSprite('sbz1-2', 'bg/sbzsky1', -1280*3, 200)
    setProperty('sbz1-2.antialiasing', false)
    scaleObject('sbz1-2', 3, 3)
    addLuaSprite('sbz1-2', false)
    doTweenX('sbz1scroll2', 'sbz1-2', -2560*3, 8*scrspd, 'linear')
	
	makeLuaSprite('sbz1-3', 'bg/sbzsky1', 1280*3, 200)
    setProperty('sbz1-3.antialiasing', false)
    scaleObject('sbz1-3', 3, 3)
    addLuaSprite('sbz1-3', false)
    doTweenX('sbz1scroll3', 'sbz1-3', 0, 8*scrspd, 'linear')
	
--

	makeLuaSprite('sbz2', 'bg/sbzsky2', 0, 248)
    setProperty('sbz2.antialiasing', false)
    scaleObject('sbz2', 3, 3)
    addLuaSprite('sbz2', false)
    doTweenX('sbz2scroll', 'sbz2', -1280*3, 10*scrspd, 'linear')

	makeLuaSprite('sbz2-2', 'bg/sbzsky2', -1280*3, 248)
    setProperty('sbz2-2.antialiasing', false)
    scaleObject('sbz2-2', 3, 3)
    addLuaSprite('sbz2-2', false)
    doTweenX('sbz2scroll2', 'sbz2-2', -2560*3, 10*scrspd, 'linear')
	
	makeLuaSprite('sbz2-3', 'bg/sbzsky2', 1280*3, 248)
    setProperty('sbz2-3.antialiasing', false)
    scaleObject('sbz2-3', 3, 3)
    addLuaSprite('sbz2-3', false)
    doTweenX('sbz2scroll3', 'sbz2-3', 0, 10*scrspd, 'linear')
	
--

	makeLuaSprite('sbz3', 'bg/sbzsky3', 0, 295)
    setProperty('sbz3.antialiasing', false)
    scaleObject('sbz3', 3, 3)
    addLuaSprite('sbz3', false)
    doTweenX('sbz3scroll', 'sbz3', -1280*3, 12*scrspd, 'linear')

	makeLuaSprite('sbz3-2', 'bg/sbzsky3', -1280*3, 295)
    setProperty('sbz3-2.antialiasing', false)
    scaleObject('sbz3-2', 3, 3)
    addLuaSprite('sbz3-2', false)
    doTweenX('sbz3scroll2', 'sbz3-2', -2560*3, 12*scrspd, 'linear')
	
	makeLuaSprite('sbz3-3', 'bg/sbzsky3', 1280*3, 295)
    setProperty('sbz3-3.antialiasing', false)
    scaleObject('sbz3-3', 3, 3)
    addLuaSprite('sbz3-3', false)
    doTweenX('sbz3scroll3', 'sbz3-3', 0, 12*scrspd, 'linear')
	
--

	makeLuaSprite('sbz4', 'bg/sbzsky4', 0, 343)
    setProperty('sbz4.antialiasing', false)
    scaleObject('sbz4', 3, 3)
    addLuaSprite('sbz4', false)
    doTweenX('sbz4scroll', 'sbz4', -1280*3, 14*scrspd, 'linear')

	makeLuaSprite('sbz4-2', 'bg/sbzsky4', -1280*3, 343)
    setProperty('sbz4-2.antialiasing', false)
    scaleObject('sbz4-2', 3, 3)
    addLuaSprite('sbz4-2', false)
    doTweenX('sbz4scroll2', 'sbz4-2', -2560*3, 14*scrspd, 'linear')
	
	makeLuaSprite('sbz4-3', 'bg/sbzsky4', 1280*3, 343)
    setProperty('sbz4-3.antialiasing', false)
    scaleObject('sbz4-3', 3, 3)
    addLuaSprite('sbz4-3', false)
    doTweenX('sbz4scroll3', 'sbz4-3', 0, 14*scrspd, 'linear')
	
--
	
	makeLuaSprite('sbz5', 'bg/sbzsky5', 0, 320)
    setProperty('sbz5.antialiasing', false)
    scaleObject('sbz5', 3, 3)
    addLuaSprite('sbz5', false)
    doTweenX('sbz5scroll', 'sbz5', -1280*3, 16*scrspd, 'linear')

	makeLuaSprite('sbz5-2', 'bg/sbzsky5', -1280*3, 320)
    setProperty('sbz5-2.antialiasing', false)
    scaleObject('sbz5-2', 3, 3)
    addLuaSprite('sbz5-2', false)
    doTweenX('sbz5scroll2', 'sbz5-2', -2560*3, 16*scrspd, 'linear')
	
	makeLuaSprite('sbz5-3', 'bg/sbzsky5', 1280*3, 320)
    setProperty('sbz5-3.antialiasing', false)
    scaleObject('sbz5-3', 3, 3)
    addLuaSprite('sbz5-3', false)
    doTweenX('sbz5scroll3', 'sbz5-3', 0, 16*scrspd, 'linear')
	
	setProperty('sbz1.visible', false)
	setProperty('sbz1-2.visible', false)
	setProperty('sbz1-3.visible', false)

	setProperty('sbz2.visible', false)
	setProperty('sbz2-2.visible', false)
	setProperty('sbz2-3.visible', false)
	
	setProperty('sbz3.visible', false)
	setProperty('sbz3-2.visible', false)
	setProperty('sbz3-3.visible', false)
	
	setProperty('sbz4.visible', false)
	setProperty('sbz4-2.visible', false)
	setProperty('sbz4-3.visible', false)
	
	setProperty('sbz5.visible', false)
	setProperty('sbz5-2.visible', false)
	setProperty('sbz5-3.visible', false)
---
	
	makeLuaSprite('knux1', 'bg/knux1', 0, 680)
    setProperty('knux1.antialiasing', false)
    scaleObject('knux1', 4, 4)
    addLuaSprite('knux1', false)
    doTweenX('knux1scroll', 'knux1', -1504*4, 5*scrspd, 'linear')

	makeLuaSprite('knux1-2', 'bg/knux1', -1504*4, 680)
    setProperty('knux1-2.antialiasing', false)
    scaleObject('knux1-2', 4, 4)
    addLuaSprite('knux1-2', false)
    doTweenX('knux1scroll2', 'knux1-2', -3008*4, 5*scrspd, 'linear')
	
	makeLuaSprite('knux1-3', 'bg/knux1', 1504*4, 680)
    setProperty('knux1-3.antialiasing', false)
    scaleObject('knux1-3', 4, 4)
    addLuaSprite('knux1-3', false)
    doTweenX('knux1scroll3', 'knux1-3', 0, 5*scrspd, 'linear')
	
--floor	
	makeLuaSprite('sbzfloor', 'bg/sbzfloor', 0, 680)
    setProperty('sbzfloor.antialiasing', false)
    scaleObject('sbzfloor', 4, 4)
    addLuaSprite('sbzfloor', false)
    doTweenX('sbzfloorscroll', 'sbzfloor', -1504*4, 5*scrspd, 'linear')

	makeLuaSprite('sbzfloor2', 'bg/sbzfloor', -1504*4, 680)
    setProperty('sbzfloor2.antialiasing', false)
    scaleObject('sbzfloor2', 4, 4)
    addLuaSprite('sbzfloor2', false)
    doTweenX('sbzfloorscroll2', 'sbzfloor2', -3008*4, 5*scrspd, 'linear')
	
	makeLuaSprite('sbzfloor3', 'bg/sbzfloor', 1504*4, 680)
    setProperty('sbzfloor3.antialiasing', false)
    scaleObject('sbzfloor3', 4, 4)
    addLuaSprite('sbzfloor3', false)
    doTweenX('sbzfloorscroll3', 'sbzfloor3', 0, 5*scrspd, 'linear')
	
	setProperty('sbzfloor.visible', false)
	setProperty('sbzfloor2.visible', false)
	setProperty('sbzfloor3.visible', false)
	
---EGG
	makeLuaSprite('eggbg', 'bg/eggbg', 0, 50)
    setProperty('eggbg.antialiasing', false)
    scaleObject('eggbg', 4, 4)
    addLuaSprite('eggbg', false)
    doTweenX('eggbgscroll', 'eggbg', -512*4, 2*scrspd, 'linear')
	
	makeLuaSprite('eggbg2', 'bg/eggbg', -512*4, 50)
    setProperty('eggbg2.antialiasing', false)
    scaleObject('eggbg2', 4, 4)
    addLuaSprite('eggbg2', false)
    doTweenX('eggbgscroll2', 'eggbg2', -1024*4, 2*scrspd, 'linear')

	makeLuaSprite('eggbg3', 'bg/eggbg', 512*4, 50)
    setProperty('eggbg3.antialiasing', false)
    scaleObject('eggbg3', 4, 4)
    addLuaSprite('eggbg3', false)
    doTweenX('eggbgscroll3', 'eggbg3', 0, 2*scrspd, 'linear')
	
	makeLuaSprite('eggbgred', 'bg/eggbgred', 0, 50)
    setProperty('eggbgred.antialiasing', false)
    scaleObject('eggbgred', 4, 4)
    addLuaSprite('eggbgred', false)
    doTweenX('eggbgredscroll', 'eggbgred', -512*4, 2*scrspd, 'linear')
	
	makeLuaSprite('eggbgred2', 'bg/eggbgred', -512*4, 50)
    setProperty('eggbgred2.antialiasing', false)
    scaleObject('eggbgred2', 4, 4)
    addLuaSprite('eggbgred2', false)
    doTweenX('eggbgredscroll2', 'eggbgred2', -1024*4, 2*scrspd, 'linear')

	makeLuaSprite('eggbgred3', 'bg/eggbgred', 512*4, 50)
    setProperty('eggbgred3.antialiasing', false)
    scaleObject('eggbgred3', 4, 4)
    addLuaSprite('eggbgred3', false)
    doTweenX('eggbgredscroll3', 'eggbgred3', 0, 2*scrspd, 'linear')
	
	setProperty('eggbgred.visible', false)
	setProperty('eggbgred2.visible', false)
	setProperty('eggbgred3.visible', false)
	
	makeLuaSprite('eggbgdark', 'bg/eggbgdark', 0, 50)
    setProperty('eggbgdark.antialiasing', false)
    scaleObject('eggbgdark', 4, 4)
    addLuaSprite('eggbgdark', false)
    doTweenX('eggbgdarkscroll', 'eggbgdark', -512*4, 2*scrspd, 'linear')
	
	makeLuaSprite('eggbgdark2', 'bg/eggbgdark', -512*4, 50)
    setProperty('eggbgdark2.antialiasing', false)
    scaleObject('eggbgdark2', 4, 4)
    addLuaSprite('eggbgdark2', false)
    doTweenX('eggbgdarkscroll2', 'eggbgdark2', -1024*4, 2*scrspd, 'linear')

	makeLuaSprite('eggbgdark3', 'bg/eggbgdark', 512*4, 50)
    setProperty('eggbgdark3.antialiasing', false)
    scaleObject('eggbgdark3', 4, 4)
    addLuaSprite('eggbgdark3', false)
    doTweenX('eggbgdarkscroll3', 'eggbgdark3', 0, 2*scrspd, 'linear')
	
	setProperty('eggbgdark.visible', false)
	setProperty('eggbgdark2.visible', false)
	setProperty('eggbgdark3.visible', false)
	
	setProperty('eggbgdark.visible', false)
	setProperty('eggbgdark2.visible', false)
	setProperty('eggbgdark3.visible', false)
	
	makeAnimatedLuaSprite('eggfloor', 'bg/eggstageanimated', 0, 420)
	addAnimationByPrefix('eggfloor', 'eggstageanimated', 'idle', 12, true)
	objectPlayAnimation('eggfloor', 'eggstageanimated')
    setProperty('eggfloor.antialiasing', false)
    scaleObject('eggfloor', 4, 4)
    addLuaSprite('eggfloor', false)
    doTweenX('eggfloorscroll', 'eggfloor', -512*4, 2*scrspd, 'linear')
	
	makeAnimatedLuaSprite('eggfloor2', 'bg/eggstageanimated', -512*4, 420)
	addAnimationByPrefix('eggfloor2', 'eggstageanimated', 'idle', 12, true)
	objectPlayAnimation('eggfloor2', 'eggstageanimated')
    setProperty('eggfloor2.antialiasing', false)
    scaleObject('eggfloor2', 4, 4)
    addLuaSprite('eggfloor2', false)
    doTweenX('eggfloorscroll2', 'eggfloor2', -1024*4, 2*scrspd, 'linear')
	
	makeAnimatedLuaSprite('eggfloor3', 'bg/eggstageanimated', 512*4, 420)
	addAnimationByPrefix('eggfloor3', 'eggstageanimated', 'idle', 12, true)
	objectPlayAnimation('eggfloor3', 'eggstageanimated')
    setProperty('eggfloor3.antialiasing', false)
    scaleObject('eggfloor3', 4, 4)
    addLuaSprite('eggfloor3', false)
    doTweenX('eggfloorscroll3', 'eggfloor3', 0, 2*scrspd, 'linear')
	
--
	
	makeAnimatedLuaSprite('eggfloorred', 'bg/eggstageanimatedred', 0, 420)
	addAnimationByPrefix('eggfloorred', 'eggstageanimated', 'idle', 12, true)
	objectPlayAnimation('eggfloorred', 'eggstageanimated')
    setProperty('eggfloorred.antialiasing', false)
    scaleObject('eggfloorred', 4, 4)
    addLuaSprite('eggfloorred', false)
    doTweenX('eggfloorredscroll', 'eggfloorred', -512*4, 2*scrspd, 'linear')
	
	makeAnimatedLuaSprite('eggfloorred2', 'bg/eggstageanimatedred', -512*4, 420)
	addAnimationByPrefix('eggfloorred2', 'eggstageanimated', 'idle', 12, true)
	objectPlayAnimation('eggfloorred2', 'eggstageanimated')
    setProperty('eggfloorred2.antialiasing', false)
    scaleObject('eggfloorred2', 4, 4)
    addLuaSprite('eggfloorred2', false)
    doTweenX('eggfloorredscroll2', 'eggfloorred2', -1024*4, 2*scrspd, 'linear')
	
	makeAnimatedLuaSprite('eggfloorred3', 'bg/eggstageanimatedred', 512*4, 420)
	addAnimationByPrefix('eggfloorred3', 'eggstageanimated', 'idle', 12, true)
	objectPlayAnimation('eggfloorred3', 'eggstageanimated')
    setProperty('eggfloorred3.antialiasing', false)
    scaleObject('eggfloorred3', 4, 4)
    addLuaSprite('eggfloorred3', false)
    doTweenX('eggfloorredscroll3', 'eggfloorred3', 0, 2*scrspd, 'linear')
	
--

	makeAnimatedLuaSprite('eggfloordark', 'bg/eggstageanimateddark', 0, 420)
	addAnimationByPrefix('eggfloordark', 'eggstageanimated', 'idle', 12, true)
	objectPlayAnimation('eggfloordark', 'eggstageanimated')
    setProperty('eggfloordark.antialiasing', false)
    scaleObject('eggfloordark', 4, 4)
    addLuaSprite('eggfloordark', false)
    doTweenX('eggfloordarkscroll', 'eggfloordark', -512*4, 2*scrspd, 'linear')
	
	makeAnimatedLuaSprite('eggfloordark2', 'bg/eggstageanimateddark', -512*4, 420)
	addAnimationByPrefix('eggfloordark2', 'eggstageanimated', 'idle', 12, true)
	objectPlayAnimation('eggfloordark2', 'eggstageanimated')
    setProperty('eggfloordark2.antialiasing', false)
    scaleObject('eggfloordark2', 4, 4)
    addLuaSprite('eggfloordark2', false)
    doTweenX('eggfloordarkscroll2', 'eggfloordark2', -1024*4, 2*scrspd, 'linear')
	
	makeAnimatedLuaSprite('eggfloordark3', 'bg/eggstageanimateddark', 512*4, 420)
	addAnimationByPrefix('eggfloordark3', 'eggstageanimated', 'idle', 12, true)
	objectPlayAnimation('eggfloordark3', 'eggstageanimated')
    setProperty('eggfloordark3.antialiasing', false)
    scaleObject('eggfloordark3', 4, 4)
    addLuaSprite('eggfloordark3', false)
    doTweenX('eggfloordarkscroll3', 'eggfloordark3', 0, 2*scrspd, 'linear')
	
	setProperty('eggfloorred.visible', false)
	setProperty('eggfloorred2.visible', false)
	setProperty('eggfloorred3.visible', false)
	
	setProperty('eggfloordark.visible', false)
	setProperty('eggfloordark2.visible', false)
	setProperty('eggfloordark3.visible', false)
	
---AI NORMAL

--SKY
	makeLuaSprite('back', 'bg/aiback', 0, 112)
    setProperty('back.antialiasing', false)
    scaleObject('back', 3, 3)
    addLuaSprite('back', false)

    makeLuaSprite('back2', 'bg/aiback', -512*3, 112)
    setProperty('back2.antialiasing', false)
    scaleObject('back2', 3, 3)
    addLuaSprite('back2', false)


    makeLuaSprite('back3', 'bg/aiback', 512*3, 112)
    setProperty('back3.antialiasing', false)
    scaleObject('back3', 3, 3)
    addLuaSprite('back3', false)
	
--SKY
	makeLuaSprite('green', 'bg/aigreen', 0, 400)
    setProperty('green.antialiasing', false)
    scaleObject('green', 3, 3)
    addLuaSprite('green', false)

    makeLuaSprite('green2', 'bg/aigreen', -512*3, 400)
    setProperty('green2.antialiasing', false)
    scaleObject('green2', 3, 3)
    addLuaSprite('green2', false)
    

    makeLuaSprite('green3', 'bg/aigreen', 512*3, 400)
    setProperty('green3.antialiasing', false)
    scaleObject('green3', 3, 3)
    addLuaSprite('green3', false)
    
	
--floor	
	makeLuaSprite('floorn', 'bg/aifloor', 0, 20)
    setProperty('floorn.antialiasing', false)
    scaleObject('floorn', 4, 4)
    addLuaSprite('floorn', false)
    

    makeLuaSprite('floorn2', 'bg/aifloor', -512*4, 20)
    setProperty('floorn2.antialiasing', false)
    scaleObject('floorn2', 4, 4)
    addLuaSprite('floorn2', false)
    

    makeLuaSprite('floorn3', 'bg/aifloor', 512*4, 20)
    setProperty('floorn3.antialiasing', false)
    scaleObject('floorn3', 4, 4)
    addLuaSprite('floorn3', false)
    
	
-- BESTENDING SKY

	makeLuaSprite('sky1', 'tornado/sky1', 0, 120)
    setProperty('sky1.antialiasing', false)
    scaleObject('sky1', 4, 4)
    addLuaSprite('sky1', false)
    doTweenX('sky1scroll', 'sky1', -512*4, 4*scrspd, 'linear')

	makeLuaSprite('sky1-2', 'tornado/sky1', -512*4, 120)
    setProperty('sky1-2.antialiasing', false)
    scaleObject('sky1-2', 4, 4)
    addLuaSprite('sky1-2', false)
    doTweenX('sky1scroll2', 'sky1-2', -1024*4, 4*scrspd, 'linear')
	
	makeLuaSprite('sky1-3', 'tornado/sky1', 512*4, 120)
    setProperty('sky1-3.antialiasing', false)
    scaleObject('sky1-3', 4, 4)
    addLuaSprite('sky1-3', false)
    doTweenX('sky1scroll3', 'sky1-3', 0, 4*scrspd, 'linear')
	
--
	
	makeLuaSprite('sky2', 'tornado/sky2', 0, 305)
    setProperty('sky2.antialiasing', false)
    scaleObject('sky2', 4, 4)
    addLuaSprite('sky2', false)
    doTweenX('sky2scroll', 'sky2', -512*4, 6*scrspd, 'linear')

	makeLuaSprite('sky2-2', 'tornado/sky2', -512*4, 305)
    setProperty('sky2-2.antialiasing', false)
    scaleObject('sky2-2', 4, 4)
    addLuaSprite('sky2-2', false)
    doTweenX('sky2scroll2', 'sky2-2', -1024*4, 6*scrspd, 'linear')
	
	makeLuaSprite('sky2-3', 'tornado/sky2', 512*4, 305)
    setProperty('sky2-3.antialiasing', false)
    scaleObject('sky2-3', 4, 4)
    addLuaSprite('sky2-3', false)
    doTweenX('sky2scroll3', 'sky2-3', 0, 6*scrspd, 'linear')
	
--
	
	makeLuaSprite('sky3', 'tornado/sky3', 0, 490)
    setProperty('sky3.antialiasing', false)
    scaleObject('sky3', 4, 4)
    addLuaSprite('sky3', false)
    doTweenX('sky3scroll', 'sky3', -512*4, 8*scrspd, 'linear')

	makeLuaSprite('sky3-2', 'tornado/sky3', -512*4, 490)
    setProperty('sky3-2.antialiasing', false)
    scaleObject('sky3-2', 4, 4)
    addLuaSprite('sky3-2', false)
    doTweenX('sky3scroll2', 'sky3-2', -1024*4, 8*scrspd, 'linear')
	
	makeLuaSprite('sky3-3', 'tornado/sky3', 512*4, 490)
    setProperty('sky3-3.antialiasing', false)
    scaleObject('sky3-3', 4, 4)
    addLuaSprite('sky3-3', false)
    doTweenX('sky3scroll3', 'sky3-3', 0, 8*scrspd, 'linear')
	
--
	
	makeLuaSprite('sky4', 'tornado/sky4', 0, 680)
    setProperty('sky4.antialiasing', false)
    scaleObject('sky4', 4, 4)
    addLuaSprite('sky4', false)
    doTweenX('sky4scroll', 'sky4', -512*4, 10*scrspd, 'linear')

	makeLuaSprite('sky4-2', 'tornado/sky4', -512*4, 680)
    setProperty('sky4-2.antialiasing', false)
    scaleObject('sky4-2', 4, 4)
    addLuaSprite('sky4-2', false)
    doTweenX('sky4scroll2', 'sky4-2', -1024*4, 10*scrspd, 'linear')
	
	makeLuaSprite('sky4-3', 'tornado/sky4', 512*4, 680)
    setProperty('sky4-3.antialiasing', false)
    scaleObject('sky4-3', 4, 4)
    addLuaSprite('sky4-3', false)
    doTweenX('sky4scroll3', 'sky4-3', 0, 10*scrspd, 'linear')
	
--
	
	makeLuaSprite('sky5', 'tornado/sky4', 0, 850)
    setProperty('sky5.antialiasing', false)
    scaleObject('sky5', 4, 4)
    addLuaSprite('sky5', false)
    doTweenX('sky5scroll', 'sky5', -512*4, 12*scrspd, 'linear')

	makeLuaSprite('sky5-2', 'tornado/sky4', -512*4, 850)
    setProperty('sky5-2.antialiasing', false)
    scaleObject('sky5-2', 4, 4)
    addLuaSprite('sky5-2', false)
    doTweenX('sky5scroll2', 'sky5-2', -1024*4, 12*scrspd, 'linear')
	
	makeLuaSprite('sky5-3', 'tornado/sky4', 512*4, 850)
    setProperty('sky5-3.antialiasing', false)
    scaleObject('sky5-3', 4, 4)
    addLuaSprite('sky5-3', false)
    doTweenX('sky5scroll3', 'sky5-3', 0, 12*scrspd, 'linear')
	
--

	makeAnimatedLuaSprite('armssonicwalkback', 'characters/sonicwalkCY', 0, 0)
	addAnimationByPrefix('armssonicwalkback', 'armback', 'armback', 8, true)
	objectPlayAnimation('armssonicwalkback', 'armback')
	setProperty('armssonicwalkback.antialiasing', false)
	scaleObject('armssonicwalkback', 4, 4)
	addLuaSprite('armssonicwalkback')

	makeAnimatedLuaSprite('soniclegswalk', 'characters/sonicwalkCY', getProperty('boyfriend.x'), getProperty('boyfriend.y'))
	addAnimationByPrefix('soniclegswalk', 'legs', 'legs', 8, true)
	objectPlayAnimation('soniclegswalk', 'legs')
	setProperty('soniclegswalk.antialiasing', false)
	scaleObject('soniclegswalk', 4, 4)
	addLuaSprite('soniclegswalk')

--
	makeLuaSprite('blackbg', 'black', -300, -300)
    setProperty('blackbg.antialiasing', false)
    scaleObject('blackbg', 10, 10)
    addLuaSprite('blackbg', false)
	--setObjectOrder('blackbg', getObjectOrder('gfGroup')-1)
	setProperty('blackbg.alpha', 0)
	

	makeLuaSprite('score','hud/score', 60, 40)
	setScrollFactor('score', 0, 0)
	setObjectCamera('score', 'hud')
	setProperty('score.antialiasing', false)
	scaleObject('score', 3, 3)
	addLuaSprite('score',false)
	setProperty('score.alpha',0)
	
	makeLuaSprite('time','hud/time', 60, 95)
	setScrollFactor('time', 0, 0)
	setObjectCamera('time', 'hud')
	setProperty('time.antialiasing', false)
	scaleObject('time', 3, 3)
	addLuaSprite('time',false)
	setProperty('time.alpha',0)
	
	makeLuaSprite('misses','hud/misses', 60, 150)
	setScrollFactor('misses', 0, 0)
	setObjectCamera('misses', 'hud')
	setProperty('misses.antialiasing', false)
	scaleObject('misses', 3, 3)
	addLuaSprite('misses',false)
	setProperty('misses.alpha',0)
	
	makeLuaSprite('misses2','hud/misses2', 60, 150)
	setScrollFactor('misses2', 0, 0)
	setObjectCamera('misses2', 'hud')
	setProperty('misses2.antialiasing', false)
	scaleObject('misses2', 3, 3)
	addLuaSprite('misses2',false)
	setProperty('misses2.alpha',0)

	makeLuaSprite('hud2', 'hud/hudlife', 10, 630)
    scaleObject('hud2', 3, 3)
    setProperty('hud2.antialiasing', false)
    setObjectCamera('hud2', 'hud')
    addLuaSprite('hud2')
	setProperty('hud2.alpha', 0)
	
	makeLuaText('sonicscoreblack', 'BOTPLAY', 0, 49+3, 29+3)
	setProperty('sonicscoreblack.borderSize', 0)
	setProperty('sonicscoreblack.antialiasing', false)
	setTextFont('sonicscoreblack', 'sonichud.ttf')
	setTextSize('sonicscoreblack', 6*8, 6*8)
	setScrollFactor('sonicscoreblack', 0, 0)
	setTextColor('sonicscoreblack' , '000000')
	setTextWidth('sonicscoreblack','300')
	setTextAlignment('sonicscoreblack','right')
	addLuaText('sonicscoreblack')
	setProperty('sonicscoreblack.alpha',0)
	
	makeLuaText('sonicscore', 'BOTPLAY', 0, 49, 29)
	setProperty('sonicscore.borderSize', 0)
	setProperty('sonicscore.antialiasing', false)
	setTextFont('sonicscore', 'sonichud.ttf')
	setTextSize('sonicscore', 6*8, 6*8)
	setScrollFactor('sonicscore', 0, 0)
	setTextWidth('sonicscore','300')
	setTextAlignment('sonicscore','right')
	addLuaText('sonicscore')
	setProperty('sonicscore.alpha',0)
	
	makeLuaText('sonicmissesblack', '0', 0, 178+3, 139+3)
	setProperty('sonicmissesblack.borderSize', 0)
	setProperty('sonicmissesblack.antialiasing', false)
	setTextFont('sonicmissesblack', 'sonichud.ttf')
	setTextSize('sonicmissesblack', 6*8, 6*8)
	setScrollFactor('sonicmissesblack', 0, 0)
	setTextColor('sonicmissesblack' , '000000')
	setTextWidth('sonicmissesblack','100')
	setTextAlignment('sonicmissesblack','right')
	addLuaText('sonicmissesblack')
	setProperty('sonicmissesblack.alpha',0)
	
	makeLuaText('sonicmisses', '0', 0, 178, 139)
	setProperty('sonicmisses.borderSize', 0)
	setProperty('sonicmisses.antialiasing', false)
	setTextFont('sonicmisses', 'sonichud.ttf')
	setTextSize('sonicmisses', 6*8, 6*8)
	setScrollFactor('sonicmisses', 0, 0)
	setTextWidth('sonicmisses','100')
	setTextAlignment('sonicmisses','right')
	addLuaText('sonicmisses')
	setProperty('sonicmisses.alpha',0)
	
	makeLuaText('sonictimeblack', '0', 0, 177+3, 84+3)
	setProperty('sonictimeblack.borderSize', 0)
	setProperty('sonictimeblack.antialiasing', false)
	setTextFont('sonictimeblack', 'sonichud.ttf')
	setTextSize('sonictimeblack', 6*8, 6*8)
	setScrollFactor('sonictimeblack', 0, 0)
	setTextColor('sonictimeblack' , '000000')
	setTextAlignment('sonictimeblack','right')
	addLuaText('sonictimeblack')
	setProperty('sonictimeblack.alpha',0)
	
	makeLuaText('sonictime', '0', 0, 177, 84)
	setProperty('sonictime.borderSize', 0)
	setProperty('sonictime.antialiasing', false)
	setTextFont('sonictime', 'sonichud.ttf')
	setTextSize('sonictime', 6*8, 6*8)
	setScrollFactor('sonictime', 0, 0)
	setTextAlignment('sonictime','right')
	addLuaText('sonictime')
	setProperty('sonictime.alpha',0)
	
-- SONIC

	makeAnimatedLuaSprite('sonicrunnin', 'characters/sonic', 480, 500)
	addAnimationByPrefix('sonicrunnin', 'sonicrunnin', 'sonic idle', 19, true)
	objectPlayAnimation('sonicrunnin', 'sonicrunnin')
	setProperty('sonicrunnin.antialiasing', false)
	setProperty('sonicrunnin.flipX', true) 
	scaleObject('sonicrunnin', 4, 4)
	addLuaSprite('sonicrunnin', false)
	setProperty('sonicrunnin.alpha', 0)
--[[
	makeAnimatedLuaSprite('SonicWalk', 'SonicWalk', 410, 480)
	addAnimationByPrefix('SonicWalk', 'SonicWalk', 'SonicWalk', 28, true)
	objectPlayAnimation('SonicWalk', 'SonicWalk')
	setProperty('SonicWalk.antialiasing', false)
	scaleObject('SonicWalk', 4, 4)
	addLuaSprite('SonicWalk', false)
	setProperty('SonicWalk.alpha', 0)

	makeAnimatedLuaSprite('SonicWalkAnger', 'SonicWalkAnger', 410, 480)
	addAnimationByPrefix('SonicWalkAnger', 'SonicWalkAnger', 'SonicWalkAnger', 28, true)
	addAnimationByPrefix('SonicWalkAnger', 'SonicWalkAngerFast', 'SonicWalkAnger', 36, true)
	objectPlayAnimation('SonicWalkAnger', 'SonicWalkAnger')
	setProperty('SonicWalkAnger.antialiasing', false)
	scaleObject('SonicWalkAnger', 4, 4)
	addLuaSprite('SonicWalkAnger', false)
	setProperty('SonicWalkAnger.alpha', 0)
--]]

---
	
	-- EggStuff
	
	makeAnimatedLuaSprite('EggWalk', 'EggWalk', 400, 470)
	addAnimationByPrefix('EggWalk', 'EggWalk', 'EggWalk', 24, true)
	objectPlayAnimation('EggWalk', 'EggWalk')
	setProperty('EggWalk.antialiasing', false)
	scaleObject('EggWalk', 4, 4)
	addLuaSprite('EggWalk', false)
	setProperty('EggWalk.alpha', 0)
	
	makeLuaSprite('EggCorpse', 'goober3', 390, 570)
	setProperty('EggCorpse.antialiasing', false)
	scaleObject('EggCorpse', 4, 4)
	addLuaSprite('EggCorpse', false)
	setProperty('EggCorpse.alpha', 0)
	setObjectOrder('EggCorpse', getObjectOrder('dadGroup')+6)
	
	makeAnimatedLuaSprite('EggFly', 'EggFly', -100, -100)
	addAnimationByPrefix('EggFly', 'EggFly', 'Eggman', 24, true)
	objectPlayAnimation('EggFly', 'EggFly')
	setProperty('EggFly.antialiasing', false)
	scaleObject('EggFly', 4, 4)
	setProperty('EggFly.flipX', true)
	addLuaSprite('EggFly', false)
	setProperty('EggFly.alpha', 1)
	
	makeAnimatedLuaSprite('EnergyBall', 'EnergyBall', 0, 0)
	addAnimationByPrefix('EnergyBall', 'EnergyBall', 'EnergyBall', 24, true)
	objectPlayAnimation('EnergyBall', 'EnergyBall')
	setProperty('EnergyBall.antialiasing', false)
	scaleObject('EnergyBall', 4, 4)
	addLuaSprite('EnergyBall', false)
	setProperty('EnergyBall.alpha', 1)
	
	--flashback deaths
	
	makeLuaSprite('TailsDeath', 'TailsDeath', -187, 200)
	setProperty('TailsDeath.antialiasing', false)
	scaleObject('TailsDeath', 4.5, 4.5)
	addLuaSprite('TailsDeath', false)
	setProperty('TailsDeath.alpha', 0)
	setObjectOrder('TailsDeath', getObjectOrder('dadGroup')+6)
	--setObjectCamera('TailsDeath', 'camHUD')
	
	makeLuaSprite('KnuxDeath', 'KnuxDeath', -187, 200)
	setProperty('KnuxDeath.antialiasing', false)
	scaleObject('KnuxDeath', 4.5, 4.5)
	addLuaSprite('KnuxDeath', false)
	setProperty('KnuxDeath.alpha', 0)
	setObjectOrder('KnuxDeath', getObjectOrder('dadGroup')+6)
	--setObjectCamera('KnuxDeath', 'camHUD')
	
	makeLuaSprite('EggDeath', 'EggDeath', -187, 200)
	setProperty('EggDeath.antialiasing', false)
	scaleObject('EggDeath', 4.5, 4.5)
	addLuaSprite('EggDeath', false)
	setProperty('EggDeath.alpha', 0)
	setObjectOrder('EggDeath', getObjectOrder('dadGroup')+6)
	--setObjectCamera('EggDeath', 'camHUD')
	
	--sonic/xeno cutscene bs
	
	makeAnimatedLuaSprite('xeno', 'gameoversheet', 520, 520)
	addAnimationByPrefix('xeno', 'xeno1', 'didyouforgetaboutME', 14, true)
	addAnimationByPrefix('xeno', 'xeno2', 'gotcha', 14, true)
	objectPlayAnimation('xeno', 'xeno1')
	setProperty('xeno.antialiasing', false)
	scaleObject('xeno', 4, 4)
	addLuaSprite('xeno', false)
	setProperty('xeno.alpha', 0)
	
	makeAnimatedLuaSprite('xeno2', 'characters/xenoCY', 540, 400)
	addAnimationByPrefix('xeno2', 'helo', 'helo', 24, true)
	addAnimationByPrefix('xeno2', 'stand', 'stand', 24, true)
	addAnimationByPrefix('xeno2', 'slide', 'slide', 24, true)
	addAnimationByPrefix('xeno2', 'hurt', 'hurt', 16, true)
	objectPlayAnimation('xeno2', 'helo')
	setProperty('xeno2.antialiasing', false)
	scaleObject('xeno2', 4, 4)
	addLuaSprite('xeno2', false)
	setProperty('xeno2.alpha', 0)
	
	makeLuaSprite('XenoStalk', 'XenoStalk', 320, 430)
	setProperty('XenoStalk.antialiasing', false)
	scaleObject('XenoStalk', 4, 4)
	addLuaSprite('XenoStalk', false)
	setProperty('XenoStalk.alpha', 0)
	setBlendMode('XenoStalk', 'add')
	
	makeAnimatedLuaSprite('sonicskid', 'gameoversheet', 420, 520)
	addAnimationByPrefix('sonicskid', 'sonicskid', 'skid', 15, false)
	addAnimationByPrefix('sonicskid', 'turns', 'turns', 15, false)
	addAnimationByPrefix('sonicskid', 'death', 'death', 15, false)
	objectPlayAnimation('sonicskid', 'sonicskid')
	setProperty('sonicskid.antialiasing', false)
	scaleObject('sonicskid', 4, 4)
	addLuaSprite('sonicskid', false)
	setProperty('sonicskid.alpha', 0)
	
	makeLuaSprite('sonicstare', 'XenoExtraSprites/Stare', 700, 480)
	setProperty('sonicstare.antialiasing', false)
	scaleObject('sonicstare', 4, 4)
	addLuaSprite('sonicstare', false)
	setProperty('sonicstare.alpha', 0)
	
	makeLuaSprite('SonicCrouch', 'XenoExtraSprites/Crouch1', 410, 480)
	setProperty('SonicCrouch.antialiasing', false)
	scaleObject('SonicCrouch', 4, 4)
	addLuaSprite('SonicCrouch', false)
	setProperty('SonicCrouch.alpha', 0)
	
	makeAnimatedLuaSprite('fake', 'gameoversheet', 410, 470)
	addAnimationByPrefix('fake', 'fake1', 'fake1', 1, false)
	addAnimationByPrefix('fake', 'fake2', 'fake2', 18, false)
	addAnimationByPrefix('fake', 'fake3', 'fake3', 1, false)
	addAnimationByPrefix('fake', 'fakelaugh', 'fakelaugh', 14, true)
	objectPlayAnimation('fake', 'fake1')
	setProperty('fake.antialiasing', false)
	setProperty('fake.alpha', 0)
	scaleObject('fake', 4, 4)
	addLuaSprite('fake', false)
	setObjectOrder('fake', getObjectOrder('dadGroup')+6)
	
	makeAnimatedLuaSprite('circle', 'gameoversheet', 440, 630)
	addAnimationByPrefix('circle', 'circle', 'circle', 1, false)
	objectPlayAnimation('circle', 'circle')
	setProperty('circle.antialiasing', false)
	setProperty('circle.alpha', 0)
	scaleObject('circle', 4, 4)
	addLuaSprite('circle', false)
	setObjectOrder('circle', getObjectOrder('dadGroup')+6)
	
	makeAnimatedLuaSprite('SonicRoll', 'blueball', 420, 500)
	addAnimationByPrefix('SonicRoll', 'Ball', 'roll', 48, true)
	addAnimationByPrefix('SonicRoll', 'Spindash', 'spindash', 48, true)
	objectPlayAnimation('SonicRoll', 'Ball')
	setProperty('SonicRoll.antialiasing', false)
	scaleObject('SonicRoll', 4, 4)
	addLuaSprite('SonicRoll', false)
	setProperty('SonicRoll.alpha', 0)
	
	makeAnimatedLuaSprite('SpinDust', 'blueball', 410, 490)
	addAnimationByPrefix('SpinDust', 'SpinDust', 'dust', 48, true)
	objectPlayAnimation('SpinDust', 'SpinDust')
	setProperty('SpinDust.antialiasing', false)
	scaleObject('SpinDust', 4, 4)
	addLuaSprite('SpinDust', false)
	setProperty('SpinDust.alpha', 0)
	
--TORNADO SEGMENT (tornbest)

	makeAnimatedLuaSprite('Tornado', 'tornado/tornado', 410, 490)
	addAnimationByPrefix('Tornado', 'Tornado', 'NYOOOM', 24, true)
	objectPlayAnimation('Tornado', 'Tornado')
	setProperty('Tornado.antialiasing', false)
	scaleObject('Tornado', 4, 4)
	addLuaSprite('Tornado', false)
	setProperty('Tornado.alpha', 0)
	
	makeAnimatedLuaSprite('TailsTornado', 'tornado/tailstornado', 410, 490)
	addAnimationByPrefix('TailsTornado', 'TailsTornado', 'mewhen', 18, true)
	objectPlayAnimation('TailsTornado', 'TailsTornado')
	setProperty('TailsTornado.antialiasing', false)
	scaleObject('TailsTornado', 4, 4)
	addLuaSprite('TailsTornado', false)
	setProperty('TailsTornado.alpha', 0)
	
	makeAnimatedLuaSprite('KnuxTornado', 'tornado/angyknuclkes', 410, 490)
	addAnimationByPrefix('KnuxTornado', 'KnuxTornado', 'beatthegoofyoutyoass', 24, true)
	objectPlayAnimation('KnuxTornado', 'KnuxTornado')
	setProperty('KnuxTornado.antialiasing', false)
	scaleObject('KnuxTornado', 4, 4)
	addLuaSprite('KnuxTornado', false)
	setProperty('KnuxTornado.alpha', 0)
	
	makeAnimatedLuaSprite('rain', 'tornado/rain', -350, 200)
	addAnimationByPrefix('rain', 'rain', 'britishweather', 24, true)
	objectPlayAnimation('rain', 'rain')
    setProperty('rain.antialiasing', false)
    scaleObject('rain', 6, 6)
    addLuaSprite('rain', false)
	setObjectOrder('rain', getObjectOrder('dadGroup')+5)
	setProperty('rain.alpha', 0)
	
		setProperty('sky1.alpha', 0)
		setProperty('sky1-2.alpha', 0)
		setProperty('sky1-3.alpha', 0)
		
		setProperty('sky2.alpha', 0)
		setProperty('sky2-2.alpha', 0)
		setProperty('sky2-3.alpha', 0)
		
		setProperty('sky3.alpha', 0)
		setProperty('sky3-2.alpha', 0)
		setProperty('sky3-3.alpha', 0)
		
		setProperty('sky4.alpha', 0)
		setProperty('sky4-2.alpha', 0)
		setProperty('sky4-3.alpha', 0)
		
		setProperty('sky5.alpha', 0)
		setProperty('sky5-2.alpha', 0)
		setProperty('sky5-3.alpha', 0)
		
	-- Knux Stuff
	
	makeAnimatedLuaSprite('KnuxWalk', 'KnuxWalk', 440, 500)
	addAnimationByPrefix('KnuxWalk', 'KnuxWalk', 'KnuxWalk', 12, true)
	objectPlayAnimation('KnuxWalk', 'KnuxWalk')
	setProperty('KnuxWalk.antialiasing', false)
	scaleObject('KnuxWalk', 4, 4)
	addLuaSprite('KnuxWalk', false)
	setProperty('KnuxWalk.alpha', 0)
	
	makeAnimatedLuaSprite('KnuxRoll', 'KnuxRoll', -700, 560)
	addAnimationByPrefix('KnuxRoll', 'KnuxRoll', 'KnuxRoll', 48, true)
	objectPlayAnimation('KnuxRoll', 'KnuxRoll')
	setProperty('KnuxRoll.antialiasing', false)
	scaleObject('KnuxRoll', 4, 4)
	addLuaSprite('KnuxRoll', false)
	setProperty('KnuxRoll.alpha', 1)
	
	makeAnimatedLuaSprite('KnuxRun', 'KnuxRun', 650, 550)
	addAnimationByPrefix('KnuxRun', 'KnuxRun', 'KnuxRun', 48, true)
	objectPlayAnimation('KnuxRun', 'KnuxRun')
	setProperty('KnuxRun.antialiasing', false)
	scaleObject('KnuxRun', 4, 4)
	addLuaSprite('KnuxRun', false)
	setProperty('KnuxRun.alpha', 0)
	
	makeLuaSprite('KnuxCorpse', 'goober2', 420, 620)
	setProperty('KnuxCorpse.antialiasing', false)
	scaleObject('KnuxCorpse', 4, 4)
	addLuaSprite('KnuxCorpse', false)
	setProperty('KnuxCorpse.alpha', 0)
	setObjectOrder('KnuxCorpse', getObjectOrder('dadGroup')+6)
	
	-- Tails Stuff
	
	makeAnimatedLuaSprite('TailsRun', 'TailsRun', 470, 560)
	addAnimationByPrefix('TailsRun', 'TailsRun', 'TailsRun', 24, true)
	objectPlayAnimation('TailsRun', 'TailsRun')
	setProperty('TailsRun.antialiasing', false)
	scaleObject('TailsRun', 4, 4)
	addLuaSprite('TailsRun', false)
	setProperty('TailsRun.alpha', 0)
	
	makeAnimatedLuaSprite('TailsDash', 'TailsDash', 300, 560)
	addAnimationByPrefix('TailsDash', 'TailsDash', 'TailsDash', 24, true)
	objectPlayAnimation('TailsDash', 'TailsDash')
	setProperty('TailsDash.antialiasing', false)
	scaleObject('TailsDash', 4, 4)
	addLuaSprite('TailsDash', false)
	setProperty('TailsDash.alpha', 0)
	
	makeAnimatedLuaSprite('TailsWalk', 'TailsWalk', 440, 560)
	addAnimationByPrefix('TailsWalk', 'TailsWalk', 'TailsWalk', 36, true)
	objectPlayAnimation('TailsWalk', 'TailsWalk')
	setProperty('TailsWalk.antialiasing', false)
	scaleObject('TailsWalk', 4, 4)
	addLuaSprite('TailsWalk', false)
	setProperty('TailsWalk.alpha', 0)
	
	makeAnimatedLuaSprite('TailsFall', 'tailseatinggrass', 415, 440)
	addAnimationByPrefix('TailsFall', 'TailsFall', 'tailseatinggrass', 16, false)
	objectPlayAnimation('TailsFall', 'TailsFall')
	setProperty('TailsFall.antialiasing', false)
	scaleObject('TailsFall', 4, 4)
	addLuaSprite('TailsFall', false)
	setProperty('TailsFall.alpha', 0)
	
	makeAnimatedLuaSprite('TailsRoll', 'TailsRoll', -500, 580)
	addAnimationByPrefix('TailsRoll', 'TailsRoll', 'TailsRoll', 48, true)
	objectPlayAnimation('TailsRoll', 'TailsRoll')
	setProperty('TailsRoll.antialiasing', false)
	scaleObject('TailsRoll', 4, 4)
	addLuaSprite('TailsRoll', false)
	setProperty('TailsRoll.alpha', 1)
	
	makeLuaSprite('TailsCorpse', 'goober1', 390, 570)
	setProperty('TailsCorpse.antialiasing', false)
	scaleObject('TailsCorpse', 4, 4)
	addLuaSprite('TailsCorpse', false)
	setProperty('TailsCorpse.alpha', 0)
	setObjectOrder('TailsCorpse', getObjectOrder('dadGroup')+6)
	
	makeAnimatedLuaSprite('SSTransformation', 'sstransformation', 440, 400)
	addAnimationByPrefix('SSTransformation', 'SSTransformation', 'idle', 18, false)
	objectPlayAnimation('SSTransformation', 'SSTransformation')
	setProperty('SSTransformation.antialiasing', false)
	scaleObject('SSTransformation', 4, 4)
	addLuaSprite('SSTransformation', false)
	setProperty('SSTransformation.alpha', 0)
	
-- BAD ENDING STUFF, SONIC FUCKING DIES LOL
	makeAnimatedLuaSprite('XenoKill', 'soncexebadend', 407, 490)
	addAnimationByPrefix('XenoKill', 'Whoops', 'lmaosucker', 12, false)
	addAnimationByPrefix('XenoKill', 'Gotcha', 'watchwereyogoinggoofy', 11, false)
	objectPlayAnimation('XenoKill', 'Whoops')
	setProperty('XenoKill.antialiasing', false)
	scaleObject('XenoKill', 4, 4)
	addLuaSprite('XenoKill', false)
	setProperty('XenoKill.alpha', 0)
	
	makeAnimatedLuaSprite('XenoKill2', 'soncexebadend', 407, 490)
	addAnimationByPrefix('XenoKill2', 'Whoops', 'lmaosucker', 12, false)
	addAnimationByPrefix('XenoKill2', 'Gotcha', 'watchwereyogoinggoofy', 9, false)
	objectPlayAnimation('XenoKill2', 'Gotcha')
	setProperty('XenoKill2.antialiasing', false)
	scaleObject('XenoKill2', 4, 4)
	addLuaSprite('XenoKill2', false)
	setProperty('XenoKill2.alpha', 0)
	
	makeAnimatedLuaSprite('SonicDies', 'soncexebadend', 419, 491)
	addAnimationByPrefix('SonicDies', 'Trip', 'hahahaaaanothingeverhappenstothekennedysWOAH', 18, false)
	objectPlayAnimation('SonicDies', 'Trip')
	setProperty('SonicDies.antialiasing', false)
	scaleObject('SonicDies', 4, 4)
	addLuaSprite('SonicDies', false)
	setProperty('SonicDies.alpha', 0)
end

function onCreatePost()

	setProperty('gf.alpha', 0)
	setProperty('dad.x', 150)
	setProperty('dad.alpha', 0)
	setProperty('boyfriend.x', -500)
	setProperty('gf.x', 230)
	setProperty('boyfriend.alpha', 1)
	
	setProperty('soniclegs.x', getProperty('boyfriend.x')-73)
	setProperty('soniclegsoverlay.x', getProperty('soniclegs.x'))
	
	setProperty('iconP2.alpha', 0)
	setProperty('health', 2)
	for i = 0, getProperty('opponentStrums.length') do
		setPropertyFromGroup('opponentStrums', 0, 'x', -100);
		setPropertyFromGroup('opponentStrums', 1, 'x', -100);
		setPropertyFromGroup('opponentStrums', 2, 'x', -100);
		setPropertyFromGroup('opponentStrums', 3, 'x', -100);
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
	setObjectOrder('soniclegs', getObjectOrder('dadGroup')-0.1)
	setProperty('soniclegs.flipX',true)
	setProperty('soniclegs.visible', false)

	makeAnimatedLuaSprite('soniclegsoverlay', 'characters/soniclegsoverlay', getProperty('soniclegs.x'), getProperty('soniclegs.y'))
	addAnimationByPrefix('soniclegsoverlay', 'soniclegsoverlay', 'soniclegsoverlay', 24, true)
	objectPlayAnimation('soniclegsoverlay', 'soniclegsoverlay')
	objectPlayAnimation('soniclegs', 'soniclegs')
	setProperty('soniclegsoverlay.antialiasing', false)
	scaleObject('soniclegsoverlay', 4, 4)
	addLuaSprite('soniclegsoverlay', false)
	setObjectOrder('soniclegsoverlay', getObjectOrder('dadGroup')+2)
	setProperty('soniclegsoverlay.flipX',true)
	setProperty('soniclegsoverlay.visible', false)
	
	---exe flying
	doTweenY('startfly','dad', getProperty('dad.y')+10, 0.5, 'quadOut')
end

function onTweenCompleted(tag, elapsed)

	if tag == 'awfuck' then
		doTweenY('wellimdeadbye', 'SonicDies', 520, 0.25, 'quadIn')
	end
	
	if tag == 'eyesjumpscare' then
		doTweenAlpha('byebye', 'eyesjumpscare', 0, 0.25, 'quadIn')
	end
	if tag == 'owfuckdudethathurtwhy' then
		doTweenY('thatsitimgonnafuckingkillyou', 'xeno2', 400, 0.2, 'quadIn')
	end
	
	if tag == 'owfuckdudethathurtwhy2' then
		doTweenY('thatsitimgonnafuckingkillyougrah', 'xeno2', 500, 0.5, 'quadIn')
	end
	
	if tag == 'fallingnowgoodbye' then
		doTweenY('AAAAAAAAAAA', 'xeno2', 1200, 1, 'quadIn')
	end

	if tag == 'hereicome' then
		objectPlayAnimation('xeno2', 'helo')
		setProperty('xeno2.flipX', true)
		setProperty('xeno2.y', 407)
	end

	if tag == 'waitwhosthat' then
		setProperty('sonicskid.alpha', 0)
		setProperty('sonicstare.alpha', 1)
	end
	
    if tag == 'startfly' then
		doTweenY('updown','dad', getProperty('dad.y')-40, 0.5, 'quadInOut')
    end
	
    if tag == 'updown' then
		doTweenY('downup','dad', getProperty('dad.y')+20, 0.5*twnspd, 'quadInOut')
    end
	
    if tag == 'downup' then
		doTweenY('updown','dad', getProperty('dad.y')-20, 0.5*twnspd, 'quadInOut')
    end
	
    if tag == 'starttornadofly' then
		doTweenY('torndown','Tornado', getProperty('Tornado.y')+20, 0.5*twnspd, 'quadInOut')
    end
	
    if tag == 'tornup' then
		doTweenY('torndown','Tornado', getProperty('Tornado.y')+20, 0.5*twnspd, 'quadInOut')
    end
	
    if tag == 'torndown' then
		doTweenY('tornup','Tornado', getProperty('Tornado.y')-20, 0.5*twnspd, 'quadInOut')
    end
	
    if tag == 'superflystart' then
		doTweenY('superupdown','boyfriend', getProperty('boyfriend.y')-30, 0.5, 'quadInOut')
    end
	
    if tag == 'superupdown' then
		doTweenY('superdownup','boyfriend', getProperty('boyfriend.y')+20, 0.5*twnspd, 'quadInOut')
    end
	
    if tag == 'superdownup' then
		doTweenY('superupdown','boyfriend', getProperty('boyfriend.y')-20, 0.5*twnspd, 'quadInOut')
    end
	
	
	--SCROLL
    if tag == 'floorscroll2' then
        setProperty('floor.x', 0)
        setProperty('floor2.x', -512*4)
        setProperty('floor3.x', 512*4)
		doTweenX('floorscroll', 'floor', -512*4, 1.2*scrspd, 'linear')
		doTweenX('floorscroll2', 'floor2', -1024*4, 1.2*scrspd, 'linear')
		doTweenX('floorscroll3', 'floor3', 0, 1.2*scrspd, 'linear')
    end
	
    if tag == 'floornscroll2' then
        setProperty('floorn.x', 0)
        setProperty('floorn2.x', -512*4)
        setProperty('floorn3.x', 512*4)
		doTweenX('floornscroll', 'floorn', -512*4, 1.2*scrspd, 'linear')
		doTweenX('floornscroll2', 'floorn2', -1024*4, 1.2*scrspd, 'linear')
		doTweenX('floornscroll3', 'floorn3', 0, 1.2*scrspd, 'linear')
    end
	
    if tag == 'backscroll2' then
        setProperty('back.x', 0)
        setProperty('back2.x', -512*3)
        setProperty('back3.x', 512*3)
		doTweenX('backscroll', 'back', -512*3, 4*scrspd, 'linear')
		doTweenX('backscroll2', 'back2', -1024*3, 4*scrspd, 'linear')
		doTweenX('backscroll3', 'back3', 0, 4*scrspd, 'linear')
    end
	
    if tag == 'AIBackAscroll2' then
        setProperty('AIBackA.x', 0)
        setProperty('AIBackA2.x', -512*3)
        setProperty('AIBackA3.x', 512*3)
		doTweenX('AIBackAscroll', 'AIBackA', -512*3, 4*scrspd, 'linear')
		doTweenX('AIBackAscroll2', 'AIBackA2', -1024*3, 4*scrspd, 'linear')
		doTweenX('AIBackAscroll3', 'AIBackA3', 0, 4*scrspd, 'linear')
    end
	
    if tag == 'AITopAscroll2' then
        setProperty('AITopA.x', 0)
        setProperty('AITopA2.x', -512*3)
        setProperty('AITopA3.x', 512*3)
		doTweenX('AITopAscroll', 'AITopA', -512*3, 6*scrspd, 'linear')
		doTweenX('AITopAscroll2', 'AITopA2', -1024*3, 6*scrspd, 'linear')
		doTweenX('AITopAscroll3', 'AITopA3', 0, 6*scrspd, 'linear')
    end
	
    if tag == 'greenscroll2' then
        setProperty('green.x', 0)
        setProperty('green2.x', -512*3)
        setProperty('green3.x', 512*3)
		doTweenX('greenscroll', 'green', -512*3, 2*scrspd, 'linear')
		doTweenX('greenscroll2', 'green2', -1024*3, 2*scrspd, 'linear')
		doTweenX('greenscroll3', 'green3', 0, 2*scrspd, 'linear')
    end
	
    if tag == 'firebgscroll2' then
        setProperty('firebg.x', 0)
        setProperty('firebg2.x', -320*4)
        setProperty('firebg3.x', 320*4)
        doTweenX('firebgscroll', 'firebg', -320*4, 2*scrspd, 'linear')
        doTweenX('firebgscroll2', 'firebg2', -640*4, 2*scrspd, 'linear')
        doTweenX('firebgscroll3', 'firebg3', 0, 2*scrspd, 'linear')
    end
	
    if tag == 'firescroll2' then
        setProperty('fire.x', 0)
        setProperty('fire2.x', -320*4)
        setProperty('fire3.x', 320*4)
        doTweenX('firescroll', 'fire', -320*4, 0.5*scrspd, 'linear')
        doTweenX('firescroll2', 'fire2', -640*4, 0.5*scrspd, 'linear')
        doTweenX('firescroll3', 'fire3', 0, 0.5*scrspd, 'linear')
    end
	
    if tag == 'AIfrontscroll2' then
        setProperty('AIfront.x', 0)
        setProperty('AIfront2.x', -2670*4)
        setProperty('AIfront3.x', 2670*4)
        doTweenX('AIfrontscroll', 'AIfront', -2670*4, 8*scrspd, 'linear')
        doTweenX('AIfrontscroll2', 'AIfront2', -5340*4, 8*scrspd, 'linear')
        doTweenX('AIfrontscroll3', 'AIfront3', 0, 8*scrspd, 'linear')
    end

    if tag == 'treesscroll2' then
        setProperty('trees.x', 0)
        setProperty('trees2.x', -2670*4)
        setProperty('trees3.x', 2670*4)
        doTweenX('treesscroll', 'trees', -2670*4, 12*scrspd, 'linear')
        doTweenX('treesscroll2', 'trees2', -5340*4, 12*scrspd, 'linear')
        doTweenX('treesscroll3', 'trees3', 0, 12*scrspd, 'linear')
    end
	
    if tag == 'topscroll2' then
        setProperty('top.x', 0)
        setProperty('top2.x', -2670*4)
        setProperty('top3.x', 2670*4)
        doTweenX('topscroll', 'top', -2670*4, 10*scrspd, 'linear')
        doTweenX('topscroll2', 'top2', -5340*4, 10*scrspd, 'linear')
        doTweenX('topscroll3', 'top3', 0, 10*scrspd, 'linear')
    end
	
	---GREEN HILL
    if tag == 'ghfloorscroll2' then
        setProperty('ghfloor.x', 0)
        setProperty('ghfloor2.x', -3417*4)
        setProperty('ghfloor3.x', 3417*4)
		doTweenX('ghfloorscroll', 'ghfloor', -3417*4, 8*scrspd, 'linear')
		doTweenX('ghfloorscroll2', 'ghfloor2', -6834*4, 8*scrspd, 'linear')
		doTweenX('ghfloorscroll3', 'ghfloor3', 0, 8*scrspd, 'linear')
    end
	
    if tag == 'ghwaterscroll2' then
        setProperty('ghwater.x', 0)
        setProperty('ghwater2.x', -3840*4)
        setProperty('ghwater3.x', 3840*4)
        doTweenX('ghwaterscroll', 'ghwater', -3840*4, 8*scrspd, 'linear')
        doTweenX('ghwaterscroll2', 'ghwater2', -7680*4, 8*scrspd, 'linear')
        doTweenX('ghwaterscroll3', 'ghwater3', 0, 8*scrspd, 'linear')
    end

    if tag == 'ghcloudsscroll2' then
        setProperty('ghclouds.x', 0)
        setProperty('ghclouds2.x', -3840*4)
        setProperty('ghclouds3.x', 3840*4)
        doTweenX('ghcloudsscroll', 'ghclouds', -3840*4, 40*scrspd, 'linear')
        doTweenX('ghcloudsscroll2', 'ghclouds2', -7680*4, 40*scrspd, 'linear')
        doTweenX('ghcloudsscroll3', 'ghclouds3', 0, 40*scrspd, 'linear')
    end
	
    if tag == 'ghcloudsBscroll2' then
        setProperty('ghcloudsB.x', 0)
        setProperty('ghcloudsB2.x', -3840*4)
        setProperty('ghcloudsB3.x', 3840*4)
        doTweenX('ghcloudsBscroll', 'ghcloudsB', -3840*4, 30*scrspd, 'linear')
        doTweenX('ghcloudsBscroll2', 'ghcloudsB2', -7680*4, 30*scrspd, 'linear')
        doTweenX('ghcloudsBscroll3', 'ghcloudsB3', 0, 30*scrspd, 'linear')
    end
	
    if tag == 'ghcloudsCscroll2' then
        setProperty('ghcloudsC.x', 0)
        setProperty('ghcloudsC2.x', -3840*4)
        setProperty('ghcloudsC3.x', 3840*4)
        doTweenX('ghcloudsCscroll', 'ghcloudsC', -3840*4, 25*scrspd, 'linear')
        doTweenX('ghcloudsCscroll2', 'ghcloudsC2', -7680*4, 25*scrspd, 'linear')
        doTweenX('ghcloudsCscroll3', 'ghcloudsC3', 0, 25*scrspd, 'linear')
    end
	
    if tag == 'ghrocksscroll2' then
        setProperty('ghrocks.x', 0)
        setProperty('ghrocks2.x', -8192*4)
        setProperty('ghrocks3.x', 8192*4)
        doTweenX('ghrocksscroll', 'ghrocks', -8192*4, 45*scrspd, 'linear')
        doTweenX('ghrocksscroll2', 'ghrocks2', -16384*4, 45*scrspd, 'linear')
        doTweenX('ghrocksscroll3', 'ghrocks3', 0, 45*scrspd, 'linear')
    end

    if tag == 'ghbgscroll2' then
        setProperty('ghbg.x', 0)
        setProperty('ghbg2.x', -8192*4)
        setProperty('ghbg3.x', 8192*4)
        doTweenX('ghbgscroll', 'ghbg', -8192*4, 30*scrspd, 'linear')
        doTweenX('ghbgscroll2', 'ghbg2', -16384*4, 30*scrspd, 'linear')
        doTweenX('ghbgscroll3', 'ghbg3', 0, 30*scrspd, 'linear')
    end
	
	---KNUCKLES STAGE
    if tag == 'kbg1scroll2' then
        setProperty('kbg1.x', 0)
        setProperty('kbg1-2.x', -512*4)
        setProperty('kbg1-3.x', 512*4)
        doTweenX('kbg1scroll', 'kbg1', -512*4, 4*scrspd, 'linear')
        doTweenX('kbg1scroll2', 'kbg1-2', -1024*4, 4*scrspd, 'linear')
        doTweenX('kbg1scroll3', 'kbg1-3', 0, 4*scrspd, 'linear')
    end
	
    if tag == 'kbg2scroll2' then
        setProperty('kbg2.x', 0)
        setProperty('kbg2-2.x', -512*4)
        setProperty('kbg2-3.x', 512*4)
        doTweenX('kbg2scroll', 'kbg2', -512*4, 6*scrspd, 'linear')
        doTweenX('kbg2scroll2', 'kbg2-2', -1024*4, 6*scrspd, 'linear')
        doTweenX('kbg2scroll3', 'kbg2-3', 0, 6*scrspd, 'linear')
    end
	
    if tag == 'kbg3scroll2' then
        setProperty('kbg3.x', 0)
        setProperty('kbg3-2.x', -512*4)
        setProperty('kbg3-3.x', 512*4)
        doTweenX('kbg3scroll', 'kbg3', -512*4, 8*scrspd, 'linear')
        doTweenX('kbg3scroll2', 'kbg3-2', -1024*4, 8*scrspd, 'linear')
        doTweenX('kbg3scroll3', 'kbg3-3', 0, 8*scrspd, 'linear')
    end
	
    if tag == 'kbg4scroll2' then
        setProperty('kbg4.x', 0)
        setProperty('kbg4-2.x', -512*4)
        setProperty('kbg4-3.x', 512*4)
        doTweenX('kbg4scroll', 'kbg4', -512*4, 10*scrspd, 'linear')
        doTweenX('kbg4scroll2', 'kbg4-2', -1024*4, 10*scrspd, 'linear')
        doTweenX('kbg4scroll3', 'kbg4-3', 0, 10*scrspd, 'linear')
    end
	
    if tag == 'sky1scroll2' then
        setProperty('sky1.x', 0)
        setProperty('sky1-2.x', -512*4)
        setProperty('sky1-3.x', 512*4)
        doTweenX('sky1scroll', 'sky1', -512*4, 4*scrspd, 'linear')
        doTweenX('sky1scroll2', 'sky1-2', -1024*4, 4*scrspd, 'linear')
        doTweenX('sky1scroll3', 'sky1-3', 0, 4*scrspd, 'linear')
    end
	
    if tag == 'sky2scroll2' then
        setProperty('sky2.x', 0)
        setProperty('sky2-2.x', -512*4)
        setProperty('sky2-3.x', 512*4)
        doTweenX('sky2scroll', 'sky2', -512*4, 6*scrspd, 'linear')
        doTweenX('sky2scroll2', 'sky2-2', -1024*4, 6*scrspd, 'linear')
        doTweenX('sky2scroll3', 'sky2-3', 0, 6*scrspd, 'linear')
    end
	
    if tag == 'sky3scroll2' then
        setProperty('sky3.x', 0)
        setProperty('sky3-2.x', -512*4)
        setProperty('sky3-3.x', 512*4)
        doTweenX('sky3scroll', 'sky3', -512*4, 8*scrspd, 'linear')
        doTweenX('sky3scroll2', 'sky3-2', -1024*4, 8*scrspd, 'linear')
        doTweenX('sky3scroll3', 'sky3-3', 0, 8*scrspd, 'linear')
    end
	
    if tag == 'sky4scroll2' then
        setProperty('sky4.x', 0)
        setProperty('sky4-2.x', -512*4)
        setProperty('sky4-3.x', 512*4)
        doTweenX('sky4scroll', 'sky4', -512*4, 10*scrspd, 'linear')
        doTweenX('sky4scroll2', 'sky4-2', -1024*4, 10*scrspd, 'linear')
        doTweenX('sky4scroll3', 'sky4-3', 0, 10*scrspd, 'linear')
    end
	
    if tag == 'sky5scroll2' then
        setProperty('sky5.x', 0)
        setProperty('sky5-2.x', -512*4)
        setProperty('sky5-3.x', 512*4)
        doTweenX('sky5scroll', 'sky5', -512*4, 12*scrspd, 'linear')
        doTweenX('sky5scroll2', 'sky5-2', -1024*4, 12*scrspd, 'linear')
        doTweenX('sky5scroll3', 'sky5-3', 0, 12*scrspd, 'linear')
    end
	
    if tag == 'knux1scroll2' then
        setProperty('knux1.x', 0)
        setProperty('knux1-2.x', -1504*4)
        setProperty('knux1-3.x', 1504*4)
        doTweenX('knux1scroll', 'knux1', -1504*4, 3*scrspd, 'linear')
        doTweenX('knux1scroll2', 'knux1-2', -3008*4, 3*scrspd, 'linear')
        doTweenX('knux1scroll3', 'knux1-3', 0, 3*scrspd, 'linear')
    end
	
    if tag == 'sbzfloorscroll2' then
        setProperty('sbzfloor.x', 0)
        setProperty('sbzfloor2.x', -1504*4)
        setProperty('sbzfloor3.x', 1504*4)
        doTweenX('sbzfloorscroll', 'sbzfloor', -1504*4, 3*scrspd, 'linear')
        doTweenX('sbzfloorscroll2', 'sbzfloor2', -3008*4, 3*scrspd, 'linear')
        doTweenX('sbzfloorscroll3', 'sbzfloor3', 0, 3*scrspd, 'linear')
    end
	
    if tag == 'sbz1scroll2' then
        setProperty('sbz1.x', 0)
        setProperty('sbz1-2.x', -1280*3)
        setProperty('sbz1-3.x', 1280*3)
        doTweenX('sbz1scroll', 'sbz1', -1280*3, 8*scrspd, 'linear')
        doTweenX('sbz1scroll2', 'sbz1-2', -2560*3, 8*scrspd, 'linear')
        doTweenX('sbz1scroll3', 'sbz1-3', 0, 8*scrspd, 'linear')
    end
	
    if tag == 'sbz2scroll2' then
        setProperty('sbz2.x', 0)
        setProperty('sbz2-2.x', -1280*3)
        setProperty('sbz2-3.x', 1280*3)
        doTweenX('sbz2scroll', 'sbz2', -1280*3, 10*scrspd, 'linear')
        doTweenX('sbz2scroll2', 'sbz2-2', -2560*3, 10*scrspd, 'linear')
        doTweenX('sbz2scroll3', 'sbz2-3', 0, 10*scrspd, 'linear')
    end
	
    if tag == 'sbz3scroll2' then
        setProperty('sbz3.x', 0)
        setProperty('sbz3-2.x', -1280*3)
        setProperty('sbz3-3.x', 1280*3)
        doTweenX('sbz3scroll', 'sbz3', -1280*3, 12*scrspd, 'linear')
        doTweenX('sbz3scroll2', 'sbz3-2', -2560*3, 12*scrspd, 'linear')
        doTweenX('sbz3scroll3', 'sbz3-3', 0, 12*scrspd, 'linear')
    end
	
    if tag == 'sbz4scroll2' then
        setProperty('sbz4.x', 0)
        setProperty('sbz4-2.x', -1280*3)
        setProperty('sbz4-3.x', 1280*3)
        doTweenX('sbz4scroll', 'sbz4', -1280*3, 14*scrspd, 'linear')
        doTweenX('sbz4scroll2', 'sbz4-2', -2560*3, 14*scrspd, 'linear')
        doTweenX('sbz4scroll3', 'sbz4-3', 0, 14*scrspd, 'linear')
    end
	
    if tag == 'sbz5scroll2' then
        setProperty('sbz5.x', 0)
        setProperty('sbz5-2.x', -1280*3)
        setProperty('sbz5-3.x', 1280*3)
        doTweenX('sbz5scroll', 'sbz5', -1280*3, 16*scrspd, 'linear')
        doTweenX('sbz5scroll2', 'sbz5-2', -2560*3, 16*scrspd, 'linear')
        doTweenX('sbz5scroll3', 'sbz5-3', 0, 16*scrspd, 'linear')
    end
	
	if tag == 'eggbgscroll2' then
        setProperty('eggbg.x', 0)
        setProperty('eggbg2.x', -512*4)
        setProperty('eggbg3.x', 512*4)
        doTweenX('eggbgscroll', 'eggbg', -512*4, 1*scrspd, 'linear')
        doTweenX('eggbgscroll2', 'eggbg2', -1024*4, 1*scrspd, 'linear')
        doTweenX('eggbgscroll3', 'eggbg3', 0, 1*scrspd, 'linear')
	end
	
	if tag == 'eggbgredscroll2' then
        setProperty('eggbgred.x', 0)
        setProperty('eggbgred2.x', -512*4)
        setProperty('eggbgred3.x', 512*4)
        doTweenX('eggbgredscroll', 'eggbgred', -512*4, 1*scrspd, 'linear')
        doTweenX('eggbgredscroll2', 'eggbgred2', -1024*4, 1*scrspd, 'linear')
        doTweenX('eggbgredscroll3', 'eggbgred3', 0, 1*scrspd, 'linear')
	end
	
	if tag == 'eggbgdarkscroll2' then
        setProperty('eggbgdark.x', 0)
        setProperty('eggbgdark2.x', -512*4)
        setProperty('eggbgdark3.x', 512*4)
        doTweenX('eggbgdarkscroll', 'eggbgdark', -512*4, 1*scrspd, 'linear')
        doTweenX('eggbgdarkscroll2', 'eggbgdark2', -1024*4, 1*scrspd, 'linear')
        doTweenX('eggbgdarkscroll3', 'eggbgdark3', 0, 1*scrspd, 'linear')
	end

	if tag == 'eggfloorscroll2' then
        setProperty('eggfloor.x', 0)
        setProperty('eggfloor2.x', -512*4)
        setProperty('eggfloor3.x', 512*4)
        doTweenX('eggfloorscroll', 'eggfloor', -512*4, 1*scrspd, 'linear')
        doTweenX('eggfloorscroll2', 'eggfloor2', -1024*4, 1*scrspd, 'linear')
        doTweenX('eggfloorscroll3', 'eggfloor3', 0, 1*scrspd, 'linear')
	end
	
	if tag == 'eggfloorredscroll2' then
        setProperty('eggfloorred.x', 0)
        setProperty('eggfloorred2.x', -512*4)
        setProperty('eggfloorred3.x', 512*4)
        doTweenX('eggfloorredscroll', 'eggfloorred', -512*4, 1*scrspd, 'linear')
        doTweenX('eggfloorredscroll2', 'eggfloorred2', -1024*4, 1*scrspd, 'linear')
        doTweenX('eggfloorredscroll3', 'eggfloorred3', 0, 1*scrspd, 'linear')
	end
	
	if tag == 'eggfloordarkscroll2' then
        setProperty('eggfloordark.x', 0)
        setProperty('eggfloordark2.x', -512*4)
        setProperty('eggfloordark3.x', 512*4)
        doTweenX('eggfloordarkscroll', 'eggfloordark', -512*4, 1*scrspd, 'linear')
        doTweenX('eggfloordarkscroll2', 'eggfloordark2', -1024*4, 1*scrspd, 'linear')
        doTweenX('eggfloordarkscroll3', 'eggfloordark3', 0, 1*scrspd, 'linear')
	end
	
	if tag =='goodendingfade1' then
		doTweenAlpha('goodendingfade2', 'dad', 0.1, 0.4, 'linear')
	end
		
	if tag =='goodendingfade2' then
		doTweenAlpha('goodendingfade1', 'dad', 0.9, 0.4, 'linear')
	end
end

function goodNoteHit()
end

function onUpdate(elapsed)
--visualizer for jario, just remove the comment brackets to activate
--[[
		nohud = true
	    for i = 4,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
--]]
	
--misscount	
--misses = 99
-- hey sammu, if you're reading this i told you to go here, basically you can change the value here
--conditions are: 0 = FC Ending, 1-19 = Canon Ending, 20+ Bad Ending

---TORNADO SHIT, FUCK.---
setProperty('TailsTornado.x', getProperty('Tornado.x'))
setProperty('TailsTornado.y', getProperty('Tornado.y'))
setProperty('KnuxTornado.x', getProperty('Tornado.x'))
setProperty('KnuxTornado.y', getProperty('Tornado.y')-15)

if fly == true then
	setProperty('boyfriend.x', getProperty('Tornado.x')+180)
	setProperty('boyfriend.y', getProperty('Tornado.y')-70)
end

---------------------------------
---	SONIC WALKING STUFF, FUCK.---
---------------------------------
if walk == true then
	setProperty('soniclegswalk.x', getProperty('boyfriend.x')-92)
	setProperty('armssonicwalkfront.x', getProperty('soniclegswalk.x')-7)
	setProperty('armssonicwalkfront.y', getProperty('soniclegswalk.y')+7)
	setProperty('armssonicwalkback.x', getProperty('soniclegswalk.x'))
	setProperty('armssonicwalkback.y', getProperty('soniclegswalk.y'))
	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		setProperty('soniclegswalk.visible', false)
		setProperty('armssonicwalkfront.visible', false)
		setProperty('armssonicwalkback.visible', false)
	elseif getProperty('boyfriend.animation.curAnim.name') ~= 'idle' then
		setProperty('soniclegswalk.visible', true)
		setProperty('armssonicwalkfront.visible', true)
		setProperty('armssonicwalkback.visible', true)
	end
	if getProperty('boyfriend.animation.curAnim.name') ~= 'singLEFT' then
		setProperty('armssonicwalkfront.alpha', 0)
	else	setProperty('armssonicwalkfront.alpha', 1)
	end
	if getProperty('boyfriend.animation.curAnim.name') ~= 'singLEFT' then
		setProperty('armssonicwalkback.alpha', 1)
	else	setProperty('armssonicwalkback.alpha', 0)
	end

	bfLegFrame = getProperty("soniclegswalk.animation.curAnim.curFrame")

	if bfLegFrame == 0 and getProperty('boyfriend.animation.curAnim.name') ~= 'idle' then
		setProperty('boyfriend.y', 484)
	end
	if bfLegFrame == 1 and getProperty('boyfriend.animation.curAnim.name') ~= 'idle' then
		setProperty('boyfriend.y', 480)
	end
	if bfLegFrame == 2 and getProperty('boyfriend.animation.curAnim.name') ~= 'idle' then
		setProperty('boyfriend.y', 476)
	end
	if bfLegFrame == 3 and getProperty('boyfriend.animation.curAnim.name') ~= 'idle' then
		setProperty('boyfriend.y', 480)
	end
	if bfLegFrame == 4 and getProperty('boyfriend.animation.curAnim.name') ~= 'idle' then
		setProperty('boyfriend.y', 484)
	end
	if bfLegFrame == 5 and getProperty('boyfriend.animation.curAnim.name') ~= 'idle' then
		setProperty('boyfriend.y', 480)
	end
	if bfLegFrame == 6 and getProperty('boyfriend.animation.curAnim.name') ~= 'idle' then
		setProperty('boyfriend.y', 476)
	end
	if bfLegFrame == 7 and getProperty('boyfriend.animation.curAnim.name') ~= 'idle' then
		setProperty('boyfriend.y', 480)
	end
	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		setProperty('boyfriend.y', 495)
	end
end
	if walk == false then
		setProperty('armssonicwalkback.visible', false)
		setProperty('soniclegswalk.visible', false)
		setProperty('armssonicwalkfront.visible', false)
		else
	end

	
---OK COOL

	--best ending trigger
	if curStep < 2175 then
		if misses <= 0 then
			best = true
		else
			best = false
		end
	end

	setProperty('soniclegs.x', getProperty('boyfriend.x')-73)
	setProperty('soniclegsoverlay.x', getProperty('soniclegs.x'))
	triggerEvent('Camera Follow Pos' , '525', '600')

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

	if curStep == 31 then
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
	
	if misses >= 20 and badending == false then
		runTimer('blink1', 0.2)
		setProperty('misses.alpha', 0)
		badending = true
	end

	if nohud == true then
		setProperty('misses.visible', false)
		setProperty('misses2.visible', false)
		setProperty('time.visible', false)
		setProperty('score.visible', false)
		setProperty('hud2.visible', false)
		setProperty('hud3.visible', false)
		setProperty('sonicmisses.visible', false)
		setProperty('sonicmissesblack.visible', false)
		setProperty('sonictime.visible', false)
		setProperty('sonictimeblack.visible', false)
		setProperty('sonicscore.visible', false)
		setProperty('sonicscoreblack.visible', false)
	else
		setProperty('misses.visible', true)
		setProperty('misses2.visible', true)
		setProperty('time.visible', true)
		setProperty('score.visible', true)
		setProperty('hud2.visible', true)
		setProperty('hud3.visible', true)
		setProperty('sonicmisses.visible', true)
		setProperty('sonicmissesblack.visible', true)
		setProperty('sonictime.visible', true)
		setProperty('sonictimeblack.visible', true)
		setProperty('sonicscore.visible', true)
		setProperty('sonicscoreblack.visible', true)
	end
	
	setTextString('sonictime', getTextString('timeTxt'))
	setTextString('sonictimeblack', getTextString('timeTxt'))

	if not botPlay then
		setTextString('sonicscore', score)
		setTextString('sonicscoreblack', score)
	end

	setProperty('timeBar.alpha', 0)
	setProperty('timeBarBG.alpha', 0)
	setProperty('timeTxt.alpha', 0)
	setTextString("botplayTxt", "")

	--bad ending trigger
	if curStep < 2175 and misses >= 20 then
		bad = true
	end

	for i = 0, getProperty('opponentStrums.length') do
	
		setPropertyFromGroup('opponentStrums', 0, 'x', -100);
		setPropertyFromGroup('opponentStrums', 1, 'x', -100);
		setPropertyFromGroup('opponentStrums', 2, 'x', -100);
		setPropertyFromGroup('opponentStrums', 3, 'x', -100);
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
	

	if sprint == true then
		if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			setProperty('soniclegs.visible', false)
			setProperty('soniclegsoverlay.visible', false)
		else
			setProperty('soniclegs.visible', true)
			setProperty('soniclegsoverlay.visible', true)
		end
		
	else
	
		if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
			setProperty('soniclegs.visible', false)
			setProperty('soniclegsoverlay.visible', false)
		else
			setProperty('soniclegs.visible', false)
			setProperty('soniclegsoverlay.visible', false)
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
	
		setProperty('redfilter.alpha', 0.1)
		
		setProperty('floor.alpha', 1)
		setProperty('floor2.alpha', 1)
		setProperty('floor3.alpha', 1)
		
		setProperty('AIBackA.alpha', 1)
		setProperty('AIBackA2.alpha', 1)
		setProperty('AIBackA3.alpha', 1)
		
		setProperty('AITopA.alpha', 1)
		setProperty('AITopA2.alpha', 1)
		setProperty('AITopA3.alpha', 1)
		
---		
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

	elseif currentbg == 'island-fire2' then
	
		setProperty('redfilter.alpha', 0.1)
		
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
		setProperty('fire.alpha', 0.3)
		setProperty('fire2.alpha', 0.3)
		setProperty('fire3.alpha', 0.3)
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
		
		setProperty('AIBackA.alpha', 0)
		setProperty('AIBackA2.alpha', 0)
		setProperty('AIBackA3.alpha', 0)
		
		setProperty('AITopA.alpha', 0)
		setProperty('AITopA2.alpha', 0)
		setProperty('AITopA3.alpha', 0)
		
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
		doTweenAlpha('eggbglol', 'eggbg', 1, 0.7, 'quadOut')
		doTweenAlpha('eggbg2lol', 'eggbg2', 1, 0.7, 'quadOut')
		doTweenAlpha('eggbg3lol', 'eggbg3', 1, 0.7, 'quadOut')

		doTweenAlpha('eggfloorlol', 'eggfloor', 1, 0.7, 'quadOut')		
		doTweenAlpha('eggfloor2lol', 'eggfloor2', 1, 0.7, 'quadOut')
		doTweenAlpha('eggfloor3lol', 'eggfloor3', 1, 0.7, 'quadOut')
		
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
		
	elseif currentbg == 'sky' then
	
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
		setProperty('sky1.alpha', 1)
		setProperty('sky1-2.alpha', 1)
		setProperty('sky1-3.alpha', 1)
		
		setProperty('sky2.alpha', 1)
		setProperty('sky2-2.alpha', 1)
		setProperty('sky2-3.alpha', 1)
		
		setProperty('sky3.alpha', 1)
		setProperty('sky3-2.alpha', 1)
		setProperty('sky3-3.alpha', 1)
		
		setProperty('sky4.alpha', 1)
		setProperty('sky4-2.alpha', 1)
		setProperty('sky4-3.alpha', 1)
		
		setProperty('sky5.alpha', 1)
		setProperty('sky5-2.alpha', 1)
		setProperty('sky5-3.alpha', 1)
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
	
	if curStep >= 1 and lowendsave1 == false then
		lowendsave1 = true
		if widescreen == false then
			doTweenX('confront','confronting', 0 , 0.3, 'linear')
			doTweenX('1st','redcircle', 0 , 0.2, 'linear')
		else
			doTweenX('confront','confronting', 160 , 0.3, 'linear')
			doTweenX('1st','redcircle', 160 , 0.2, 'linear')
		end
		runTimer('stagestart', '0.3')
		doTweenColor('exedark', 'dad', '000000', 0.001, 'quadOut')
	end
	
	if curStep >= 30 and lowendsave2 == false then
		lowendsave2 = true
	    for i = 4,7 do
            setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
        end
		setProperty('dad.alpha', 0)
		doTweenAlpha('byexeno', 'dad', 0, 0.1, 'quadOut')
		
	end
	
	if curStep >= 31 and lowendsave3 == false then
		lowendsave3 = true
		doTweenAlpha('blackfade', 'blackfull', 0, 0.5, 'quadOut')
	end
	
	if curStep >= 39 and lowendsave4 == false then
		lowendsave4 = true
		doTweenX('1st','redcircle', 960 , 0.25, 'linear')
		doTweenX('confronting','confronting', -960 , 0.25, 'linear')
		doTweenX('yourself','yourself', -960 , 0.25, 'linear')
		doTweenX('act1','act1', 960 , 0.25, 'linear')
		doTweenX('hisonic', 'boyfriend', 500, 0.4, 'linear')
	end
	
	if curStep >= 45 and lowendsave5 == false then
		lowendsave5 = true
		doTweenX('backscroll', 'back', -512*3, 4*scrspd, 'linear')
		doTweenX('backscroll2', 'back2', -1024*3, 4*scrspd, 'linear')
		doTweenX('backscroll3', 'back3', 0, 4*scrspd, 'linear')

		doTweenX('greenscroll', 'green', -512*3, 2*scrspd, 'linear')
		doTweenX('greenscroll2', 'green2', -1024*3, 2*scrspd, 'linear')
		doTweenX('greenscroll3', 'green3', 0, 2*scrspd, 'linear')

		doTweenX('floornscroll', 'floorn', -512*4, 1.2*scrspd, 'linear')
		doTweenX('floornscroll2', 'floorn2', -1024*4, 1.2*scrspd, 'linear')
		doTweenX('floornscroll3', 'floorn3', 0, 1.2*scrspd, 'linear')
	end
	
	if curStep >= 114 and lowendsave6 == false then
		lowendsave6 = true
	    for i = 4,7 do
            noteTweenAlpha(i+16, i, 1, 0.7, 'quadOut')
        end
	end
	
	if curStep == 127 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.5, 'quadOut')
	end
	
	if curStep == 239 then
		triggerEvent('Change Character', 'bf','sonic')
		setProperty('dad.alpha', 0)
		doTweenAlpha('byexeno', 'dad', 0.5, 0.9, 'quadOut')
		doTweenX('hixeno', 'dad', 250, 0.5, 'quadOut')
		doTweenAlpha('whiteflash', 'white', 1, 0.9, 'quadIn')
		doTweenAlpha('static', 'static', 1, 0.9, 'quadIn')
	end
	
	if curStep == 255 then
		doTweenColor('exedark', 'dad', 'FFFFFF', 0.01, 'quadOut')
		currentbg = 'island-fire'
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
		doTweenAlpha('static', 'static', 0, 0.75, 'quadOut')
		setProperty('dad.alpha', 1)
	end
	
	if curStep == 256 then
		-- in case of lag/frame drops
		setProperty('dad.alpha', 1)
		doTweenColor('exedark', 'dad', 'FFFFFF', 0.01, 'quadOut')
		doTweenAlpha('byexeno', 'dad', 1, 0.01, 'quadOut')
	end
	
	if curStep == 391 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.5, 'quadOut')
	end
	
	if curStep == 751 then
		doTweenAlpha('whiteflash', 'white', 1, 0.8, 'quadIn')
		doTweenColor('exedark', 'dad', '000000', 0.5, 'quadIn')
		doTweenAlpha('byexeno', 'dad', 0, 0.7, 'quadIn')
		doTweenX('xenoleft', 'dad', 150, 0.7, 'quadIn')
		doTweenX('gosonicgo', 'boyfriend', 900, 0.9, 'quadIn')
		doTweenAlpha('static', 'static', 1, 0.8, 'quadIn')
	end

	if curStep == 767 then
	--ghost/halucination
		currentbg = 'knux'
		triggerEvent('Change Character', 'bf','sonicpanic')
		nohud = true
		setProperty('boyfriend.x', -200)
		doTweenX('gosonicgo', 'boyfriend', 500, 2, 'quadOut')
		doTweenAlpha('whiteflash', 'white', 0, 0.5, 'quadOut')
		doTweenAlpha('static', 'static', 0.2, 0.5, 'quadOut')
		setProperty('Vignette.alpha', 1)
		
		setProperty('sbzfloor.visible', true)
		setProperty('sbzfloor2.visible', true)
		setProperty('sbzfloor3.visible', true)
	end

	if curStep == 831 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.5, 'quadOut')
	end
	
	if curStep == 895 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.5, 'quadOut')
	end
	
	if curStep == 959 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.5, 'quadOut')
	end
	
	if curStep == 1007 then
		doTweenAlpha('whiteflash', 'white', 1, 0.8, 'quadIn')
		doTweenAlpha('static', 'static', 1, 0.8, 'quadIn')
	end
	
	if curStep == 1023 then
	nohud = false
		setProperty('black.alpha', 0)
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
		setProperty('dad.alpha', 0)
		doTweenAlpha('byexeno', 'dad', 1, 1.5, 'quadOut')
		doTweenX('hixeno', 'dad', 250, 1, 'quadOut')
		doTweenAlpha('static', 'static', 0, 0.75, 'quadOut')
		setProperty('Vignette.alpha', 0)
		
	setProperty('sbz1.visible', true)
	setProperty('sbz1-2.visible', true)
	setProperty('sbz1-3.visible', true)

	setProperty('sbz2.visible', true)
	setProperty('sbz2-2.visible', true)
	setProperty('sbz2-3.visible', true)
	
	setProperty('sbz3.visible', true)
	setProperty('sbz3-2.visible', true)
	setProperty('sbz3-3.visible', true)
	
	setProperty('sbz4.visible', true)
	setProperty('sbz4-2.visible', true)
	setProperty('sbz4-3.visible', true)
	
	setProperty('sbz5.visible', true)
	setProperty('sbz5-2.visible', true)
	setProperty('sbz5-3.visible', true)
	end
	
	if curStep == 1087 then
		doTweenColor('exedark', 'dad', 'FFFFFF', 0.01, 'quadIn')
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.5, 'quadOut')
		triggerEvent('Change Character', 'bf','sonic')
		setProperty('boyfriend.x', 500)
		setProperty('Vignette.alpha', 1)

	setProperty('sbz1.visible', false)
	setProperty('sbz1-2.visible', false)
	setProperty('sbz1-3.visible', false)

	setProperty('sbz2.visible', false)
	setProperty('sbz2-2.visible', false)
	setProperty('sbz2-3.visible', false)
	
	setProperty('sbz3.visible', false)
	setProperty('sbz3-2.visible', false)
	setProperty('sbz3-3.visible', false)
	
	setProperty('sbz4.visible', false)
	setProperty('sbz4-2.visible', false)
	setProperty('sbz4-3.visible', false)
	
	setProperty('sbz5.visible', false)
	setProperty('sbz5-2.visible', false)
	setProperty('sbz5-3.visible', false)
	
		setProperty('sbzfloor.visible', false)
		setProperty('sbzfloor2.visible', false)
		setProperty('sbzfloor3.visible', false)
	end
	
	if curStep == 1135 then
		nohud = true
		setProperty('black.alpha', 1)
		setProperty('circle.alpha', 1)
		setProperty('fake.alpha', 1)
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
	end

	if curStep == 1141 then
		scaleObject('circle', 6, 6)
		scaleObject('fake', 6, 6)
		setProperty('fake.x', 340)
		setProperty('circle.x', 390)
		setProperty('circle.y', 720)
		objectPlayAnimation('fake', 'fake2')
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
	end
	
	if curStep == 1147 then
		scaleObject('circle', 8, 8)
		scaleObject('fake', 8, 8)
		setProperty('fake.x', 280)
		setProperty('circle.x', 340)
		setProperty('circle.y', 800)
		objectPlayAnimation('fake', 'fake3')
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
	end
	
	if curStep == 1151 then
		nohud = false
		setProperty('black.alpha', 0)
		setProperty('circle.alpha',0)
		setProperty('fake.alpha', 0)
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.5, 'quadOut')
	end
	
	if curStep == 1271 then
		doTweenAlpha('whiteflash', 'white', 0, 0.5, 'quadIn')
		doTweenAlpha('static', 'static', 1, 0.4, 'quadIn')
	end
	
	if curStep == 1279 then
		nohud = true
		currentbg = 'island-fire2'
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
		setProperty('boyfriend.visible', false)
		setProperty('soniclegs.alpha', 0)
		setProperty('soniclegsoverlay.alpha', 0)
		setProperty('flashback.alpha', 1)
		setProperty('TailsWalk.alpha', 1)
		setProperty('dad.x', -300)
		doTweenX('ohnotails', 'dad', 370, 1, 'linear')
		doTweenAlpha('static', 'static', 0.1, 0.3, 'quadIn')
		setProperty('Vignette.alpha', 0)
		
		
		scrspd = 0.3
		doTweenX('floorscroll2', 'floor2', -6834*4, 0.01, 'linear')
		doTweenX('firebgscroll2', 'firebg2', -640*4, 0.01, 'linear')
		doTweenX('firescroll2', 'fire2', -640*4, 0.01, 'linear')
		doTweenX('AIfrontscroll2', 'AIfront2', -5340*4, 0.01, 'linear')
		doTweenX('treesscroll2', 'trees2', -5340*4, 0.01, 'linear')
		doTweenX('topscroll2', 'top2', -5340*4, 0.01, 'linear')
	end
	
	if curStep == 1287 then
		setProperty('TailsWalk.alpha', 0)
		setProperty('TailsRun.alpha', 1)
	end
	
	if curStep == 1295 then
		setProperty('dad.visible', false)
		setProperty('TailsRun.alpha', 0)
		setProperty('TailsFall.alpha', 1)
		doTweenX('ohnotails:(', 'TailsFall', 450, 1, 'quadOut')
		objectPlayAnimation('TailsFall', 'TailsFall')
		
		cancelTween('floorscroll1')
		cancelTween('floorscroll2')
		cancelTween('floorscroll3')
		cancelTween('firebgscroll')
		cancelTween('firebgscroll2')
		cancelTween('firebgscroll3')
		cancelTween('firescroll')
		cancelTween('firescroll2')
		cancelTween('firescroll3')
		cancelTween('AIfrontscroll')
		cancelTween('AIfrontscroll2')
		cancelTween('AIfrontscroll3')
		cancelTween('treesscroll')
		cancelTween('treesscroll2')
		cancelTween('treesscroll3')
		cancelTween('topscroll')
		cancelTween('topscroll2')
		cancelTween('topscroll3')
		
		doTweenX('floorscroll', 'floor', -512*4, 1.5, 'cubeOut')
		doTweenX('floorscroll2', 'floor2', -1024*4, 1.5, 'cubeOut')
		doTweenX('floorscroll3', 'floor3', 0, 1.5, 'cubeOut')

        doTweenX('firebgscroll', 'firebg', -320*4, 1.5, 'cubeOut')
        doTweenX('firebgscroll2', 'firebg2', -640*4, 1.5, 'cubeOut')
        doTweenX('firebgscroll3', 'firebg3', 0, 1.5, 'cubeOut')

        doTweenX('firescroll', 'fire', -320*4, 1.5, 'cubeOut')
        doTweenX('firescroll2', 'fire2', -640*4, 1.5, 'cubeOut')
        doTweenX('firescroll3', 'fire3', 0, 1.5, 'cubeOut')

        doTweenX('AIfrontscroll', 'AIfront', -1370*4, 1.5, 'cubeOut')
        doTweenX('AIfrontscroll2', 'AIfront2', -4040*4, 1.5, 'cubeOut')
        doTweenX('AIfrontscroll3', 'AIfront3', 1300, 1.5, 'cubeOut')

        doTweenX('treesscroll', 'trees', -970*4, 1.5, 'cubeOut')
        doTweenX('treesscroll2', 'trees2', -3640*4, 1.5, 'cubeOut')
        doTweenX('treesscroll3', 'trees3', 1700, 1.5, 'cubeOut')
	end
	
	if curStep == 1311 then
		nohud = true
		currentbg = 'knux'
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
		setProperty('TailsFall.alpha', 0)
		setProperty('KnuxWalk.alpha', 1)
		setProperty('redfilter.alpha', 0)
		setProperty('dad.x', 250)
		setProperty('dad.visible', false)
		setProperty('XenoStalk.alpha', 1)
		
		scrspd = 1.4
		doTweenX('knux1scroll2', 'knux1-2', -3008*4, 0.01, 'linear')
		doTweenX('kbg4scroll2', 'kbg4-2', -1024*4, 0.01, 'linear')
		doTweenX('kbg3scroll2', 'kbg3-2', -1024*4, 0.01, 'linear')
		doTweenX('kbg2scroll2', 'kbg2-2', -1024*4, 0.01, 'linear')
		doTweenX('kbg1scroll2', 'kbg1-2', -1024*4, 0.01, 'linear')
	end
	
	if curStep == 1343 then
		nohud = true
		currentbg = 'egg'
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
		setProperty('KnuxWalk.alpha', 0)
		setProperty('EggWalk.alpha', 1)
		scrspd = 2
		doTweenX('eggbgscroll2', 'eggbg2', -1024*4, 0.01, 'linear')
		doTweenX('eggfloorscroll2', 'eggfloor2', -1024*4, 0.01, 'linear')
		setProperty('XenoStalk.alpha', 0)
	end
	
	if curStep == 1375 then
		nohud = false
		currentbg = 'knux'
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.4, 'quadOut')
		setProperty('dad.x', 250)
		setProperty('boyfriend.visible', true)
		setProperty('dad.visible', true)
		setProperty('soniclegs.alpha', 1)
		setProperty('soniclegsoverlay.alpha', 1)
		setProperty('flashback.alpha',0)
		doTweenAlpha('static', 'static', 0, 0.4, 'quadOut')
		setProperty('EggWalk.alpha', 0)
		setProperty('Vignette.alpha', 1)
		
		scrspd = 0.8
		doTweenX('knux1scroll2', 'knux1-2', -3008*4, 0.01, 'linear')
		doTweenX('kbg4scroll2', 'kbg4-2', -1024*4, 0.01, 'linear')
		doTweenX('kbg3scroll2', 'kbg3-2', -1024*4, 0.01, 'linear')
		doTweenX('kbg2scroll2', 'kbg2-2', -1024*4, 0.01, 'linear')
		doTweenX('kbg1scroll2', 'kbg1-2', -1024*4, 0.01, 'linear')
	end
	
	if curStep == 1391 then
		nohud = true
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
		setProperty('TailsDeath.alpha', 1)
		setProperty('flashback.alpha', 1)
		setProperty('Vignette.alpha', 0)
	end
	
	if curStep == 1397 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
		setProperty('TailsDeath.alpha', 0)
		setProperty('KnuxDeath.alpha', 1)
	end
	
	if curStep == 1403 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
		setProperty('KnuxDeath.alpha', 0)
		setProperty('EggDeath.alpha', 1)
	end
	
	if curStep == 1407 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.5, 'quadOut')
		setProperty('EggDeath.alpha', 0)
		setProperty('flashback.alpha', 0)
		setProperty('Vignette.alpha', 1)
		nohud = false
	end
	
	if curStep == 1519 then
		doTweenAlpha('whiteflash', 'white', 1, 0.8, 'quadIn')
		doTweenAlpha('static', 'static', 1, 0.8, 'quadIn')
		doTweenColor('exedark', 'dad', '000000', 0.5, 'quadIn')
		doTweenAlpha('byexeno', 'dad', 0, 0.7, 'quadIn')
		doTweenX('xenoleft', 'dad', 150, 0.7, 'quadIn')
		doTweenX('gosonicgo', 'boyfriend', 900, 0.9, 'quadIn')
	end

	if curStep == 1535 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 1, 'quadOut')
		doTweenAlpha('static', 'static', 0, 1, 'quadOut')
		currentbg = 'egg'
		scrspd = 4
		doTweenX('eggbgscroll2', 'eggbg2', -1024*4, 0.01, 'linear')
		doTweenX('eggfloorscroll2', 'eggfloor2', -1024*4, 0.01, 'linear')
		walk = true
		triggerEvent('Change Character', 'bf','sonicwalkworried')
		setProperty('boyfriend.x', -400)
		doTweenX('walkfasterufuck', 'boyfriend', 500, 6, 'linear')
		setProperty('boyfriend.alpha', 1)
		setProperty('dad.visible', false)
		setProperty('soniclegs.alpha', 0)
		setProperty('soniclegsoverlay.alpha', 0)
		nohud = true
	end
	
	if curStep == 1663 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.5, 'quadOut')
		doTweenColor('exedark', 'dad', 'FFFFFF', 0.01, 'quadIn')
		setProperty('TailsCorpse.alpha', 0.8)
		doTweenAlpha('tailsisfuckingdead', 'TailsCorpse', 0, 1, 'quadIn')
		doTweenX('movingcorpsewow', 'TailsCorpse', -650, 2, 'linear')
	end

	if curStep == 1783 then
		cancelTween('eggbgscroll')
		cancelTween('eggbgscroll2')
		cancelTween('eggbgscroll3')
		cancelTween('eggfloorscroll')
		cancelTween('eggfloorscroll2')
		cancelTween('eggfloorscroll3')
		walk = false
		setProperty('SonicWalk.alpha', 0)
		setProperty('boyfriend.visible', false)
		setProperty('boyfriend.alpha', 0)
		setProperty('sonicskid.alpha', 1)
		setProperty('dad.alpha', 1)
		setProperty('xeno2.alpha', 1)
		
		objectPlayAnimation('sonicskid', 'sonicskid')
		objectPlayAnimation('xeno2', 'helo')
	end
	
	if curStep == 1786 then
		setProperty('SonicCrouch.alpha', 1)
		setProperty('sonicskid.alpha', 0)	
	end
	
	if curStep == 1787 then
		doTweenAlpha('whiteflash', 'white', 1, 0.3, 'quadIn')
		doTweenAlpha('static', 'static', 1, 0.3, 'quadIn')
	end
	
	if curStep == 1791 then
		currentbg = 'stop it you fuck'
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
		doTweenAlpha('static', 'static', 0, 0.75, 'quadOut')
		setProperty('eggbgred.visible', true)
		setProperty('eggbgred2.visible', true)
		setProperty('eggbgred3.visible', true)
		setProperty('eggfloorred.visible', true)
		setProperty('eggfloorred2.visible', true)
		setProperty('eggfloorred3.visible', true)
		setProperty('eggfloor.visible', false)
		setProperty('eggfloor2.visible', false)
		setProperty('eggfloor3.visible', false)
		doTweenColor('exedark', 'dad', 'FFFFFF', 0.01, 'quadIn')
		setProperty('Vignette.alpha', 1)
		setProperty('black.alpha', 0.1)
		doTweenX('eggbgscrollred2', 'eggbgred2', -1024*4, 0.01, 'linear')
		doTweenX('eggfloorscrollred2', 'eggfloorred2', -1024*4, 0.01, 'linear')
		walk = true
		setProperty('boyfriend.visible', true)
		setProperty('boyfriend.alpha', 1)
		triggerEvent('Change Character', 'bf','sonicwalkangy')
		--setProperty('SonicWalkAnger.alpha', 1)
		setProperty('xeno2.alpha', 0)
		setProperty('SonicCrouch.alpha', 0)
		setProperty('boyfriend.x', 500)
		setProperty('KnuxCorpse.alpha', 0.8)
		doTweenAlpha('knuxisfuckingdead', 'KnuxCorpse', 0, 1, 'quadIn')
		doTweenX('movingcorpsewow', 'KnuxCorpse', -650, 2, 'linear')
	end
	
	if curStep == 1915 then
		doTweenAlpha('whiteflash', 'white', 1, 0.4, 'quadIn')
		doTweenAlpha('static', 'static', 1, 0.4, 'quadIn')
	end
	
	if curStep == 1919 then
		doTweenAlpha('whiteflash', 'white', 0, 0.5, 'quadOut')
		doTweenAlpha('static', 'static', 0.05, 0.5, 'quadOut')
		
		setProperty('EggCorpse.alpha', 0.6)
		doTweenAlpha('robotnikisfuckingdead', 'EggCorpse', 0, 1, 'quadIn')
		doTweenX('movingcorpsewow', 'EggCorpse', -650, 2, 'linear')
	
		setProperty('eggbgred.visible', false)
		setProperty('eggbgred2.visible', false)
		setProperty('eggbgred3.visible', false)
		setProperty('eggfloorred.visible', false)
		setProperty('eggfloorred2.visible', false)
		setProperty('eggfloorred3.visible', false)
		
		setProperty('eggbgdark.visible', true)
		setProperty('eggbgdark2.visible', true)
		setProperty('eggbgdark3.visible', true)
		setProperty('eggfloordark.visible', true)
		setProperty('eggfloordark2.visible', true)
		setProperty('eggfloordark3.visible', true)
		
		setProperty('dad.alpha', 0)
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 1, 'quadOut')
		setProperty('black.alpha', 0.6)
		setProperty('Vignette2.alpha', 1)
		setProperty('Vignette.alpha', 0)
	end
	
	if curStep == 1983 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
	end
	
	if curStep == 1999 then
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
	end
	
	if curStep == 2015 then
		scrspd = 2.2
		doTweenX('eggbgdarkscroll2', 'eggbgdark2', -1024*4, 0.01, 'linear')
		doTweenX('eggfloordarkscroll2', 'eggfloordark2', -1024*4, 0.01, 'linear')
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
		
	end
	
	if curStep == 2023 then
		scrspd = 1.1
		doTweenX('eggbgdarkscroll2', 'eggbgdark2', -1024*4, 0.01, 'linear')
		doTweenX('eggfloordarkscroll2', 'eggfloordark2', -1024*4, 0.01, 'linear')
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
		objectPlayAnimation('SonicWalkAnger', 'SonicWalkAngerFast')
	end
	
	if curStep == 2031 then
		scrspd = 0.8
		doTweenX('eggbgdarkscroll2', 'eggbgdark2', -1024*4, 0.01, 'linear')
		doTweenX('eggfloordarkscroll2', 'eggfloordark2', -1024*4, 0.01, 'linear')
		setProperty('white.alpha', 1)
		doTweenAlpha('whiteflash', 'white', 0, 0.3, 'quadOut')
		setProperty('SonicWalkAnger.alpha', 0)
		walk = false
		triggerEvent('Change Character', 'bf','sonicpanic')
		setProperty('boyfriend.x', 500)
		setProperty('boyfriend.y', 495)
		setProperty('boyfriend.visible', true)
		setProperty('soniclegs.alpha', 1)
		setProperty('soniclegsoverlay.alpha', 1)
		setProperty('dad.x', 150)
		setProperty('dad.visible', true)
		doTweenAlpha('byexeno', 'dad', 1, 1.5, 'quadOut')
		doTweenX('hixeno', 'dad', 250, 1, 'quadOut')
		doTweenColor('exedark', 'dad', 'FFFFFF', 0.01, 'quadOut')
	end
	
	if curStep == 2039 then
		doTweenAlpha('whiteflash', 'white', 1, 0.4, 'quadIn')
		doTweenAlpha('static', 'static', 1, 0.4, 'quadIn')
	end
	
	if curStep == 2047 then
		setProperty('Vignette2.alpha', 0)
		setBlendMode('redfilter', 'normal')
		setProperty('black.alpha', 0)
		setProperty('eggbgdark.visible', false)
		setProperty('eggbgdark2.visible', false)
		setProperty('eggbgdark3.visible', false)
		setProperty('eggfloordark.visible', false)
		setProperty('eggfloordark2.visible', false)
		setProperty('eggfloordark3.visible', false)
		setProperty('Vignette.alpha', 0)
		currentbg = 'island-fire'
		triggerEvent('Change Character', 'bf','sonic')
		setProperty('boyfriend.x', 500)
		setProperty('boyfriend.y', 495)
		setProperty('white.alpha', 1)
		doTweenX('floorscroll2', 'floor2', -6834*4, 0.01, 'linear')
		doTweenX('AIBackAscroll2', 'AIBackA2', -640*4, 0.01, 'linear')
		doTweenX('AITopAscroll2', 'AITopA2', -640*4, 0.01, 'linear')
		nohud = false
		
		doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
		doTweenAlpha('static', 'static', 0, 0.75, 'quadOut')
	end
	
	---endings time
	
	--best ending (Full Combo) - (endbest)
	if best == true then
		if curStep == 2151 then
			cancelTween('floorscroll')
			cancelTween('floorscroll2')
			cancelTween('floorscroll3')
			
			cancelTween('AIBackAscroll')
			cancelTween('AIBackAscroll2')
			cancelTween('AIBackAscroll3')
			
			cancelTween('AITopAscroll')
			cancelTween('AITopAscroll2')
			cancelTween('AITopAscroll3')
			
			setProperty('dad.alpha', 0)
			setProperty('boyfriend.visible', false)
			setProperty('soniclegs.alpha', 0)
			setProperty('soniclegsoverlay.alpha', 0)
			
			setProperty('xeno2.x', 205)
			setProperty('xeno2.y', 390)
			doTweenX('hereicome', 'xeno2', 490, 0.5, 'quadOut')
			objectPlayAnimation('xeno2', 'slide')
			setProperty('xeno2.alpha', 1)
			
			setProperty('sonicskid.alpha', 1)
			doTweenX('waitwhosthat', 'sonicskid', 700, 0.5, 'quadOut')
			objectPlayAnimation('sonicskid', 'sonicskid')
			runTimer('turnsonic', 0.7)
		end
		
		if curStep == 2159 then
			doTweenX('gotailsgo', 'TailsRoll', 1400, 0.9, 'linear')
			doTweenX('goknuxgo', 'KnuxRoll', 1500, 0.9, 'linear')
		end
		
		if curStep == 2167 then
			setProperty('xeno2.flipX', false)
			setProperty('xeno2.y', 400)
			objectPlayAnimation('xeno2', 'hurt')
			doTweenX('owfuckdudethathurt', 'xeno2', 200, 0.9, 'linear')
			doTweenY('owfuckdudethathurtwhy', 'xeno2', 300, 0.25, 'quadOut')
			doTweenAlpha('finefuckyouassholes', 'xeno2', 0, 0.5, 'linear')
			doTweenAlpha('whiteflash', 'white', 1, 0.5, 'quadIn')
			doTweenAlpha('static', 'static', 1, 0.5, 'quadIn')
			cancelTween('startfly')
			cancelTween('updown')
			cancelTween('downup')
			setProperty('dad.y', 1)
		end
		
		if curStep == 2167 then
			setProperty('sonicstare.alpha', 0)
			setProperty('sonicskid.alpha', 1)
			doTweenX('gosonicskid', 'sonicskid', 1400, 0.4, 'quadIn')
			setProperty('boyfriend.x', 700)
			doTweenX('gosonicgooo', 'boyfriend', 1400, 0.4, 'quadIn')
		end
		
		if curStep == 2171 then
			setProperty('sonicskid.alpha', 0)
			
			setProperty('boyfriend.visible', true)
			setProperty('soniclegs.alpha', 1)
			setProperty('soniclegsoverlay.alpha', 1)
		end 
		
		if curStep == 2175 then
			scrspd = 0.5
			doTweenX('floorscroll2', 'floor2', -6834*4, 0.01, 'linear')
			doTweenX('AIBackAscroll2', 'AIBackA2', -640*4, 0.01, 'linear')
			doTweenX('AITopAscroll2', 'AITopA2', -640*4, 0.01, 'linear')
			
			setProperty('white.alpha', 1)
			setProperty('static.alpha', 1)
			doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
			doTweenAlpha('static', 'static', 0, 0.75, 'quadOut')
			
			triggerEvent('Change Character', 'dad','xenoPixelAnger')
			triggerEvent('Alt Idle Animation', 'dad','')
			doTweenY('startfly','dad', getProperty('dad.y')+10, 0.5, 'quadOut')
			setProperty('dad.alpha', 1)
			setProperty('xeno2.alpha', 0)
			twnspd = 0.75
			
			setProperty('boyfriend.x', -500)
			setProperty('dad.x', -800)
			setProperty('TailsDash.x', -500)
			setProperty('KnuxRun.x', -500)
			setProperty('TailsDash.alpha', 1)
			setProperty('KnuxRun.alpha', 1)
			
			doTweenX('LETS', 'TailsDash', 300, 1.5, 'quadOut')
			doTweenX('FUCKING', 'KnuxRun', 630, 1.5, 'quadOut')
			doTweenX('GOOOOO', 'boyfriend', 500, 1.5, 'quadOut')
			doTweenX('ohandxenotoo', 'dad', 100, 1.5, 'quadOut')
		end
		
		if curStep == 2271 then
			doTweenX('runbitch', 'dad', -500, 0.9, 'quadIn')
		end
		
		if curStep == 2287 then
			setProperty('Tornado.x', -300)
			setProperty('Tornado.y', -300)
			setProperty('Tornado.alpha', 1)
			--setProperty('TailsTornado.alpha', 1)
			doTweenX('flying', 'Tornado', 300, 0.9, 'quadIn')
			doTweenY('inbaby', 'Tornado', 400, 0.9, 'quadOut')
			doTweenAlpha('whiteflash', 'white', 1, 0.9, 'quadIn')
			doTweenAlpha('static', 'static', 1, 0.9, 'quadIn')
		end
		
		if curStep == 2303 then
			--skytime
			scrspd = 0.4
			twnspd = 0.5
			currentbg = 'sky'
			setProperty('dad.x', -800)
			doTweenX('ohandxenotoo', 'dad', 100, 1, 'quadOut')
			fly = true
			sprint = false
			triggerEvent('Change Character', 'bf','sonictornado')
			setProperty('Tornado.y', 1000)
			setProperty('Tornado.alpha', 1)
			setProperty('TailsTornado.alpha', 1)
			setProperty('TailsDash.alpha', 0)
			setProperty('KnuxRun.alpha', 0)
			setProperty('KnuxTornado.alpha', 1)
			doTweenX('FLYINGTIME','Tornado', 410, 1, 'quadOut')
			doTweenY('starttornadofly','Tornado', 530, 0.75, 'quadOut')
			setProperty('rain.alpha', 1)
			setProperty('black.alpha', 0.1)
			setProperty('Vignette.alpha', 1)
			
			setProperty('white.alpha', 1)
			setProperty('static.alpha', 1)
			doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
			doTweenAlpha('static', 'static', 0, 0.75, 'quadOut')
			
			doTweenX('sky1scroll2', 'sky1-2', -1024*4, 0.01*scrspd, 'linear')
			doTweenX('sky2scroll2', 'sky2-2', -1024*4, 0.01*scrspd, 'linear')
			doTweenX('sky3scroll2', 'sky3-2', -1024*4, 0.01*scrspd, 'linear')
			doTweenX('sky4scroll2', 'sky4-2', -1024*4, 0.01*scrspd, 'linear')
			doTweenX('sky5scroll2', 'sky5-2', -1024*4, 0.01*scrspd, 'linear')
		end
		
		if curStep == 2687 then
			doTweenX('ohandxenotoo', 'dad', 300, 8, 'linear')
		end
		
		if curStep == 2807 then
			doTweenX('SHUTUPLOSER', 'EnergyBall', 320, 0.5, 'linear')
			doTweenY('BIDENBLAST', 'EnergyBall', 600, 0.5, 'linear')
		end
		
		if curStep == 2815 then
			setProperty('white.alpha', 1)
			setProperty('static.alpha', 1)
			doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
			doTweenAlpha('static', 'static', 0, 0.75, 'quadOut')
			setProperty('dad.alpha', 0)
			setProperty('xeno2.flipX', false)
			setProperty('xeno2.x', 200)
			setProperty('xeno2.y', 400)
			setProperty('xeno2.alpha', 1)
			objectPlayAnimation('xeno2', 'hurt')
			doTweenX('manimmdead', 'xeno2', -300, 2, 'linear')
			doTweenY('fallingnowgoodbye', 'xeno2', 250, 1, 'quadOut')

			setProperty('EnergyBall.alpha', 0)
			doTweenX('hereseggy', 'EggFly', 100, 1, 'quadInOut')
			doTweenY('hereseggywoo', 'EggFly', 300, 1, 'quadInOut')
			nohud = true
			for i = 4,7 do
				setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
			end
		end
		
		if curStep == 2847 then
			setProperty('blackfull.alpha', 1)
			setProperty('eyesjumpscare.alpha', 1)
			doTweenAlpha('eyesjumpscare', 'eyesjumpscare', 0, 1, 'quadOut')
		end
	end
	
	--good (canon) ending - (endgood)
	if bad == false and best == false then
	
		if curStep == 2143 then
			setProperty('boyfriend.visible', false)
			setProperty('soniclegs.alpha', 0)
			setProperty('soniclegsoverlay.alpha', 0)
			setProperty('SonicRoll.alpha', 1)
			
			doTweenY('jumponhim', 'SonicRoll', 200, 0.5, 'quadOut')
			doTweenX('lookoutbitch', 'dad', 500, 1, 'linear')
		end
		
		if curStep == 2151 then
			setProperty('boyfriend.visible', false)
			setProperty('soniclegs.alpha', 0)
			setProperty('soniclegsoverlay.alpha', 0)
			setProperty('SonicRoll.alpha', 1)
			
			doTweenY('jumponhim', 'SonicRoll', 480, 0.4, 'quadIn')
		end
		
		if curStep == 2159 then
		
			cancelTween('floorscroll')
			cancelTween('floorscroll2')
			cancelTween('floorscroll3')
			
			cancelTween('AIBackAscroll')
			cancelTween('AIBackAscroll2')
			cancelTween('AIBackAscroll3')
			
			cancelTween('AITopAscroll')
			cancelTween('AITopAscroll2')
			cancelTween('AITopAscroll3')
			
			
			setProperty('SonicRoll.y', 480)
			objectPlayAnimation('SonicRoll', 'Spindash')
			setProperty('SpinDust.alpha', 1)
		
			setProperty('dad.alpha', 0)
			setProperty('xeno2.flipX', false)
			setProperty('xeno2.x', 350)
			setProperty('xeno2.y', 400)
			setProperty('xeno2.alpha', 1)
			objectPlayAnimation('xeno2', 'hurt')
			doTweenX('owfuckdudethathurt', 'xeno2', -300, 1.5, 'linear')
			doTweenY('owfuckdudethathurtwhy2', 'xeno2', 310, 0.5, 'quadOut')
			doTweenAlpha('finefuckyouassholes', 'xeno2', 0, 0.9, 'quadIn')

			cancelTween('startfly')
			cancelTween('updown')
			cancelTween('downup')
			setProperty('dad.y', 1)
		end
		
		if curStep == 2175 then
			scrspd = 0.5
			doTweenX('floorscroll2', 'floor2', -6834*4, 0.01, 'linear')
			doTweenX('AIBackAscroll2', 'AIBackA2', -640*4, 0.01, 'linear')
			doTweenX('AITopAscroll2', 'AITopA2', -640*4, 0.01, 'linear')
			
			setProperty('SonicRoll.y', 500)
			objectPlayAnimation('SonicRoll', 'Ball')
			setProperty('SpinDust.alpha', 0)
			
			
			triggerEvent('Change Character', 'dad','xenoPixelAnger')
			triggerEvent('Alt Idle Animation', 'dad','')
			doTweenY('startfly','dad', getProperty('dad.y')+10, 0.5, 'quadOut')
			doTweenAlpha('finefuckyouassholes', 'dad', 1, 0.9, 'linear')
			setProperty('dad.x', 0)
			doTweenX('ohandxenotoo', 'dad', 250, 1.5, 'quadOut')
			twnspd = 0.75
			
			setProperty('white.alpha', 1)
			doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
			doTweenAlpha('static', 'static', 0, 0.75, 'quadOut')
		end
	
		if curStep == 2191 then
			doTweenY('jumponhim', 'SonicRoll', 300, 0.5, 'quadOut')
		end
		
		if curStep == 2199 then
			doTweenY('jumponhim', 'SonicRoll', 500, 0.5, 'quadIn')
		end
		
		if curStep == 2207 then
			setProperty('boyfriend.visible', true)
			setProperty('soniclegs.alpha', 1)
			setProperty('soniclegsoverlay.alpha', 1)
			setProperty('SonicRoll.alpha', 0)
		end
		
		if curStep == 2279 then
			currentbg = 'end'
			setProperty('boyfriend.visible', false)
			sprint = false
			setProperty('SonicRoll.y', 500)
			setProperty('soniclegs.alpha', 0)
			setProperty('soniclegsoverlay.alpha', 0)
			setProperty('SonicRoll.alpha', 1)
			doTweenAlpha('transformintime1', 'blackbg', 1, 0.25, 'quadOut')
			doTweenAlpha('transformintime2', 'dad', 0, 0.25, 'quadOut')
			doTweenAlpha('transformintime3', 'redfilter', 0, 0.25, 'quadOut')
			
			doTweenY('jumpin', 'SonicRoll', 350, 0.5, 'quadOut')
		end
		
		if curStep == 2287 then
			setProperty('SonicRoll.alpha', 0)
			setProperty('SSTransformation.alpha', 1)
			objectPlayAnimation('SSTransformation', 'SSTransformation')
			--transform
		end
		
		if curStep == 2303 then
			setProperty('SSTransformation.alpha', 0)
			scrspd = 0.3
			twnspd = 0.5
			
			doTweenX('floorscroll2', 'floor2', -6834*4, 0.01, 'linear')
			doTweenX('AIBackAscroll2', 'AIBackA2', -640*4, 0.01, 'linear')
			doTweenX('AITopAscroll2', 'AITopA2', -640*4, 0.01, 'linear')
			
			setProperty('boyfriend.visible', true)
			setProperty('soniclegs.alpha', 1)
			setProperty('soniclegsoverlay.alpha', 1)
			setProperty('SonicRoll.alpha', 0)
			triggerEvent('Change Character', 'bf','cocky-supersonic')
			setProperty('boyfriend.y', 370)
			doTweenX('ohandxenotoo', 'dad', 100, 0.5, 'quadOut')
			doTweenY('superflystart', 'boyfriend', 570, 0.5, 'quadOut')
			
			setProperty('dad.alpha', 1)
			setProperty('blackbg.alpha', 0)
			setProperty('redfilter.alpha', 0.1)
			
			setProperty('white.alpha', 1)
			doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
		end
		
		if curStep == 2815 then
			setProperty('white.alpha', 1)
			doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
			nohud = true
			for i = 4,7 do
				setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
			end
		end
		
		if curStep == 2831 then
			doTweenX('ohandxenotoo', 'dad', 1500, 1, 'quadIn')
			doTweenX('weeee', 'boyfriend', 2000, 1, 'quadIn')
		end
		
		if curStep == 2847 then
			setProperty('blackfull.alpha', 1)
		end
	end
	
	--bad ending (endbad)
	if bad == true and best == false then
		
		if curStep == 2143 then
			setProperty('boyfriend.visible', false)
			setProperty('soniclegs.alpha', 0)
			setProperty('soniclegsoverlay.alpha', 0)
			setProperty('SonicRoll.alpha', 1)
			
			doTweenY('jumponhim', 'SonicRoll', 200, 0.5, 'quadOut')
			doTweenX('lookoutbitch', 'dad', 470, 0.9, 'linear')
		end
		
		if curStep == 2151 then
			setProperty('boyfriend.visible', false)
			setProperty('soniclegs.alpha', 0)
			setProperty('soniclegsoverlay.alpha', 0)
			setProperty('SonicRoll.alpha', 1)
			
			doTweenY('jumponhim', 'SonicRoll', 480, 0.4, 'quadIn')
			doTweenAlpha('finefuckyouassholes', 'dad', 0, 0.4, 'linear')
		end
		
		if curStep == 2159 then
		
			cancelTween('floorscroll')
			cancelTween('floorscroll2')
			cancelTween('floorscroll3')
			
			cancelTween('AIBackAscroll')
			cancelTween('AIBackAscroll2')
			cancelTween('AIBackAscroll3')
			
			cancelTween('AITopAscroll')
			cancelTween('AITopAscroll2')
			cancelTween('AITopAscroll3')
			
			setProperty('ready.alpha', 1)
			setProperty('orNot.alpha', 1)
			if widescreen == false then
				doTweenX('ready', 'ready', 0, 0.3, 'linear')
				doTweenX('ornot', 'orNot', 0, 0.3, 'linear')
			else
				doTweenX('ready', 'ready', 160, 0.3, 'linear')
				doTweenX('ornot', 'orNot', 160, 0.3, 'linear')
			end
			
			setProperty('SonicRoll.y', 480)
			objectPlayAnimation('SonicRoll', 'Spindash')
			setProperty('SpinDust.alpha', 1)
		end
		
		if curStep == 2167 then
			setProperty('dad.x', -400)

			doTweenAlpha('finefuckyouassholes', 'dad', 1, 0.5, 'linear')
		end
		
		if curStep == 2175 then
			scrspd = 0.5
			doTweenX('floorscroll2', 'floor2', -6834*4, 0.01, 'linear')
			doTweenX('AIBackAscroll2', 'AIBackA2', -640*4, 0.01, 'linear')
			doTweenX('AITopAscroll2', 'AITopA2', -640*4, 0.01, 'linear')
			
			setProperty('ready.alpha', 0)
			setProperty('orNot.alpha', 0)
			setProperty('hereicome.alpha', 1)
			canPause = false
			cameraShake('other', 0.06, 1)
			
			setProperty('SonicRoll.y', 500)
			objectPlayAnimation('SonicRoll', 'Ball')
			setProperty('SpinDust.alpha', 0)

			setProperty('white.alpha', 1)
			doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
			doTweenAlpha('static', 'static', 0, 0.75, 'quadOut')
			
			doTweenX('ohandxenotoo', 'dad', 380, 40, 'linear')	
			twnspd = 0.75			
			
			nohud = true
		end
	
		if curStep == 2191 then
			doTweenY('jumponhim', 'SonicRoll', 300, 0.5, 'quadOut')
		end
		
		if curStep == 2199 then
			doTweenY('jumponhim', 'SonicRoll', 500, 0.5, 'quadIn')
		end
		
		if curStep == 2207 then
			doTweenAlpha('hereicomebitch', 'hereicome', 0, 1, 'linear')
			setProperty('boyfriend.visible', true)
			triggerEvent('Change Character', 'bf','sonicpanic')
			setProperty('boyfriend.x', 510)
			setProperty('boyfriend.y', 495)
			setProperty('soniclegs.alpha', 1)
			setProperty('soniclegsoverlay.alpha', 1)
			setProperty('SonicRoll.alpha', 0)
			doTweenAlpha('endingtime', 'blackbg', 1, 22, 'linear')
			doTweenAlpha('static', 'static', 0.3, 22, 'linear')
		end
		
		if curStep == 2303 then
			setProperty('white.alpha', 1)
			doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
		end
		
		if curStep == 2559 then
			setProperty('white.alpha', 1)
			doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
		end
		
		if curStep == 2687 then
			setProperty('white.alpha', 1)
			doTweenAlpha('whiteflash', 'white', 0, 0.75, 'quadOut')
		end
		
		if curStep == 2815 then
			setProperty('dad.alpha', 0)
			triggerEvent('Change Character', 'bf','sonic')
			setProperty('boyfriend.x', 510)
			setProperty('boyfriend.y', 495)

			for i = 4,7 do
				setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
			end
		end
		
		if curStep == 2833 then
			setProperty('boyfriend.visible', false)
			setProperty('soniclegs.alpha', 0)
			setProperty('soniclegsoverlay.alpha', 0)
			setProperty('SonicDies.alpha', 1)
			objectPlayAnimation('SonicDies', 'Trip')
			setProperty('XenoKill.alpha', 1)
			setProperty('XenoKill.x', 1500)
			setProperty('XenoKill.y', 530)
			objectPlayAnimation('XenoKill', 'Whoops')
			doTweenX('hahaidiot', 'XenoKill', -300, 0.5, 'linear')
		end
		
		
		if curStep == 2839 then
			doTweenAlpha('staticfull', 'staticfull', 0.3, 0.4, 'quadIn')
			runTimer('death', 0.1)
			doTweenY('awfuck', 'SonicDies', 440, 0.25, 'quadOut')
			doTweenAlpha('ahehaehaehaheahahahae', 'XenoKill', 0, 0.25, 'quadOut')
			setProperty('XenoKill2.alpha', 1)
			setProperty('XenoKill2.x', 1500)
			setProperty('XenoKill2.y', 500)
			objectPlayAnimation('XenoKill2', 'Gotcha')
			doTweenX('igotchubitch', 'XenoKill2', 420, 0.4, 'linear')
		end
		
		if curStep == 2846 then
			setProperty('SonicDies.alpha', 0)
		end
		
		if curStep == 2847 then
			cancelTween('igotchubitch')
			doTweenX('igotchubitchhhh', 'XenoKill2', 520, 0.2, 'quadOut')
		end
		
		if curStep == 2848 then
			setProperty('staticfull.alpha', 0)
			setProperty('XenoKill.alpha', 0)
			setProperty('XenoKill2.alpha', 0)
			setProperty('static.alpha', 0)
			setProperty('blackfull.alpha', 1)
			setProperty('eyesjumpscare.alpha', 1)
			setProperty('jumpscare.alpha', 1)
			doTweenAlpha('eyesjumpscare', 'jumpscare', 0, 0.25, 'quadOut')
		end
			
		if curStep == 2927 then
			currentbg = 'no more red pls ty'
			setProperty('redfilter.alpha', 0)
			setProperty('blackfull.alpha', 0)
			makeAnimatedLuaSprite('games', 'gameoversheet', -670, 580)
			addAnimationByPrefix('games', 'games', 'game1', 15, false)
			objectPlayAnimation('games', 'games')
			setProperty('games.antialiasing', false)
			scaleObject('games', 4, 4)
			addLuaSprite('games', true)
			doTweenX('gameslide', 'games', 250, 0.4)

			makeAnimatedLuaSprite('over', 'gameoversheet', 1570, 580)
			addAnimationByPrefix('over', 'over', 'over', 15, false)
			objectPlayAnimation('over', 'over')
			setProperty('over.antialiasing', false)
			scaleObject('over', 4, 4)
			addLuaSprite('over', true)
			doTweenX('overslide', 'over', 550, 0.4)
		end
		
		if curStep == 2975 then
			setProperty('redfilter.alpha', 0)
			setProperty('blackfull.alpha', 0)
			doTweenAlpha('gamesalpha', 'games', 0, 0.7)
			doTweenAlpha('overalpha', 'over', 0, 0.7)
		end
		
		if curStep >= 3004 then	
			setProperty('jumpscare.alpha', 1)
		end
		
		if curStep >= 3005 then	
			setProperty('jumpscare.alpha', 1)
			setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
			playSound('laugh', 0.7)
			runHaxeCode([[
			Application.current.window.alert("Irregularity Detected\nWhat Failed: ('INVALID_DATA.RDSK')\nReason For Error: 'Character 'SONIC' not found.'\n###\n###\nAw... Too slow. Wanna try again?\n###\n###\nStopping Emulation\nClosing Game", "ERROR");
			]]);
			os.exit()
		end
	end
	
setProperty('peeloutlegs.x', getProperty('boyfriend.x')-24*4)
setProperty('peeloutlegs.y', getProperty('boyfriend.y')+4)

	if widescreen == false and (getPropertyFromClass('openfl.Lib', 'application.window.fullscreen') == true or getPropertyFromClass('openfl.Lib', 'application.window.maximise') == true) then
		setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
		playSound('fullscreen', 1)
		setPropertyFromClass('flixel.FlxG', 'sound.music.volume', 0)
		setProperty('vocals.volume', 0)
		runHaxeCode([[
		Application.current.window.alert("Irregularity Detected\nWhat Failed: ('INCORRECT_RESOLUTION')\nReason For Error: 'Do not fullscreen or resize the application.'\nStopping Emulation\nClosing Game", "ERROR");
		]]);
		runTimer('closegame', 0.1)
		os.exit()
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
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'death' then
		playSound('sonicDeath', 0.8)
	end

	if tag == 'blink1' then
		runTimer('blink2', 0.2)
		setProperty('misses.alpha', 1)
		setProperty('misses2.alpha', 0)
	end
	
	if tag == 'blink2' then
		runTimer('blink1', 0.2)
		setProperty('misses.alpha', 0)
		setProperty('misses2.alpha', 1)
	end
	
	if tag == 'stagestart' then
		if widescreen == false then
			doTweenX('yourself', 'yourself', 0, 0.25, 'linear')
		else
			doTweenX('yourself', 'yourself', 160, 0.25, 'linear')
		end
		runTimer('2ndtext', '0.25')
	end
	
	if tag == '2ndtext' then
		if widescreen == false then
			doTweenX('act', 'act1', 0, 0.25, 'linear')
		else
			doTweenX('act', 'act1', 160, 0.25, 'linear')
		end
	end
	
	if tag == 'turnsonic' then
		objectPlayAnimation('sonicskid', 'turns')
	end
end

function onStepHit()
	if curStep == 1535 then
		setProperty('soniclegswalk.y', getProperty('boyfriend.y')-13.5)
	end
end

function onDestroy()
	setPropertyFromClass('openfl.Lib', 'application.window.title', "Friday Night Funkin': Psych Engine")
	setPropertyFromClass('openfl.Lib', 'application.window.borderless', false)
	
runHaxeCode([[
    var stage = Lib.current.stage;
    var resolutionX = 0;
    var resolutionY = 0;

    if (stage.window != null)
    {
        var display = stage.window.display;

        if (display != null)
        {
            resolutionX = Math.ceil(display.currentMode.width * stage.window.scale);
            resolutionY = Math.ceil(display.currentMode.height * stage.window.scale);
        }
    }

    if(resolutionX <= 0){
        resolutionX = stage.stageWidth;
        resolutionY = stage.stageHeight;
    }

  Lib.application.window.x = (resolutionX - Lib.application.window.width)/2;
  Lib.application.window.y = (resolutionY - Lib.application.window.height)/2;
]]);
end

function onPause()
	if canPause == false then
		return Function_Stop
	end
end