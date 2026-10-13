local u = false;
local r = 0;
local i =0
local shot = false;
local agent = 1
local health = 0;
local xx = 900
local yy = -600
local xx2 = 650
local yy2 = 700
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	addCharacterToList('SANSsex2', 'dad')

	makeLuaSprite('bg1', 'ld/love/LOVEbg1', -620, -100);
	setScrollFactor('bg1', 0.1, 0.1);
	addLuaSprite('bg1', false);

	makeLuaSprite('bg2', 'ld/love/LOVEbg2', -620, -100);
	setScrollFactor('bg2', 0.2, 0.2);
	addLuaSprite('bg2', false);

	makeLuaSprite('bg3', 'ld/love/LOVEbg3', -620, -100);
	setScrollFactor('bg3', 0.1, 0.1);
	setBlendMode('bg3', "add")
	setProperty('bg3.alpha', 0.5)
	addLuaSprite('bg3', false);

	makeLuaSprite('bg4', 'ld/love/LOVEbg4', -620, -100);
	setScrollFactor('bg4', 0.3, 0.3);
	addLuaSprite('bg4', false);

	makeLuaSprite('bg5', 'ld/love/LOVEbg5', -620, -100);
	setScrollFactor('bg5', 0.4, 0.4);
	setBlendMode('bg5', "add")
	setProperty('bg5.alpha', 0.5)
	addLuaSprite('bg5', false);

	makeLuaSprite('bg6', 'ld/love/LOVEbg6', -620, -100);
	setScrollFactor('bg6', 0.5, 0.5);
	addLuaSprite('bg6', false);

	makeLuaSprite('bg7', 'ld/love/LOVEbg7', -620, -100);
	setScrollFactor('bg7', 0.6, 0.6);
	setBlendMode('bg7', "add")
	setProperty('bg7.alpha', 0.5)
	addLuaSprite('bg7', false);

	makeLuaSprite('bg8', 'ld/love/LOVEbg8', -640, -100);
	setScrollFactor('bg8', 0.7, 0.7);
	addLuaSprite('bg8', false);

	makeLuaSprite('bg9', 'ld/love/LOVEbg9', -620, -100);
	setScrollFactor('bg9', 0.8, 0.8);
	addLuaSprite('bg9', false);

	makeAnimatedLuaSprite('bg10', 'ld/soat/particlesBG', -200, 300);
		setScrollFactor('bg10', 0.8, 0.8);
		addAnimationByPrefix('bg10', 'idle', 'particlesBG', 24, true)
		scaleObject('bg10', 1, 1)
		setProperty('bg10.blend', "add")
        addLuaSprite('bg10', true);

	makeLuaSprite('bg11', 'ld/love/LOVEbg11', -640, -100);
	setScrollFactor('bg11', 0.8, 0.8);
	setBlendMode('bg11', "add")
	setProperty('bg11.alpha', 0.5)
	addLuaSprite('bg11', true);

	makeLuaSprite('black', '', -1000, -200);
	makeGraphic('black',1280,720,'000000')
	scaleObject('black', 2.5, 2.5)
	setObjectCamera('black', 'game')
	setProperty('black.alpha', 0)
	addLuaSprite('black', true);

	makeLuaSprite('black2', '', 0, 0);
	makeGraphic('black2',1280,720,'000000')
	setObjectCamera('black2', 'hud')
	setProperty('black2.alpha', 0)
	addLuaSprite('black2', true);

	makeLuaSprite('white', '', -1000, -200);
	makeGraphic('white',1280,720,'FFFFFF')
	scaleObject('white', 2.5, 2.5)
	setObjectCamera('white', 'game')
	setProperty('white.alpha', 0)
	addLuaSprite('white', true);

	makeLuaSprite('white2', '', 0, 0);
	makeGraphic('white2',1280,720,'FFFFFF')
	setObjectCamera('white2', 'other')
	setProperty('white2.alpha', 0)
	addLuaSprite('white2', true);
	
end

function onCreatePost()
	setProperty('dad.flipX', 'true')
	setProperty('gf.visible', false)
end

function onUpdate(elapsed)

	daElapsed = elapsed * 30
	i = i + daElapsed

	daYvalue = 
	
	setProperty('dad.y', (math.sin(i/20)*35) + 350)
	setProperty('GBB.y', (math.sin(i/20)*55) + 350)
	yy = (math.sin(i/20)*75) + 650

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
     if followchars == true then
        if mustHitSection == false then
            setProperty('defaultCamZoom', 0.7)
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
            if getProperty('boyfriend.animation.curAnim.name') == 'coolhey' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('dad.animation.curAnim.name') == 'dead' then
                triggerEvent('Camera Follow Pos',450,500)
                setProperty('defaultCamZoom',0.9)
            end
            if getProperty('dad.animation.curAnim.name') == 'deadLoop' then
                --triggerEvent('Camera Follow Pos',450,500)
                setProperty('defaultCamZoom',0.9)
            end
            if getProperty('dad.animation.curAnim.name') == 'confirm' then
                triggerEvent('Camera Follow Pos',450,500)
                setProperty('defaultCamZoom',0.9)
            end
            if getProperty('dad.animation.curAnim.name') == 'confirmLoop' then
                triggerEvent('Camera Follow Pos',450,500)
                setProperty('defaultCamZoom',0.9)
            end
        else
      
            setProperty('defaultCamZoom', 0.6)
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
            if gfSection == true then
                --setProperty('defaultCamZoom',1)
                if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
                    triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
                    triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'singUP' then
                    triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
                end
                if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
                    triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
                end
                if getProperty('boyfriend.animation.curAnim.name') == 'coolhey' then
                    triggerEvent('Camera Follow Pos',xx2,yy2)
                end
                if getProperty('gf.animation.curAnim.name') == 'hey' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'danceLeft' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
                if getProperty('gf.animation.curAnim.name') == 'danceRight' then
                    triggerEvent('Camera Follow Pos',xx3,yy3)
                end
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
end

function onStepHit()
	if songName == 'LOVE' then
		if curStep == 907 then
			setProperty('camGame.visible', false)
			setProperty('camHUD.visible', false)
		end
		if curStep == 1056 then
			doTweenAlpha('white2', 'white2', 1, 1, 'sineInOut')
		end
		if curStep == 1072 then
			setProperty('white2.visible', false)
			setProperty('camGame.visible', true)
			setProperty('camHUD.visible', true)
		end
	end
end