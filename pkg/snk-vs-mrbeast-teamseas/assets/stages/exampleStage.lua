local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 420.95;
local yy = 263;
local xx2 = 952.9;
local yy2 = 530;
local ofs = 50;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()

	makeLuaSprite('sky', 'sky', -650, -400);
	addLuaSprite('sky',false)
	setScrollFactor('sky', 1.2, 1.2);

	makeAnimatedLuaSprite('sea', 'seaanim', -650,-450)
	addAnimationByPrefix('sea','seawave','clouds copy',24,true)
	addLuaSprite('sea',false)
	objectPlayAnimation('sea','seawave',false)
	setScrollFactor('sea', 1, 1);

	makeAnimatedLuaSprite('trashsea', 'seaanimtrash', -650,-450)
	addAnimationByPrefix('trashsea','seawave','clouds copy',24,true)
	addLuaSprite('trashsea',false)
	objectPlayAnimation('trashsea','seawave',false)
	setScrollFactor('sea', 1, 1);

	makeAnimatedLuaSprite('clouds', 'cloudsanim', -650,-400)
	addAnimationByPrefix('clouds','cloudlol','clouds',24,true)
	addLuaSprite('clouds',false)
	objectPlayAnimation('sea','cloudlol',false)
	setScrollFactor('clouds', 1, 1);

	makeLuaSprite('land', 'land', -650, -430);
	addLuaSprite('land',false)

	makeLuaSprite('trash', 'trash', -650, -430);
	addLuaSprite('trash',false)

	makeLuaSprite('trashgf', 'trashgf', -650, -480);
	addLuaSprite('trashgf',true)

	makeLuaSprite('text', 'text thing', -650, -360);
	addLuaSprite('text',true)

	setObjectCamera('text', 'camother')


	-- sprites that only load if Low Quality is turned off
	if not lowQuality then
	end
end

function onBeatHit()
     objectPlayAnimation('sea','clouds copy',true)
end


function onBeatHit()
	if curBeat < 388 then

		if curBeat % 2 == 0 then
			angleshit = anglevar;
		else
			angleshit = -anglevar;
		end
		setProperty('camHUD.angle',angleshit*3)
		setProperty('camGame.angle',angleshit*3)
		doTweenAngle('turn', 'camHUD', angleshit, stepCrochet*0.002, 'circOut')
		doTweenX('tuin', 'camHUD', -angleshit*8, crochet*0.001, 'linear')
		doTweenAngle('tt', 'camGame', angleshit, stepCrochet*0.002, 'circOut')
		doTweenX('ttrn', 'camGame', -angleshit*8, crochet*0.001, 'linear')
	else
		setProperty('camHUD.angle',0)
		setProperty('camHUD.x',0)
		setProperty('camHUD.x',0)
	end
		
end

function onStepHit()
	if curBeat < 388 then
		if curStep % 4 == 0 then
			doTweenY('rrr', 'camHUD', -5, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
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

            setProperty('defaultCamZoom',0.9)
            if getProperty('bf.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('bf.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('bf.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('bf.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
end