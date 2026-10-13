--Script by DENOTT | Use it if you want, you don't need to credit me lol

allowCountdown = false
goOn = false

death = getPropertyFromClass('PlayState', 'deathCounter');

--Nombre de los iconos, van numerados
icon1 = 'Kimihito'
icon2 = 'The RedBlack Master'
icon3 = 'DENOTT'
icon4 = ''
icon5 = ''
icon6 = ''

--Nombre de la persona
name1 = 'Kimihito'
name2 = 'The RedBlack'
name3 = 'DENOTT'
name4 = ''
name5 = ''
name6 = ''

--Que rol tuvo en la canción
rol1 = 'Composer'
rol2 = 'Charter'
rol3 = 'Programmer'
rol4 = ''
rol5 = ''
rol6 = ''

--Aquí va el texdo del lore lul
loreTXT = 'Aquí va todo el lore\nlore por quí, lore por allá\nno sé que mas poner ekisde\npene.'


--Variables, preferiblemente no tocar si no sabes que estás haciendo
offset = 100
posC = 120
posI = 100
posT = 150
ENDposC = -120
ENDposI = 380
iconScale = 0.8

function onCreatePost()
    if songName == 'prologo' then
        setProperty('tebg.alpha',1);
    end
end

function onCreate()

    setPropertyFromClass("openfl.Lib", "application.window.title", "FNAD Funk Off Reality | " .. (songName))
