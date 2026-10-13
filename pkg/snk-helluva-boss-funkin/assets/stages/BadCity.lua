function onCreate()
-- background shit
makeLuaSprite('sky', 'BadMoxxie/Sky', -750, -500);
scaleObject('sky', 0.6, 0.6);
setScrollFactor('sky', 0.4, 1);

makeLuaSprite('city', 'BadMoxxie/City', -650, -500);
scaleObject('city', 0.6, 0.6);
setScrollFactor('city', 0.4, 1);
makeLuaSprite('side', 'BadMoxxie/Side', -600, -500);
scaleObject('side', 0.6, 0.6);
setScrollFactor('side', 0.6, 1);
makeLuaSprite('railing', 'BadMoxxie/Railing', -750, -500);
scaleObject('railing', 0.6, 0.6);
makeLuaSprite('floor', 'BadMoxxie/Floor', -750, -500);
scaleObject('floor', 0.6, 0.6);

makeLuaSprite('paper', 'BadMoxxie/PaperEffect', 0, 0)
--setGraphicSize('paper',screenWidth*(2.5-getProperty('defaultCamZoom')), screenHeight*(2.5-getProperty('defaultCamZoom')))
setScrollFactor('paper',0,0)
screenCenter('paper')

makeAnimatedLuaSprite('winners1','BadMoxxie/crowd1',-350,175)
scaleObject('winners1',1.375,1.375)
addAnimationByPrefix('winners1','idle','1',24,false)
objectPlayAnimation('winners1','idle')

makeAnimatedLuaSprite('winners2','BadMoxxie/crowd2', 700, 150)
scaleObject('winners2',1.375,1.375)
addAnimationByPrefix('winners2','idle','2',24,false)
objectPlayAnimation('winners2','idle')


makeAnimatedLuaSprite('3','BadMoxxie/3', -1800, 300)
scaleObject('3',2,2)
addAnimationByPrefix('3','idle','3',24,true)
objectPlayAnimation('3','idle')

makeAnimatedLuaSprite('4','BadMoxxie/4', 2300, 550)
scaleObject('4',2,2)
addAnimationByPrefix('4','idle','4',24,true)
objectPlayAnimation('4','idle')

makeAnimatedLuaSprite('5','BadMoxxie/5', -1850, 450)
scaleObject('5',2,2)
addAnimationByPrefix('5','idle','5',24,true)
objectPlayAnimation('5','idle')

makeAnimatedLuaSprite('6','BadMoxxie/6', 2100, 375)
scaleObject('6',2,2)
addAnimationByPrefix('6','idle','6',24,true)
objectPlayAnimation('6','idle')

makeLuaSprite('frontrail', 'BadMoxxie/FrontRailing', -750, -500);
scaleObject('frontrail', 0.6, 0.6);

addLuaSprite('sky', false);
addLuaSprite('city', false);
addLuaSprite('side', false);
addLuaSprite('railing', false);
addLuaSprite('floor', false);

addLuaSprite('winners1', false);
addLuaSprite('winners2', false);
addLuaSprite('3', true);
addLuaSprite('6', true);
addLuaSprite('4', true);
addLuaSprite('5', true);
addLuaSprite('frontrail', true);
addLuaSprite('paper', true);


end


function onCountdownTick(counter)
if counter == 2 then

objectPlayAnimation('winners2','idle', true)
objectPlayAnimation('winners1','idle', true)
end
end
rando = 0
function onBeatHit()
rando = getRandomInt(1,4)
if curBeat % 2 == 0 then
objectPlayAnimation('winners2','idle', true)
objectPlayAnimation('winners1','idle', true)
end

if curBeat %55 == 0 then

if rando == 1 then
if not getProperty('3.flipX') then
setProperty('3.velocity.x', 200)
else
 setProperty('3.velocity.x', -200)
end

elseif rando == 2 then
if not getProperty('5.flipX') then
setProperty('5.velocity.x', 200)
else
 setProperty('5.velocity.x', -200)
end

elseif rando == 3 then
if getProperty('4.flipX') then
setProperty('4.velocity.x', 200)
else
 setProperty('4.velocity.x', -200)
end
elseif rando == 4 then
if getProperty('6.flipX') then
setProperty('6.velocity.x', 200)
else
 setProperty('6.velocity.x', -200)
end
end
end
end
function onSongStart()
setProperty('healthBar.visible', false);
setProperty('healthBarBG.visible', false);
end

