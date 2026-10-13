local sus = 0
local beatFlag = 0
local stepFlag = 0
local iHateDebugging = true;
local bitch = false
local ghostFlippyFlop = 0

function onCountdownStarted()
    runHaxeCode([[
        game.dadGroup.scrollFactor.set(1, 1);
        game.boyfriendGroup.scrollFactor.set(1, 1);
    ]])
	
	setProperty('dad.visible', false)
	setProperty('gf.visible', false)
	setProperty('iconP2.visible', false)
	
	noteTweenX('oppo0', 0, -1000, 0.001, 'quartInOut')
	noteTweenX('oppo1', 1, -1000, 0.001, 'quartInOut')
	noteTweenX('oppo2', 2, -1000, 0.001, 'quartInOut')
	noteTweenX('oppo3', 3, -1000, 0.001, 'quartInOut')
end

function onCreatePost()
	precacheImage('stages/theSkeld/still1')
	precacheImage('stages/theSkeld/still2')
	precacheImage('stages/theSkeld/still3')
	beatFlag = 0
	stepFlag = 0
	
	runHaxeCode('for (strum in game.opponentStrums) strum.shader =  null;')
	runHaxeCode('for (strum in game.playerStrums) strum.shader = null;')
	runHaxeCode('for (note in game.unspawnNotes) note.shader = null;')
	runHaxeCode('for (note in game.notes.members) note.shader = null;')
    --cool = getRandomInt(204, 324) no more random mountain drop!
    --cooler = getRandomInt(140, 331) owned epic style! -skyan
end

