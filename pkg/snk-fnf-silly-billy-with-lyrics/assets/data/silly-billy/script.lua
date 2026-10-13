function onCreate()
    --97a0fc
	--5b0013
	--3516e3
	makeLuaSprite('textbox', 'textbox', 0, 590);
	setObjectCamera('textbox', 'other');
	scaleObject('textbox', 1.05, 1.05);
	screenCenter('textbox', 'x');
	addLuaSprite('textbox');
	makeLuaSprite('textbox2', 'textboxblue', 0, 590);
	setObjectCamera('textbox2', 'other');
	scaleObject('textbox2', 1.05, 1.05);
	screenCenter('textbox2', 'x');
	addLuaSprite('textbox2');
    setProperty('textbox2.alpha', 0.001);	
	addCharacterToList('lyric', 'dad');
	setProperty('iconP1.visible', false);
	setProperty('iconP2.visible', false);
	startVideo('open');
end

function onCreatePost()
    setProperty('bars.visible', false);
end

function onEvent(name, value1, value2)
    if name == 'ill make' and value1 == 'anim' then
	   triggerEvent('Change Character', 'dad', 'lyric');
	   playAnim('dad', 'story_of_mytalebilly');
	   end
    if name == 'ill make' and value1 == 'vid' then
	   setProperty('textbox2.alpha', 1);
	   removeLuaSprite('textbox', true);	
       setProperty('camGame.visible', false);
       setProperty('camHUD.visible', false);		   
	   end	 	   
end

function onStepHit()
    if curStep == 3888 then
	   triggerEvent('Change Character', 'dad', 'evilLookalike');
	   setProperty('dad.color', getColorFromHex('97a0fc'));
	   setProperty('boyfriend.color', getColorFromHex('97a0fc'));
       setProperty('camGame.visible', true);
       setProperty('camHUD.visible', true);	
       setProperty('camHUD.alpha', 1);	   
       end
end	