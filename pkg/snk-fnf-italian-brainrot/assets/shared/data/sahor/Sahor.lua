function onCreate()
makeLuaSprite("black","black", 0, 0);
addLuaSprite("black", true);
setObjectCamera("black", 'hud')

makeAnimatedLuaSprite('Title', 'Sahor', 70, 200);
addAnimationByPrefix('Title', 'Idle', 'Sahor', 10, true);
objectPlayAnimation('Title', 'Idle', false);
setObjectCamera('Title', 'hud')
scaleLuaSprite('Title', 2, 2);
addLuaSprite('Title', true);
doTweenX('TitleX', 'Title.scale', 2.0, 0.1, 'linear')
doTweenY('TitleY', 'Title.scale', 2.0, 0.1, 'linear')
doTweenAlpha("TitleFade","Title", 0, 0.1, true);
end

function onSongStart()
doTweenX('TitleX', 'Title.scale', 3, 3, 'linear')
doTweenY('TitleY', 'Title.scale', 3, 3, 'linear')
doTweenAlpha("TitleFade","Title", 1, 1, true);
end

function onBeatHit()
if curBeat == 4 then
doTweenAlpha("TitleFade","Title", 0, 2, true);
doTweenAlpha("black","black", 0, 2, false);
end
end