function onBeatHit()
	--epic dance
	if curStep > 590 and curStep < 623 or curStep > 750 and curStep < 783 then
		if weCallThisOneTheSusStep then
			weCallThisOneTheSusStep = false
			setProperty('boyfriend.angle', 5)
			setProperty('gf.angle', -5)
		else
			weCallThisOneTheSusStep = true
			setProperty('boyfriend.angle', -5)
			setProperty('gf.angle', 5)
		end
		setProperty('boyfriend.y', getProperty('boyfriend.y') + 100)
		setProperty('gf.y', getProperty('gf.y') + 100)
		doTweenY('bfSusStep', 'boyfriend', getProperty('boyfriend.y') - 100, 0.4, 'circOut')
		doTweenY('gfSusStep', 'gf', getProperty('gf.y') - 100, 0.4, 'circOut')
		doTweenAngle('bfSusSwing', 'boyfriend', 0, 0.4, 'circIn')
		doTweenAngle('gfSusSwing', 'gf', 0, 0.4, 'circIn')
	end
	--beatflag stuff
    if curBeat > 75 and beatFlag < 1 then
		beatFlag = 1
		
		setProperty('gf.visible', true)
        setSpriteShader('boyfriend', 'glitch')
		setSpriteShader('iconP1', 'glitch')
        --setSpriteShader('mt', 'rareblin')
        removeLuaSprite('p1bg', false)
		addLuaSprite('p2bg', false)
        runHaxeCode('for (strum in game.playerStrums) strum.shader = game.boyfriend.shader;')
        runHaxeCode('for (poop in game.unspawnNotes) if (poop.mustPress) poop.shader = game.boyfriend.shader;')
    end
	
	if curBeat > 138 and beatFlag < 2 then
		beatFlag = 2
		
		setProperty('iconP2.visible', true)
		setProperty("p2bg.visible", false)
		setProperty('defaultCamZoom',0.4);
		setProperty('boyfriend.x', getProperty('boyfriend.x') - 800)
		setProperty('gf.x', getProperty('gf.x') + 500)
		setProperty('gf.y', getProperty('gf.y') + 950)
		addLuaSprite('p3bg', false)
		addLuaSprite('p3table', false)
		setObjectOrder('p3table', 1000)
		addLuaSprite('p3multiply', true)
		addLuaSprite('p3add', true)
		runHaxeCode('game.boyfriend.shader = null;')
		runHaxeCode('game.iconP1.shader = game.boyfriend.shader;')
		runHaxeCode('for (strum in game.playerStrums) strum.shader = game.boyfriend.shader;')
        runHaxeCode('for (poop in game.unspawnNotes) if (poop.mustPress) poop.shader = game.boyfriend.shader;')
    end
	if curBeat > 144 and beatFlag < 3 then
		beatFlag = 3
		doTweenY('heyManWhatsUp', 'gf', getProperty('gf.y') - 800, 1, 'circOut')
	end
	if curBeat > 156 and beatFlag < 4 then
		beatFlag = 4
		doTweenX('youKindaSus', 'gf', getProperty('gf.x') - 150, 0.5, 'circOut')
		doTweenX('nuhUh', 'boyfriend', getProperty('boyfriend.x') + 150, 0.5, 'circOut')
		doTweenZoom('camera', 'camGame', 0.9, 0.5, 'circOut')
	end
	if curBeat > 158 and beatFlag < 5 then
		beatFlag = 5
		doTweenX('youKindaNotSus', 'gf', getProperty('gf.x') + 150, 0.5, 'circOut')
		doTweenX('yuhHuh', 'boyfriend', getProperty('boyfriend.x') - 150, 0.5, 'circOut')
		doTweenZoom('camera', 'camGame', 0.7, 0.5, 'circOut')
	end
	if curBeat > 172 and beatFlag < 6 then
		beatFlag = 6
		doTweenX('youKindaSus', 'gf', getProperty('gf.x') - 250, 0.5, 'circOut')
		doTweenZoom('camera', 'camGame', 0.9, 0.5, 'circOut')
	end
	if curBeat > 175 and beatFlag < 7 then
		beatFlag = 7
		doTweenX('youKindaSus', 'gf', getProperty('gf.x') + 250, 0.5, 'circOut')
		doTweenZoom('camera', 'camGame', 0.7, 0.5, 'circOut')
	end

    if curBeat > 199 and beatFlag < 8 then
		beatFlag = 8
		
		doTweenZoom('camera', 'camGame', 1.2, 0.5, 'circOut')
		setProperty('iconP2.visible', false)
        setProperty("p2bg.visible", true)
		setProperty('defaultCamZoom', 0.7);
		removeLuaSprite('p3bg')
		removeLuaSprite('p3table')
		removeLuaSprite('p3multiply')
		removeLuaSprite('p3add')
		setSpriteShader('boyfriend', 'glitch')
		runHaxeCode('game.iconP1.shader = game.boyfriend.shader;')
		runHaxeCode('for (strum in game.playerStrums) strum.shader = game.boyfriend.shader;')
        runHaxeCode('for (poop in game.unspawnNotes) if (poop.mustPress) poop.shader = game.boyfriend.shader;')
    end
	
	if curBeat > 203 and beatFlag < 9 then
		beatFlag = 9
		
		doTweenZoom('camera', 'camGame', 0.7, 0.5, 'circOut')
	end
	
	if curBeat > 235 and beatFlag < 10 then
		beatFlag = 10
		
		removeLuaSprite('p2bg')
		addLuaSprite('p4bg', false)
		addLuaSprite('purp', false)
		addLuaSprite('p4topoftable', false)
		addLuaSprite('p4add', true)
		doTweenZoom('camera', 'camGame', 0.5, 0.5, 'circOut')
		
		setObjectOrder('boyfriend', 5)
		setObjectOrder('purp', 6)
		setObjectOrder('greencrew', 7)
		setObjectOrder('pinkcrew', 8)
		setObjectOrder('bluecrew', 9)
		setObjectOrder('redcrew', 11)
		setObjectOrder('blackcrew', 12)
		setObjectOrder('p4topoftable', 10)
		
		setProperty('gf.visible', false)
		setProperty('greencrew'..'.visible', true)
		setProperty('pinkcrew'..'.visible', true)
		setProperty('bluecrew'..'.visible', true)
		setProperty('redcrew'..'.visible', true)
		setProperty('blackcrew'..'.visible', true)
		
		runHaxeCode('game.boyfriend.shader = null;')
		runHaxeCode('game.iconP1.shader = game.boyfriend.shader;')
		runHaxeCode('for (strum in game.playerStrums) strum.shader = game.boyfriend.shader;')
        runHaxeCode('for (poop in game.unspawnNotes) if (poop.mustPress) poop.shader = game.boyfriend.shader;')
	end
	if curBeat > 298 and beatFlag < 11 then
		beatFlag = 11
		doTweenZoom('camera', 'camGame', 1.2, 0.5, 'circIn')
	end
	if curBeat > 299 and beatFlag < 12 then
		beatFlag = 12
		
		doTweenZoom('camera', 'camGame', 0.7, 1, 'circOut')
        addLuaSprite('stars')
		addLuaSprite('stars2')
		setSpriteShader('stars', 'damnThatsCrazy')
		setSpriteShader('stars2', 'damnThatsCrazy')
		setProperty('gf.visible', true)
		removeLuaSprite('p4bg')
		removeLuaSprite('p4topoftable')
		removeLuaSprite('p4add')
		removeLuaSprite('purp')
		removeLuaSprite('greencrew')
		removeLuaSprite('pinkcrew')
		removeLuaSprite('bluecrew')
		removeLuaSprite('redcrew')
		removeLuaSprite('blackcrew')
		setSpriteShader('boyfriend', 'glitch')
		runHaxeCode('game.iconP1.shader = game.boyfriend.shader;')
		runHaxeCode('for (strum in game.playerStrums) strum.shader = game.boyfriend.shader;')
        runHaxeCode('for (poop in game.unspawnNotes) if (poop.mustPress) poop.shader = game.boyfriend.shader;')
		doTweenX('ermAwkward', 'stars', getProperty('stars.x') - 1500, 35, 'linear')
		doTweenX('ummAwkward', 'stars2', getProperty('stars2.x') - 1500, 35, 'linear')
    end
	if curBeat > 299 then
		if getRandomInt(0, 10) == 1 and bitch == false then
			bitch = true
			ghostFlippyFlop = 0
			makeAnimatedLuaSprite('ghosthaha', 'stages/theSkeld/ghosthaha', getProperty('boyfriend.x') + 1250, getProperty('boyfriend.y')+getRandomInt(-200, 200))
			addAnimationByPrefix('ghosthaha', 'haha', 'laugh0')
			addAnimationByPrefix('ghosthaha', 'hahe', 'turn')
			addAnimationByPrefix('ghosthaha', 'hehe', 'laughingturned')
			addLuaSprite('ghosthaha')
			doTweenX('hahahaha', 'ghosthaha', getProperty('ghosthaha.x') - 2500, 5, 'linear')
		end
		if curBeat/4 % 1 == 0 then
			if weCallThisOneTheSusStep then
				weCallThisOneTheSusStep = false
				doTweenAngle('bfSusSwing', 'boyfriend', 10, 3, 'quartInOut')
			else
				weCallThisOneTheSusStep = true
				doTweenAngle('bfSusSwing', 'boyfriend', -10, 3, 'quartInOut')
			end
		end
	end
