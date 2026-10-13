-- Lua stuff
local squish = 80
local xx = 700;
local yy = 450;
local xx2 = 800;
local yy2 = 470;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
    makeLuaSprite('Sky', 'tord/paradox/oldsky', -300, -350)
	setLuaSpriteScrollFactor('BG', 0.9, 0.9);
    makeLuaSprite('BG', 'tord/paradox/oldbg', -350, 50)
	makeAnimatedLuaSprite('edd', 'tord/paradox/oldedd', 50, 220);
	luaSpriteAddAnimationByPrefix('edd', 'idle', 'oldedd', 24, true);
	makeAnimatedLuaSprite('tom', 'tord/paradox/oldtom', 1100, 140);
	luaSpriteAddAnimationByPrefix('tom', 'idle', 'oldtom', 24, true);
    makeLuaSprite('barleft','',-4,0)
    makeGraphic('barleft',163,882,'000000')
    makeLuaSprite('barright','',1119,0)
    makeGraphic('barright',162,882,'000000')
    setScrollFactor('barleft',0,0)
    setObjectCamera('barleft','hud')
    setScrollFactor('barright',0,0)
    setObjectCamera('barright','hud')
    addLuaSprite('Sky',  false)
    addLuaSprite('BG',  false)
    addLuaSprite('edd',  false)
    addLuaSprite('tom',  false)
    addLuaSprite('barleft',true)
    addLuaSprite('barright',true)
end

function onUpdate(elapsed)

    if not middlescroll then
        noteTweenX('0',0,defaultOpponentStrumX0 + squish,0.15,'linear')
        noteTweenX('1',1,defaultOpponentStrumX1 + squish,0.15,'linear')
        noteTweenX('2',2,defaultOpponentStrumX2 + squish,0.15,'linear')
        noteTweenX('3',3,defaultOpponentStrumX3 + squish,0.15,'linear')
        noteTweenX('4',4,defaultPlayerStrumX0 - squish,0.01,'linear')
        noteTweenX('5',5,defaultPlayerStrumX1 - squish,0.01,'linear')
        noteTweenX('6',6,defaultPlayerStrumX2 - squish,0.01,'linear')
        noteTweenX('7',7,defaultPlayerStrumX3 - squish,0.01,'linear')

    end

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