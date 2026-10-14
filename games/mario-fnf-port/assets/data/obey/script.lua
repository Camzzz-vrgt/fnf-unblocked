function onStepHit()
  if curStep == 128 then
  
    
  
    setPropertyFromGroup('opponentStrums',0,'x','-500')
    setPropertyFromGroup('opponentStrums',1,'x','-500')
    setPropertyFromGroup('opponentStrums',2,'x','-500')
    setPropertyFromGroup('opponentStrums',3,'x','-500')
  
    setPropertyFromGroup('playerStrums',0,'x','412')
    setPropertyFromGroup('playerStrums',1,'x','527')
    setPropertyFromGroup('playerStrums',2,'x','643')
    setPropertyFromGroup('playerStrums',3,'x','761')
    end
   

  if curStep == 384 then

  setProperty("dad.alpha", 1)
  doTweenAlpha('iconP2', 'iconP2', 1, 1, 'linear')
setProperty('Blackball.visible', false)
  end
  if curStep == 1984 then
    setProperty('wh.visible', true)

    end
    if curStep == 2016 then
      doTweenAlpha('thank', 'thx', 1, 1.5, 'linear')
  
      end
 end
  function onCreatePost()
      setProperty("iconP2.alpha", 0)
      setProperty("dad.alpha", 0)
      setProperty("health",getProperty('health') +2)

      addCharacterToList('GigaWEEGEE')
end
