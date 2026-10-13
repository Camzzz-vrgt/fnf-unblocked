function onCreate()
-- background shit
makeLuaSprite('Space', 'susverse/space_is_so_cool', -750, -600);
setScrollFactor('Space', 0.9, 0.9);
addLuaSprite('Space', false);

makeLuaSprite('amongUsGuys1','susverse/SPACE', -500, -300)
addLuaSprite('amongUsGuys1', false)
setProperty('amongUsGuys1.velocity.x', 50)
setProperty('amongUsGuys1.angularVelocity', 50)

makeLuaSprite('Ground', 'susverse/your_grounded', -750, -600);
addLuaSprite('Ground', false);

makeLuaSprite('Wall', 'susverse/where_shit_gets_done', -750, -600);
addLuaSprite('Wall', false);

makeAnimatedLuaSprite('amongUsGuys2', 'susverse/dilfs', 950, -25)
addAnimationByPrefix('amongUsGuys2','idle','dilfs', 24)
addLuaSprite('amongUsGuys2')

makeLuaSprite('Table', 'susverse/i_wonder_what_this_red_button_do', -750, -600);
addLuaSprite('Table', false);

makeAnimatedLuaSprite('amongUsGuys3', 'susverse/lookatthat', -250, -1150)
addAnimationByPrefix('amongUsGuys3','idle','whoa', 24)
addLuaSprite('amongUsGuys3')

makeAnimatedLuaSprite('amongUsGuys4', 'susverse/tabelguys', 50, -1160)
addAnimationByPrefix('amongUsGuys4','idle','tabletop', 24)
addLuaSprite('amongUsGuys4')

makeLuaSprite('Spotlight', 'susverse/duh_duh_duhhh', -750, -600);
addLuaSprite('Spotlight', true);

makeLuaSprite('FG', 'susverse/you_need_glasses_lol', -750, -600);
addLuaSprite('FG', true);

makeAnimatedLuaSprite('amongUsGuys5', 'susverse/orangeandgreen', -700, 300)
addAnimationByPrefix('amongUsGuys5','idle','OrangeNGreen',24)
addLuaSprite('amongUsGuys5',true)

makeLuaSprite('Effect', 'susverse/wtf_is_this', -750, -600);
addLuaSprite('Effect', true);


-- close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end

function onCreatePost()
setProperty('timeBarBG.visible', false)
setProperty('timeTxt.visible', false)

setProperty('timeBar.color', getColorFromHex('44d844'))
makeLuaSprite('among_us_time', 'susverse/timeBar', getProperty('timeBarBG.x'),getProperty('timeBarBG.y'))
setObjectCamera('among_us_time', 'hud')
addLuaSprite('among_us_time', false)

makeLuaText('songnametxt', songName, 0,0,0)
setObjectCamera('songnametxt', 'hud')
setTextFont('songnametxt', 'among us.ttf')
addLuaText('songnametxt', false)--i know i could just force the options to put a song name for the timer, but i feel scared that the code with that will be fucked, so i just took the safe option

setProperty('timeBar.x', 50)
end


function onUpdatePost(elapsed)
setProperty('timeBarBG.alpha', 0)
setProperty('timeTxt.alpha', 0)

if curStep < 1 then
setProperty('songnametxt.x', getProperty('timeBar.x'))
setProperty('songnametxt.y', getProperty('timeBar.y') - 5)

setProperty('among_us_time.x', getProperty('timeBarBG.x'))
setProperty('among_us_time.y', getProperty('timeBarBG.y'))
end

if getProperty('amongUsGuys1.x') >= 2000 then
setProperty('amongUsGuys1.x', -500)
end
end


function onEvent(n,v1,v2)
if n == 'WBG' then
if v1 == 'Bon' then
setProperty('songnametxt.visible', false)
setProperty('among_us_time.visible', false)

setProperty('amongUsGuys2.colorTransform.greenOffset', 255)
setProperty('amongUsGuys2.colorTransform.redOffset', 255)
setProperty('amongUsGuys2.colorTransform.blueOffset', 255)

setProperty('amongUsGuys3.colorTransform.greenOffset', 255)
setProperty('amongUsGuys3.colorTransform.redOffset', 255)
setProperty('amongUsGuys3.colorTransform.blueOffset', 255)

setProperty('amongUsGuys4.colorTransform.greenOffset', 255)
setProperty('amongUsGuys4.colorTransform.redOffset', 255)
setProperty('amongUsGuys4.colorTransform.blueOffset', 255)

setProperty('amongUsGuys5.colorTransform.greenOffset', 255)
setProperty('amongUsGuys5.colorTransform.redOffset', 255)
setProperty('amongUsGuys5.colorTransform.blueOffset', 255)


elseif v1 == 'off' then
setProperty('songnametxt.visible', true)
setProperty('among_us_time.visible', true)
setProperty('songnametxt.alpha', 1)
setProperty('timeBarBG.visible', false)
setProperty('timeTxt.visible', false)

setProperty('amongUsGuys2.colorTransform.greenOffset',0)
setProperty('amongUsGuys2.colorTransform.redOffset',0)
setProperty('amongUsGuys2.colorTransform.blueOffset',0)

setProperty('amongUsGuys3.colorTransform.greenOffset',0)
setProperty('amongUsGuys3.colorTransform.redOffset',0)
setProperty('amongUsGuys3.colorTransform.blueOffset',0)

setProperty('amongUsGuys4.colorTransform.greenOffset',0)
setProperty('amongUsGuys4.colorTransform.redOffset',0)
setProperty('amongUsGuys4.colorTransform.blueOffset',0)

setProperty('amongUsGuys5.colorTransform.greenOffset',0)
setProperty('amongUsGuys5.colorTransform.redOffset',0)
setProperty('amongUsGuys5.colorTransform.blueOffset',0)

setProperty('Spotlight.visible', true)
setProperty('FG.visible', true)
setProperty('Effect.visible', true)
end
end

if n == 'Cinematics (UnderLap)' then
Speed = tonumber(v1)
Distance = tonumber(v2)
doTweenAlpha('Alpha(Uap)', 'songnametxt', 0, Speed - 0.1)
doTweenAlpha('Alpha(Uavp)', 'among_us_time', 0, Speed - 0.1)

if Distance == 0 then
doTweenAlpha('Alpha(Uap)', 'songnametxt', 1, Speed - 0.1)
doTweenAlpha('Alpha(Uavp)', 'among_us_time', 1, Speed - 0.1)
end
end
end