local beatFlag = 0

function onCountdownStarted()
    runHaxeCode([[
        game.dadGroup.scrollFactor.set(1, 1);
        game.boyfriendGroup.scrollFactor.set(1, 1);
    ]])
end

function onCreatePost()
    initLuaShader('glitch')
	initLuaShader('rareblin')
	beatFlag = 0
	
	runHaxeCode('for (strum in game.opponentStrums) strum.shader = null;')
	runHaxeCode('for (strum in game.playerStrums) strum.shader = null;')
	runHaxeCode('for (note in game.unspawnNotes) note.shader = null;')
	runHaxeCode('for (note in game.notes.members) note.shader = null;')
end

function onBeatHit()
    if curBeat > 51 and beatFlag < 1 then
		beatFlag = 1
		
        setSpriteShader('boyfriend', 'glitch')
		setSpriteShader('iconP1', 'glitch')
        --setSpriteShader('farlands', 'rareblin')
        setBlendMode('grad', 'subtract')
        --scaleObject('grad', 8, 1)
		setSpriteShader('mcNoteUnderlay', 'glitch')
        runHaxeCode('for (strum in game.playerStrums) strum.shader = game.boyfriend.shader;')
        runHaxeCode('for (poop in game.unspawnNotes) if (poop.mustPress) poop.shader = game.boyfriend.shader;')
    end
	
	if curBeat > 179 and beatFlag < 2 then
		beatFlag = 2
		
        setProperty('green.alpha', 0.8)
        setSpriteShader('boyfriend', 'glitch')
        runHaxeCode('for (strum in game.playerStrums) strum.shader = game.boyfriend.shader;')
        runHaxeCode('for (poop in game.unspawnNotes) if (poop.mustPress) poop.shader = game.boyfriend.shader;')
    end

end

function onUpdate(elapsed)
    setShaderFloat('boyfriend', 'iTime', os.clock())
    setShaderFloat('farlands', 'iTime', os.clock())

    -- if curBeat > 337 and curBeat < 364 then
    --     setProperty("camFollowPos.y", 'boyfriendGroup.y')
    -- end


    --     runHaxeCode([[
    --     for (strum in game.opponentStrums)
    --     {
    --         strum.x += 0.05;
    --     }

    --     for (note in game.unspawnNotes)
    --     {
    --         if (!note.mustPress) {
    --             note.x += 0.05;
    --         }
    --     }
    -- ]])
end