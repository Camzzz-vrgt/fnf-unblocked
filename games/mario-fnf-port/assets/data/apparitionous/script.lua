function onStepHit()
  if curStep == 768 then
    doTweenX('dad.x', 250, 10,'linear')

    doTweenX('dadScaleTweenX', 'dad.scale', 3, 14, 'linear' )
    doTweenY('dadScaleTweenY', 'dad.scale', 3, 14, 'linear' )
  end
  if curStep == 928 then
    doTweenX('dadScaleTweenX', 'dad.scale', 1.4, 1.9, 'linear' )
    doTweenY('dadScaleTweenY', 'dad.scale', 1.4, 1.9, 'linear' )
  end
  if curStep == 1088 then
    doTweenX('dadScaleTweenX', 'dad.scale', 4, 6, 'linear' )
    doTweenY('dadScaleTweenY', 'dad.scale', 4, 6, 'linear' )
  end
if curStep == 1152 then
  doTweenX('dad.x', 170, 0.01,'linear')
  doTweenX('dadScaleTweenX', 'dad.scale', 0.6, 0.01, 'linear' )
  doTweenY('dadScaleTweenY', 'dad.scale', 0.6, 0.01, 'linear' )
end
if curStep == 1153 then
  doTweenX('dadScaleTweenX', 'dad.scale', 1.4, 1, 'linear' )
  doTweenY('dadScaleTweenY', 'dad.scale', 1.4, 1, 'linear' )
end
if curStep == 1472 then
  doTweenX('dadScaleTweenX', 'dad.scale', 1.7, 0.5, 'linear' )
  doTweenY('dadScaleTweenY', 'dad.scale', 1.7, 0.5, 'linear' )
end
if curStep == 1504 then
  doTweenX('dadScaleTweenX', 'dad.scale', 2, 0.5, 'linear' )
  doTweenY('dadScaleTweenY', 'dad.scale', 2, 0.5, 'linear' )
end
if curStep == 1536 then
  doTweenX('dad.x', 250, 8,'linear')
  doTweenX('dadScaleTweenX', 'dad.scale', 4, 7, 'linear' )
  doTweenY('dadScaleTweenY', 'dad.scale', 4, 7, 'linear' )
end
if curStep == 1600 then
  doTweenX('dad.x', 170, 1,'linear')
  doTweenY('dad.y', 500, 1,'linear')
  doTweenX('dadScaleTweenX', 'dad.scale', 0.4, 1.8, 'linear' )
  doTweenY('dadScaleTweenY', 'dad.scale', 0.4, 1.8, 'linear' )
  doTweenAlpha('dad', 'dad', 0, 1.5, 'linear')
end
end
function onCreatePost()



  setProperty("health",getProperty('health') +2)
  end
  function opponentNoteHit(id,data,type,sus)	
    
    triggerEvent('Add Camera Zoom','0.01','0.01') 
  
    health = getProperty('health')
        if getProperty('health') > 0.1 then
            setProperty('health', health- 0.0027);
          end
    end
    function goodNoteHit()
      health = getProperty('health')
        setProperty('health', health- 0.022);
    end
    function onCreate()
      setPropertyFromClass('GameOverSubstate', 'characterName', ''); --Character json file for the death animation
      setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'WarioGloryKill'); --put in mods/sounds/
      setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'wariogameOver'); --put in mods/music/
      setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/
    
      precacheImage('invisible')
    end
