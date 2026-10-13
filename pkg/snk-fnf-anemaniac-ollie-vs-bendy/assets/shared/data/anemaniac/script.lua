local healthBarY = nil
local iconP1Y = nil
local iconP2Y = nil
local scoreTxtY = nil
function onCreate()
    makeLuaSprite('overlay1', 'overlay1', 0, 0)
    --makeLuaSprite('overlay2', 'overlay2', 0, 0)

    setObjectCamera('overlay1', 'other')
    --setObjectCamera('overlay2', 'other')

    scaleObject('overlay1', 0.33, 0.235)
    --scaleObject('overlay2', 0.33, 0.2)

    setProperty('overlay1.alpha', 0.6)
    --setProperty('overlay2.alpha', 0.5)

    addLuaSprite('overlay1')
    --addLuaSprite('overlay2')

    if not lowQuality then
    makeLuaSprite('spotlight', 'spotlightNEW', 325, -300)
    setProperty('spotlight.alpha', 0)
    scaleObject('spotlight', 1, 1.5)
    setBlendMode('spotlight', 'add')
    setProperty('spotlight.angle', -20)
    addLuaSprite('spotlight', true)
    end

    -- above
    
    makeLuaSprite('ending', '', -1000, -1000)
    makeGraphic('ending', 5012, 5012, '000000')
    setObjectCamera('ending', 'camera')
    setScrollFactor('ending', 0, 0)
    setProperty('ending.alpha', 0)
    addLuaSprite('ending', true)

    makeLuaSprite('END', 'END')
    setObjectCamera('END', 'other')
    setProperty('END.color', getColorFromHex('505050'))
    scaleObject('END', 0.7, 0.7)
    screenCenter('END', 'xy')
    setProperty('END.alpha', 0)
    addLuaSprite('END')

    makeAnimatedLuaSprite('countdown', 'countdown', 0, 0)
    addAnimationByPrefix('countdown', 'idle', 'idle', 43, false)
    scaleObject('countdown', 1.65, 1.65)
    setObjectCamera('countdown', 'other')
    addLuaSprite('countdown')

    makeLuaSprite('behind', 'behind', -1000, -1000)
    makeGraphic('behind', 256, 256, '000000')
    scaleObject('behind', 100, 100, true)
    addLuaSprite('behind', true)

    setProperty('introSoundsSuffix', '-empty');
    emptyCountdown(true)
    initLuaShader("bloom")
end

function onCountdownStarted()
    objectPlayAnimation('countdown', 'idle')
end

function onCountdownTick(swagCounter)
    if swagCounter == 3 then
        setProperty('countdown.color', 0)
    end
end

function onSongStart()
    doTweenAlpha('behind', 'behind', 0, 3, 'linear')
    doTweenAlpha('countdown', 'countdown', 0, 1, 'linear')
    setProperty('camHUD.zoom', 3)
    doTweenZoom('camHUD', 'camHUD', 0.9, 3, 'smootherStepOut')
    setProperty('defaultCamZoom', 0.5)
    doTweenZoom('camera', 'camera', 0.5, 3, 'smootherStepOut')
    runTimer('hudZoom', 3, 1)
    setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Psych Engine")

    if not lowQuality then
    setProperty('healthBar.y', getProperty('healthBar.y') - Yvalue)
    setProperty('iconP1.y', getProperty('iconP1.y') - Yvalue)
    setProperty('iconP2.y', getProperty('iconP2.y') - Yvalue)
    setProperty('scoreTxt.y', getProperty('scoreTxt.y') - Yvalue)
    end
end

function onTweenCompleted()
    if tag == 'camHUD' then
        zoome = true;
    end
    if tag == 'camera' then
        setProperty('defaultCamZoom', 0.5)
    end
end

