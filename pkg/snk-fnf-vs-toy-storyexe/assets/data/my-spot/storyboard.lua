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
    makeLuaSprite('bg', 'Storyboard-bg/BACKGROUND_STORYBOARD_WOODYV2', ekis, ye);
	scaleObject('bg', scales, scales);
    addLuaSprite('bg', false);

    makeAnimatedLuaSprite('rexito', 'Storyboard-bg/Rex', 2000, -120)
    addAnimationByPrefix('rexito','idlerexito','Rex Rex-Dance',7,true)
	scaleObject('rexito', 1, 1)
    addLuaSprite('rexito',false)

    makeAnimatedLuaSprite('oink-oink', 'Storyboard-bg/Ham', 2000, -40)
    addAnimationByPrefix('oink-oink','idleHam','Ham idle',20,true)
	scaleObject('oink-oink', 1, 1)
    addLuaSprite('oink-oink',true)

    makeAnimatedLuaSprite('lapapa', 'Storyboard-bg/Potatoe-Head', 300, 1000)
    addAnimationByPrefix('lapapa','idlepatata','Potatoe-Head Papa-Dance',7,true)
	scaleObject('lapapa', 1, 1)
    addLuaSprite('lapapa',true)


    makeLuaSprite('downP', null, 0, -200)
	makeGraphic('downP', 1400, 300, '000000')
    setObjectCamera('downP', 'camhud')


    makeLuaSprite('UPP', null, 0, 600)
	makeGraphic('UPP', 1400, 300, '000000')
    setObjectCamera('UPP', 'camhud')
end    

local xx = 800;
local yy = 300;
local xx2 = 850;
local yy2 = 450;
local ofs = 18;
local followchars = true;
local del = 0;
local del2 = 0;
function onUpdate()
    setProperty('boyfriend.y',350)
    for i=0,7 do
        noteTweenAlpha(i+0, i, 0.7, 1)
    end 
    if curStep == 114 then
        doTweenY('lolpapa','lapapa',200,1,'circOut')
        setProperty('oink-oink.y',300)
        doTweenX('lolrex','rexito',1000,1,'circOut')
        doTweenX('oink-move','oink-oink',1000,1,'circOut')
    end
end