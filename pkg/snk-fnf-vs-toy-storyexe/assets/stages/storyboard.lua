function onStartCountdown()
    makeLuaSprite('coso', 'empty', 0, 0)
	makeGraphic('coso', 1400, 1100, '000000')
	setObjectCamera('coso', 'camOther')
    doTweenAlpha('fadeout', 'coso', 0.2, 5, 'linear')
	addLuaSprite('coso', true)
end  
function onCreatePost()
    ekis=-600
    ye=-400
    scales=0.7
    makeLuaSprite('bg', 'Storyboard-bg/BACKGROUND_STORYBOARD_WOODYV2', -600, -400);
	scaleObject('bg', 0.7, 0.7);
    addLuaSprite('bg', false);

   

    makeAnimatedLuaSprite('rexito', 'Storyboard-bg/Rex', 2000, -120)
    addAnimationByPrefix('rexito','idlerexito','Rex Rex-Dance',7,true)
	scaleObject('rexito', 1, 1)
    addLuaSprite('rexito',false)


    makeAnimatedLuaSprite('oink-oink', 'Storyboard-bg/Ham', 2000, -40)
    addAnimationByPrefix('oink-oink','idleHam','Ham idle',20,true)
	scaleObject('oink-oink', 1, 1)
    addLuaSprite('oink-oink',true)


    
    makeAnimatedLuaSprite('slinkyOMG', 'Storyboard-bg/slinky',0, -250)
    addAnimationByPrefix('slinkyOMG','idleslinkyomg','Slinky Idle-Dance-Slinky',20,true)
	scaleObject('slinkyOMG', 1, 1)
    addLuaSprite('slinkyOMG',true)

    makeAnimatedLuaSprite('lapapa', 'Storyboard-bg/Potatoe-Head', 300, 1000)
    addAnimationByPrefix('lapapa','idlepatata','Potatoe-Head Papa-Dance',7,true)
	scaleObject('lapapa', 1, 1)
    addLuaSprite('lapapa',true)


    makeLuaSprite('downP', '', 0, -200)
	makeGraphic('downP', 1400, 300, '000000')
    setObjectCamera('downP', 'camhud')


    makeLuaSprite('UPP', '', 0, 600)
	makeGraphic('UPP', 1400, 300, '000000')
    setObjectCamera('UPP', 'camhud')

    setProperty('slinkyOMG.alpha',0)
end    

local xx = 660;
local yy = 360;
local xx2 = 700;
local yy2 = 420;
local ofs = 18;
local followchars = true;
local del = 0;
local del2 = 0;
function onUpdate()
    setProperty('boyfriend.y',350)
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
    for i=0,7 do
        noteTweenAlpha(i+0, i, 0.7, 1)
    end 

    doTweenY('lolpapa','lapapa',200,1,'circOut')
    setProperty('oink-oink.y',300)
    doTweenX('lolrex','rexito',1000,1,'circOut')
    doTweenX('oink-move','oink-oink',1000,1,'circOut')

end