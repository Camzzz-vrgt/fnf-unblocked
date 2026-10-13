local xx = 750; --750
local yy = 750; --750
local xx2 = 1500; --1500
local yy2 = 750; --750
local ofs = 35;
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

end

function onCreate()
	--background boi
	makeLuaSprite('bg','bg', -850, -450)
	makeLuaSprite('bg2','bg', 9150, -450)
	makeLuaSprite('Sbg','bg', -850, -450)
	makeLuaSprite('Sbg2','bg', 9150, -450)
	makeLuaSprite('fog','bluefog', 0, 0)
	makeLuaSprite('red','redbg', -800, -800)
	makeLuaSprite('flash','Flash', 0, 0)
	makeLuaSprite('darksc','DarkSC', 0, 0)
	makeLuaSprite('flashwhite','flashwhite', 0, 0)
	makeLuaSprite('scenema','cutscene', 0, 0)
	makeLuaSprite('defeat','defeat', -850, 0)
	setScrollFactor('fakersky', 0.8, 0.8);
	--makeAnimatedLuaSprite('screamsky','screamsky', -525, 250);
		--addAnimationByPrefix('screamsky','scream','scream sky  instance', 24, false);
	makeAnimatedLuaSprite('fuckinglegs','legs', -90, 1000);
		addAnimationByPrefix('fuckinglegs','loop','legs', 15, true);
	makeAnimatedLuaSprite('blackcutscene','Black-danger-scream', -525, 250);
		addAnimationByPrefix('blackcutscene','scream','scream', 24, false);
	makeAnimatedLuaSprite('bfleg','bfleg', 1620, 1100);
		addAnimationByPrefix('bfleg','loop','legs', 24, true);
		
	




    addLuaSprite('bg')
	addLuaSprite('bg2')
	addLuaSprite('Sbg')
	addLuaSprite('Sbg2')
	addLuaSprite('fog', true)
	addLuaSprite('darksc')
	
	addLuaSprite('flash')
	addLuaSprite('flashwhite')
	addLuaSprite('scenema')
	addLuaSprite('red')
	
	addLuaSprite('screamsky')
	addLuaSprite('fuckinglegs')
	addLuaSprite('bfleg')
	addLuaSprite('blackcutscene', true)


	setProperty('fog.alpha', 0.3);
	setObjectCamera('fog', 'other');
	setProperty('red.alpha', 0);
	setProperty('flash.alpha', 1);
	setObjectCamera('flash', 'other');
	setProperty('flashwhite.alpha', 0);
	setObjectCamera('flashwhite', 'other');
	setProperty('scenema.alpha', 0);
	setObjectCamera('scenema', 'other');
	setProperty('darksc.alpha', 0.5);
	setObjectCamera('darksc', 'other');
	setProperty('Sbg.alpha', 0);
	setProperty('Sbg2.alpha', 0);
	
	makeLuaSprite('Name','Onequart', -500, 100)
	addLuaSprite('Name')
	setObjectCamera('Name', 'hud');
	scaleObject('Name',0.75,0.75)
	
	doTweenX('Stage1TweenX', 'bg', -10850, 4, 'linear');
	doTweenX('Stage2TweenX', 'bg2', -850, 4, 'linear');
	
	
	setProperty('blackcutscene.alpha', 0.001);

	
	
end

function flash()
    setProperty('flashwhite.alpha', 1);
	doTweenAlpha('flashdown', 'flashwhite', 0, 0.5, 'linear');
end

function onBeatHit()
	if curBeat % 2 == 0 then
		if beating == true then
	        triggerEvent('Add Camera Zoom', 0.05, 0.03)
		end
	end
end

    function onStepHit()
	    if curStep == 50 then
		doTweenX('NameTweenX', 'Name', 0, 2, 'CircInOut');
		runTimer('nameout', 5);
		end
	    if curStep == 256 or curStep == 1279 or curStep == 1663 or curStep == 1984 then
		beating = true;
		end
		if curStep == 768 or curStep == 1535 or curStep == 1936 then
		beating = false;
		end
	    if curStep == 1 then
		flash()
		setProperty('flash.alpha', 0);
		
	    setProperty('screamsky.alpha', 0);
		triggerEvent('Change Character', 1, 'black');
		end
	    if curStep == 608 then
		xx = 450; --750
        yy = 825; --750
        end
	    if curStep == 640 then
		setProperty('blackcutscene.alpha', 0);
		setProperty('screamsky.alpha', 0);
		setProperty('red.alpha', 0);
		setProperty('scenema.alpha', 0);
		setProperty("dad.visible", true);
		triggerEvent('Change Character', 1, 'black-angry');
		xx = 750; --750
        yy = 750; --750
		end
		if curStep == 624 then
		setProperty('blackcutscene.alpha', 1);
		setProperty('scenema.alpha', 1);
		objectPlayAnimation('blackcutscene','scream', true);
		
		setProperty("dad.visible", false);
		end
		if curStep == 632 then
		flash()
		setProperty('red.alpha', 1);
		objectPlayAnimation('screamsky','scream', false);
		end
		if curStep == 1791 then
		flash()
		triggerEvent('Change Character', 1, 'blackparasite');
		triggerEvent('Change Character', 0, 'bf-defeat-scared');
		triggerEvent('Set Cam Zoom', 0.4, 0.3);
		setCharacterY('dad', 600);
		setProperty('fuckinglegs.alpha', 0);
		setProperty('bfleg.alpha', 0);
		setProperty('bg.alpha', 0);
		setProperty('bg2.alpha', 0);
		setProperty('Sbg.alpha', 1);
		setProperty('Sbg2.alpha', 1);
		xx2 = 1650;
		end
		if curStep == 2376 then
		setProperty('flash.alpha', 1);
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
	end
	
end