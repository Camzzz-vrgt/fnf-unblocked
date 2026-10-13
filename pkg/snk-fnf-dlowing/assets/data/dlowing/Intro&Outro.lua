function onUpdate(elapsed)
end

function onTweenCompleted(tag)
if tag == 'zoomin' then
setProperty('defaultCamZoom', 1.2)
setProperty('opponentCameraOffset.x', 0)
end
end

function onCreatePost()
    makeLuaSprite('void','black', 0, 0)
	setGraphicSize('void',1280,720)
	setObjectCamera('void','camHud')
	updateHitbox('void')
	setBlendMode('void','multiply')
    addLuaSprite('void', false);
    setProperty('void.visible', true);
end

function onStepHit()
   if curStep == 1 then
      doTweenAlpha('black', 'void',0,5, 'linear');
   end
   if curStep == 1280 then
      doTweenAlpha('hudalpha', 'camHUD',0,5, 'linear');
   end
end

ending = true
function onEndSong()
    if ending and isStoryMode then
          ending = false
           followchars = false
           setObjectOrder('gfGroup', getObjectOrder('dadGroup')+4)
           playSound('Walking',1,'Walk')    
           runTimer('endSong',10)
           runTimer('yarlowloop',2)
           runTimer('bfloop',0.5)
           runTimer('camgobyebye',5.5)          
           playAnim('gf', 'idle-loop', true);
           doTweenZoom('zoomin', 'camGame', 1.1, 25, 'quadInOut')
          return Function_Stop;
    end
    if ending == false then
      return Function_Continue
    end
end

function onTimerCompleted(tag)
if tag == 'endSong' then
endSong(true)
end
if tag == 'yarlowloop' then
triggerEvent('Play Animation','confused-loop', 'dad')
end
if tag == 'bfloop' then
triggerEvent('Play Animation','idle-loop-post', 'bf')
end
if tag == 'camgobyebye' then
doTweenAlpha('hudalpha', 'camGame',0,0.1, 'linear');
end
end

beatHitFuncs = { 
	[343] = function()
	doTweenX('walks', 'gf', 1150, 4.3, 'sineInOut')
	end,
	}

function onBeatHit()
	if beatHitFuncs[curBeat] then 
		beatHitFuncs[curBeat]()
	end
end