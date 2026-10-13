
function onStepHit()

   if curStep == 192 then
		doTweenZoom('cameraW', 'camGame', (math.sin(0.7)*1), 5, 'linear')
		doTweenAngle('turn', 'camGame', (math.sin(80)*7), 4, 'circOut')
                setProperty('sss.alpha', 0)
      end
end

function onTweenCompleted(tag)
  if tag == 'cameraW' then
                doTweenZoom('camera', 'camGame', (math.sin(1.1)*1), 5, 'linear')
    end
  if tag == 'camera' then
		doTweenZoom('cameraW', 'camGame', (math.sin(0.65)*1), 3, 'linear')
    end
  if tag == 'turn' then
		doTweenAngle('tur', 'camGame', (math.sin(50)*-7), 4, 'circOut')
  end
  if tag == 'tur' then
		doTweenAngle('turn', 'camGame', (math.sin(50)*7), 4, 'circOut')
  end
   if tag == 'flThw' then
                	doTweenAlpha('flTjw','text',0,1,'linear')
end
end

