function onCreate()
    precacheImage('ui/coras')
    precacheImage('ui/coras_bg')
    precacheImage('ui/icon_bf')
end

function onUpdate()
    if getProperty('health') > 1.0 then
        setProperty('health', 1.0)
    end
end

function onCreatePost()
	runTimer('inicializarHUD', 1)
end

function onTimerCompleted(tag)
    if tag == 'inicializarHUD' then
		setProperty('healthBar.visible', false)
		setProperty('healthBarBG.visible', true) 
		setProperty('iconP1.visible', false)
		setProperty('iconP2.visible', false)
		setProperty('timeBar.visible', false)
		setProperty('timeBarBG.visible', false)
		setProperty('scoreTxt.visible', false)

        -- TimeBar

        setProperty('timeTxt.visible', true)
        setProperty('timeTxt.x', (screenWidth / 2) - (getProperty('timeTxt.width') / 2) + 18)
        setProperty('timeTxt.y', 22)

        makeLuaSprite('timerIcon', 'ui/timer', (screenWidth / 2) - 65, 10)
        setObjectCamera('timerIcon', 'hud')
        addLuaSprite('timerIcon', true)
        setProperty('timerIcon.scale.x', 0.8)
        setProperty('timerIcon.scale.y', 0.8)

        --

		makeLuaSprite('bordeRojo', 'vida', 0, 0)
		setObjectCamera('bordeRojo', 'hud')
		setProperty('bordeRojo.alpha', 0)
		addLuaSprite('bordeRojo', true)
		setGraphicSize('bordeRojo', screenWidth, screenHeight)

		-- HealthBar

		makeLuaSprite('vidaFondo', 'ui/vida_fondo', 100, 575)
		setObjectCamera('vidaFondo', 'hud')
		addLuaSprite('vidaFondo', true)

		makeLuaSprite('marcoBF', 'ui/marco_bf', 42, 560)
		setObjectCamera('marcoBF', 'hud')
		addLuaSprite('marcoBF', true)

		makeLuaSprite('hpEmpty', 'ui/coras_bg', 175, 617)
		setObjectCamera('hpEmpty', 'hud')
		addLuaSprite('hpEmpty')

		makeLuaSprite('hpFill', 'ui/coras', 175, 617)
		setObjectCamera('hpFill', 'hud')
		addLuaSprite('hpFill')

        makeLuaSprite('iconP1Alt', 'ui/icon_bf', 25, 540)
		setObjectCamera('iconP1Alt', 'camHUD')
		addLuaSprite('iconP1Alt', true)

		setProperty('iconP1.scale.x', 0.8)
		setProperty('iconP1.scale.y', 0.8)

		setObjectOrder('vidaFondo', 1)
		setObjectOrder('hpEmpty', 2)
		setObjectOrder('hpFill', 3)
		setObjectOrder('marcoBF', 4)
		setObjectOrder('iconP1Alt', 5)
    end
end

function onUpdatePost()
    local vida = getProperty('health')
    if vida < 0.6 then
        local alpha = (0.6 - vida) / 0.6
        setProperty('bordeRojo.alpha', alpha)
    else
        setProperty('bordeRojo.alpha', 0)
    end
    
    local rawHealth = getProperty('health') / 2  -- salud normal (0 a 1)
    local health = math.min(rawHealth, 0.5)      -- tope máximo en 0.5
    runHaxeCode([[
        import flixel.math.FlxRect;
        var bar = game.getLuaObject("hpFill");
        if (bar != null) {
            var w = bar.width;
            var h = bar.height;
            bar.clipRect = new FlxRect(0, 0, w * ]] .. health * 2 .. [[, h);
        }
    ]])

    setProperty('iconP1Alt.scale.x', getProperty('iconP1.scale.x'))
    setProperty('iconP1Alt.scale.y', getProperty('iconP1.scale.y'))
end

local lastHealth = 1
local justMissed = false

function onUpdate(elapsed)
    local currentHealth = getProperty('health')

    if not justMissed then
        if currentHealth < lastHealth then
            setProperty('health', lastHealth)
        else
            lastHealth = currentHealth
        end
    else
        lastHealth = currentHealth
        justMissed = false
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
    setProperty('health', getProperty('health') - 0.023)
end

function noteMiss(id, direction, noteType, isSustainNote)
    justMissed = true
end