function onCreatePost()
    if not lowQuality then
    --doTweenColor('dad', 'dad', '808080', 2, 'linear')
    --doTweenColor('boy', 'boyfriend', '808080', 2, 'linear')
    end
    doTweenColor('background', 'background', '000000', 2, 'linear')
	setProperty('gf.alpha', 0)
    
    if not middlescroll then
    for i = 0, getProperty('opponentStrums.length') - 1 do
        setPropertyFromGroup('opponentStrums', i, 'x', getPropertyFromGroup('opponentStrums', i, 'x') - 100)
    end
    for i = 0, getProperty('playerStrums.length') - 1 do
        setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup('playerStrums', i, 'x') + 100)
    end
    end

    if not lowQuality then
    callScript("scripts/ExtraChars", "createCharacter", {'extra','pico',0,0,true,false})
    callScript("scripts/ExtraChars", "setNotes", {'extra','',{true,true,'',''}})
    callScript("scripts/ExtraChars", "setNotes",{'extra',''})

    callOnLuas("createCharacter",{'extra',dadName,-130,230,false,false})
    callOnLuas("createCharacter",{'extra2',boyfriendName,1010,230,true,false})    
    callOnLuas("setNotes",{'extra','',nil})
    callOnLuas("setNotes",{'extra2','',nil})

    setProperty('extra2.flipX', false)
    setProperty('extra2.flipY', false)
    setProperty('extra2.scale.x', 0.7)
    setProperty('extra2.scale.y', 1)
    setProperty('extra2.angle', -30)
    setProperty('extra2.color', 0)
    setProperty('extra2.alpha', 0)

    setProperty('extra.angle', 30)
    setProperty('extra.color', 0)
    setProperty('extra.flipY', false)
    setProperty('extra.scale.x', 0.7)
    setProperty('extra.scale.y', 1)
    setProperty('extra.alpha', 0)

    setBlendMode('extra', 'multiply')
    setBlendMode('extra2', 'multiply')

    healthBarY = getProperty('healthBar.y')
    iconP1Y = getProperty('iconP1.y')
    iconP2Y = getProperty('iconP2.y')
    scoreTxtY = getProperty('scoreTxt.y')
    if not downscroll then
        scroll = -150
    else
        scroll = 800
    end

    if downscroll then
        Yvalue = 200
    else
        Yvalue = -600
    end
    end
    if shadersEnabled then
        setSpriteShader('boyfriend', 'bloom')
        setSpriteShader('dad', 'bloom')
    end
end

local tick = false;
local wait1 = false;
local wait2 = false;

local wait3 = false;
local wait4 = false;
function onUpdate()
if not lowQuality or curStep > 221 and curStep < 1179 then
    -- left shadow
    if not tick and not wait1 then --fade in
        runTimer('wait', 1.5, 1)
        wait1 = true;
        wait2 = false;
    elseif tick and not wait2 then
        runTimer('wait2', 0.75, 1)
        wait1 = false;
        wait2 = true;
    end 
    -- right shadow
    if tick and not wait3 then --fade in
        runTimer('wait3', 1.6, 1)
        wait3 = true;
        wait4 = false;
    elseif not tick and not wait4 then
        runTimer('wait4', 0.75, 1)
        wait3 = false;
        wait4 = true;
    end
  end
end

function onEvent(n)
    if n == 'Change Character' then
        setProperty('dad.color', getColorFromHex('808080'))
        setProperty('boyfriend.color', getColorFromHex('808080'))
    end
end

function onStepHit()
    if curStep < 220 then
        setProperty('extra.alpha', 0)
        setProperty('extra2.alpha', 0)
    end
    if curStep == 196 then
        cameraSetTarget('dad')
        doTweenZoom('uhoh', 'camera', 0.6, 0.8, 'smootherStepInOut')
    end
    if curStep == 220 then
        setProperty('spotlight.alpha', 0.5)
        doTweenColor('background', 'background', '808080', 0.001, 'linear')
        cameraShake('camera', 0.01, 0.5)
        playSound('Lights_Turn_On', 0.5)
        setHealth(1)
        
        setProperty('dad.color', getColorFromHex('808080'))
        setProperty('boyfriend.color', getColorFromHex('808080'))
        
        if not lowQuality then
            doTweenY('healthReturn', 'healthBar', healthBarY, 3, 'backOut')
            doTweenY('scoreReturn', 'scoreTxt', scoreTxtY, 3, 'backOut')
            doTweenY('icon1Return', 'iconP1', iconP1Y, 3, 'backOut')
            doTweenY('icon2Return', 'iconP2', iconP2Y, 3, 'backOut')
        end
        
        if shadersEnabled then
            removeSpriteShader("boyfriend")
            removeSpriteShader("dad")
        end
    end
    if curStep == 1180 or curStep == 1181 then
        tick = 3
        wait1 = 3
        wait2 = 3
        wait3 = 3
        wait4 = 3 -- prevents them from activating update

        cancelTween('extraAlpha')
        cancelTween('extraAlpha2')
        
        doTweenAlpha('shortage', 'ending', 1, 3, 'linear')
        runTimer('blackout', 3)

        if not lowQuality then
            doTweenY('healthReturn', 'healthBar', -healthBarY, 3, 'backIn')
            doTweenY('scoreReturn', 'scoreTxt', -scoreTxtY, 3, 'backIn')
            if downscroll then
                doTweenY('icon1Return', 'iconP1', -195.8, 3, 'backIn')
                doTweenY('icon2Return', 'iconP2', -195.8, 3, 'backIn')
            else
                doTweenY('icon1Return', 'iconP1', 1165.8, 3, 'backIn')
                doTweenY('icon2Return', 'iconP2', 1165.8, 3, 'backIn')
            end
        end
    end
    if curStep == 1312 then
        doTweenAlpha('endingFade', 'ending', 1, 22.5, 'smootherStepInOut')
        doTweenZoom('cameraEnding', 'camera', 1, 17, 'smootherStepInOut')
    end
    if curStep == 1410 then
        zoome = false
        doTweenAlpha('endingHUD', 'camHUD', 0, 1, 'smootherStepOut')
    end
