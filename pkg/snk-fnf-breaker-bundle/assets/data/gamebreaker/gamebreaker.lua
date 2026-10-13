local dxEpicTrollMoment = 0
local beatFlag = 0
local stepFlag = 0

function onCountdownStarted()
    runHaxeCode([[
        game.dadGroup.scrollFactor.set(1, 1);
        game.boyfriendGroup.scrollFactor.set(1, 1);
    ]])
	        -- for (strum in game.opponentStrums)
        -- {
            -- strum.camera = game.camGame;
            -- strum.scrollFactor.set(0, 0);
            -- strum.alpha = 1;
        -- }

        -- for (note in game.unspawnNotes)
        -- {
            -- if (!note.mustPress) {
                -- note.camera = game.camGame;
                -- note.scrollFactor.set(0, 0);
                -- note.x = 30;
            -- }
        -- }
end

function onCreatePost()
    initLuaShader('glitch')
	initLuaShader('rareblin')
    initLuaShader('bgGlitch')
	precacheImage('stages/ruins/dxcomicP1')
	precacheImage('stages/ruins/dxcomicP2')
	precacheImage('stages/ruins/dxcomicP3')
	precacheSound('dxfuckingdies')
	precacheSound('boxbreaker')
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
    if curBeat > 75 and beatFlag < 1 then
		beatFlag = 1
		
        setSpriteShader('dad', 'glitch')
		setSpriteShader('iconP2', 'glitch')
        setSpriteShader('mt', 'rareblin')
        setBlendMode('add', 'subtract')
        scaleObject('add', 8, 1)
        removeLuaSprite('light', true)
        runHaxeCode('for (strum in game.opponentStrums) strum.shader = game.dad.shader;')
        runHaxeCode('for (poop in game.unspawnNotes) if (!poop.mustPress) poop.shader = game.dad.shader;')
        --cameraFlash('camGame', 'ffffff', 2, false)
    end
	
	if curBeat > 203 and beatFlag < 2 then
		beatFlag = 2
		
        setProperty('blue.alpha', 1)
        setSpriteShader('dad', 'glitch')
        runHaxeCode('for (strum in game.opponentStrums) strum.shader = game.dad.shader;')
        runHaxeCode('for (poop in game.unspawnNotes) if (!poop.mustPress) poop.shader = game.dad.shader;')
        --cameraFlash('camGame', '0000ff', 2, false)
    end

    if curBeat > 267 and beatFlag < 3 then
		beatFlag = 3
		
        doTweenY("mty", "mt", -250, 0.7, "quartOut")
    end

    if curBeat > 268 and beatFlag < 4 then
		beatFlag = 4
		
        doTweenAngle("mtangle", "mt", getRandomInt(-20, 20), 1.5, "quadInOut")
        doTweenY("mty", "mt", 20000, 7, "circInOut")
        setSpriteShader('sky', 'bgGlitch')
    end

    if curBeat > 330 and beatFlag < 5 then
		beatFlag = 5
		
        doTweenX("camTween", "camFollow", 300, 0.5, "circOut")
    end

    if curBeat > 331 and beatFlag < 6 then
		beatFlag = 6
	
        setProperty("floor.visible", false)
		setProperty("floor1.visible", false)
        setProperty("sky.visible", false)
        setProperty("mt.visible", false)
        setProperty("trees.visible", false)
        setProperty("light.visible", false)
        setProperty("add.visible", false)
        removeLuaSprite("blue", true)
        setProperty("dadGroup.y", 10000)
        setProperty("cameraY", 10000)
    end

    if curBeat > 337 and beatFlag < 7 then
		beatFlag = 7
		
        setSpriteShader('dad', 'glitch')
        runHaxeCode('for (strum in game.opponentStrums) strum.shader = game.dad.shader;')
        runHaxeCode('for (poop in game.unspawnNotes) if (!poop.mustPress) poop.shader = game.dad.shader;')
        setProperty("boyfriendGroup.visible", true)
        doTweenY("w", "camFollow", 9870, 8.5, "circOut")
        doTweenY("bftween", "boyfriendGroup", 10000, 9.0, "circOut")
        setProperty("dad.alpha", 0)
    end

    if curBeat > 343 and beatFlag < 8 then
		beatFlag = 8
		
        doTweenAlpha("daddy", "dad", 1, 16.0, "circOut")
		doTweenY("guntween", "gun", 11000, 13.0, "circOut")
		doTweenAngle("gunspeen", "gun", 720, 20.0, "circOut") --SPEEN
		doTweenY("knuxtween", "knux", 12000, 90.0, "circOut")
    end

    if curBeat > 398 and beatFlag < 9 then
		beatFlag = 9
		
        doTweenY("camer", "camFollow", 0, 0.5, "circInOut")
    end

    if curBeat > 399 and beatFlag < 10 then
		beatFlag = 10
		
        setSpriteShader('dad', 'glitch')
        runHaxeCode('for (strum in game.opponentStrums) strum.shader = game.dad.shader;')
        runHaxeCode('for (poop in game.unspawnNotes) if (!poop.mustPress) poop.shader = game.dad.shader;')
        setProperty("dadGroup.y", 0)
        setProperty("boyfriendGroup.y", 0)
        setProperty("sky1.visible", true)
        setProperty("sun.visible", true)
        setProperty("ground.visible", true)
        setProperty("cod.visible", true)
        setProperty("overlay.visible", true)
		setProperty("gradent.visible", true)
    end
	
	if curBeat > 529 and beatFlag < 11 then
		beatFlag = 11
		
		setSpriteShader('dad', 'glitch')
        runHaxeCode('for (strum in game.opponentStrums) strum.shader = game.dad.shader;')
        runHaxeCode('for (poop in game.unspawnNotes) if (!poop.mustPress) poop.shader = game.dad.shader;')
		setSpriteShader('floor1', 'glitch')
		setSpriteShader('trees', 'rareblin')
		--cameraFlash('camGame', 'ff0000', 2, false)
		removeLuaSprite("sky1", true)
		removeLuaSprite("sun", true)
		removeLuaSprite("ground", true)
		removeLuaSprite("cod", true)
		removeLuaSprite("overlay", true)
		removeLuaSprite("gradent", true)
		
		setProperty("floor1.visible", true)
        setProperty("sky.visible", true)
        setProperty("trees.visible", true)
        setProperty("add.visible", true)
		setProperty('pink.alpha', 1)
		
		setScrollFactor('floor1',1,1); 
		setScrollFactor('sky',0.9,0.9);	
		setScrollFactor('trees',0.9,0.9); 
		setScrollFactor('add',0,0);
	end

