function onCreate()
-- Stage1
	makeLuaSprite('backstage', 'BG/bg1', 0, 0);
	setLuaSpriteScrollFactor('backstage', 1, 1);
	scaleObject('backstage', 2.5, 2.5);
	
	makeLuaSprite('backstage2', 'BG/bg2', 10, 0);
	setLuaSpriteScrollFactor('backstage2', 1, 1);
	scaleObject('backstage2', 2.5, 2.5);

	makeLuaSprite('BG_Lights', 'A_lights', 0, 0);
	setLuaSpriteScrollFactor('BG_Lights', 1, 1);
	scaleObject('BG_Lights', 4.0, 4.0);
	 
    makeAnimatedLuaSprite('Line', 'BG/Line',-250, 0);
    scaleObject('Line', 3.0, 3.0);


	addLuaSprite('backstage', false);
	addLuaSprite('backstage2', false);
	addLuaSprite('BG_Lights', true);
  addLuaSprite('Line', true);
  addAnimationByPrefix('Line','idle','lines 인스턴스 1',24,true);
 
 -- Stage 2
	makeLuaSprite('fnaf', 'BG/negro', -500, -300);
	setLuaSpriteScrollFactor('fnaf', 0.9, 0.9);


	addLuaSprite('fnaf', false);
setProperty('fnaf.visible', false);
end
function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == '1' then
--stage1	
 setProperty('backstage.visible', true);
	setProperty('backstage2.visible', true);
	setProperty('BG_Lights.visible', true);
	setProperty('Line.visible', true);
--stage2	
	setProperty('fnaf.visible', false);
		end
		if value1 == '2' then
--stage1	
 setProperty('backstage.visible',false);
	setProperty('backstage2.visible', false);
	setProperty('BG_Lights.visible', true);
	setProperty('Line.visible', false);
--stage2	
	setProperty('fnaf.visible', true);
		end
	end
end
-- dsa

function onCreatePost()
	if not isStoryMode then
    setProperty("BotplayTxt.visible",false)

      makeLuaSprite('TimeBarBG','timeBar',defaultOpponentStrumX0,getProperty('timeBar.y'))
      setObjectCamera('TimeBarBG','hud')
      addLuaSprite('TimeBarBG')
      -----------------------
      makeLuaSprite('TimeBar',nil,getProperty('TimeBarBG.x')+4,getProperty('TimeBarBG.y')+4)
      makeGraphic('TimeBar',getProperty('TimeBarBG.width')-8,getProperty('TimeBarBG.height')-8,'00EC00')
      setObjectCamera('TimeBar','hud')
      addLuaSprite('TimeBar')
      -----------------------
      setProperty('TimeBar.visible',false)
      setProperty('timeTxt.visible',false)
      -----------------------
      makeLuaText('TimeTxt',string.upper(songName),0,getProperty('TimeBarBG.x')+12,getProperty('TimeBarBG.y')+2)
      setTextBorder('TimeTxt',1,'000000')
      setTextSize('TimeTxt',12)
      addLuaText('TimeTxt')

      setObjectCamera('TimeTxt','hud')
      setProperty('camHUD.visible',true)
	end
            -----------------------
			if isStoryMode then
				setProperty("BotplayTxt.visible",false)
				setTextColor('scoreTxt','DD0000')
				makeLuaSprite('TimeBarBG','timeBar',defaultOpponentStrumX0,getProperty('timeBar.y'))
				setObjectCamera('TimeBarBG','hud')
				addLuaSprite('TimeBarBG')
				-----------------------
				makeLuaSprite('TimeBar',nil,getProperty('TimeBarBG.x')+4,getProperty('TimeBarBG.y')+4)
				makeGraphic('TimeBar',getProperty('TimeBarBG.width')-8,getProperty('TimeBarBG.height')-8,'00EC00')
				setObjectCamera('TimeBar','hud')
				addLuaSprite('TimeBar')
				-----------------------
				setProperty('TimeBar.visible',false)
				setProperty('timeTxt.visible',false)
				-----------------------
				makeLuaText('TimeTxt',string.upper(songName),0,getProperty('TimeBarBG.x')+12,getProperty('TimeBarBG.y')+2)
				setTextBorder('TimeTxt',1,'000000')
				setTextSize('TimeTxt',12)
				addLuaText('TimeTxt')
		  
				setObjectCamera('TimeTxt','hud')
				setProperty('TimeBar.x',getProperty('TimeBar.x')+30)
				setProperty('TimeTxt.x',getProperty('TimeTxt.x')+30)
				setProperty('TimeBarBG.x',getProperty('TimeBarBG.x')+30)
				setProperty('camHUD.visible',true)
					  -----------------------
  end
end

  function onCountdownTick(swagCounter)
      setObjectCamera('countdownGo','other')
      setObjectCamera('countdownSet','other')
      setObjectCamera('countdownReady','other')
  end

  function onUpdate(elapsed)
      setProperty('timeBar.alpha',0)
      
      if getProperty('timeBar.percent')>0 then
          setProperty('TimeBar.visible',true)
      setGraphicSize('TimeBar',(getProperty('TimeBarBG.width')-8)*(getProperty('timeBar.percent')/100),getProperty('TimeBarBG.height')-8)
      end
  end