if creditsOn then
    runTimer('goOnActive', 1.6)

    makeLuaSprite('tebg', '', 0, 0)
	makeGraphic('tebg',1280,720,'000000')
	addLuaSprite('tebg', false)
	setProperty('tebg.alpha',0);
	setObjectCamera('tebg', 'other');
    if songName == 'prologo' then
    else
        doTweenAlpha('bg', 'tebg', 0.8, 0.8)
    end

    makeLuaSprite('lore', 'creditsInGameAssets/lore', 650, -600)
    addLuaSprite('lore', false)
    setObjectCamera('lore', 'other')
    doTweenY('loreENTER', 'lore', 50, 1.5, 'quartInOut')
    setProperty('lore.scale.x',1.1);
    setProperty('lore.scale.y',1.1)

    makeLuaText('creditsText', "Credits - ".. songName, 0, 20,30);
    setTextSize('creditsText', 46);
    addLuaText('creditsText');setObjectCamera('creditsText', 'other')

    makeLuaText('loreText', "History:", 0, 850,-160);
    setTextSize('loreText', 46);
    addLuaText('loreText');setObjectCamera('loreText', 'other')
    doTweenY('loreTextENTER', 'loreText', 60, 1.5, 'quartInOut')

    makeLuaText('loreIDK', loreTXT, 0, 700,-160);
    setTextSize('loreIDK', 34);
    addLuaText('loreIDK');setObjectCamera('loreIDK', 'other')
    setTextAlignment('loreIDK', 'center')
    doTweenY('loreIDKENTER', 'loreIDK', 120, 1.5, 'quartInOut')

    makeAnimatedLuaSprite('start','creditsInGameAssets/start',860, 580)
	addAnimationByPrefix('start','idle','starto',24,true)
	addLuaSprite('start',false)
    setObjectCamera('start', 'other');setProperty('start.alpha',0);





    --////_______Credit 1_________________________________________________________
    makeLuaSprite('cred1', 'creditsInGameAssets/bar credits/kimihito', -800, posC)-- cambiar el 'creditsInGameAssets/[NOMBRE DEL BANNER]'
    addLuaSprite('cred1', false);setObjectCamera('cred1', 'other')
    if name1 == '' then else doTweenX('cred1ENTER', 'cred1', ENDposC, 1.4, 'quartInOut')end
    makeLuaSprite('credICON1', 'creditsInGameAssets/icons/' .. icon1, -800, posI)
    addLuaSprite('credICON1', true);setObjectCamera('credICON1', 'other')
    setProperty('credICON1.scale.x',iconScale);setProperty('credICON1.scale.y',iconScale)
    if name1 == '' then else doTweenX('credICON1ENTER', 'credICON1', ENDposI, 1.4, 'quartInOut')end
    --TXT
    makeLuaText('cred1TXT', name1..' - '.. rol1, 0, -800,posT);
    setTextSize('cred1TXT', 28);
    addLuaText('cred1TXT');setObjectCamera('cred1TXT', 'other')
    if name1 == '' then else doTweenX('cred1TXTENTER', 'cred1TXT', 20, 1.4, 'quartInOut')end
    --////_______END Credit 1_________________________________________________________

    --////_______Credit 2_________________________________________________________
    makeLuaSprite('cred2', 'creditsInGameAssets/bar credits/the redblack master', -800, posC+offset*1)-- cambiar el 'creditsInGameAssets/[NOMBRE DEL BANNER]'
    addLuaSprite('cred2', false);setObjectCamera('cred2', 'other')
    if name2 == '' then else doTweenX('cred2ENTER', 'cred2', ENDposC, 1.5, 'quartInOut')end
    makeLuaSprite('credICON2', 'creditsInGameAssets/icons/' .. icon2, -800, posI+offset*1)
    addLuaSprite('credICON2', true);setObjectCamera('credICON2', 'other')
    setProperty('credICON2.scale.x',iconScale);setProperty('credICON2.scale.y',iconScale)
    if name2 == '' then else doTweenX('credICON2ENTER', 'credICON2', ENDposI, 1.5, 'quartInOut')end
    --TXT
    makeLuaText('cred2TXT', name2..' - '.. rol2, 0, -800,posT+offset*1);
    setTextSize('cred2TXT', 28);
    addLuaText('cred2TXT');setObjectCamera('cred2TXT', 'other')
    if name2 == '' then else doTweenX('cred2TXTENTER', 'cred2TXT', 20, 1.4, 'quartInOut')end
    --////_______END Credit 2_________________________________________________________

    --////_______Credit 3_________________________________________________________
    makeLuaSprite('cred3', 'creditsInGameAssets/bar credits/denott', -800, posC+offset*2)-- cambiar el 'creditsInGameAssets/[NOMBRE DEL BANNER]'
    addLuaSprite('cred3', false);setObjectCamera('cred3', 'other')
    if name3 == '' then else doTweenX('cred3ENTER', 'cred3', ENDposC, 1.6, 'quartInOut')end
    makeLuaSprite('credICON3', 'creditsInGameAssets/icons/' .. icon3, -800, posI+offset*2)
    addLuaSprite('credICON3', true);setObjectCamera('credICON3', 'other')
    setProperty('credICON3.scale.x',iconScale);setProperty('credICON3.scale.y',iconScale)
    if name3 == '' then else doTweenX('credICON3ENTER', 'credICON3', ENDposI, 1.6, 'quartInOut')end
    --TXT
    makeLuaText('cred3TXT', name3..' - '.. rol3, 0, -800,posT+offset*2);
    setTextSize('cred3TXT', 28);
    addLuaText('cred3TXT');setObjectCamera('cred3TXT', 'other')
    if name3 == '' then else doTweenX('cred3TXTENTER', 'cred3TXT', 20, 1.4, 'quartInOut')end
    --////_______END Credit 3_________________________________________________________

    --////_______Credit 4_________________________________________________________
    makeLuaSprite('cred4', 'creditsInGameAssets/cred', -800, posC+offset*3)-- cambiar el 'creditsInGameAssets/[NOMBRE DEL BANNER]'
    addLuaSprite('cred4', false);setObjectCamera('cred4', 'other')
    if name4 == '' then else doTweenX('cred4ENTER', 'cred4', ENDposC, 1.7, 'quartInOut')end
    makeLuaSprite('credICON4', 'creditsInGameAssets/icons/' .. icon4, -800, posI+offset*3)
    addLuaSprite('credICON4', true);setObjectCamera('credICON4', 'other')
    setProperty('credICON4.scale.x',iconScale);setProperty('credICON4.scale.y',iconScale)
    if name4 == '' then else doTweenX('credICON4ENTER', 'credICON4', ENDposI, 1.7, 'quartInOut')end
    --TXT
    makeLuaText('cred4TXT', name4..' - '.. rol4, 0, -800,posT+offset*3);
    setTextSize('cred4TXT', 28);
    addLuaText('cred4TXT');setObjectCamera('cred4TXT', 'other')
    if name4 == '' then else doTweenX('cred4TXTENTER', 'cred4TXT', 20, 1.4, 'quartInOut')end
    --////_______END Credit 4_________________________________________________________

    --////_______Credit 5_________________________________________________________
    makeLuaSprite('cred5', 'creditsInGameAssets/cred', -800, posC+offset*4)-- cambiar el 'creditsInGameAssets/[NOMBRE DEL BANNER]'
    addLuaSprite('cred5', false);setObjectCamera('cred5', 'other')
    if name5 == '' then else doTweenX('cred5ENTER', 'cred5', ENDposC, 1.8, 'quartInOut')end
    makeLuaSprite('credICON5', 'creditsInGameAssets/icons/' .. icon5, -800, posI+offset*4)
    addLuaSprite('credICON5', true);setObjectCamera('credICON5', 'other')
    setProperty('credICON5.scale.x',iconScale);setProperty('credICON5.scale.y',iconScale)
    if name5 == '' then else doTweenX('credICON5ENTER', 'credICON5', ENDposI, 1.8, 'quartInOut')end
    --TXT
    makeLuaText('cred5TXT', name5..' - '.. rol5, 0, -800,posT+offset*4);
    setTextSize('cred5TXT', 28);
    addLuaText('cred5TXT');setObjectCamera('cred5TXT', 'other')
    if name5 == '' then else doTweenX('cred5TXTENTER', 'cred5TXT', 20, 1.4, 'quartInOut')end
    --////_______END Credit 5_________________________________________________________

    --////_______Credit 6_________________________________________________________
    makeLuaSprite('cred6', 'creditsInGameAssets/cred', -800, posC+offset*5)-- cambiar el 'creditsInGameAssets/[NOMBRE DEL BANNER]'
    addLuaSprite('cred6', false);setObjectCamera('cred6', 'other')
    if name6 == '' then else doTweenX('cred6ENTER', 'cred6', ENDposC, 1.9, 'quartInOut')end
    makeLuaSprite('credICON6', 'creditsInGameAssets/icons/' .. icon6, -800, posI+offset*5)
    addLuaSprite('credICON6', true);setObjectCamera('credICON6', 'other')
    setProperty('credICON6.scale.x',iconScale);setProperty('credICON6.scale.y',iconScale)
    if name6 == '' then else doTweenX('credICON6ENTER', 'credICON6', ENDposI, 1.9, 'quartInOut')end
    --TXT
    makeLuaText('cred6TXT', name6..' - '.. rol6, 0, -800,posT+offset*5);
    setTextSize('cred6TXT', 28);
    addLuaText('cred6TXT');setObjectCamera('cred6TXT', 'other')
    if name6 == '' then else doTweenX('cred6TXTENTER', 'cred6TXT', 20, 1.4, 'quartInOut')end
    --////_______END Credit 6_________________________________________________________
