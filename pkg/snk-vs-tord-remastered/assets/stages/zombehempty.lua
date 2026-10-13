-- Lua stuff
local squish = 80
local xx = 625;
local yy = 400;
local xx2 = 870;
local yy2 = 450;
local ofs = 35;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
    makeLuaSprite('Sky', 'necromancy/zombehsky', 0, -75)
    setLuaSpriteScrollFactor('Sky', 1.1, 1.1);
    makeLuaSprite('Hill', 'necromancy/hill', -150, 150)
    makeLuaSprite('fence', 'necromancy/fence', 0, 200)
    makeLuaSprite('floor', 'necromancy/floor', -200, 600)
    addLuaSprite('Sky',  false)
    addLuaSprite('Hill',  false)
    addLuaSprite('fence',  false)
    addLuaSprite('floor',  false)
    addLuaSprite('edd',  false)
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
function opponentNoteHit()
    health = getProperty('health')
    if getProperty('health') > 0.1 then
        setProperty('health', health- 0.017);
    end
end