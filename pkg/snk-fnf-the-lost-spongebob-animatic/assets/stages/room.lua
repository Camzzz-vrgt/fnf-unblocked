noteapp = true
go = false
ends = false

function onMoveCamera(cus)
    if cus == 'boyfriend' then
        if ends == false then
         setProperty("defaultCamZoom",0.6)
        end
    elseif cus == 'dad' then
      if ends == false then
        setProperty("defaultCamZoom",0.75)
      end
	end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
		

    if go == true then
      cameraShake('game', 0.009, 0.09)
      cameraShake('camHUD', 0.005, 0.05)
    end
end





function onCreatePost()

    precacheImage('background')
    precacheImage('light')
    setProperty('gf.visible', false)
    setProperty('dad.visible', false)
    setProperty('dad.y', 100)


    setProperty('timeTxt.y', 10000)
    setProperty('timeBar.y', 825)
    setTextSize("timeTxt", 39)


    setProperty("n3.alpha", 1)
	--setProperty('healthBarBG.alpha', 0)
    --setProperty('healthBar.alpha', 0)

    scaleObject('healthBarBG', 0.5, 1)
    scaleObject('healthBar', 0.5, 1)
    setProperty('healthBar.x', 100)
    setProperty('healthBarBG.x', 100)

    setProperty('healthBar.y', 655)
    setProperty('healthBarBG.y', 655)

    setProperty('healthBarBG.flipX', true)
    setProperty('healthBar.flipX', true)


    --setProperty('scoreTxt.x', -390)
    setTextFont('scoreTxt', 'SpongeboyRegular-gx2n6.otf')
    setProperty('timeTxt.alpha', 0)
    setProperty('h.alpha', 0)
    setProperty('iconP2.alpha', 0)


    setProperty('iconP1.alpha', 0)        ---hud
    setProperty('healthBar.alpha', 0)
    setProperty('healthBarBG.alpha', 0)
    setProperty('scoreTxt.alpha', 0)



end

function onUpdatePost()
  setProperty('iconP1.x', 11)
  setProperty('iconP1.y', 570)
end


