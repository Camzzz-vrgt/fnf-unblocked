local xx =  600;
local yy =  700;
local xx2 = 775;
local yy2 = 700;
local ofs = 20;

function onCreate()
	-- background shit
	makeLuaSprite('m', 'jadassets/main', -600, 100);
	setScrollFactor('m', 1, 1);
	makeLuaSprite('a', 'jadassets/lights', -600, 100);
	setScrollFactor('a', 1.1, 1.1);
	setBlendMode('a', 'add')
	makeLuaSprite('g', 'jadassets/gradient', -600, 100);
	setScrollFactor('g', 1.1, 1.1);
	setBlendMode('g', 'add')

	makeAnimatedLuaSprite('onion', 'jadassets/onion', -400, 686);
    addAnimationByPrefix('onion','idle','onion instance',24, false)
	scaleObject('onion', 1.1, 1.1)
    setScrollFactor('onion', 1, 1)
	makeAnimatedLuaSprite('yfronts', 'jadassets/yfronts', 1400, 620);
    addAnimationByPrefix('yfronts','idle','YFRONTS instance',24, false)
	scaleObject('onion', 1.1, 1.1)
    setScrollFactor('yfronts', 1, 1)

	
	addLuaSprite('m', false);
	addLuaSprite('onion', true);
	addLuaSprite('a', true);
	addLuaSprite('yfronts', true);
	addLuaSprite('g', true);
end

function onBeatHit()
    dance()

    

end

function dance()
    if curBeat % 2 == 0 then
        playAnim('onion', 'idle', true);
        playAnim('yfronts', 'idle', true);
    end
end
	
function onUpdate()
    setProperty('gf.visible',false)
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