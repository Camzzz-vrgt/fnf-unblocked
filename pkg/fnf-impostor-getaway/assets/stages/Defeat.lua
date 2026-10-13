local xx = 950; --750
local yy = 1000; --750
local xx2 = 1300; --1500
local yy2 = 1000; --750
local ofs = 30;
local followchars = true;
local del = 0;
local del2 = 0;
local damage = false;
local beating = false;
local beat_skip = 0;
local shake = true;
local runbfX = 1
local runbfY = 1
local noloop = false;
local bestpart = false;

function onCreatePost()--this thing happens once the characters are spawned

    setProperty("gf.visible", false);

end

function onCreate()
	--background boi
	makeLuaSprite('red','redbg', -800, -800)
	makeLuaSprite('flash','Flash', 0, 0)
	makeLuaSprite('darksc','DarkSC', 0, 0)
	makeLuaSprite('flashwhite','flashwhite', 0, 0)
	makeLuaSprite('scenema','cutscene', 0, 0)
	makeLuaSprite('defeat','defeat', -950, -300)
	makeLuaSprite('skulls','lol thing', -550, 400)
	setScrollFactor('skulls', 0.9, 0.9);
	scaleObject('skulls', 1.5, 1.3);
	makeLuaSprite('skulls2','deadBG', -550, 900)
	scaleObject('skulls2', 0.45, 0.45);
	makeLuaSprite('skulls3','deadFG', -1050, 900)
	setScrollFactor('skulls3', 0.6, 0.6);
	scaleObject('skulls3', 0.5, 0.5);





	addLuaSprite('defeat')
	addLuaSprite('skulls')
	addLuaSprite('skulls2')
	addLuaSprite('skulls3', true)
	addLuaSprite('darksc')
	
	addLuaSprite('flash')
	addLuaSprite('flashwhite')
	addLuaSprite('scenema')
	addLuaSprite('red')


	setProperty('defeat.alpha', 0.5);
	setProperty('skulls.alpha', 0);
	setProperty('skulls2.alpha', 0);
	setProperty('skulls3.alpha', 0);
	setProperty('red.alpha', 0);
	setProperty('flash.alpha', 0);
	setObjectCamera('flash', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	setProperty('scenema.alpha', 0);
	setObjectCamera('scenema', 'other');
	setProperty('darksc.alpha', 0.5);
	setObjectCamera('darksc', 'other');
	
	makeLuaSprite('Name','defeat-name', -500, 100)
	addLuaSprite('Name')
	setObjectCamera('Name', 'hud');
	scaleObject('Name',0.75,0.75)
	

	
	
end


function onBeatHit()
	if curBeat % 4 == 0 then
	    if bestpart == true then
	    setProperty('defeat.alpha', 1);
		doTweenAlpha('defeatflash', 'defeat', 0.5, 1, 'linear');
		end
		
		if beating == true then
	        triggerEvent('Add Camera Zoom', 0.05, 0.03)
		end
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

    function onStepHit()
	    if curStep == 1 then
		doTweenX('NameTweenX', 'Name', 0, 2, 'CircInOut');
		runTimer('nameout', 5);
		end
	    if curStep == 800 then
		flash()
		end
	    if curStep == 288 then
		bestpart = true;
        beating = true;
		flash()
		setProperty('skulls.alpha', 1);
		setProperty('skulls2.alpha', 1);
		setProperty('skulls3.alpha', 1);
		triggerEvent('Change Character', 0, 'bf-defeat-scared');
		end
		if curStep == 1183 then
		flashdark()
		setProperty('skulls.alpha', 0);
		setProperty('skulls2.alpha', 0);
		setProperty('skulls3.alpha', 0);
		shake = false;
		triggerEvent('Change Character', 1, 'white-defeat');
		triggerEvent('Change Character', 0, 'bf-defeat-normal');
		end
		if curStep == 1567 then
		flashdark()
		shake = true;
		setProperty("gf.visible", true);
		setCharacterX('dad', 150);
		setProperty('skulls.alpha', 1);
		setProperty('skulls2.alpha', 1);
		setProperty('skulls3.alpha', 1);
		triggerEvent('Change Character', 1, 'black-defeat');
		triggerEvent('Change Character', 0, 'bf-defeat-scared');
		end
		if curStep == 2336 then
		flash()
		beating = false;
		end
    end
	
	
function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'nameout' then
	doTweenX('NameTweenX2', 'Name', -500, 2, 'CircInOut');
    end
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
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
			end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end


function opponentNoteHit()
if shake == true then
    triggerEvent('Screen Shake','0.02, 0.02','0.1, 0.01');
	
    health = getProperty('health')
    if damage == true then
        if getProperty('health') > 0.4 then
            setProperty('health', health- 0.02);
		end
    end
end
end