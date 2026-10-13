local xx =  2350;
local yy =  1470;
local xx2 = 2900;
local yy2 = 1470;
local ofs = 20;

function onCreate()
	-- background shit
    makeLuaSprite('stage', 'blackoutassets/main', 1292.5, 659.5);
    setScrollFactor('stage', 1, 1);
    makeLuaSprite('doors', 'blackoutassets/doors', 1292.5, 659.5);
    setScrollFactor('doors', 1, 1);
    makeLuaSprite('corpse1', 'blackoutassets/dead people 1v', 1292.5, 659.5+50);
    setScrollFactor('corpse1', 1, 1);
    makeLuaSprite('corpse3', 'blackoutassets/dead person', 1292.5, 659.5+50);
    setScrollFactor('corpse3', 1, 1);
    makeLuaSprite('crown', 'blackoutassets/crown', 1292.5, 659.5+50);
    setScrollFactor('crown', 1, 1);
    makeLuaSprite('corpse2', 'blackoutassets/dead people 2', 1292.5, 659.5);
    setScrollFactor('corpse2', 1, 1);
    
    makeLuaSprite('cs', 'blackoutassets/front shadows', 1292.5, 659.5+50);
    setScrollFactor('cs', 1, 1);
    makeLuaSprite('ov', 'blackoutassets/overlay', 1292.5, 659.5);
    setScrollFactor('ov', 1, 1);
    setBlendMode('ov', 'multiply')
    setBlendMode('cs', 'multiply')
    setProperty('cs.alpha', 0.5)
    
    -- funky black and white
    makeLuaSprite('stage-bw', 'blackoutassets/main-bw', 1292.5, 659.5);
    setScrollFactor('stage-bw', 1, 1);
    makeLuaSprite('overlay-bw', 'blackoutassets/overlay-bw', 1292.5, 659.5);
    setScrollFactor('overlay-bw', 1, 1);
    setBlendMode('overlay-bw', 'multiply')
    makeLuaSprite('corpse1-bw', 'blackoutassets/dead people 1v-bw', 1292.5, 659.5+50);
    setScrollFactor('corpse1-bw', 1, 1);
    
    makeLuaSprite('ov-bw', 'blackoutassets/overlay-bw', 1292.5, 659.5);
    setScrollFactor('ov-bw', 1, 1);
    setBlendMode('ov-bw', 'multiply')
    setBlendMode('cs-bw', 'multiply')
    setProperty('cs-bw.alpha', 0.5)

    -- screen stuff
    makeLuaSprite('cinema','blackoutassets/cinema', 0, 0)
	setGraphicSize('cinema',1280,720)
	setObjectCamera('cinema','camHud')
	updateHitbox('cinema')
	setBlendMode('cinema','multiply')
	
	


    makeLuaSprite('lb', 'blackoutassets/lightblackout', 1290, 680);
    setScrollFactor('lb', 1, 1);
    makeLuaSprite('db', 'blackoutassets/darkblackout', 1290, 680);
    setScrollFactor('db', 1, 1);
setProperty('lb.alpha',0.75)
setProperty('db.alpha',0.75)

 setBlendMode('lb', 'multiply')
  setBlendMode('db', 'multiply')
   
     makeLuaSprite('vig', 'blackoutassets/vignette', 0, 0);
