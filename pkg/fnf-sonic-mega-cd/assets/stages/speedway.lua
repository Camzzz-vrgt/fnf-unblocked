xshit = -950
yshit = -550
scaleshit = 1.35
function onCreate()
	makeLuaSprite('sky', 'metallicdouble/sky', xshit, yshit);
	scaleObject('sky', scaleshit, scaleshit);

	makeLuaSprite('light1', 'metallicdouble/light1', xshit + 835, yshit);
	scaleObject('light1', scaleshit, scaleshit);
	setProperty('light1.alpha', 0.4);
	setBlendMode('light1', 'add');

	makeLuaSprite('light2', 'metallicdouble/light2', xshit + 1841, yshit);
	scaleObject('light2', scaleshit, scaleshit);
	setProperty('light2.alpha', 0.4);
	setBlendMode('light2', 'add');

	makeLuaSprite('light3', 'metallicdouble/light3', xshit + 2520, yshit);
	scaleObject('light3', scaleshit, scaleshit);
	setProperty('light3.alpha', 0.4);
	setBlendMode('light3', 'add');

	makeLuaSprite('stage', 'metallicdouble/stage', xshit, yshit);
	scaleObject('stage', scaleshit, scaleshit);

	addLuaSprite('sky', false);
	addLuaSprite('light1', false);
	addLuaSprite('light2', false);
	addLuaSprite('light3', false);
	addLuaSprite('stage', false);

	doTweenAngle('yellowLight1', 'light1', -20, 3, 'quadInOut')
	doTweenAngle('pinkLight', 'light2', 25, 4, 'quadInOut')
	doTweenAngle('yellowLight2', 'light3', -30, 3.5, 'quadInOut')

	doTweenX('yellowLight1X', 'light1', getProperty('light1.x') - 20, 3, 'quadInOut')
	doTweenX('pinkLightX', 'light2', getProperty('light2.x') + 90, 4, 'quadInOut')

    runTimer('delayYellow1', 3, 1)
	runTimer('delayPink', 4, 1)
	runTimer('delayYellow2', 3.5, 1)
end

tweenedYellow1 = false;
tweenedPink = false;
tweenedYellow2 = false;

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'delayYellow1' and tweenedYellow1 == false then
	doTweenAngle('yellowLight1', 'light1', 0, 3, 'quadInOut')
	doTweenX('yellowLight1X', 'light1', getProperty('light1.x') + 20, 3, 'quadInOut')
    runTimer('delayYellow1', 3, 1)
    tweenedYellow1 = true

    elseif tag == 'delayYellow1' and tweenedYellow1 == true then
	doTweenAngle('yellowLight1', 'light1', -20, 3, 'quadInOut')
	doTweenX('yellowLight1X', 'light1', getProperty('light1.x') - 20, 3, 'quadInOut')
	tweenedYellow1 = false 
    runTimer('delayYellow1', 3, 1)

	elseif tag == 'delayPink' and tweenedPink == false then
	doTweenAngle('pinkLight', 'light2', 0, 4, 'quadInOut')
	doTweenX('pinkLightX', 'light2', getProperty('light2.x') - 90, 4, 'quadInOut')
    runTimer('delayPink', 4, 1)
    tweenedPink = true

    elseif tag == 'delayPink' and tweenedPink == true then
	doTweenAngle('pinkLight', 'light2', 25, 4, 'quadInOut')
	doTweenX('pinkLightX', 'light2', getProperty('light2.x') + 90, 4, 'quadInOut')
	tweenedPink = false 
    runTimer('delayPink', 4, 1)

	elseif tag == 'delayYellow2' and tweenedYellow2 == false then
	doTweenAngle('yellowLight2', 'light3', 0, 3.5, 'quadInOut')
    runTimer('delayYellow2', 3, 1)
    tweenedYellow2 = true

    elseif tag == 'delayYellow2' and tweenedYellow2 == true then
	doTweenAngle('yellowLight2', 'light3', -30, 3.5, 'quadInOut')
	tweenedYellow2 = false 
    runTimer('delayYellow2', 3, 1)
    end
end