end

local zoome = false;
function onTimerCompleted(tag)
    if tag == 'wait' then
        doTweenAlpha('extraAlpha', 'extra', 0.35, 0.8, 'circIn')
    end
    if tag == 'wait2' then
        doTweenAlpha('extraAlpha', 'extra', 0, 0.8, 'circOut')
    end
    if tag == 'wait3' then
        doTweenAlpha('extraAlpha2', 'extra2', 0.35, 0.8, 'circIn')
    end
    if tag == 'wait4' then
        doTweenAlpha('extraAlpha2', 'extra2', 0, 0.8, 'circOut')
    end
    if tag == 'hudZoom' then
        zoome = true;
    end
    if tag == 'blackout' then
        doTweenAlpha('shortage', 'ending', 0, 3, 'linear')
        setProperty('background.color', getColorFromHex('000000'))
        setProperty('dad.color', getColorFromHex('FFFFFF'))
        setProperty('boyfriend.color', getColorFromHex('FFFFFF'))
        doTweenAlpha('ending1', 'extra', 0, 0.2, 'linear')
        doTweenAlpha('ending2', 'extra2', 0, 0.2, 'linear')
        doTweenAlpha('ending3', 'spotlight', 0, 0.3, 'linear')
        if shadersEnabled then
            setSpriteShader('boyfriend', 'bloom')
            setSpriteShader('dad', 'bloom')
        end
    end
    if tag == 'end' then
        playSound('ollie', 1)
        setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', true)
        runHaxeCode([[FlxG.autoPause = false;]])
        runTimer('haha', 2)
    end
    if tag == 'haha' then
        setPropertyFromClass('openfl.Lib', 'application.window.fullscreen', false)
        setPropertyFromClass("openfl.Lib", "application.window.title", "Friday Night Funkin': Psych Engine")
        stopSound('ollie')
        exitSong(false)
    end
end

function onUpdatePost()
    if zoome then
        setProperty('camHUD.zoom', 0.9)
    end
    if not mustHitSection then
        doTweenX('camFollow', 'camFollow', 618, 0.5, 'bounceOut')
        doTweenY('camFollow', 'camFollow', 496, 0.0001, 'linear')
    elseif mustHitSection then
        doTweenX('camFollow', 'camFollow', 758, 0.5, 'bounceOut')
        doTweenY('camFollow', 'camFollow', 496, 0.0001, 'linear')
    end
    setProperty('timeBar.alpha', 0)
    setProperty('timeBarBG.alpha', 0)
    setProperty('timeTxt.alpha', 0)
    setTextSize('scoreTxt', 20)
    if not lowQuality then
        if getProperty('spotlight.angle') == -20 then
            doTweenAngle('spotlight', 'spotlight', 20, 3, 'smootherStepInOut')
            doTweenX('spotlightX', 'spotlight', -250, 3, 'smootherStepInOut')
            tick = false;
    elseif getProperty('spotlight.angle') == 20 then
            doTweenAngle('spotlight', 'spotlight', -20, 3, 'smootherStepInOut')
            doTweenX('spotlightX', 'spotlight', 1050, 3, 'smootherStepInOut')
            tick = true;
        end
    updateHitbox("spotlight")
    end
end

local finished = false
function onEndSong()
    if not finished then
		runHaxeCode([[FlxG.autoPause = false;]])
        setPropertyFromClass("openfl.Lib", "application.window.title", "YOU THINK YOU CAN JUST RUN AWAY? FOLLOW THE PATH. KNOW YOUR PLACE. SAY MY NAME.")
        doTweenAlpha('END', 'END', 1, 5, 'smootherStepInOut')
        runTimer('end', 10, 1)
        finished = true
        return Function_Stop;
    end
    return Function_Continue;
end