setObjectCamera('vig', 'other')
   setProperty('vig.alpha',0.1)
    addLuaSprite('cinema', false);

    addLuaSprite('stage-bw', false);
    addLuaSprite('corpse1-bw', true);
    addLuaSprite('stage', false);
    addLuaSprite('corpse2', false);
    addLuaSprite('corpse3', false);
    addLuaSprite('doors', false);
    addLuaSprite('cs', false);
    addLuaSprite('crown', false);
    addLuaSprite('corpse1', true);
	
	addLuaSprite('lb', true);
	addLuaSprite('db', true);
    addLuaSprite('overlay-bw', true);
    addLuaSprite('ov', true);
	addLuaSprite('vig', true);


    setProperty('cinema.visible', true)
	
    setProperty('stage.visible', true)
    setProperty('corpse2.visible', true)
    setProperty('corpse3.visible', true)
    setProperty('doors.visible', true)
    setProperty('cs.visible', true)
    setProperty('crown.visible', true)
    setProperty('corpse1.visible', true)
    setProperty('ov.visible', true)
	
    setProperty('stage-bw.visible', true)
    setProperty('corpse1-bw.visible', true)
    setProperty('overlay-bw.visible', true)
	
	precacheImage('NOTE_assets_bw');
	precacheImage('noteSplashesBW');
    
end

function onStepHit()
--S means start
    if curStep == 1 then
	doTweenAlpha('flickerslowS', 'lb', 0, 0.25, 'bounceInOut')--start flicker slow
	end

	if curStep == 256 then
	cancelTween('flickerslow')-- stop flickering slow
	cancelTween('flickerslow2')-- stop flickering slow
		doTweenAlpha('darken', 'lb', 0.7, 0.35, 'bounceInOut')-- darken
    xx =  2200;
    yy =  1500;
    xx2 = 3050;
    yy2 = 1530;
    end

    if curStep == 272 then
	doTweenAlpha('vigalphachange', 'vig', 0.3, 0.5, 'expoOut')
	doTweenAlpha('flickerS', 'lb', 0, 0.4, 'bounceInOut')--start flicker normal
    xx =  2350;
    yy =  1470;
    xx2 = 2900;
    yy2 = 1470;
    end

    if curStep == 528 then
	cancelTween('flicker')
	cancelTween('flicker2')
	doTweenAlpha('darkenS', 'lb', 0.7, 0.5, 'bounceInOut')
	end
	
	if curStep == 560 then
	doTweenAlpha('vigalphachange', 'vig', 0.1, 0.5, 'expoOut')
    doTweenAlpha('flickerslowS', 'lb', 0, 0.25, 'bounceInOut')
	end
	
	    if curStep == 819 then
	cancelTween('flickerslow')
	cancelTween('flickerslow2')
	doTweenAlpha('darken', 'lb', 0.7, 0.5, 'bounceInOut')
	end
	
	if curStep == 832 then
	doTweenAlpha('vigalphachange', 'vig', 0.3, 0.5, 'expoOut')
    doTweenAlpha('flickerS', 'lb', 0, 0.25, 'bounceInOut')
	end
	
	if curStep == 1338 then
	cancelTween('flicker')
	cancelTween('flicker2')
	doTweenAlpha('vigalphachange', 'vig', 0.1, 0.5, 'expoOut')
	doTweenAlpha('darken', 'lb', 0.7, 0.25, 'bounceInOut')
    end
	
	if curStep == 1344 then
		cancelTween('flickerfaster')
	cancelTween('flickerfaster2')
	cancelTween('flickerfast')
	cancelTween('flickerfast2')
	cancelTween('flicker')
	cancelTween('flicker2')
	cancelTween('flickerslow')
	cancelTween('flickerslow2')
    xx =  2200;
    yy =  1500;
    xx2 = 2850;
    yy2 = 1500;
    end
	
    if curStep == 1616 then
		cancelTween('flickerfaster')
	cancelTween('flickerfaster2')
	cancelTween('flickerfast')
	cancelTween('flickerfast2')

	cancelTween('flickerslow')
	cancelTween('flickerslow2')
	doTweenAlpha('vigalphachange', 'vig', 0.3, 1, 'expoOut')
	    doTweenAlpha('flickerS', 'lb', 0, 0.25, 'bounceInOut')
    xx =  2400;
    yy =  1450;
    xx2 = 2850;
    yy2 = 1450;
    end

    if curStep == 1872 then
	cancelTween('flicker')
	cancelTween('flicker2')
	doTweenAlpha('darken', 'lb', 0.7, 0.7, 'bounceInOut')
	end
	
    if curStep == 1872 then
    xx =  2200;
    yy =  1500;
    xx2 = 3050;
    yy2 = 1530;
    end

	if curStep == 1888 then
	doTweenAlpha('vigalphachange', 'vig', 0.45, 1, 'expoOut')
    doTweenAlpha('flickerfastS', 'lb', 0, 0.25, 'bounceInOut')
    xx =  2350;
    yy =  1470;
    xx2 = 2900;
    yy2 = 1470;
    end

    if curStep == 2140 then
	cancelTween('flickerfast')
	cancelTween('flickerfast2')
	cancelTween('flicker')
	cancelTween('flicker2')
	cancelTween('flickerslow')
	cancelTween('flickerslow2')
	doTweenAlpha('darken', 'lb', 0.9, 0.2, 'bounceInOut')
	doTweenAlpha('darkendb', 'db', 0.9, 0.2, 'bounceInOut')
	end

	if curStep == 2144 then
	doTweenAlpha('vigalphachange', 'vig', 0.6, 1, 'expoOut')
    doTweenAlpha('flickerfasterS', 'lb', 0, 0.1, 'bounceInOut')
	end

    if curStep == 2400 then
	cancelTween('flickerfaster')
	cancelTween('flickerfaster2')
	cancelTween('flickerfast')
	cancelTween('flickerfast2')
	cancelTween('flicker')
	cancelTween('flicker2')
	cancelTween('flickerslow')
	cancelTween('flickerslow2')
	doTweenAlpha('darken', 'lb', 0.1, 0.3, 'expoOut')
	doTweenAlpha('darkendb', 'db', 0.7, 0.3, 'expoOut')
    xx =  2550;
    yy =  1400;
    xx2 = 2550;
    yy2 = 1400;
    end
	
	    if curStep == 2406 then
	doTweenAlpha('darken', 'lb', 0.5, 0.3, 'expoOut')
    end
	
		    if curStep == 2412 then
			doTweenAlpha('vigalphachange', 'vig', 1, 5, 'quadInOut')
	doTweenAlpha('darken', 'lb', 1, 5, 'quadInOut')
	doTweenAlpha('darkendb', 'db', 1, 5, 'quadInOut')
    end
	

