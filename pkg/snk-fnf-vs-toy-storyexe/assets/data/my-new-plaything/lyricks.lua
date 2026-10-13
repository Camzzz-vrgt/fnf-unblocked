function onCreatePost()
    makeLuaSprite('upBarrGr', 'empty', 0, -450)
	makeGraphic('upBarrGr', 1400, 200, '000000')
	setObjectCamera('upBarrGr', 'camOther')
	addLuaSprite('upBarrGr', true)

	makeLuaSprite('downBarrGr', 'empty', 0, 720)
	makeGraphic('downBarrGr', 1400, 250, '000000')
	setObjectCamera('downBarrGr', 'camOther')
	addLuaSprite('downBarrGr', true)

    makeLuaText('text', '',0,600,500)
	setObjectCamera('text', 'camOther')
    setTextBorder('text', 2, '000000')
	setTextSize('text', 50)
	addLuaText('text',true)
    setProperty('text.alpha',0)

end   
function onStartCountdown(elapsed)

   if swiningcamera==true then 
	doTweenAngle('turn', 'camGame', 1.5, crochet/300, 'sineInOut')
	doTweenAngle('camturn', 'camHUD', -1.5, crochet/300, 'sineInOut')
   end
end

function onTweenCompleted(t)
    if swiningcamera==true then  
	if t == 'turn' then
		doTweenAngle('turn1', 'camGame', -1.5, crochet/300, 'sineInOut')
		doTweenAngle('camturn1', 'camHUD', 1.5, crochet/300, 'sineInOut')
	end
	if t == 'turn1' then
		doTweenAngle('turn', 'camGame', 1.5, crochet/300, 'sineInOut')
		doTweenAngle('camturn', 'camHUD', -1.5, crochet/300, 'sineInOut')
	end
    end
end

local defaultHudX = 0
local camHudAngle = 0
function onUpdate(elapsed)
    if curStep==390 then

        doTweenZoom('screenZoom2', 'camGame',1, 2.9, 'circInOut');
        triggerEvent('Flashes Camera','0.6','')
    end       
    if curStep==397 then
        setTextString('text','we')
    end    
    if curStep==398 then
        doTweenAlpha('alpha1', 'text', 1, 1, 'linear')
    end       
    if curStep==405 then
        setTextString('text','we Toy s')
        setProperty('text.x',450)
    end    
    if curStep==410 then
        setTextString('text','we Toy s Can')
    end    
    if curStep==420 then
        setProperty('text.x',440)
        setTextString('text','we Toy s Can Se')
    end    
    if curStep==425 then
        setTextString('text','we Toy s Can Se \nEverything')
    end    
    if curStep==435 then
        doTweenAlpha('alph2d', 'text', 0, 1, 'linear')
    end    
    if curStep== 390 then
        doTweenY('downMovexd', 'downBarrGr', 580, 1, 'CircInOut')
        doTweenY('upMovexd', 'upBarrGr', 0, 1, 'CircInOut')
    end     
    if curStep==447 then
        doTweenY('downMovexd2', 'downBarrGr', 900, 1, 'CircInOut')
        doTweenY('upMovexd2', 'upBarrGr', -500, 1, 'CircInOut')
    end     
    if curStep==2659 then
        doTweenAlpha('alph2asads', 'text', 1, 1, 'linear')
        setProperty('text.y',400)
        setTextString('text','To be continued....')
       setProperty('camHUD.alpha',0)
    end    


   
    
end