function onCreate()
  --background stuff
    
      makeLuaSprite("bg", 'roulette/IMG_2480', 0, 0)
      scaleObject('bg', 0.7, 0.7)
      setScrollFactor('bg', 1, 1)
  
      makeLuaSprite("light", 'roulette/2', 0, 0)
      scaleObject('light', 0.7, 0.7)
      setScrollFactor('light', 1, 1)
    
      makeLuaSprite("vigentte", 'roulette/IMG_2492', 0, 0)
      scaleObject('vigentte', 0.5, 0.5)
      setScrollFactor('vigentte', 0, 0)
      setObjectCamera("vigentte", "camHUD")
      screenCenter("vigentte")
    
      --black box
    
      makeLuaSprite('black', '', 0, 0);
      makeGraphic('black',1280,720,'000000')
      setScrollFactor('black',0,0)
      setProperty('black.scale.x', 4)
      setProperty('black.scale.y', 4)
      --setProperty('black.visible', false)
      --setObjectCamera('black', 'other')
      setProperty('black.alpha', 0.0000001)   
  
      --red light + overlay
    
      makeLuaSprite('redlight', 'roulette/redness', 0, 0)
      scaleObject("redlight", 0.7, 0.7)
      setScrollFactor("redlight", 1, 1)
      setProperty("redlight.alpha", 0.00000001)
      setProperty('redlight.origin.x', 2028)
  
      makeLuaSprite('overlay', 'roulette/redderness', -100, -100)
      setBlendMode('overlay', 'screen')
      setScrollFactor('overlay', 0, 0)
      setObjectCamera('overlay', 'hud')
      setObjectOrder('overlay', 1)
      setProperty('overlay.alpha', 0.00001)
        
  
      --adding
    
      addLuaSprite('bg')
      addLuaSprite('black')
      addLuaSprite('light', true)
      addLuaSprite('redlight', true)
      addLuaScript("overlay", true)
      addLuaSprite('vigentte', true)
    
  end
    
  function onBeatHit()      
      if (curBeat >= 193 and curBeat <= 196) then
          setProperty("black.alpha", (getProperty('black.alpha') + 0.25))
          setProperty("redlight.alpha", (getProperty('redlight.alpha') + 0.25))
          setProperty("light.alpha", (getProperty('light.alpha') - 0.25))
          setProperty("defaultCamZoom", (getProperty('defaultCamZoom') + 0.2)) 
          setProperty('overlay.alpha', (getProperty('overlay.alpha') + 0.09375))
          setProperty('comboGroup.alpha', (getProperty("comboGroup.alpha") - 0.25))
          setProperty('uiGroup.alpha', (getProperty("uiGroup.alpha") - 0.25))
      end
      if (curBeat >= 261 and curBeat <= 264) then
          setProperty("black.alpha", (getProperty('black.alpha') - 0.25))
          setProperty("redlight.alpha", (getProperty('redlight.alpha') - 0.25))
          setProperty("light.alpha", (getProperty('light.alpha') + 0.25))
          --setProperty("defaultCamZoom", (getProperty('defaultCamZoom') - 0.1)) 
          setProperty('overlay.alpha', (getProperty('overlay.alpha') - 0.09375))
          setProperty('comboGroup.alpha', (getProperty("comboGroup.alpha") + 0.25))
          setProperty('uiGroup.alpha', (getProperty("uiGroup.alpha") + 0.25))
      end
  end