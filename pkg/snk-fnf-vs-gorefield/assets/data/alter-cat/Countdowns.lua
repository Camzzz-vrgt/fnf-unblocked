--Script Config Fade
FadeTime = 0.3
FadeEase = 'CircInOut'

function onCreate()
--Images Yo

--Two
                    makeLuaSprite('CountTwo', 'ready', 0, 190)

	setObjectCamera('CountTwo', 'other')
	setProperty('CountTwo.visible', false)
--One
	makeLuaSprite('CountOne', 'set', 0, 200)

	setObjectCamera('CountOne', 'other')
	setProperty('CountOne.visible', false)
--Go	
	makeLuaSprite('CountGO', 'go', 0, 150)

	setObjectCamera('CountGO', 'other')
	setProperty('CountGO.visible', false)
--Add Lua Sprites
	addLuaSprite('CountTwo', true)
	addLuaSprite('CountOne', true)
	addLuaSprite('CountGO', true)
scaleObject('CountTwo', 0.8, 0.8)
scaleObject('CountOne', 0.8, 0.8)
scaleObject('CountGO', 0.8, 0.8)
end

function onUpdate()
	setProperty('CountTwo.x', getProperty('countdownReady.x') + 70)
  setProperty('CountOne.x', getProperty('countdownSet.x') + 70)
  setProperty('CountGO.x', getProperty('countdownGo.x') + 60)
end

function onCountdownTick(counter)
	if counter == 1 then
   setProperty('countdownReady.visible', false)
		setProperty('CountTwo.visible', true)
    runTimer('1',0.12)
 elseif counter == 2 then
   runTimer('2',0.12)
   setProperty('countdownSet.visible', false)
		setProperty('CountOne.visible', true)
	elseif counter == 3 then
    setProperty('countdownGo.visible', false)

   setProperty('CountGO.visible', true)
    runTimer('3',0.12)
	end

function onTimerCompleted(t)
if t == '1' then
doTweenAlpha('TwoFade', 'CountTwo', 0, FadeTime, FadeEase)
doTweenY("introTwo", "CountTwo", 1000, 0.7, "sineIn")
end
if t == '2' then
doTweenAlpha('OneFade', 'CountOne', 0, FadeTime, FadeEase)
		doTweenY("introOne", "CountOne", 1000, 0.7, "sineIn")
end
if t == '3' then
doTweenY("introGo", "CountGO", 1000, 0.7, "sineIn")
doTweenAlpha('GoFade', 'CountGO', 0, FadeTime, FadeEase)
end
end
end