function onCreatePost()
setProperty('healthBar.visible', false);
setProperty('healthBar.alpha', 0);
setProperty('healthBarBG.visible', false);
setProperty('healthBarBG.alpha', 0);
--hiding some hud stuff, healthBarBG copies healthBar's alpha so i dont need to set it
--620 - 550
makeLuaSprite('hbFinaleBlue', 'badHealthBar', 0, (downscroll and -9 or 550)); --making the healthbar, which is two images that overlap each other
setObjectCamera('hbFinaleBlue', 'hud');
screenCenter('hbFinaleBlue', 'x');
addLuaSprite('hbFinaleBlue');

makeLuaSprite('hbFinaleRed', 'badHealthBar', 0, (downscroll and -9 or 550));
setObjectCamera('hbFinaleRed', 'hud');
screenCenter('hbFinaleRed', 'x');
addLuaSprite('hbFinaleRed');

makeLuaSprite('healthBarOV', 'badHealthBarNoFill', 0, (downscroll and -9 or 550));
setObjectCamera('healthBarOV', 'hud');
screenCenter('healthBarOV', 'x');
addLuaSprite('healthBarOV');

setObjectOrder('iconP1', getObjectOrder('healthBarOV') + 1);
setProperty('hbFinaleRed.color', getIconColor('dad'))
setProperty('hbFinaleBlue.color', getIconColor('boyfriend'))

-- iconP1pos = getProperty('hbFinaleRed.x') + getProperty('hbFinaleRed.width')
-- iconP2pos = getProperty('hbFinaleRed.x') - getProperty('iconP2.width')

iconP1pos = 630
iconP2pos = 495





-- debugPrint(getProperty('iconP1.x'))
end

iconP1pos = 0
iconP2pos = 0

curFrame = 0;
curHealth = 0;
iconAnim = 'default';
function onUpdatePost(e)

setProperty('hbFinaleBlue.alpha', getProperty('iconP1.alpha'))
setProperty('hbFinaleRed.alpha', getProperty('iconP1.alpha'))
setProperty('healthBarOV.alpha', getProperty('iconP1.alpha'))

setProperty('iconP1.x',iconP1pos)
setProperty('iconP2.x',iconP2pos)
setProperty('iconP1.offset.y', 20)
setProperty('iconP2.offset.y', 30)

curFrame = curFrame + e*24;
if curFrame > 9 then
curFrame = 0;
end

curHealth = getProperty('health')/2;
setProperty('hbFinaleRed._frame.frame.width', (math.lerp(getProperty('hbFinaleRed.width'), 0, curHealth))); --masking parts of the opponent healthbar based on some offset + health
-- getProperty('hbFinaleRed.width')

if not getProperty('3.flipX') then
if getProperty('3.x') >= 2000 then
setProperty('3.velocity.x', 0)
setProperty('3.flipX', true)
end
else
 if getProperty('3.x') <= -2000 then
setProperty('3.velocity.x', 0)
setProperty('3.flipX', false)
end
end

if not getProperty('5.flipX') then
if getProperty('5.x') >= 2000 then
setProperty('5.velocity.x', 0)
setProperty('5.flipX', true)
end
else
 if getProperty('5.x') <= -2000 then
setProperty('5.velocity.x', 0)
setProperty('5.flipX', false)
end
end

if getProperty('4.flipX') then
if getProperty('4.x') >= 2000 then
setProperty('4.velocity.x', 0)
setProperty('4.flipX', true)
end
else
 if getProperty('4.x') <= -2000 then
setProperty('4.velocity.x', 0)
setProperty('4.flipX', false)
end
end

if getProperty('6.flipX') then
if getProperty('6.x') >= 2000 then
setProperty('6.velocity.x', 0)
setProperty('6.flipX', true)
end
else
 if getProperty('6.x') <= -2000 then
setProperty('6.velocity.x', 0)
setProperty('6.flipX', false)
end
end

end

function math.lerp(a, b, t)
return a + t * (b - a);
end
function onEvent(name, value1, value2)
if string.lower(name) == "change character" then
if string.lower(value1) == 'dad' then
setProperty('hbFinaleRed.color', getIconColor('dad'))
end

if string.lower(value1) == 'bf' then
setProperty('hbFinaleBlue.color', getIconColor('boyfriend'))
end
end
end

function getIconColor(chr)
local chr = chr or "dad" or "boyfriend"
return getColorFromHex(rgbToHex(getProperty(chr .. ".healthColorArray")))
end

function rgbToHex(array)
return string.format('%.2x%.2x%.2x', array[1], array[2], array[3])
end