end

function onStepHit()

	if curStep > 283 and stepFlag < 1 then
		stepFlag = 1
		
		playSound('dxfuckingdies', 1)
	end
	
	if curStep > 295 and stepFlag < 2 and beatFlag < 6 then
		stepFlag = 2
		
		playSound('boxbreaker', 0.6)
		removeLuaSprite('floor')
		addLuaSprite('floor1',false);
		setObjectOrder('floor1', getObjectOrder('trees')+1)
		setObjectOrder('strumLineNotes', getObjectOrder('floor1'))
		setObjectOrder('notes', getObjectOrder('floor1'))
	end
	
	if curStep > 1326 and stepFlag < 3 and beatFlag < 6 then
		stepFlag = 3
		
        setProperty("boyfriendGroup.visible", false)
    end  
	
	if curStep == 2032 or curStep == 2035 or curStep == 2038 then
		dxEpicTrollMoment = dxEpicTrollMoment + 1
		makeLuaSprite('dxtroll','stages/ruins/dxcomicP'..dxEpicTrollMoment,-100,0)
		scaleObject('dxtroll', 1.2, 1.2)
		addLuaSprite('dxtroll',true);
		setScrollFactor('dxtroll',0,0);
		setObjectOrder('dxtroll', 0)
		setObjectCamera('dxtroll','hud');
	end
	
	if curStep == 2042 then
		makeLuaSprite('blackout', '', 0, 0);
		makeGraphic('blackout',1280,720,v2)
		addLuaSprite('blackout', true);
		setLuaSpriteScrollFactor('blackout',0,0)
		setProperty('blackout.scale.x',2)
		setProperty('blackout.scale.y',2)
		setProperty('blackout.alpha',0)
		setObjectOrder('blackout', getObjectOrder('picomic')+1)
		setObjectCamera('blackout',1);
		doTweenAlpha('flTw','blackout',1,0.5,'linear')
	end
	
	if curStep > 2047 and stepFlag < 4 then
		stepFlag = 4
		
		removeLuaSprite('dxtroll')
		removeLuaSprite('blackout')
	end
	
end

function onUpdate(elapsed)
    setShaderFloat('dad', 'iTime', os.clock())
    setShaderFloat('sky', 'iTime', os.clock())
    setShaderFloat('mt', 'iTime', os.clock())
	setShaderFloat('trees', 'iTime', os.clock())
	
	--icon change in last phase
	if beatFlag == 11 and getProperty('dad.animation.curAnim.name') == 'idle' then
		loadGraphic('iconP2','icons/icon-dx2',150)
        addAnimation('iconP2', 'idle', {0,1}, 0, true)
        playAnim('iconP2','idle',true)
	end
end

function opponentNoteHit(id,dir,note,sus)
	--icon change in last phase
	if beatFlag == 11 then
		dirI = dir+1
		if dir == 2 then dirI = 4 elseif dir == 3 then dirI = 3 end
		loadGraphic('iconP2','icons/icon-dx'..dirI,150)
        addAnimation('iconP2', 'idle', {0,1}, 0, true)
        playAnim('iconP2','idle',true)
	end
end