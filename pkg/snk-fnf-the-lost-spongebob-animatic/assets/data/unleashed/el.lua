
over = false


function noteMiss()
  cameraShake('game', 0.006, 0.09)
  doTweenColor('ar', 'boyfriend', 'D2002B', 0.001, 'linear')
  runTimer('goo', 0.5, 0)
end

function onTimerCompleted(goo)
 doTweenColor('ar2', 'boyfriend', 'FFFFFF', 0.1, 'linear')
end

function ta()
  if tamer == false then 
      startVideo('DOOR')
      tamer = true
  end
end



tamer = false

function onGameOver()

     over = true
     gmsong = true

     
     ta()

     --objectPlayAnimation('gameover', 'ferme', true)
     doTweenAlpha("ffff", "gm", 1, 5)
     setProperty('black.alpha', 1)
     setProperty('playbackRate', 0)
     setProperty('scoreTxt.alpha', 0)
     --startVideo('context')

     for i = 4,7 do
         setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
     end
     if keyJustPressed('pause') then
       restartSong(false)
     end
     if keyJustPressed('back') then
      exitSong(false)
     end

 return Function_Stop
end


function onPause()
 if over == true then
  return Function_Stop
 end
end


function opponentNoteHit() 
	health = getProperty('health') 
	if getProperty('health') > 0.1 then 
	 setProperty('health', health- 0.01); 
	end
end



function onCreate() 


    makeLuaSprite('black', '', 0, 0);
    makeGraphic('black', 1380,720, '000000')
    setObjectCamera("black", "camHUD") 
    setProperty('black.alpha', 0)

    


    makeLuaSprite('red', '', 0, 0);
    makeGraphic('red', 1380,720, '9A3000')
    setObjectCamera("red", "camHUD") 
    setBlendMode('red', 'multiply')

    addLuaSprite('black', true)
    addLuaSprite('red', true)

end

function onUpdate()

   setProperty("showComboNum", false)
   setProperty("showRating", false)

   setProperty('red.alpha', rates)

   if getHealth() < 0.2  then
     cameraShake('game', 0.005, 0.07)
   end
   if getHealth() < 0.3  then
     cameraShake('game', 0.004, 0.06)
   end
   if getHealth() < 0.4  then
     cameraShake('game', 0.003, 0.05)
   end
   if getHealth() > 0.2  then
     rates = 0.7
   end
   if getHealth() > 0.3  then
     rates = 0.6
   end
   if getHealth() > 0.4 then
     rates = 0.5
   end
   if getHealth() > 0.5 then
     rates = 0.4
   end
   if getHealth() > 0.6 then
      rates = 0.3
   end
   if getHealth() > 0.7 then
     rates = 0.2
   end
   if getHealth() > 0.8 then
     rates = 0.1
   end
   if getHealth() > 0.9 then
     rates = 0
   end
end