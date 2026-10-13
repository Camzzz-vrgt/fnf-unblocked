flechas_restantes = 30

function onCreatePost()

   setProperty('gf.visible',false)
   setProperty('iconP2.alpha', 0.0)

   setPropertyFromGroup('opponentStrums', 0, 'x', -5000);
   setPropertyFromGroup('opponentStrums', 1, 'x', -5000);
   setPropertyFromGroup('opponentStrums', 2, 'x', -5000);
   setPropertyFromGroup('opponentStrums', 3, 'x', -5000);

   setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - 320);
   setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - 320);
   setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - 320);
   setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - 320);

   makeLuaText('score','',0,15,560); --y:520
   setTextSize('score', 20);
   setTextFont('score', "vcr.ttf") 
   addLuaText('score');

   -- makeLuaText('misses','',0,15,560); 
   -- setTextSize('misses', 20);
   -- setTextFont('misses', "vcr.ttf")
   -- addLuaText('misses');
 
   makeLuaText('accu', 'Accuracy: '..math.floor(rating)..'%', 0, 15,600) 
   setTextSize('accu', 20);
   setTextFont('accu', "vcr.ttf")
   addLuaText('accu');

   makeLuaText('sick','',0,1150,500); 
   setTextSize('sick', 20);
   setTextFont('sick', "vcr.ttf")
   addLuaText('sick');

   makeLuaText('good','',0,1150,530); 
   setTextSize('good', 20);
   setTextFont('good', "vcr.ttf")
   addLuaText('good');

   makeLuaText('bad','',0,1150,560); 
   setTextSize('bad', 20);
   setTextFont('bad', "vcr.ttf")
   addLuaText('bad');

   makeLuaText('shit','',0,1150,595); 
   setTextSize('shit', 20);
   setTextFont('shit', "vcr.ttf")
   addLuaText('shit');

   makeLuaText('flechas_restantes','',0,580,680); 
   setTextSize('flechas_restantes', 20);
   setTextFont('flechas_restantes', "vcr.ttf") 
   addLuaText('flechas_restantes');

end

function onUpdate()

   setTextString('sick', 'Sick: '..getProperty('sicks'));
   setTextString('good', 'Good: '..getProperty('goods'));
   setTextString('bad', 'Bad: '..getProperty('bads'));
   setTextString('shit', 'Shit: '..getProperty('shits'));
   setTextString('score', 'Score: '..getProperty('songScore'));
   --setTextString('misses', 'Misses: '..getProperty('songMisses'));
   setTextString('accu','Accuracy: '..getProperty('ratingPercent'));

   setTextString('flechas_restantes','Notas restantes: '..flechas_restantes);

   if flechas_restantes == 0 then
      setHealth(0.0)
   end

   if difficulty == 0 then
      new_health_value = flechas_restantes / 15
   end
   if difficulty == 1 then
      new_health_value = flechas_restantes / 10
   end
   if difficulty == 2 then
      new_health_value = flechas_restantes / 5
   end
end

function onUpdatePost()
   setProperty('scoreTxt.visible', false)

end

function onSongStart()
   setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-dead'); --Character json file for the death animation
   setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOver'); --put in mods/music/
   setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverEnd'); --put in mods/music/

end

function onGameOver()
   triggerEvent('Flash', 'FFFFFF', '2.0')
end


function onGameOverConfirm()
   triggerEvent('Flash', 'FFFFFF', '2.0')
end

function goodNoteHit(id, noteData, noteType, isSustainNote)

   if noteType == 'Heal Note' then

      if difficulty == 0 then
         flechas_restantes = flechas_restantes + 3
         new_health_value = flechas_restantes / 15
      end

      if difficulty == 1 then
         flechas_restantes = flechas_restantes + 4
         new_health_value = flechas_restantes / 10
      end

      if difficulty == 2 then
         flechas_restantes = flechas_restantes + 3
         new_health_value = flechas_restantes / 5 
      end

      health = getProperty('health')
      if getProperty('health') > 0.1 then
         setProperty('health', new_health_value);
      end
   end

   health = getProperty('health')
   if health > 0.1 then
      setProperty('health', new_health_value);
   end
