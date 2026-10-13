defaultCamZoomAdd = 0
function onCreate()
    makeLuaSprite('mirror2', 'bg/broken_mirror');
	addLuaSprite('mirror2');
	
    makeLuaSprite('mirror', 'bg/silly_mirror');
	addLuaSprite('mirror');
	
    makeAnimatedLuaSprite('sprite', 'bg/bgAssets');
	addAnimationByPrefix('sprite', 'i', 'Silly_floor');
	addLuaSprite('sprite');	
	
    makeAnimatedLuaSprite('sprite2', 'bg/bgAssets');
	addAnimationByPrefix('sprite2', 'i', 'Silly_idk_1');
	addLuaSprite('sprite2');	

    makeAnimatedLuaSprite('sprite3', 'bg/bgAssets');
	addAnimationByPrefix('sprite3', 'i', 'Silly_idk_2');
	addLuaSprite('sprite3');	
	
    setProperty('skipCountdown', true);	
end

function onCreatePost()
    makeLuaSprite('vag', 'vignette');
    setObjectCamera('vag', 'camHUD');
    addLuaSprite('vag');

    makeLuaSprite('bars', 'bars');
    setObjectCamera('bars', 'camHUD');
    addLuaSprite('bars');	
end

function onMoveCamera(focus)
    if not camZoomLock then
    if focus == 'dad' then
	   setProperty('defaultCamZoom', 0.625 + defaultCamZoomAdd);
	   else
	   setProperty('defaultCamZoom', 0.5);
	   end
	end
end

function onEvent(name, value1, value2)
  if name == '' then
    if value1 == 'zoomin' then
	   defaultCamZoomAdd = value2
	   end
	if value1 == 'hurt' then
	   if getProperty('health') > 0.5 then
	      setProperty('health', getProperty('health') - 0.05);
		  end
		end
    if value1 == 'setZoom' then
	   camZoomLock = true
	   setProperty('defaultCamZoom', value2);
	   end
	if value1 == 'removeLock' then
	   camZoomLock = false
	   end
	end
	if name == 'ill make' then
	if value1 == 'pre' then
	      doTweenAlpha('camHUD', 'camHUD', 0, 2);
		  end
	   if value1 == 'die' then
	      setProperty('camGame.visible', false);
		  setProperty('camHUD.visible', false);
		  end
	   if value1 == 'break mirror' then
	      removeLuaSprite('mirror', true);
    playSound('mirror_break');
    triggerEvent('Screen Shake', '0.25, 0.01');
    end
	end
end


