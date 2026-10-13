followUzi = true
followBF = false
center = false
fastBeat = false
veryFastBeat = false
zoomStrenght = 0
timeBeats = 9999

function onCreate()
 makeLuaSprite('bg', 'stages/stage 1/background', -650, 20)
 
 makeLuaSprite('table', 'stages/stage 1/table', -980, -230)
 setScrollFactor('table', 1.5, 1)
 scaleObject('table', 1.2, 1.2)

 makeLuaSprite('blackBox', '', -650, 20)
 makeGraphic('blackBox', 2659, 1080, '000000')
 setProperty('blackBox.alpha', 0)
 
 makeLuaSprite('whiteBox', '', -650, 20)
 makeGraphic('whiteBox', 2659, 1080, 'FFFFFF')
 setProperty('whiteBox.alpha', 0)
 
 makeLuaSprite('blackBoxFront', '', -650, 20)
 makeGraphic('blackBoxFront', 2659, 1080, '000000')
 setProperty('blackBoxFront.alpha', 0)
 
 addLuaSprite('bg', false)
 addLuaSprite('blackBox', false)
 addLuaSprite('table', true)
 addLuaSprite('whiteBox', true)
 addLuaSprite('blackBoxFront', true)
 
 makeLuaSprite('credit', 'stages/stage 1/credit', 1300, 500)
 scaleObject('credit', 0.8, 0.8)
 setObjectCamera('credit', 'other')
 addLuaSprite('credit', false)
 
 makeLuaSprite('counter1', 'game/ready', 0, 0)
 scaleObject('counter1', 0.75, 0.75)
 
 makeLuaSprite('counter2', 'game/set', 0, 0)
 scaleObject('counter2', 0.7375, 0.7375)
 
 makeLuaSprite('counter3', 'game/go', 0, 0)
 scaleObject('counter3', 0.625, 0.625)
 
 for i=1, 3 do
  setProperty('counter' .. i .. '.alpha', 0.00000001)
  setObjectCamera('counter' .. i, 'other')
  screenCenter('counter' .. i)
  addLuaSprite('counter' .. i, false)
 end
end

function onCreatePost()
 setProperty('gf.alpha', 0.00000000001)
end

function onCountdownTick(counter)
 if counter >= 1 and counter <= 3 then
  setProperty('counter' .. counter .. '.alpha', 1)
  doTweenY('counter' .. counter .. 'Y', 'counter' .. counter, getProperty('counter' .. counter .. '.y') + 155, (stepCrochet/ 1000) * 4, 'cubeIn')
  doTweenAlpha('counter' .. counter .. 'Alpha', 'counter' .. counter, 0, (stepCrochet/ 1000) * 4, 'cubeIn')
 end
 
 if counter == 0 then
  doTweenZoom('gameZoom', 'camGame', 1.3, (stepCrochet/1000) * 8, 'quadOut')
 end
 
 if counter == 2 then
  cancelTween('gameZoom')
  playSound('yey')
  playAnim('boyfriend', 'singLEFT', false)
  setProperty('boyfriend.specialAnim', true)
  playAnim('dad', 'pissed1', false)
  setProperty('dad.specialAnim', true)
  doTweenZoom('gameZoom', 'camGame', 0.9, 1, 'quadOut')
  followUzi = false
  followBF = true
 end
end

function onSongStart()
 followBF = false
 setProperty('camZooming', true)
 setProperty('camZoomingMult', 0)
 zoomStrenght = 1
 timeBeats = 2
end

