local window

function onCreatePost()
    window = {getPropertyFromClass('openfl.Lib', 'application.window.x'), getPropertyFromClass('openfl.Lib', 'application.window.y')}

    makeLuaSprite('weird', '', window[1], window[2])
    setProperty('weird.visible', false)

    addLuaSprite('weird')

    updateVelocity(1, 'x') updateVelocity(1, 'y')

    makeLuaSprite('back', 'stages/idiot/moron')
    addLuaSprite('back')

    runHaxeCode([[
        shader0 = game.createRuntimeShader('invert');

        game.camGame.setFilters([new ShaderFilter(shader0)]);

        shader0.setBool("shart", true);

        idiot = new Character(-88, 310, 'moron');
        idiot.scrollFactor.set(0.95, 0.95);
        
        game.addBehindDad(idiot);
    ]])

    triggerEvent('Camera Follow Pos', getMidpointX('back'), getMidpointY('back') + 100)

    setPropertyFromClass('openfl.Lib', 'application.window.borderless', true)

    addHaxeLibrary('Application', 'lime.app')
end

function onDestroy() setPropertyFromClass('openfl.Lib', 'application.window.borderless', false) runHaxeCode('Application.current.window.move(' .. window[1] .. ', ' .. window[2] .. ');') end

local tard = 3

function onUpdatePost(elapsed)
    for axis, thing in pairs({['x'] = 'Width', ['y'] = 'Height'}) do
        local shit = getPropertyFromClass('openfl.Lib', 'application.window.' .. axis)

        if shit <= 0 then updateVelocity(tard, axis) elseif shit > (getPropertyFromClass('openfl.Lib', 'application.window.display.bounds.' .. thing:lower()) - _G['screen' .. thing]) then updateVelocity(-tard, axis) end
    end

    runHaxeCode('var point = game.getLuaObject("weird"); Application.current.window.move(point.x, point.y);')
end

function updateVelocity(mult, axis) --lazy
    setProperty('weird.velocity.' .. axis, getRandomInt(5, 10) * 10 * mult)
end

function onBeatHit()
    if curBeat == 539 then
        runHaxeCode('game.openPauseMenu(); Application.current.window.alert("YOU ARE AN IDIOT!", "HA HA!"); shader0.setBool("shart", false); game.camGame.visible = true;')
    end
    
    if flashingLights and curBeat > 159 and curBeat < 224 then runHaxeCode('shader0.setBool("shart", !shader0.getBool("shart"));') end
end

function opponentNoteHit(id, direction, noteType, isSustainNote) if noteType == 'Alt Animation' then runHaxeCode('game.gf.playAnim(\'singUP-alt\', true); game.gf.holdTimer = 0; idiot.playAnim(\'singUP-alt\', true); idiot.holdTimer = 0;') end end