local xx = 1900; --750
local yy = 1050; --750
local xx2 = 1900; --1500
local yy2 = 1050; --750
local ofs = 10;
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

function onCreatePost()--this thing happens once the characters are spawned

    setProperty("gf.visible", false);
	setProperty("dad.visible", false);

end

function onCreate()
	--background boi
	makeLuaSprite('bg','bg', -850, -450)
	makeLuaSprite('bg2','bg', 9150, -450)
	makeLuaSprite('fog','bluefog', 0, 0)
	makeLuaSprite('fogD','blackfog', -3250, 300)
	makeLuaSprite('red','redbg', -800, -800)
	makeLuaSprite('flash','Flash', 0, 0)
	makeLuaSprite('darksc','DarkSC', 0, 0)
	makeLuaSprite('flashwhite','flashwhite', 0, 0)
	makeLuaSprite('scenema','cutscene', 0, 0)
	makeLuaSprite('defeat','defeat', -850, 0)
	setScrollFactor('fakersky', 0.8, 0.8);




    addLuaSprite('bg')
	addLuaSprite('bg2')
	addLuaSprite('defeat')
	addLuaSprite('fog', true)
	addLuaSprite('fogD', false)
	addLuaSprite('darksc')
	
	addLuaSprite('flash')
	addLuaSprite('flashwhite')
	addLuaSprite('scenema')
	addLuaSprite('red')


	setProperty('fog.alpha', 0.3);
	setObjectCamera('fog', 'other');
	setProperty('red.alpha', 0);
	setProperty('flash.alpha', 0);
	setObjectCamera('flash', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	setProperty('scenema.alpha', 0);
	setObjectCamera('scenema', 'other');
	setProperty('darksc.alpha', 0.5);
	setObjectCamera('darksc', 'other');
	setProperty('defeat.alpha', 0);
	
	makeLuaSprite('Name','comfortical', -500, 100)
	addLuaSprite('Name')
	setObjectCamera('Name', 'hud');
	scaleObject('Name',0.75,0.75)
	

	
	
end

function resetlegs()
    makeAnimatedLuaSprite('fuckinglegs','legs', -90, 1000);
		addAnimationByPrefix('fuckinglegs','loop','legs', 15, true);
	makeAnimatedLuaSprite('bfleg','bfleg', 1620, 1100);
		addAnimationByPrefix('bfleg','loop','legs', 24, true);
		
	addLuaSprite('fuckinglegs')
	addLuaSprite('bfleg')
end


function flash()
    setProperty('flashwhite.alpha', 1);
	doTweenAlpha('flashdown', 'flashwhite', 0, 0.5, 'linear');
end

function onBeatHit()
    if beat_skip == 0 then
	    beat_skip = 1
		
        if beating == true then
	        triggerEvent('Add Camera Zoom', 0.06, 0.04)
		end
	else
	    beat_skip = 0
	    
end
end

    function onStepHit()
	    if curStep == 1 then
		doTweenX('NameTweenX', 'Name', 0, 2, 'CircInOut');
		runTimer('nameout', 5);
		end
	    if curStep == 280 then
	    setProperty("dad.visible", true);
		triggerEvent('Play Animation', 'dark', 'dad')
		end
		if curStep == 287 then
		triggerEvent('Play Animation', 'idle', 'dad')
		end
        if curStep == 99999 then
		--beating on
		beating = true
		end
		if curStep == 99999 then
		--beating off
		beating = false
		end
		if curStep == 271 then
        setProperty('camHUD.visible', false);
		xx = 750;
        yy = 750;
        xx2 = 1500;
        yy2 = 750;
		end
		if curStep == 287 then
		flash()
		triggerEvent('Add Camera Zoom', 0.06, 0.04)
		setProperty('fogD.alpha', 0);
		end
		if curStep == 317 then
		flash()
		triggerEvent('Change Character', 1, 'black');
		triggerEvent('Change Character', 0, 'Run_BF');
		setCharacterX('dad', -10);
		setCharacterY('dad', 655);
		resetlegs();
		objectPlayAnimation('bfleg','legs', true);
		setProperty('camHUD.visible', true);
		ofs = 55;
		end
		if curStep == 317 then
        doTweenX('Stage1TweenX', 'bg', -10850, 4, 'linear');
		doTweenX('Stage2TweenX', 'bg2', -850, 4, 'linear');
		end
		if curStep == 829 then
		flash()
		setProperty('bg.alpha', 0);
		setProperty('bg2.alpha', 0);
		setProperty('defeat.alpha', 1);
		doTweenX('defeatmove', 'defeat', -5000, 60, 'linear');
		end
		if curStep == 1341 then
		xx2 = 1900;
		yy2 = 1050;
		end
		if curStep == 1357 then
		xx2 = 1500;
		yy2 = 750;
		flash()
		setProperty('bg.alpha', 1);
		setProperty('bg2.alpha', 1);
		setProperty('defeat.alpha', 0);
		triggerEvent('Change Character', 1, 'black-angry');
		end
    end
	
function onTimerCompleted(tag, loops, loopsleft)
    if tag == 'nameout' then
	doTweenX('NameTweenX2', 'Name', -500, 2, 'CircInOut');
    end
end
	
	function onTweenCompleted(tag)
    if tag == 'Stage1TweenX' then
	    if noloop == false then
   -- makeLuaSprite('bg','bg', -850, -450)
	--makeLuaSprite('bg2','bg', 9150, -450)
	--addLuaSprite('bg')
	--addLuaSprite('bg2')
	--resetlegs();;
	setProperty('bg.x', -850);
	setProperty('bg2.x', 9150);
	doTweenX('Stage1TweenX', 'bg', -10850, 4, 'linear');
	doTweenX('Stage2TweenX', 'bg2', -850, 4, 'linear');
        end
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