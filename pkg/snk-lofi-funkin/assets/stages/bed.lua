local angleshit = 1.0,9;
local anglevar = 0;

function onCreate()
	-- background shit
	makeLuaSprite('Bedroom Top BG', 'W2/Bedroom Top BG', 0,0);
	setLuaSpriteScrollFactor('Bedroom Top BG', 0.9, 0.9);

   makeAnimatedLuaSprite('kittycat', 'W2/kittycat', 580, 490)
   addAnimationByPrefix('kittycat', 'idle', 'Kitty clowfoe', 20, true)
	
	addLuaSprite('Bedroom Top BG', false);
	addLuaSprite('kittycat', false);

end

function onStepHit()
	if curBeat < 388 then
		if curStep % 4== 0 then
			doTweenY('rrr', 'camHUD', -12, stepCrochet*0.002, 'circOut')
			doTweenY('rtr', 'camGame.scroll', 12, stepCrochet*0.002, 'sineIn')
		end
		if curStep % 4 == 2 then
			doTweenY('rir', 'camHUD', 0, stepCrochet*0.002, 'sineIn')
			doTweenY('ryr', 'camGame.scroll', 0, stepCrochet*0.002, 'sineIn')
		end
	end
end