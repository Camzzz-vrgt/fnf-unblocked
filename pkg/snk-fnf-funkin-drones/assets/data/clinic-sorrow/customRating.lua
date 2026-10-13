scale = 0.7
startX = 665
startY = 235
moveY = 53.57 * scale

function onCreate()
 setProperty('showRating', false)
 setProperty('showComboNum', false)
end

combo = 0
function goodNoteHit(id, direction, noteType, isSustainNote)
 if not isSustainNote then
  if combo == 0 then
   makeCombo(string.lower(getPropertyFromGroup('notes', id, 'rating')))
   combo = combo + 1
  else
   combo = combo + 1
   makeCombo(string.lower(getPropertyFromGroup('notes', id, 'rating')))
  end
 end
end

function noteMiss()
 combo = 0
end

function onTweenCompleted(tag)
 if string.sub(tag, 1, 10) == 'comboNumIn' then
  doTweenY(string.sub(tag, 1, 8) .. 'Out' .. string.sub(tag, 11), string.sub(tag, 1, 8) .. string.sub(tag, 11), getProperty(string.sub(tag, 1, 8) .. string.sub(tag, 11) .. '.y') + (moveY * 1.8), _G[string.sub(tag, 11) .. 'time'], 'quadIn')
  doTweenAlpha(string.sub(tag, 1, 8) .. 'End' .. string.sub(tag, 11), string.sub(tag, 1, 8) .. string.sub(tag, 11), 0, _G[string.sub(tag, 11) .. 'time'], 'quadIn')
 end
 
 if string.sub(tag, 1, 11) == 'comboNumEnd' then
  removeLuaSprite(string.sub(tag, 1, 8) .. string.sub(tag, 12), true)
 end
 
 if string.sub(tag, 1, 8) == 'ratingIn' then
  doTweenY(string.sub(tag, 1, 6) .. 'Out' .. string.sub(tag, 9), string.sub(tag, 1, 6) .. string.sub(tag, 9), getProperty(string.sub(tag, 1, 6) .. string.sub(tag, 9) .. '.y') + (moveY * 1.8), 0.5, 'quadIn')
  doTweenAlpha(string.sub(tag, 1, 6) .. 'End' .. string.sub(tag, 9), string.sub(tag, 1, 6) .. string.sub(tag, 9), 0, 0.5, 'quadIn')
 end
 
 if string.sub(tag, 1, 9) == 'ratingEnd' then
  removeLuaSprite(string.sub(tag, 1, 6) .. string.sub(tag, 10), true)
 end
 
 if string.sub(tag, 1, 7) == 'comboIn' then
  doTweenY(string.sub(tag, 1, 5) .. 'Out' .. string.sub(tag, 9), string.sub(tag, 1, 5) .. string.sub(tag, 8), getProperty(string.sub(tag, 1, 5) .. string.sub(tag, 8) .. '.y') + (moveY * 1.8), 0.5, 'quadIn')
  doTweenAlpha(string.sub(tag, 1, 5) .. 'End' .. string.sub(tag, 9), string.sub(tag, 1, 5) .. string.sub(tag, 8), 0, 0.5, 'quadIn')
 end
 
 if string.sub(tag, 1, 8) == 'comboEnd' then
  removeLuaSprite(string.sub(tag, 1, 5) .. string.sub(tag, 9), true)
 end
end

function makeCombo(rate)
 time = getSongPosition()
 makeLuaSprite('rating' .. time, 'game/score/' .. rate, startX, startY)
 setObjectCamera('rating' .. time, 'game')
 scaleObject('rating' .. time, scale, scale)
 doTweenY('ratingIn' .. time, 'rating' .. time, getProperty('rating' .. time .. '.y') - moveY, 0.5, 'quadOut')
 
 if combo >= 10 then
  makeLuaSprite('combo' .. time, 'game/score/combo', startX + (scale * 58.57), startY + (scale * 85.71))
  setObjectCamera('combo' .. time, 'game')
  scaleObject('combo' .. time, scale, scale)
  doTweenY('comboIn' .. time, 'combo' .. time, getProperty('combo' .. time .. '.y') - moveY, 0.5, 'quadOut')
 end
 
 addLuaSprite('combo' .. time, false)
 addLuaSprite('rating' .. time, false)
 
 if combo >= 10 then
  if combo > 999 then
   long = 4
  else
   long = 3
  end
  if combo == 0 then
   comboDisplay = '000'
  elseif combo >= 10 and combo < 100 then
   comboDisplay = '0' .. combo
  elseif combo >= 100 then
   comboDisplay = combo
  end
  for i=1, long do
   _G[i .. time .. 'time'] = getRandomFloat(0.6, 0.8)
   makeLuaSprite('comboNum' .. i .. time, 'game/score/num' .. string.sub(comboDisplay, i, i), startX - (scale * 70), startY + (scale * 198.57))
   setObjectCamera('comboNum' .. i .. time, 'game')
   scaleObject('comboNum' .. i .. time, scale * 0.71, scale * 0.71)
   addLuaSprite('comboNum' .. i .. time, false)
   if i > 1 then
    setProperty('comboNum' .. i .. time .. '.x', getProperty('comboNum' .. (i-1) .. time .. '.x') + (getProperty('comboNum' .. (i-1) .. time .. '.width') - 3))
   end
   doTweenY('comboNumIn' .. i .. time, 'comboNum'.. i .. time, getProperty('comboNum'.. i .. time .. '.y') - moveY, _G[i .. time .. 'time'], 'quadOut')
  end
 end
end