function onStepHit() 
 if curStep == 2 then
  doTweenX('creditX', 'credit', 953, 1, 'expoOut')
 end
    
 if curStep == 64 then
  timeBeats = 1
 end
    
 if curStep == 96 then
  timeBeats = 9999
  zoomStrenght = 0
  fastBeat = true
 end
 
 if curStep == 112 then
  fastBeat = false
  veryFastBeat = true
 end
 
 if curStep == 120 then
  veryFastBeat = false
  timeBeats = 2
  zoomStrenght = 1
  doTweenX('creditX', 'credit', 1300, 1, 'expoIn')
 end
 
 if curStep == 260 or curStep == 292 or curStep == 356 then
  veryFastBeat = true
 end
 
 if curStep == 268 or curStep == 294 or curStep == 358 then
  veryFastBeat = false
 end
 
 if curStep == 384 then
  center = true
  setProperty('defaultCamZoom', 0.7)
  timeBeats = 1
 end
 
 if curStep == 636 then
  doTweenZoom('gameZoom', 'camGame', 1.3, 2, 'quadInOut')
  doTweenAlpha('blackBoxAlpha', 'blackBox', 1, 2, 'quadOut')
  center = false
 end
 
 if curStep == 659 then
  setProperty('defaultCamZoom', 1.3)
 end
 
 if curStep == 640 or curStep == 644 or curStep == 648 or curStep == 651 or curStep == 654 or curStep == 656 or curStep == 660 or curStep == 664 or curStep == 667 or curStep == 670 or curStep == 672 or curStep == 676 or curStep == 680 or curStep == 683 or curStep == 688 or curStep == 692 or curStep == 696 or curStep == 699 or curStep == 702 or curStep == 705 or curStep == 708 or curStep == 710 or curStep == 714 or curStep == 718 or curStep == 721 or curStep == 724 or curStep == 727 or curStep == 730 or curStep == 733 or curStep == 736 or curStep == 739 or curStep == 742 or curStep == 745 or curStep == 748 or curStep == 751 or curStep == 754 or curStep == 757 or curStep == 760 or curStep == 763 or curStep == 766 or curStep == 769 or curStep == 772 or curStep == 775 or curStep == 778 or curStep == 781 or curStep == 784 or curStep == 787 or curStep == 790 or curStep == 793 or curStep == 796 or curStep == 799 or curStep == 802 or curStep == 805 or curStep == 808 or curStep == 811 or curStep == 814 or curStep == 817 or curStep == 820 or curStep == 823 or curStep == 826 or curStep == 829 or curStep == 832 or curStep == 835 or curStep == 838 or curStep == 841 or curStep == 844 or curStep == 847 or curStep == 850 or curStep == 853 or curStep == 856 or curStep == 859 or curStep == 862 or curStep == 865 or curStep == 868 or curStep == 871 or curStep == 874 or curStep == 877 then
  triggerEvent('Add Camera Zoom', 0.035, 0.05)
  if curStep == 640 then
   timeBeats = 9999
   zoomStrenght = 0
  end
  
  if curStep == 877 then
   timeBeats = 1
   zoomStrenght = 1
  end
 end
 
 if curStep == 880 then
  doTweenZoom('gameZoom', 'camGame', 0.8, 2, 'quadOut')
  doTweenAlpha('blackBoxAlpha', 'blackBox', 0, 2, 'quadOut')
 end
 
 if curStep == 881 then
  center = true
  doTweenAlpha('gfAlpha', 'gf', 1, 1, 'quadOut')
  playAnim('gf', 'enter', false)
  setProperty('gf.specialAnim', true)
  timeBeats = 4
 end
 
 if curStep == 892 then
  playAnim('boyfriend', 'reactions', false)
  setProperty('boyfriend.specialAnim', true)
 end
 
 if curStep == 904 then
  setProperty('defaultCamZoom', 0.7)
 end
 
 if curStep == 912 then
  setProperty('whiteBox.alpha',  1)
  triggerEvent('Change Character', 'GF', 'miniThad')
  playAnim('boyfriend', 'idle', false)
  doTweenAlpha('whiteBoxAlpha', 'whiteBox', 0, 1, 'quadOut')
 end
 
 if curStep == 1040 or curStep == 1044 or curStep == 1048 or curStep == 1051 or curStep == 1054 or curStep == 1056 or curStep == 1060 or curStep == 1064 or curStep == 1067 or curStep == 1070 or curStep == 1072 or curStep == 1076 or curStep == 1080 or curStep == 1083 or curStep == 1088 or curStep == 1092 or curStep == 1096 or curStep == 1099 or curStep == 1102 or curStep == 1105 or curStep == 1108 or curStep == 1110 or curStep == 1114 or curStep == 1118 or curStep == 1121 or curStep == 1124 or curStep == 1127 or curStep == 1130 or curStep == 1133 or curStep == 1136 or curStep == 1139 or curStep == 1142 or curStep == 1145 or curStep == 1148 or curStep == 1151 or curStep == 1154 or curStep == 1157 or curStep == 1160 or curStep == 1163 or curStep == 1166 or curStep == 1169 or curStep == 1172 or curStep == 1175 or curStep == 1180 or curStep == 1183 or curStep == 1186 or curStep == 1189 or curStep == 1192 or curStep == 1195 or curStep == 1198 or curStep == 1201 or curStep == 1204 or curStep == 1207 or curStep == 1210 or curStep == 1213 or curStep == 1216 or curStep == 1219 or curStep == 1222 or curStep == 1225 or curStep == 1228 or curStep == 1231 or curStep == 1234 or curStep == 1237 or curStep == 1240 or curStep == 1243 or curStep == 1246 then
  triggerEvent('Add Camera Zoom', 0.025, 0.03)
  if curStep == 1040 then
   timeBeats = 9999
   zoomStrenght = 0
  end
  
  if curStep == 1246 then
   timeBeats = 1
   zoomStrenght = 1
  end
 end
 
 if curStep == 1248 then
  timeBeats = 9999
  zoomStrenght = 0
  fastBeat = true
 end
 
 if curStep == 1303 then
  fastBeat = false
  veryFastBeat = true
 end
 
 if curStep == 1312 then
  timeBeats = 2
  zoomStrenght = 1
  veryFastBeat = false
  center = true
  setProperty('defaultCamZoom', 0.7)
 end
 
 if curStep == 1440 then
  triggerEvent('Add Camera Zoom', 0.025, 0.015)
  doTweenAlpha('hudAlpha', 'camHUD', 0, 1, 'quadOut')
  doTweenZoom('gameZoom', 'camGame', 1.5, 2, 'quadOut')
  doTweenAlpha('blackBoxFrontAlpha', 'blackBoxFront', 1, 2, 'quadOut')
  playAnim('dad', 'pissed2', false)
  setProperty('dad.specialAnim', true)
  playAnim('boyfriend', 'hey', false)
  setProperty('boyfriend.specialAnim', true)
 end
 
 if curStep % 2 == 0 and fastBeat then
  triggerEvent('Add Camera Zoom', 0.025, 0.015)
 end
 
 if curStep % 1 == 0 and veryFastBeat then
  triggerEvent('Add Camera Zoom', 0.025, 0.015)
 end
