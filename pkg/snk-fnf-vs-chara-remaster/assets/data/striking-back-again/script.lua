local xx = 630;
local yy = 403;
local xx2 = 900
local yy2 = 403;
local ofs = 20;
local followchars = true;

local del = 0;
local del2 = 0;

local beating = false;
local nightofnights = false;

function onCreatePost()
    triggerEvent('Camera Follow Pos',xx,yy)
end

function onCreate()
    setProperty('camHUD.visible', false);
    makeLuaSprite('red','redbg', -600, -400)
	makeLuaSprite('flash','Flash', 0, 0)
	makeLuaSprite('flashwhite','flashwhite', 0, 0)
	makeLuaSprite('csdown','cutscene1', 0, 0)
	makeLuaSprite('csup','cutscene2', 0, 0)
	makeLuaSprite('load','loaded', 0, 0)
	
	
	addLuaSprite('pinky')
	addLuaSprite('pinky2')
	addLuaSprite('SCheart')
	
	addLuaSprite('flash')
	addLuaSprite('flashwhite')
	addLuaSprite('red')
	
	addLuaSprite('csup')
	addLuaSprite('csdown')
	addLuaSprite('load')
	
	setProperty('red.alpha', 0);
	setProperty('flash.alpha', 0);
	setObjectCamera('flash', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	setProperty('csup.alpha', 1);
	setObjectCamera('csup', 'other');
	setProperty('csdown.alpha', 1);
	setObjectCamera('csdown', 'other');
	setProperty('load.alpha', 0);
	setObjectCamera('load', 'other');
	
	makeLuaSprite('Name','strikingback', -500, 100)
	addLuaSprite('Name')
	setObjectCamera('Name', 'hud');
	scaleObject('Name',0.75,0.75)
end

function onBeatHit()
    if curBeat % 2 == 0 then
	    if sv == true then
		setProperty('camFollowPos.x',xx)
        setProperty('camFollowPos.y',yy)
        triggerEvent('Camera Follow Pos',xx2,yy2)
		setProperty('load.alpha', 1);
		doTweenAlpha('loadfade', 'load', 0, 0.5, 'linear');
        end
		if nightofnights == true then
		 triggerEvent('Add Camera Zoom', 0.025, 0.045)
		 triggerEvent('Screen Shake','0.01, 0.01','0.1, 0.01');
		end
	end
end

function onStepHit()
   if curStep == 256 then
		doTweenX('NameTweenX', 'Name', 0, 2, 'CircInOut');
		runTimer('nameout', 5);
   end

   if curStep == 256 or curStep == 768 or curStep == 1792 or curStep == 2560 or curStep == 4000 then
   flash()
   end
   if curStep == 256 then
   setProperty('camHUD.visible', true);
   setObjectCamera('csup', 'hud');
   setObjectCamera('csdown', 'hud');
   end
   if curStep == 2304 then
   doTweenAlpha('flashdown', 'flashwhite', 0, 0.5, 'linear');
   end
   if curStep == 4640 then
   setProperty('flash.alpha', 1);
   end
   if curStep == 2560 or curStep == 2944 or curStep == 4000 then
   flash()
   changeon()
   end
   if curStep == 2816 or curStep == 3072 or curStep == 4256 then
   flash()
   changeoff()
   end
   if curStep == 9999 then
   setProperty('flash.alpha', 0);
   flash()
   end
   if curStep == 256 or curStep == 2560 then
   nightofnights = true;
   end
   if curStep == 2304  then
   nightofnights = false;
   end
   if curStep == 1792 or curStep == 4000 then
   cuton()
   end
   if curStep == 1536 or curStep == 3391 or curStep == 9999 or curStep == 9999 then
   cutoff()
   end
   if curStep == 3250 then
   sv = true;
   end
   if curStep == 3327 then
   sv = false;
   end
   if curStep == 1024 or curStep == 1536 or curStep == 4000 then
   xx = 750;
   yy = 375;
   xx2 = 750
   yy2 = 375;
   triggerEvent('Camera Follow Pos',xx,yy)
   end
   if curStep == 1280 or curStep == 1792 or curStep == 9999 then
   xx = 630;
   yy = 375;
   xx2 = 900
   yy2 = 375;
   triggerEvent('Camera Follow Pos',xx,yy)
   end
   if curStep == 9999 then
   setProperty('camHUD.visible', false);
   doTweenAlpha('endfade', 'flash', 1, 5, 'linear');
   end
end

function flash()
    setProperty('flashwhite.alpha', 0.7);
	doTweenAlpha('flashdown', 'flashwhite', 0, 0.5, 'linear');
end

function flashdark()
    setProperty('flash.alpha', 1);
	doTweenAlpha('flashdowndark', 'flash', 0, 1.5, 'linear');
end

function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'nameout' then
	doTweenX('NameTweenX2', 'Name', -500, 2, 'CircInOut');
    end
end

function cuton()
    doTweenY('CSUPY', 'csup', 0, 1, 'CircInOut');
    doTweenY('SCDOWNY', 'csdown', 0, 1, 'CircInOut');
end

function cutoff()
    doTweenY('CSUPYend', 'csup', -100, 1, 'CircInOut');
    doTweenY('SCDOWNYend', 'csdown', 100, 1, 'CircInOut');
end

function changeon()
    xx = 900;
    yy = 403;
    xx2 = 630;
    yy2 = 403;
    setCharacterX('dad', 900);
	setCharacterY('dad', 100);
	setCharacterX('bf', 180.45);
	setCharacterY('bf', 20);
	triggerEvent('Change Character', 1, 'chara-change');
	triggerEvent('Change Character', 0, 'bf-change');
end

function changeoff()
    xx = 630;
    yy = 403;
    xx2 = 900;
    yy2 = 403;
    setCharacterX('dad', 180.45);
	setCharacterY('dad', 100);
	setCharacterX('bf', 900);
	setCharacterY('bf', 20);
	triggerEvent('Change Character', 1, 'chara');
	triggerEvent('Change Character', 0, 'bf');
end

function onUpdate()
	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
        else
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end

function opponentNoteHit()
    triggerEvent('Screen Shake','0.01, 0.01','0.1, 0.0075');
	
    health = getProperty('health')
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.02);
		end
    end