function onUpdate(elapsed)
	if dadName == 'dave3d' then --replace the name for your character name
	  if curStep >= 0 then
  
		songPos = getSongPosition()
  
		local currentBeat = (songPos/1000)*(bpm/200)
  
		doTweenY(dadTweenY, 'dad', -100-110*math.sin((currentBeat*1.25)*math.pi),1.001)
  
	  end
	end
end

function opponentNoteHit(id,data,type,sus)
	triggerEvent('Screen Shake','0.1, 0.01','0.01, 0.01')
end