end

function onStepHit()

	if curStep == 1120 or curStep == 1123 or curStep == 1126 then
		sus = sus + 1
		makeLuaSprite('cyantroll','stages/theSkeld/still'..sus,-240,0)
		scaleObject('cyantroll', 0.9, 0.9)
		addLuaSprite('cyantroll',true);
		setScrollFactor('cyantroll',0,0);
		setObjectOrder('cyantroll', 0)
		setObjectCamera('cyantroll','hud');
	end
	
	if curStep > 1135 and stepFlag < 1 then
		stepFlag = 1
		
		removeLuaSprite('cyantroll')
	end
	
	if curStep > 1199 and curStep/3 % 1 == 0 then
		if getProperty('ghosthaha.x') > getProperty('boyfriend.x') then
			objectPlayAnimation('ghosthaha', 'haha', true);
		else
			if ghostFlippyFlop == 2 then
				objectPlayAnimation('ghosthaha', 'hehe', true);
			else
				if ghostFlippyFlop == 0 then
					objectPlayAnimation('ghosthaha', 'hahe', true);
				end
				ghostFlippyFlop = ghostFlippyFlop + 1
			end
		end
	end
end

function onTweenCompleted(t)
	if t == 'hahahaha' then
		bitch = false
	end
end

function onUpdate(elapsed)
    setShaderFloat('boyfriend', 'iTime', os.clock())
    setShaderFloat('iconP1', 'iTime', os.clock())
    setShaderFloat('p2bg', 'iTime', os.clock())
	if iHateDebugging then
		addHaxeLibrary('StrumNote')
		addHaxeLibrary('ClientPrefs')
		runHaxeCode([[
			for(i in 0...game.strumLineNotes.members.length){
				game.strumLineNotes.members[i].y = ClientPrefs.downScroll ? 960 - 150 : 50;
			}
		]])
		iHateDebugging = false
	end
end