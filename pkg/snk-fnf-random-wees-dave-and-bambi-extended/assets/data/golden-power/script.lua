function onUpdate(elapsed)
	if dadName == 'golden tristan' then --replace the name for your character name
	  if curStep >= 0 then
  
		songPos = getSongPosition()
  
		local currentBeat = (songPos/1000)*(bpm/200)
  
		doTweenY(dadTweenY, 'dad', 50 -30*math.sin((currentBeat*1.25)*math.pi),1.001)
		
  
  
	  end
	end
end



