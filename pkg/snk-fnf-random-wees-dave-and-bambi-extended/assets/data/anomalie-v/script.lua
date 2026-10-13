function onUpdate(elapsed)
	if dadName == 'vicente' then --replace the name for your character name
	  if curStep >= 0 then
  
		songPos = getSongPosition()
  
		local currentBeat = (songPos/1000)*(bpm/200)
  
		doTweenY(dadTweenY, 'dad', 300-110*math.sin((currentBeat*1.25)*math.pi),1.001)
  
	  end
	end
end