end

end

function onStartCountdown()
if creditsOn then
	if not allowCountdown then
		return Function_Stop
	end
	return Function_Continue
end
end

function onUpdate(elapsed)
if creditsOn then
	if (getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and not allowCountdown and goOn) then
        runTimer('startGame', 0.8)
        if songName == 'prologo' then
            doTweenAlpha('bg', 'tebg', 1, 0.8)
        else
            doTweenAlpha('bg', 'tebg', 0, 0.8)
        end
        doTweenX('loreOUT', 'lore', 1480, 0.5, 'quartIn')
        doTweenAlpha('txtOUT', 'creditsText', 0, 0.8)
        doTweenX('loreTextOUT', 'loreText', 1480, 0.5, 'quartIn')
        doTweenX('loreIDKOUT', 'loreIDK', 1480, 0.5, 'quartIn')
        --////_______Credit 1____________________
        doTweenX('cred1OUT', 'cred1', -800, 0.4, 'quartIn')
        doTweenX('credICON1OUT', 'credICON1', -800, 0.4, 'quartIn')
        doTweenX('cred1TXTOUT', 'cred1TXT', -800, 0.4, 'quartIn')
        --////_______END Credit 1________________________

        --////_______Credit 2____________________
        doTweenX('cred2OUT', 'cred2', -800, 0.5, 'quartIn')
        doTweenX('credICON2OUT', 'credICON2', -800, 0.5, 'quartIn')
        doTweenX('cred2TXTOUT', 'cred2TXT', -800, 0.5, 'quartIn')
        --////_______END Credit 2________________________

        --////_______Credit 3____________________
        doTweenX('cred3OUT', 'cred3', -800, 0.6, 'quartIn')
        doTweenX('credICON3OUT', 'credICON3', -800, 0.6, 'quartIn')
        doTweenX('cred3TXTOUT', 'cred3TXT', -800, 0.6, 'quartIn')
        --////_______END Credit 3________________________

        --////_______Credit 4____________________
        doTweenX('cred4OUT', 'cred4', -800, 0.7, 'quartIn')
        doTweenX('credICON4OUT', 'credICON4', -800, 0.7, 'quartIn')
        doTweenX('cred4TXTOUT', 'cred4TXT', -800, 0.7, 'quartIn')
        --////_______END Credit 4________________________

        --////_______Credit 5____________________
        doTweenX('cred5OUT', 'cred5', -800, 0.8, 'quartIn')
        doTweenX('credICON5OUT', 'credICON5', -800, 0.8, 'quartIn')
        doTweenX('cred5TXTOUT', 'cred5TXT', -800, 0.8, 'quartIn')
        --////_______END Credit 5________________________

        --////_______Credit 6____________________
        doTweenX('cred6OUT', 'cred6', -800, 0.9, 'quartIn')
        doTweenX('credICON6OUT', 'credICON6', -800, 0.9, 'quartIn')
        doTweenX('cred6TXTOUT', 'cred6TXT', -800, 0.9, 'quartIn')
        --////_______END Credit 6________________________
        doTweenAlpha('startAPPEAR', 'start', 0, 0.5)
        goOn = false
    end
	
    if death >= 1 then
		allowCountdown = true
		startCountdown()
	end

    if getPropertyFromClass('flixel.FlxG', 'keys.justReleased.SPACE') then
		allowCountdown = true
		startCountdown()
		--playSound('clickText')
		removeLuaSprite('ready', true)
		removeLuaSprite('readyCL', true)
	end
