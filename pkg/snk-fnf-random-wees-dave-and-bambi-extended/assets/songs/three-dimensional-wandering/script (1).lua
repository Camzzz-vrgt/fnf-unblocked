function onUpdate(elapsed)
	if bfName == 'bf3d' then --replace the name for your character name
	  if curStep >= 0 then
  
		songPos = getSongPosition()
  
		local currentBeat = (songPos/1000)*(bpm/200)
  
		doTweenY(bfTweenY, 'bf', -100-110*math.sin((currentBeat*1.25)*math.pi),1.001)
  
	  end
	end
end
