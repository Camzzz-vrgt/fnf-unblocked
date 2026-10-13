--Por Nickobelit
local u = false;
local r = 0;
local shot = false;
local agent = 1
local health = 0;
local xx = 1100;
local yy = 850;
local xx2 = 1400;
local yy2 = 850;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
     makeLuaSprite('bg', 'tripleTrouble/tripleBG', 100, 110)
	 addLuaSprite('bg', false);
	 scaleObject('bg',1.2,1.2)
	
	makeLuaSprite('bgBlack', 'tripleTrouble/blackBG', 100, 110)
	 addLuaSprite('bgBlack', false);
	 scaleObject('bgBlack',1.2,1.2)
	setProperty('bgBlack.alpha',0)

	makeLuaSprite('fgBlack', 'tripleTrouble/blackFG', 100, 110)
	 addLuaSprite('fgBlack', true);
	 scaleObject('fgBlack',1.2,1.2)
	setProperty('fgBlack.alpha',0)
	
	makeLuaSprite('flashPink', 'tripleTrouble/flashbackPink', 100, 110)
	 addLuaSprite('flashPink', false);
	 scaleObject('flashPink',0.8,0.8)
	setProperty('flashPink.alpha',0)
	
	makeLuaSprite('flashGreyBG', 'tripleTrouble/flashbackGrey', 240, 40)
	 addLuaSprite('flashGreyBG', false);
	 scaleObject('flashGreyBG',1.2,1.2)
	setProperty('flashGreyBG.alpha',0)
	
	makeLuaSprite('flashGreyFront', 'tripleTrouble/flashbackGreyFront', 240, 40)
	 addLuaSprite('flashGreyFront', true);
	 scaleObject('flashGreyFront',1.2,1.2)
	setProperty('flashGreyFront.alpha',0)
	
	makeLuaSprite('airshipGreyBG', 'tripleTrouble/greyAirship', -300, 190)
	 addLuaSprite('airshipGreyBG', false);
	 scaleObject('airshipGreyBG',1,1)
	setProperty('airshipGreyBG.alpha',0)
	
	makeLuaSprite('flashMaroon', 'tripleTrouble/flashbackMaroon', -20, 85)
	 addLuaSprite('flashMaroon', false);
	 scaleObject('flashMaroon',0.9,0.9)
	setProperty('flashMaroon.alpha',0)
	
	if not lowQuality then
     makeLuaSprite('oscuridad', 'tripleTrouble/graymultiply', -300, 190)
	 addLuaSprite('oscuridad', true);
	 setBlendMode('oscuridad','MULTIPLY')
	 setProperty('oscuridad.alpha',0)
	
	makeLuaSprite('overlayGrey', 'tripleTrouble/grayOverlay',-300, 190)
    addLuaSprite('overlayGrey', true)
    setBlendMode('overlayGrey','MULTIPLY')
    setProperty('overlayGrey.alpha',0)
	
	makeLuaSprite('overlayMaroon', 'tripleTrouble/overlay', -100, -100)
	addLuaSprite('overlayMaroon', true);
	setProperty('overlayMaroon.alpha', 0);
	setBlendMode('overlayMaroon','add')
	
	makeLuaSprite('shadowDAD', 'tripleTrouble/shadow', 480, 955)
	 addLuaSprite('shadowDAD', false);
	 scaleObject('shadowDAD',1,1)
	
	makeLuaSprite('shadowBF', 'tripleTrouble/shadow', 1290, 955)
	 addLuaSprite('shadowBF', false);
	 scaleObject('shadowBF',1,1)
	
	    makeLuaSprite('bgFront', 'tripleTrouble/saness', 0,1150);
        scaleObject('bgFront',0.8,0.8)
	    setScrollFactor('bgFront', 1.2, 1.2);
	    addLuaSprite('bgFront', true);   
	
	makeLuaSprite('negro', 'tripleTrouble/lightingpretender',-300,0);
    addLuaSprite('negro',true)
    scaleObject('negro', 1,1);
    setScrollFactor('negro',1.2,1);
    setProperty('negro.alpha',0)
	end

        makeAnimatedLuaSprite('noob49Ghost', 'tripleTrouble/noob49', 320,600)
		addAnimationByPrefix('noob49Ghost', 'idle', 'idle',24,false)
		objectPlayAnimation('noob49Ghost', 'idle',false)
		addLuaSprite('noob49Ghost',false)
		scaleObject('noob49Ghost',1.3,1.3)
		setProperty('noob49Ghost.alpha',0)

	makeLuaSprite('BarradeArriba', '', 0, -120)
	makeGraphic('BarradeArriba', 1280, 120, '000000')
	setObjectCamera('BarradeArriba', 'camHUD')
	addLuaSprite('BarradeArriba', false)

	makeLuaSprite('BarradeAbajo', '', 0, 720)
	makeGraphic('BarradeAbajo', 1280, 120, '000000')
	setObjectCamera('BarradeAbajo', 'camHUD')
	addLuaSprite('BarradeAbajo', false)
