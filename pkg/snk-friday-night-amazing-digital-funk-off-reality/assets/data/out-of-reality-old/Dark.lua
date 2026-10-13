function onCreate()
	makeLuaSprite('flaash', 'black', 1100, 800);
	setProperty('flaash.scale.x',12.2)
	setProperty('flaash.scale.y',12.2)
	setProperty('flaash.alpha', 0)
    addLuaSprite('flaash', false);
    
	
	setObjectOrder('flaash', 13);
	setObjectOrder('boyfriendGroup', 15);
	setObjectOrder('dadGroup', 14);
	setObjectOrder('girlfriendGroup', 12);	
	setProperty('camHUD.alpha', 2)
end

function onStepHit()
if curStep == 769 then
doTweenAlpha('owo', 'flaash', 1, 0.5, 'linear');
doTweenAlpha('GUItOOaaoooooween', 'scoreTxt', 0, 0.5, 'linear');
end
if curStep == 1088 then
setProperty('flaaash.alpha', 0);
setProperty('flaash.alpha', 0);
setProperty('camHUD.alpha', 1)
setProperty('scoreTxt.alpha', 0.5)
end
if curStep == 1472 then
doTweenAlpha('owo', 'flaash', 1, 0.5, 'linear');
doTweenAlpha('GUItOOaaoooooween', 'scoreTxt', 0, 0.5, 'linear');
end
if curStep == 1600 then
setProperty('flaaash.alpha', 0);
setProperty('flaash.alpha', 0);
setProperty('camHUD.alpha', 1)
setProperty('scoreTxt.alpha', 0.5)
end
end