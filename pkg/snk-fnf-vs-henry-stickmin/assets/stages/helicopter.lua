function onCreate()
    makeLuaSprite('moreskyfront', 'charlie/sky', 950, -250)
    addLuaSprite('moreskyfront', false)

    makeLuaSprite('sky', 'charlie/sky', -350, -250)
    addLuaSprite('sky', false)

    makeLuaSprite('sun', 'charlie/sun', 3900, 0)
    addLuaSprite('sun', false)

    makeLuaSprite('clouds', 'charlie/fclouds', 800, -250)
    addLuaSprite('clouds', false)

    makeLuaSprite('cockpit', 'charlie/cockpit', 3030, 780)
    addLuaSprite('cockpit', false)

    makeLuaSprite('helicopter', 'charlie/helicopter', 0, 0)
    addLuaSprite('helicopter', false)

    makeAnimatedLuaSprite('propolback', 'charlie/propellerBACK', -310, 0);
	addAnimationByPrefix('propolback', 'idle', 'PROPELLERBACK0', 24, true);
	addLuaSprite('propolback', false);

    makeAnimatedLuaSprite('propoltop', 'charlie/propellerTOP', 800, -450);
	addAnimationByPrefix('propoltop', 'idle', 'propeller0', 24, true);
	addLuaSprite('propoltop', false);


    makeLuaSprite('cloudsFG', 'charlie/fclouds2', 800, -400)
    addLuaSprite('cloudsFG', true)

doTweenX('SunMove', 'sun', -10000, 800, 'linear')
doTweenX('clouds1', 'clouds', -9000, 3, 'linear')
doTweenX('cloudsFG', 'cloudsFG', -8000, 1.90, 'linear')
runTimer('cloudreset', 3)
runTimer('cloudresetFG', 2)
end

function onUpdate()
    setProperty('gf.alpha', 0);
end

function onTimerCompleted(tag, loops, loopsLeft)

if tag == 'cloudreset' then
setProperty('clouds.x', 5000)
runTimer('cloudreset', 3)
doTweenX('clouds1', 'clouds', -9000, 3, 'linear')

end

if tag == 'cloudresetFG' then
setProperty('cloudsFG.x', 5000)
doTweenX('cloudsFG', 'cloudsFG', -8000, 2, 'linear')
runTimer('cloudresetFG', 2)
end
end