end

function noteMiss()
   flechas_restantes = flechas_restantes - 1
   setHealth(new_health_value)
end

function onCreate()

   setProperty('camGame.visible', false)

   if difficulty == 0 then
      flechas_restantes = 30
   end

   if difficulty == 1 then
      flechas_restantes = 20
   end

   if difficulty == 2 then
      flechas_restantes = 10
   end

   setProperty('camZooming', true)
	
   setHealth(2.0)

	makeLuaSprite('hoshino-stage','hoshino-stage', -80, 0)
   setLuaSpriteScrollFactor('hoshino-stage', 1, 1);

   makeLuaSprite('sfx','sfx', -5,0)
   makeLuaSprite('sfx 2','sfx 2', -5,0)
   makeLuaSprite('sfx 3','sfx 3', -70, -80)

	addLuaSprite('hoshino-stage', false);

   addLuaSprite('sfx', true);
   setBlendMode('sfx','add')
   setProperty('sfx.alpha', 0.3)

   addLuaSprite('sfx 2', true);
   setBlendMode('sfx 2','darken')
   setProperty('sfx 2.alpha', 1.0)
   setProperty('sfx 2.visible', false)

   addLuaSprite('sfx 3', true);
   setBlendMode('sfx 3','add')
   setProperty('sfx 3.visible', false)

   makeLuaSprite('bartop','',0,-140)
   makeGraphic('bartop',1281,200,'000000')
   addLuaSprite('bartop',false)
   setObjectCamera('bartop','camhud')
   setScrollFactor('bartop',0,0)

   makeLuaSprite('barbot','',0,650)
   makeGraphic('barbot',1281,200,'000000')
   addLuaSprite('barbot',false)
   setScrollFactor('barbot',0,0)
   setObjectCamera('barbot','camhud')

   makeLuaSprite('black')
   makeGraphic('black', screenWidth, screenHeight, '000000')
   setObjectCamera('black', 'other')
   setProperty('black.alpha', 0)
   addLuaSprite('black', true)

   makeLuaSprite('black_game')
   makeGraphic('black_game', screenWidth * 10, screenHeight * 10, '000000')
   setProperty('black_game.alpha', 0)
   addLuaSprite('black_game', true)

end


function onStepHit()
   if curStep == 32 then
      triggerEvent('Flash', 'FFFFFF', '0.7')
      setProperty('camGame.visible', true)
   end

   if curStep == 1200 then
      triggerEvent('Flash', 'FFFFFF', '0.7')
      setProperty('sfx 2.visible', true)
      setProperty('hoshino-stage.visible', false)
   end

   if curStep == 1328 then
      triggerEvent('Flash', 'FFFFFF', '0.7')
      setProperty('sfx 2.visible', false)
      setProperty('hoshino-stage.visible', true)
   end

   if curStep == 1424 then
      doTweenAlpha('hud0','black', 1.0, 3.5)
   end


   if curStep == 1600 then
      setProperty('camHUD.alpha', 0.0)    
   end  

   if curStep == 1728 then
      setProperty('black.alpha', 0.0)
      setProperty('camGame.alpha', 0.0)
      doTweenAlpha('hud0', 'camHUD', 1.0, 2.0)
   end

   if curStep == 1744 then
      setProperty('camGame.alpha', 1.0)
   end

   if curStep == 2432 then
      triggerEvent('Flash', 'FFFFFF', '0.7')
      setProperty('sfx 3.visible', true)
   end

   if curStep == 2560 then
      setProperty('sfx 3.visible', false)
   end
   
   if curStep == 2680 then
      doTweenAlpha('hud0', 'camHUD', 0.0, 4.0)
   end

end