function onCreate() 

    setProperty('skipCountdown', true)


    makeLuaSprite('background', 'background', 600, 0)

    makeLuaSprite('bulle', 'bulle', 0, 0)                  
    makeAnimatedLuaSprite('bulle', 'bulle', 0, 0)
    screenCenter('bulle')
    setObjectCamera("bulle", "camHUD")
    addAnimationByPrefix('bulle', 'rien', 'rien0', 24, false)
    --scaleObject('bulle', 1.8, 1.8)
    setBlendMode('bulle', 'add')
    addAnimationByPrefix('bulle', 'gobulle', 'bulle0', 24, true)
    setProperty('bulle.alpha', 0.5)


    makeLuaSprite('scream', 'scream', 0, 0)                  
    makeAnimatedLuaSprite('scream', 'scream', 0, 0)
    setObjectCamera("scream", "camHUD")
    addAnimationByPrefix('scream', 'screamrien', 'screamrien0', 24, false)
    scaleObject('scream', 1.3, 1.3)
    addAnimationByPrefix('scream', 'scream', 'scream0', 30, true)


    makeLuaSprite('talk', 'talk', 270, 100)                  
    makeAnimatedLuaSprite('talk', 'talk', 270, 100)
    setObjectCamera("talk", "camHUD")
    addAnimationByPrefix('talk', 'talkrien', 'talkrien0', 24, false)
    --scaleObject('talk', 1.3, 1.3)
    addAnimationByPrefix('talk', 'talk', 'talk0', 24, false)


    makeLuaSprite('line', 'line', 280, -80)                  
    makeAnimatedLuaSprite('line', 'line', 280, -80)
    setObjectCamera("line", "camHUD")
    --screenCenter("line")
    addAnimationByPrefix('line', 'line', 'line0', 24, true)
    scaleObject('line', 0.7, 0.7)
    setProperty('line.alpha', 0)



    makeLuaSprite('light', 'light', 0, 0)
    setBlendMode('light', 'add')
    scaleObject('light', 0.8, 0.8)
    setLuaSpriteScrollFactor('light', 0.84, 0.84)

    makeLuaSprite('n', 'n', 0, -195);        --bar haut
    makeGraphic('n',2380, 300,'000000')
    setScrollFactor('n',0,0)
    setObjectCamera("n", "camHUD")

    makeLuaSprite('n2', 'n2', 0, 630);         --bar bas
    makeGraphic('n2', 2280, 300,'000000')
    setObjectCamera("n2", "camHUD")

    makeLuaSprite('orange', '', 0, 0);
    makeGraphic('orange',1280,720,'FFA300')
    setScrollFactor('orange',0,0)
    setProperty('orange.scale.x',5)
    setProperty('orange.scale.y',5)
    setBlendMode('orange', 'multiply')
    setProperty('orange.alpha', 0.1)

    
    makeLuaSprite('n3', '', 0, 0);
    makeGraphic('n3',1280,720,'000000')
    setScrollFactor('n3',0,0)

    setProperty('n3.scale.x',5)
    setProperty('n3.scale.y',5)
    setObjectCamera("n3", "camHUD")

    makeLuaSprite('n5', '', 0, 0);
    makeGraphic('n5',1280,720,'000000')
    setObjectCamera("n5", "camHUD")
    setScrollFactor('n5',0,0)
    setProperty('n5.alpha', 0)



    makeLuaSprite('time', 'time', 490, 50)
    scaleObject('time', 0.5, 0.6)
    setObjectCamera("time", "camHUD")

    makeLuaSprite('effect', 'effect', -250, -100)
    setObjectCamera("effect", "camHUD")
    --screenCenter('effect')
    --setScrollFactor('effect',0,0)
    scaleObject('effect', 0.6, 0.6)
    setProperty('effect.alpha', 0.5)

    makeLuaSprite('cave', 'cave', -370, -348)
    scaleObject('cave', 0.8, 0.8)


    makeLuaText('titre', 'The Lost Spongebob Animatic Mod presents', 950, 150, 150)       
    setObjectCamera('titre', 'HUD')
    setTextAlignment('titre', 'center')
    addLuaText('titre', true)
    setTextBorder('titre', 3, '000000')
    setTextSize('titre', 40)
    setTextFont('titre', 'SpongeboyRegular-gx2n6.otf')
    setTextColor('titre', 'ECDECE')
    setProperty('titre.alpha', 0)
    --scaleObject('titre', 2, 2)
    --screenCenter('titre')

    makeLuaText('title', 'UNLEASHED', screenWidth, 0, 320)       
    setObjectCamera('title', 'HUD')
    addLuaText('title', true)
    setTextBorder('title', 3, '000000')
    setTextSize('title', 130)
    setTextFont('title', 'SpongeboyRegular-gx2n6.otf')
    setTextColor('title', 'ECDECE')
    setProperty('title.alpha', 0)
    --scaleObject('title', 2, 2)
    --screenCenter('title')

    --chart by MrMoustache Song by Calitsuki

    


    makeLuaText('credit1', "Song by Calitsuki", screenWidth, -470, 120)       
    setObjectCamera('credit1', 'HUD')
    addLuaText('credit1', true)
    setTextBorder('credit1', 1, '000000')
    setTextSize('credit1', 30)
    setTextFont('credit1', 'SpongeboyRegular-gx2n6.otf')
    setTextColor('credit1', 'ECDECE')

    makeLuaText('credit2', "chart by MrMoustache", screenWidth, -425, 120)       
    setObjectCamera('credit2', 'HUD')
    addLuaText('credit2', true)
    setTextBorder('credit2', 1, '000000')
    setTextSize('credit2', 30)
    setTextFont('credit2', 'SpongeboyRegular-gx2n6.otf')
    setTextColor('credit2', 'ECDECE')

    makeLuaText('credit3', "Code/Arts by The Reda Show", screenWidth, -370, 120)       
    setObjectCamera('credit3', 'HUD')
    addLuaText('credit3', true)
    setTextBorder('credit3', 1, '000000')
    setTextSize('credit3', 30)
    setTextFont('credit3', 'SpongeboyRegular-gx2n6.otf')
    setTextColor('credit3', 'ECDECE')

    setProperty('credit1.alpha', 0)
    setProperty('credit2.alpha', 0)
    setProperty('credit3.alpha', 0)


    makeLuaSprite('porte', 'porte', 500, -125)
    setScrollFactor('porte', 1.2, 1.2)


    makeLuaSprite('flou', 'flou', 500, -125)
    setScrollFactor('flou', 1.2, 1.2)

    makeLuaSprite('bgtalk', 'bgtalk', -60, 0)
    setObjectCamera("bgtalk", "camHUD")
    scaleObject('bgtalk', 0.7, 0.7)

    --setScrollFactor('bgtalk',0,0)
    --setProperty('bgtalk.alpha', 0)

    makeLuaSprite('efe', 'efe', 1400, 850);
    --setObjectCamera("efe", "camHUD")
    --setScrollFactor('efe',0,0)
    setProperty('efe.alpha', 0.8)


    makeLuaSprite('doorlight', 'doorlight', 660, 42)
    scaleObject('doorlight', 0.8, 0.8)
    setBlendMode('doorlight', 'add')
    setProperty('doorlight.alpha', 0.5)
    setProperty('doorlight.alpha', 0)


    addLuaSprite('cave', false)
    addLuaSprite('doorlight', true)
    addLuaSprite('porte', false)
    addLuaSprite('flou', false)
    addLuaSprite('light', true)
    addLuaSprite('orange', true)
    addLuaSprite('background', true)
    addLuaSprite('titre', true)
    addLuaSprite('title', true)
    addLuaSprite('n5', true)
    --addLuaSprite('bgtalk', true)
    addLuaSprite('scream', true)
    addLuaSprite('talk', true)
    addLuaSprite('bulle', true)
    addLuaSprite('line', true)
    addLuaSprite('n', true)
    addLuaSprite('effect', true)
    addLuaSprite('efe', true)
    addLuaSprite('n2', true)
    addLuaSprite('n3', true)

    --addLuaSprite('time', true)

    addLuaText('credit1', true)
    addLuaText('credit2', true)
    addLuaText('credit3', true)