end
end

function onTweenCompleted(tag)
if creditsOn then
	if tag == 'RXS0' then
		doTweenX('RXS2', 'ready.scale', 0.63, 0.5, 'quadInOut')
		doTweenY('RYS2', 'ready.scale', 0.63, 0.5, 'quadInOut')
	elseif tag == 'RXS2' then
		doTweenX('RXS0', 'ready.scale', 0.65, 0.5, 'quadInOut')
		doTweenY('RYS0', 'ready.scale', 0.65, 0.5, 'quadInOut')
	end

    if tag == 'credICON6OUT' then
		removeLuaSprite('cred1');removeLuaSprite('credICON1');
        removeLuaSprite('cred2');removeLuaSprite('credICON2');
        removeLuaSprite('cred3');removeLuaSprite('credICON3');
        removeLuaSprite('cred4');removeLuaSprite('credICON4');
        removeLuaSprite('cred5');removeLuaSprite('credICON5');
        removeLuaSprite('cred6');removeLuaSprite('credICON6');
        removeLuaSprite('lore');removeLuaSprite('tebg');
	end
end
end

function onTimerCompleted(tag)
    if tag == 'startGame' then
        allowCountdown = true
		startCountdown()
    end

    if tag == 'goOnActive' then
        goOn = true
        doTweenAlpha('startAPPEAR', 'start', 1, 0.5)
    end
end

function onSongStart()
if creditsOn then
    setProperty('tebg.alpha',0)
end
end


function onDestroy()
	setPropertyFromClass("openfl.Lib", "application.window.title", "FNAD Funk Off Reality")
end