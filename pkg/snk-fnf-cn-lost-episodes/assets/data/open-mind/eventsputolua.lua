verdaderoofalso=false
function onCreate()
   verdaderoofalso=true

   crearBGNegro()

   makeAnimatedLuaSprite('1lol', 'billy/mandy', getProperty('boyfriendGroup.x')+460, getProperty('boyfriendGroup.y')+40);
   addAnimationByPrefix('1lol', 'idle', 'mandy idle',24,true)
   addLuaSprite('1lol')
   objectPlayAnimation('1lol','idle',false)
   scaleObject('1lol',1,1);

      
   setObjectOrder('whitebg',0)
   setObjectOrder('gfGroup',1)
   setObjectOrder('boyfriendGroup',2)
   setObjectOrder('dadGroup',3)
   setObjectOrder('1lol',4)
   setObjectOrder('Blackbg',5)
end    
function negreadoevento()-- evento del coso ese negro de los personajes          
    makeLuaSprite('whitebg', '', 0, 0)
    makeGraphic('whitebg', screenWidth+2000, screenHeight+2000, 'FFFFFF')
    addLuaSprite('whitebg', false)
    screenCenter('whitebg','X')
    screenCenter('whitebg','Y')

    if verdaderoofalso==true then
     setProperty('whitebg.alpha',0)
     doTweenAlpha('applebadxd69', 'whitebg', 1, 1, 'linear')
     doTweenColor('badapplexd', 'boyfriend', '000000', 1, 'linear')
	 doTweenColor('badapplexd1', 'dad', '000000', 1, 'linear')
	 doTweenColor('badapplexd2', 'gf', '000000', 1, 'linear')
    doTweenColor('badapplexdada2', '1lol', '000000', 1, 'linear')
	 doTweenColor('badapplexd6', 'healthBar', getColorFromHex('D8D8D8'), 1, 'linear')
	 doTweenColor('iconocolor1', 'iconP1',getColorFromHex('D8D8D8'), 1, 'linear')
	 doTweenColor('iconocolor2', 'iconP2',getColorFromHex('D8D8D8'), 1, 'linear')
    elseif verdaderoofalso==false then
        doTweenAlpha('applebadxd', 'whitebg', 0, 1, 'linear')
		doTweenColor('badapplexd3', 'boyfriend', 'FFFFFF', 1, 'linear')
		doTweenColor('badapplexd4', 'dad', 'FFFFFF', 1, 'linear')
		doTweenColor('badapplexd5', 'gf', 'FFFFFF', 1, 'linear')
      doTweenColor('badapplexadadd5', '1lol', 'FFFFFF', 1, 'linear')
		doTweenColor('badapplexd7', 'healthBar', 'FFFFFF', 1, 'linear')
		doTweenColor('badapplexd101', 'iconP1', 'FFFFFF', 1, 'linear')
		doTweenColor('badapplexd11', 'iconP2', 'FFFFFF', 1, 'linear')

		if getProperty('whitebg.alpha')=="0" then
			removeLuaSprite('whitebg',true)
		end	

    end    
end    
function crearBGNegro()
    makeLuaSprite('Blackbg', '', 0, 0)
    setScrollFactor('Blackbg', 0, 0)
    makeGraphic('Blackbg', screenWidth+2000, screenHeight+2000, '000000')
    addLuaSprite('Blackbg', true)
    screenCenter('Blackbg','X')
    screenCenter('Blackbg','Y')
    if verdaderoofalso == true then
        runTimer('nosepudodea',0.01)
    elseif verdaderoofalso==false then
        runTimer('PORFIN',0.01)
    end   
end
function onTimerCompleted(tag)
  if tag=="PORFIN" then
    setProperty('Blackbg.alpha',1)
     doTweenAlpha('alpha2a','Blackbg', 0, 1, 'linear')
  end  
  if tag=="nosepudodea"then
    setProperty('Blackbg.alpha',0)
     doTweenAlpha('alpha1w3','Blackbg', 1, 0.5, 'linear')  
  end  
end
 

function onUpdate(elapsed)

    if curStep==256 then
        doTweenZoom(zoomlol,'camGame',tonumber(1),tonumber(1.5),'sineInOut')
        cameraFlash('camHUD','FFFFFF', 0.8,false)
    end    
    if curStep==288 then
        cameraFlash('camHUD','FFFFFF', 0.8,false)
    end    
  if curStep==190 then
     crearBGNegro()
     verdaderoofalso=false
 end  
 if curStep==320 then
    doTweenZoom(zoomlol,'camGame',tonumber(0.8) , tonumber(1) , 'sineInOut')
    cameraFlash('camHUD','FFFFFF', 0.8,false)
 end 
 if curStep==352 then
    cameraFlash('camHUD','FFFFFF', 0.8,false)
 end   
 if curStep==384 then
    cameraFlash('camHUD','FFFFFF', 0.8,false)
 end   

 if curStep==10 then
    setProperty("cameraSpeed",1)
 end   

 if curStep==736 then
    setProperty('camHUD.alpha',0)
 end   
 if curStep==740 then
  
    doTweenZoom(zoomlol,'camGame',tonumber(0.8) , tonumber(1) , 'sineInOut')
    verdaderoofalso=true
    negreadoevento()
    setProperty("cameraSpeed",2)
 end  

 if curStep==827 then
    doTweenAlpha('alphaadjsakda','camHUD', 1, 1, 'linear')  
 end   
 if curStep==886 then
    verdaderoofalso=false
    negreadoevento()
 end
 if curStep==1570 then
    verdaderoofalso=true
    negreadoevento()
    doTweenZoom(zoomlol,'camGame',tonumber(1.2) , tonumber(1) , 'sineInOut')
 end
 if curStep==2096 then
    
    crearBGNegro()
    verdaderoofalso=true;
 end


end    

function onTweenCompleted(name)
    if name == zoomlol then
     setProperty("defaultCamZoom",getProperty('camGame.zoom'));    
    end
end