end

function onCreatePost()
setProperty('iconP2.y', getProperty('iconP2.y') -20);   
end

function onSongStart()
setProperty('defaultCamZoom',0.65)
end

function onBeatHit()
if curBeat % 2 == 0 then
		objectPlayAnimation('noob49Ghost', 'idle',false)
end
end

function onStepHit()
if curStep == 1040 then
xx = 1250;
yy = 780;
xx2 = 1400;
yy2 = 850;
end

if curStep == 1296 then
xx = 1400;
yy = 850;
xx2 = 1100;
yy2 = 850;
end

if curStep == 1680 then
xx = 1250;
yy = 780;
xx2 = 1400;
yy2 = 780;
end

if curStep == 1936 then
xx = 1100;
yy = 850;
xx2 = 1400;
yy2 = 850;
end

if curStep == 2192 then
xx = 1400;
yy = 850;
xx2 = 1100;
yy2 = 850;
end

if curStep == 2320 then
xx = 1250;
yy = 780;
xx2 = 1100;
yy2 = 850;
end

if curStep == 2832 then
xx = 1100;
yy = 850;
xx2 = 1400;
yy2 = 850;
end

if curStep == 3216 then
xx = 1150;
yy = 850;
xx2 = 1300;
yy2 = 850;
end

if curStep == 3728 then
xx = 1100;
yy = 850;
xx2 = 1400;
yy2 = 850;
end

if curStep == 4112 then
xx = 1250;
yy = 780;
xx2 = 1400;
yy2 = 850;
end
end

function onUpdate()
        setTextColor('scoreHUD',holaColor(getProperty('dad.healthColorArray')[1],getProperty('dad.healthColorArray')[2],getProperty('dad.healthColorArray')[3]))
        setTextColor('scoreTxt',holaColor(getProperty('dad.healthColorArray')[1],getProperty('dad.healthColorArray')[2],getProperty('dad.healthColorArray')[3]))
   setProperty('gf.alpha', 0);
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
            if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','')
    end
    
    if curStep >= 400 and curStep <= 528 then
    setProperty('defaultCamZoom',1)
end
    if curStep >= 528 then
    setProperty('defaultCamZoom',0.65)
end
    if curStep >= 3472 and curStep <= 3728 then
    setProperty('defaultCamZoom',0.8)
end
    if curStep >= 3728 then
    setProperty('defaultCamZoom',0.65)
end
end

function holaColor(RR,GG,BB,PassFromHex)
    local FinalColor=''
    local RGBNum={"0","1","2","3","4","5","6","7","8","9","A","B","C","D","E","F"}
    if RR==nil then RR="00" end
    if GG==nil then GG="00" end
    if BB==nil then BB="00" end
    local RGB={RR,GG,BB}
    for i=1,#RGB do
        FinalColor=FinalColor..RGBNum[math.floor(RGB[i]/16)+1]..RGBNum[(RGB[i]%16)+1]
    end
    if PassFromHex then
        return getColorFromHex(FinalColor)
    else
        return FinalColor
    end
end