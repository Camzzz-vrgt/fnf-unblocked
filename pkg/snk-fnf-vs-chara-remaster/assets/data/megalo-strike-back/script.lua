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
	setObjectCamera('csup', 'hud');
	setProperty('csdown.alpha', 1);
	setObjectCamera('csdown', 'hud');
	setProperty('load.alpha', 0);
	setObjectCamera('load', 'other');
	
	makeLuaSprite('Name','megalostrikeback', -500, 100)
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
	    if beating == true then
		 triggerEvent('Add Camera Zoom', 0.015, 0.03)
		end
		if nightofnights == true then
		 triggerEvent('Add Camera Zoom', 0.025, 0.045)
		 triggerEvent('Screen Shake','0.01, 0.01','0.1, 0.01');
		end
	end
end

function onStepHit()
   if curStep == 1 then
   setProperty('camHUD.visible', true);
		doTweenX('NameTweenX', 'Name', 0, 2, 'CircInOut');
		runTimer('nameout', 5);
   end
   if curStep == 2616 or curStep == 2664 then
   setProperty('flash.alpha', 1);
   xx = 430;
   setProperty('camHUD.visible', false);
   end
   if curStep == 2641 then
   flash()
   setProperty('flash.alpha', 0);
   end
   if curStep == 128 or curStep == 607 or curStep == 928 or curStep == 1272 or curStep == 1975 or curStep == 2537 then
   flash()
   end
   if curStep == 2336 then
   setProperty('flash.alpha', 1);
   changeon()
   end
   if curStep == 2537 then
   changeoff()
   end
   if curStep == 2345 then
   setProperty('flash.alpha', 0);
   flash()
   end
   if curStep == 128 or curStep == 9999 then
   beating = true;
   end
   if curStep == 928 then
   nightofnights = true;
   end
   if curStep == 2168  then
   nightofnights = false;
   end
   if curStep == 607 or curStep == 928 then
   cuton()
   end
   if curStep == 800 or curStep == 2168 then
   beating = false;
   end
   if curStep == 1 or curStep == 800 or curStep == 1272 or curStep == 2336 then
   cutoff()
   end
   if curStep == 1208 then
   sv = true;
   end
   if curStep == 1272 then
   sv = false;
   end
   if curStep == 607 or curStep == 1832 or curStep == 1975 then
   xx = 750;
   yy = 375;
   xx2 = 750
   yy2 = 375;
   triggerEvent('Camera Follow Pos',xx,yy)
   end
   if curStep == 800 or curStep == 1848 or curStep == 2168 then
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
    setProperty('flashwhite.alpha', 1);
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