end

function onCreatePost()
end

function onTweenCompleted(tag)

	if tag == 'flickerslow' or tag == 'flickerslowS' then
	doTweenAlpha('flickerslow2', 'lb', 0.7, 0.6, 'bounceInOut')--darker
	end
	if tag == 'flickerslow2' then
	doTweenAlpha('flickerslow', 'lb', 0, 0.6, 'elasticInOut')--lighter
	end
-- normal flickers
	if tag == 'flicker' or tag == 'flickerS' then
	doTweenAlpha('flicker2', 'lb', 0.75, 0.4, 'bounceInOut')
	end	
	if tag == 'flicker2' then
	doTweenAlpha('flicker', 'lb', 0.25, 0.4, 'bounceInOut')
	end
-- fast flickers
	if tag == 'flickerfast' or tag == 'flickerfastS' then
	doTweenAlpha('flickerfast2', 'lb', 0.75, 0.15, 'bounceInOut')
	end
	if tag == 'flickerfast2' then
	doTweenAlpha('flickerfast', 'lb', 0.45, 0.15, 'bounceInOut')
	end
   -- fast as fuck flickers
	if tag == 'flickerfaster' or tag == 'flickerfasterS' then
	doTweenAlpha('flickerfaster2', 'lb', 0.9, 0.08, 'bounceInOut')
	end
	if tag == 'flickerfaster2' then
	doTweenAlpha('flickerfaster', 'lb', 0.65, 0.08, 'bounceInOut')
	end
	
end	


function onUpdate()
    setProperty('gf.visible',true)
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
end