end

function onUpdate()
 if followUzi then 
  triggerEvent('Camera Follow Pos', 100, 625)
 elseif followBF then 
  triggerEvent('Camera Follow Pos', 700, 580)
 elseif center then 
  triggerEvent('Camera Follow Pos', 450, 540)
 else 
  triggerEvent('Camera Follow Pos', '', '') 
 end
end

function onUpdatePost()
 for i=0, getProperty('notes.length')-1 do
  if getPropertyFromGroup('notes', i, 'noteType') == 'GF Sing' then
   setPropertyFromGroup('notes', i, 'x', -9999)
  end
 end
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
 if noteType == 'GF Sing' then
  if direction == 0 then
   offX = 35
   offY = 35
  elseif direction == 1 then
   offX = 38
   offY = 35
  elseif direction == 2 then
   offX = 36
   offY = 34
  elseif direction == 3 then
   offX = 35
   offY = 35
  end
  
  setPropertyFromGroup('opponentStrums', direction, 'animation.name', 'static')
  setPropertyFromGroup('opponentStrums', direction, 'offset.x', offX)
  setPropertyFromGroup('opponentStrums', direction, 'offset.y', offY)
 end
end

function onBeatHit()
 if curBeat % timeBeats == 0 then
  triggerEvent('Add Camera Zoom', 0.015 * zoomStrenght, 0.03 * zoomStrenght)
 end
end