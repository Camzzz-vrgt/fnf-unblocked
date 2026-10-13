function onUpdate(elapsed)
	if dadName == 'expunged' then --replace the name for your character name
	  if curStep >= 0 then
  
		songPos = getSongPosition()
  
		local currentBeat = (songPos/1000)*(bpm/200)
  
		doTweenY(dadTweenY, 'dad', 400 -190*math.sin((currentBeat*1.25)*math.pi),1.001)
  
	  end
	end
end

function opponentNoteHit(id,data,type,sus)
	triggerEvent('Screen Shake','0.1, 0.01','0.05, 0.01')
end

function onCreatePost()
    addVCREffect('camgame')
    addVCREffect('camhud', false)
end


