
function onStepHit()

   if curStep == 176 then
		doTweenZoom('cameraW', 'camGame', (math.sin(0.7)*1), 5, 'linear')
		doTweenAngle('turn', 'camGame', (math.sin(80)*7), 4, 'circOut')
                setProperty('sss.alpha', 0)

	   makeLuaSprite('flash', '', 0, 0);
        makeGraphic('flash',1280,720,'ffffff')
	      addLuaSprite('flash', true);
	      setLuaSpriteScrollFactor('flash',0,0)
	      setProperty('flash.scale.x',9)
	      setProperty('flash.scale.y',9)
	      setProperty('flash.alpha',0)
		setProperty('flash.alpha',1)
		doTweenAlpha('flTw','flash',0,1,'linear')


         makeLuaText('text', 'Toothless____', 200, 50, 10) -- change your title text
         setTextSize('text', '50') --text size 
         setTextColor('text', 'FFFFFF') --change color in hex
         setObjectCamera('text', 'other')
         setProperty('text.alpha', 0)
         addLuaText('text', true)
	doTweenAlpha('flThw','text',1,1,'linear')
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

