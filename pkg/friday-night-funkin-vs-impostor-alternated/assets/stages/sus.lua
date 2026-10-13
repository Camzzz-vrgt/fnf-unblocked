function onCreatePost();
	if(!isStoryMode){
    setProperty("BotplayTxt.visible",false);
      makeLuaSprite('TimeBarBG','timeBar',defaultOpponentStrumX0,Std.parseFloat(getProperty('timeBar.y')));
      setObjectCamera('TimeBarBG','hud');
      addLuaSprite('TimeBarBG');
      
      makeLuaSprite('TimeBar',nil,getProperty('TimeBarBG.x')+4,Std.parseFloat(getProperty('TimeBarBG.y'))+4);
      makeGraphic('TimeBar',getProperty('TimeBarBG.width')-8,getProperty('TimeBarBG.height')-8,'00EC00');
      setObjectCamera('TimeBar','hud');
      addLuaSprite('TimeBar');
      
      setProperty('TimeBar.visible',false);
      setProperty('timeTxt.visible',false);
      
      makeLuaText('TimeTxt',string.upper(songName),0,getProperty('TimeBarBG.x')+12,Std.parseFloat(getProperty('TimeBarBG.y'))+2);
      setTextBorder('TimeTxt',1,'000000');
      setTextSize('TimeTxt',12);
      addLuaText('TimeTxt');
      setObjectCamera('TimeTxt','hud');
      setProperty('camHUD.visible',true);
	}
			if(isStoryMode){
				setProperty("BotplayTxt.visible",false);
				setTextColor('scoreTxt','DD0000');
				makeLuaSprite('TimeBarBG','timeBar',defaultOpponentStrumX0,Std.parseFloat(getProperty('timeBar.y')));
				setObjectCamera('TimeBarBG','hud');
				addLuaSprite('TimeBarBG');
				
				makeLuaSprite('TimeBar',nil,getProperty('TimeBarBG.x')+4,Std.parseFloat(getProperty('TimeBarBG.y'))+4);
				makeGraphic('TimeBar',getProperty('TimeBarBG.width')-8,getProperty('TimeBarBG.height')-8,'00EC00');
				setObjectCamera('TimeBar','hud');
				addLuaSprite('TimeBar');
				
				setProperty('TimeBar.visible',false);
				setProperty('timeTxt.visible',false);
				
				makeLuaText('TimeTxt',string.upper(songName),0,getProperty('TimeBarBG.x')+12,Std.parseFloat(getProperty('TimeBarBG.y'))+2);
				setTextBorder('TimeTxt',1,'000000');
				setTextSize('TimeTxt',12);
				addLuaText('TimeTxt');
				setObjectCamera('TimeTxt','hud');
				setProperty('TimeBar.x',getProperty('TimeBar.x')+60);
				setProperty('TimeTxt.x',getProperty('TimeTxt.x')+60);
				setProperty('TimeBarBG.x',getProperty('TimeBarBG.x')+60);
				setProperty('camHUD.visible',true);
					  
  }
}
function onCreate();
	
	makeLuaSprite('blue', 'blue', 100, 225);
	setScrollFactor('blue', 1, 1);
	scaleObject('blue', 2.4, 2.0);
	makeAnimatedLuaSprite('purple','purple', 2000, 600);
            addAnimationByPrefix('purple', 'idle', 'purple idle' ,16, true);
            addAnimationByPrefix('purple', 'godehd', 'purple godehd' ,16, true);
            addAnimationByPrefix('purple', 'ektlehdwkr', 'purple ektlehdwkr' ,12, true);
	addLuaSprite('purple', true);
	objectPlayAnimation('purple', 'idle', false);
            setObjectCamera('purple', 'camGame');
	setProperty('purple.alpha', 1);
	scaleObject('purple', 2.8, 2.8);
	makeAnimatedLuaSprite('white','White', -1500, 500);
            addAnimationByPrefix('white', 'idle', 'White idle' ,60, true);
	addLuaSprite('white', true);
	objectPlayAnimation('white', 'idle', false);
            setObjectCamera('white', 'camGame');
	setProperty('white.alpha', 1);
	scaleObject('white', 3.3, 3.3);
	makeAnimatedLuaSprite('white3','white3', 2000, 600);
            addAnimationByPrefix('white3', 'idle', 'white3 idle' ,16, true);
	addLuaSprite('white3', true);
	objectPlayAnimation('white3', 'idle', false);
            setObjectCamera('white3', 'camGame');
	setProperty('white3.alpha', 1);
	scaleObject('white3', 2.8, 2.8);
	makeAnimatedLuaSprite('gray','gray', -1500, 550);
            addAnimationByPrefix('gray', 'idle', 'gray idle' ,16, true);
            addAnimationByPrefix('gray', 'enlehfdkqhr', 'gray enlehfdkqhr' ,12, true);
            addAnimationByPrefix('gray', 'enlehfdkqhrhflema', 'gray enlehfdkqhrhflema' ,16, true);
            addAnimationByPrefix('gray', 'ektldkvqhr', 'gray ektldkvqhr' ,16, true);
            addAnimationByPrefix('gray', 'tlcpqkfrus', 'gray tlcpqkfrus' ,16, true);
            addAnimationByPrefix('gray', 'ehakdcu', 'gray ehakdcu' ,20, true);
            addAnimationByPrefix('gray', 'ehakdeorl', 'gray ehakdeorl' ,26, true);
	addLuaSprite('gray', true);
	objectPlayAnimation('gray', 'idle', false);
            setObjectCamera('gray', 'camGame');
	setProperty('gray.alpha', 1);
	scaleObject('gray', 2.8, 2.8);
	makeAnimatedLuaSprite('yellow','pale yellow', 2000, 600);
            addAnimationByPrefix('yellow', 'idle', 'pale yellow idle' ,16, true);
            addAnimationByPrefix('yellow', 'dkfofhrjer', 'pale yellow dkfofhrjer' ,16, true);
	addLuaSprite('yellow', true);
	objectPlayAnimation('yellow', 'idle', false);
            setObjectCamera('yellow', 'camGame');
	setProperty('yellow.alpha', 1);
	scaleObject('yellow', 2.8, 2.8);
	makeAnimatedLuaSprite('white3','white3', 2000, 600);
            addAnimationByPrefix('white3', 'idle', 'white3 idle' ,16, true);
	addLuaSprite('white3', true);
	objectPlayAnimation('white3', 'idle', false);
            setObjectCamera('white3', 'camGame');
	setProperty('white3.alpha', 1);
	scaleObject('white3', 2.8, 2.8);
	makeAnimatedLuaSprite('coral','coral', 2000, 600);
            addAnimationByPrefix('coral', 'idle', 'coral idle' ,16, true);
            addAnimationByPrefix('coral', 'RkaWkr', 'coral RkaWkr' ,16, true);
	addLuaSprite('coral', true);
	objectPlayAnimation('coral', 'idle', false);
            setObjectCamera('coral', 'camGame');
	setProperty('coral.alpha', 1);
	scaleObject('coral', 2.8, 2.8);
	makeAnimatedLuaSprite('sans','sans', -2000, 0);
            addAnimationByPrefix('sans', 'idle', 'White idle' ,60, true);
	addLuaSprite('sans', true);
	objectPlayAnimation('sans', 'idle', false);
            setObjectCamera('sans', 'camOther');
	setProperty('sans.alpha', 1);
	scaleObject('sans', 4, 4);
	makeAnimatedLuaSprite('light','light', 0, 225);
            addAnimationByPrefix('light', 'idle', 'light idle' ,60, true);
            addAnimationByPrefix('light', 'alt', 'light alt' ,3, true);
	addLuaSprite('light', true);
	objectPlayAnimation('light', 'idle', false);
            setObjectCamera('light', 'camGame');
	setProperty('light.alpha', 1);
	scaleObject('light', 3.0, 3.0);

	if(!lowQuality){
	}
	addLuaSprite('blue', false);
}
function onUpdate();
	if(curStep == 10){
	objectPlayAnimation('purple', 'idle', true);
	}
	if(curStep == 445){
	doTweenX('alphaTweer', 'purple', 1100, 6);
	}
	if(curStep == 522){
	objectPlayAnimation('purple', 'godehd', true);
	}
	if(curStep == 531){
	objectPlayAnimation('purple', 'ektlehdwkr', true);
	}
	if(curStep == 1040){
	objectPlayAnimation('purple', 'idle', true);
	}
	if(curStep == 1040){
	doTweenX('alphaTweer', 'purple', -1500, 5.5);
	}
	if(curStep == 128){
	doTweenX('alphaTweer', 'white3', -1500, 6);
	}
	if(curStep == 406){
	doTweenX('alphaTweer', 'white', 2500, 1.5);
	}
	if(curStep == 256){
	doTweenX('alphaTweer', 'yellow', 800, 6);
	}
	if(curStep == 330){
	doTweenY('alphaTweer', 'yellow', 2000, 3);
	}
	if(curStep == 330){
	objectPlayAnimation('yellow', 'dkfofhrjer', true);
	}
	if(curStep == 620){
	doTweenX('alphaTweer', 'gray', -200, 6);
	}
	if(curStep == 696){
	objectPlayAnimation('gray', 'enlehfdkqhr', true);
	}
	if(curStep == 702){
	objectPlayAnimation('gray', 'enlehfdkqhrhflema', true);
	}
	if(curStep == 894){
	objectPlayAnimation('gray', 'ektldkvqhr', true);
	}
	if(curStep == 898){
	objectPlayAnimation('gray', 'idle', true);
	}
	if(curStep == 898){
	doTweenX('alphaTweer', 'gray', 100, 1.5);
	}
	if(curStep == 920){
	objectPlayAnimation('gray', 'tlcpqkfrus', true);
	}
	if(curStep == 930){
	objectPlayAnimation('gray', 'ehakdcu', true);
	}
	if(curStep == 933){
	objectPlayAnimation('gray', 'ehakdeorl', true);
	}
	if(curStep == 933){
	doTweenX('alphaTweer', 'gray', 2500, 1);
	}
	if(curStep == 760){
	doTweenX('alphaTweer', 'coral', -2000, 7.5);
	}
	if(curStep == 10000){
	doTweenX('alphaTweer', 'sans', 20000, 8);
	}
	if(curStep == 784){
	objectPlayAnimation('light', 'idle', true);
	}
}
function onBeatHit();

}