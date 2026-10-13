enabled = true
StartOn = 1
EndOn = 120000
function onStepHit()
	if curStep == StartOn then
	
		doTweenAngle('turn', 'camGame', 2.5, crochet/200, 'sineInOut')
		
	end
	
	if curStep == EndOn then
		enabled = false
	end
end

function onTweenCompleted(t)
	if enabled then
		if t == 'turn' then
			doTweenAngle('turn1', 'camGame', -2.5, crochet/200, 'sineInOut')
		end
		if t == 'turn1' then
			doTweenAngle('turn', 'camGame', 2.5, crochet/200, 'sineInOut')
		end
	else
		doTweenAngle('turn3', 'camGame', 0, crochet/200, 'sineInOut')
	end
end  
function onUpdate()
 if curStep==0 then
	setProperty('dad.color','00000')
	setProperty('camGame.alpha',0.6)
	crearBGNegro()
 end	
 if curStep==230 then
	doTweenAlpha('alpha2a','Blackbg', 0, 2, 'linear')
 end	
 if curStep==580 then
	doTweenAlpha('alpha2a2','camGame', 1, 2, 'linear')
	doTweenColor('badapplexd3', 'boyfriend', 'FFFFFF', 1, 'linear')
	doTweenColor('badapplexd4', 'dad', 'FFFFFF', 1, 'linear')
	doTweenColor('badapplexd5', 'gf', 'FFFFFF', 1, 'linear')

 end	
 if curStep==2624 then
	doTweenAlpha('alpha2ascaa','Blackbg', 1, 2, 'linear')
 end

end
function crearBGNegro()
    makeLuaSprite('Blackbg', '', 0, 0)
    setScrollFactor('Blackbg', 0, 0)
    makeGraphic('Blackbg', screenWidth+300, screenHeight+300, '000000')
    addLuaSprite('Blackbg', true)
    screenCenter('Blackbg','X')
    screenCenter('Blackbg','Y')
end