end


function onStepHit()
	if curStep == 1 then
        doTweenZoom('iii', 'camGame', 1.3, 16, 'linear')
        doTweenAngle('lllk', 'background', 18, 15, 'linear')
        doTweenAngle('lllk', 'background', 18, 15, 'linear')
		doTweenAlpha("n3", "n3", 0, 0.5)
	end
    if curStep == 15 then
      doTweenAlpha("titre1", "titre", 1, 5)
      --doTweenX('titre', 'titre.scale', 1, 3, 'linear')
      --doTweenY('titre2', 'titre.scale', 1, 3, 'linear')
    end
    if curStep == 45 then
        
        doTweenAlpha("title", "title", 1, 3)
	end
    if curStep == 120 then
        --doTweenX('title1', 'title.scale', 0, 3, 'linear')
        --doTweenY('titl2e', 'title.scale', 0, 3, 'linear')
        doTweenAlpha("title", "title", 0, 2)
        doTweenAlpha("titre", "titre", 0, 2)
	end
    if curStep == 50 then
		doTweenAlpha("n3", "n3", 1, 8)
        noteapp = false
	end
    if curStep == 150 then
		doTweenZoom('iii2', 'camGame', 0.7, 0, 'linear')
	end
    if curStep == 155 then
        doTweenZoom('iii2', 'camGame', 0.7, 0, 'linear')
        doTweenZoom('iii', 'camGame', 0.7, 10, 'linear')
        setProperty('background.alpha', 0)
		doTweenAlpha("n3", "n3", 0, 3)
        noteTweenAlpha('strumLineNotes1', 4, 1, 3, 'linear')
        noteTweenAlpha('strumLineNotes2', 5, 1, 3, 'linear')
        noteTweenAlpha('strumLineNotes3', 6, 1, 3, 'linear')
        noteTweenAlpha('strumLineNotes4', 7, 1, 3, 'linear')
        
        doTweenAlpha("credit1", "credit1", 1, 2)
	end
    if curStep == 200 then
        doTweenAlpha("credit1", "credit1", 0, 0.1)
        doTweenAlpha("credit2", "credit2", 1, 1)
        doTweenAlpha("flou", "flou", 0, 1)
	end
    if curStep == 250 then
        doTweenAlpha("credit2", "credit2", 0, 0.1)
        doTweenAlpha("credit3", "credit3", 1, 1)
	end
    if curStep == 280 then
        doTweenAlpha("credit3", "credit3", 0, 1)
	end
    if curStep == 289 then
      setProperty('n3.alpha', 1)

      for i = 4,7 do
           setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
      end


      setProperty('iconP1.alpha', 0)        ---hud
      setProperty('healthBar.alpha', 0)
      setProperty('healthBarBG.alpha', 0)
      setProperty('scoreTxt.alpha', 0)


    end
    if curStep == 291 then
        go = true
        setProperty('n5.alpha', 1)
        setProperty('bgtalk.alpha', 1)
        setProperty('doorlight.alpha', 0.5)
        setProperty('boyfriend.y', 1150)
        setProperty('boyfriend.x', 2000)
	end
    if curStep == 300 then
        doTweenAlpha("n3", "n3", 0, 4)
        setProperty('dad.visible', true)
        setProperty('light.alpha', 0)
        setProperty('porte.alpha', 0)
	end
    if curStep == 302 then
      objectPlayAnimation('talk', 'talk', true)

	end
    if curStep == 324 then
      scaleObject('talk', 1.7, 1.7)
      setProperty('talk.x', 20)
	end
    if curStep == 351 then
      doTweenAlpha("po", "n3", 1, 2)
	end
    if curStep == 372 then
        doTweenAlpha("poh", "n3", 0, 3)
        --setProperty('bgtalk.alpha', 0)
        objectPlayAnimation('bulle', 'gobulle', true)
        objectPlayAnimation('scream', 'scream', true)
        objectPlayAnimation('talk', 'talkrien', true)
        setProperty('n5.alpha', 1)


        AHHH = true
	end
    if curStep == 410 then
        noteTweenAlpha('strumLineNotes1', 4, 1, 1, 'linear')
        noteTweenAlpha('strumLineNotes2', 5, 1, 1, 'linear')
        noteTweenAlpha('strumLineNotes3', 6, 1, 1, 'linear')
        noteTweenAlpha('strumLineNotes4', 7, 1, 1, 'linear')
	end

    if curStep == 418 then
        cameraFlash('camOther', 'EAE3DC', 0.7)
        setProperty('n5.alpha', 0)
        objectPlayAnimation('scream', 'screamrien', true)
        objectPlayAnimation('bulle', 'rien', false)
        AHHH = false




        setProperty('iconP1.alpha', 1)        ---hud
        setProperty('healthBar.alpha', 0.5)
        setProperty('healthBarBG.alpha', 0.5)
        setProperty('scoreTxt.alpha', 0.4)


	end

    if curStep == 1583 then
      doTweenAlpha("kkjkkj", "n3", 1, 2)
	end
    if curStep == 1713 then
      doTweenAlpha("ghgj", "n3", 0, 7)
      cameraFlash('camOther', 'EAE3DC', 0.9)
      setProperty('line.alpha', 1)
      setProperty('doorlight.x', -500)
      setProperty('cave.alpha', 0)
      ends = true
      phase2 = true
      setProperty("defaultCamZoom",0.56)
      triggerEvent('Change Character','dad','bobsad1')
      setProperty('dad.y', 1000)
      setProperty('dad.x', 600)
      scaleObject('dad', 1.8, 1.8)
      setProperty('dad.alpha', 0.3)
      setProperty('dad.flipX', false)
	end
    if curStep == 2096 then
       doTweenAlpha("hhgghfgh", "dad", 0, 11)
      doTweenX('fghgfh', 'dad', 100, 11, 'linear')
	end
    if curStep == 2225 then
        setProperty('line.alpha', 0)
        setProperty('doorlight.alpha', 0)
        objectPlayAnimation('bulle', 'gobulle', true)
        objectPlayAnimation('scream', 'scream', true)
        setProperty('n5.alpha', 1)
        AHHH = true
	end
end

AHHH = false
phase2 = false

function onUpdate()

  if phase2 == true then
    triggerEvent('Camera Follow Pos', 1500, 1200)
  end


  if AHHH == true then
   cameraShake('camHUD', 0.009, 0.09)
  end

  if curStep >= 0 then
    songPos = getSongPosition()
    local currentBeat = (songPos / 1000) * (bpm / 40)
    local newPosition = 20 * math.sin((currentBeat * 0.25) * math.pi)

    doTweenAngle('ahah', 'light', newPosition, 5, 'linear')

  end
   setProperty("showComboNum", false)
   setProperty("showRating", false)

   if noteapp == true then
    for i = 4,7 do
      setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
    end
    for i = 0,3 do
       setPropertyFromGroup('strumLineNotes',i,'alpha', 0)
    end
  end
end

