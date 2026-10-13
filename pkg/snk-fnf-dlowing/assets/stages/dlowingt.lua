local xx =  2400;
local yy =  1600;
local xx2 = 2600;
local yy2 = 1600;
local ofs = 20;

function onCreate()

    if (songName == "Yarlow") then
    makeAnimatedLuaSprite('whiteruby', 'dlowingassets/boppers/whiteruby', 2350, 1420);
    addAnimationByPrefix('whiteruby','idle','white',24,false)
    setScrollFactor('whiteruby', 1, 1)
    else
    makeAnimatedLuaSprite('whiteruby', 'dlowingassets/boppers/whiteruby', 2500, 1150);
    addAnimationByPrefix('whiteruby','idle','white',24,false)
    setScrollFactor('whiteruby', 1, 1)
    end

	-- background shit
    	-- background shit
    makeLuaSprite('stage', 'dlowingassets/main', 1262.5, 806);
    setScrollFactor('stage', 1, 1);
    makeLuaSprite('stand', 'dlowingassets/ruby stand', 1386.5, 906);
    scaleObject('stand', 0.90, 0.9);
    setScrollFactor('stand', 1, 1);
    makeLuaSprite('other', 'dlowingassets/the thingies', 1262.5, 806);
    setScrollFactor('other', 1, 1);
    makeLuaSprite('blade', 'dlowingassets/blade', 1262.5, 806);
    setScrollFactor('blade', 1.1, 1);

    makeLuaSprite('addb', 'dlowingassets/blade glow', 1262.5, 806);
    setScrollFactor('addb', 1.1, 1);
    makeLuaSprite('adds', 'dlowingassets/stand glow', 1262.5, 806);
    setScrollFactor('add', 1, 1);
    makeLuaSprite('addm', 'dlowingassets/lighting main', 1262.5, 806);
    setScrollFactor('add', 1, 1);
    makeLuaSprite('ov', 'dlowingassets/overlay gold', 1262.5, 806);
    setScrollFactor('ov', 1, 1);

    makeAnimatedLuaSprite('lime', 'dlowingassets/boppers/limedlowing', 3200, 1850);
    addAnimationByPrefix('lime','idle','lime',24,false)
    setScrollFactor('lime', 1, 1)

    makeAnimatedLuaSprite('call', 'dlowingassets/boppers/call', 1450, 1300);
    addAnimationByPrefix('call','idle','call',24,false)
    setScrollFactor('call', 1, 1)

    makeAnimatedLuaSprite('nr', 'dlowingassets/boppers/nr', 1320, 1500);
    addAnimationByPrefix('nr','idle','nr',24,false)
    setScrollFactor('nr', 1, 1)

    makeAnimatedLuaSprite('sheriff', 'dlowingassets/boppers/sheriff', 3250, 1500);
    addAnimationByPrefix('sheriff','idle','sheriff',24,false)
    setScrollFactor('sheriff', 1, 1)

    makeAnimatedLuaSprite('gray', 'dlowingassets/boppers/gay', 3800, 1650);
    addAnimationByPrefix('gray','idle','gray instance ',24,false)
    setScrollFactor('gray', 1, 1)

    makeAnimatedLuaSprite('mint', 'dlowingassets/boppers/mint', 2100, 1250);
    addAnimationByPrefix('mint','idle','mint',24,false)
    setScrollFactor('mint', 1, 1)

    makeAnimatedLuaSprite('amongly', 'dlowingassets/passers/amongly', -1500, 1575);
    addAnimationByPrefix('amongly','idle','amongly',24,true)
    setScrollFactor('amongly', 1.2, 1)
    scaleObject('amongly', 0.95, 0.95)
    setProperty('amongly.velocity.x',280)

    makeAnimatedLuaSprite('tnr', 'dlowingassets/passers/tanandrichard', -10000, 1575);
    addAnimationByPrefix('tnr','idle','tanandrichard',32,true)
    setScrollFactor('tnr', 1.2, 1)
    scaleObject('tnr', 0.95, 0.95)
    setProperty('tnr.velocity.x',240)

    makeAnimatedLuaSprite('amonglit', 'dlowingassets/passers/amonglita', 55000, 1250);
    addAnimationByPrefix('amonglit','idle','amonglita',32,true)
    setScrollFactor('amonglit,', 1.2, 1)
    scaleObject('amonglit', 0.95, 0.95)
    setProperty('amonglit.velocity.x', -800)

    makeAnimatedLuaSprite('redmungus', 'dlowingassets/passers/redmungus', -16000, 1575);
    addAnimationByPrefix('redmungus','idle','redmungus',24,true)
    setScrollFactor('redmungus,', 1.2, 1)
    scaleObject('redmungus', 0.95, 0.95)
    setProperty('redmungus.velocity.x', 200)

    makeAnimatedLuaSprite('vig', 'pee vig', 0, 0);
    addAnimationByPrefix('vig','idle','penis vig', 12, false)
    setObjectCamera('vig', 'hud')
    setProperty('vig.alpha', 0.3)
    setScrollFactor('vig', 0, 0)
    
    setBlendMode('addm', 'add');
    setBlendMode('addb', 'add');
    setBlendMode('adds', 'add');
    setBlendMode('ov', 'overlay');
    setBlendMode('vig', 'add');


    addLuaSprite('stage', false);
    addLuaSprite('mint',false)
    addLuaSprite('other', false);
    addLuaSprite('stand', false);
    addLuaSprite('whiteruby',false)
    addLuaSprite('call',false);
    addLuaSprite('nr',false);
    addLuaSprite('sheriff',false);
	addLuaSprite('adds', false);
	
	addLuaSprite('blade', true);
    addLuaSprite('ov', true);
    addLuaSprite('gray', true);
    addLuaSprite('lime',true)
    addLuaSprite('amongly',true)
    addLuaSprite('tnr',true)
    addLuaSprite('amonglit',true)
    addLuaSprite('redmungus',true)
    addLuaSprite('addm', true);
    addLuaSprite('addb', true);
    addLuaSprite('vig', true);

end

function onStepHit()
	if curStep == 1374 then
      xx =  2200;
      yy =  1800;
      xx2 = 2200;
      yy2 = 1800;
    end
end

function onBeatHit()
    dance()

    

end

function onCountdownTick(counter)
	if counter % 2 == 0 then
		dance()
	end
end

function dance()
    if curBeat % 2 == 0 then
        playAnim('lime', 'idle', true);
        playAnim('nr', 'idle', true);
        playAnim('sheriff', 'idle', true);
        playAnim('whiteruby', 'idle', true);
        playAnim('mint', 'idle', true);
        playAnim('call', 'idle', true);
        playAnim('vig', 'idle', true);
        playAnim('gray', 'idle', true);
    end
end

function onCreatePost()
    if (songName == "Yarlow") then
       setProperty('amongly.visible', false);
       setProperty('amonglit.visible', false);
       setProperty('redmungus.visible', false);
       setProperty('gray.visible', false);
       setProperty('mint.visible', false);
       setProperty('sheriff.visible', false);
       setProperty('lime.visible', false);
       setProperty('tnr.visible', false);
       setProperty('nr.visible', false);
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