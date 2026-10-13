function onCreate()
    precacheImage('tablet');
	precacheImage('sbstage2');
	precacheImage('cursedfan');
end

function onStepHit()
   if curStep == 1204 then
    removeLuaSprite('sbstage', false);
	removeLuaSprite('wfstage5', false);

    makeLuaSprite('sbstage2', 'sbstage2', -1500, -450);
	setLuaSpriteScrollFactor('sbstage2', 0.8, 0.8);
	scaleObject('sbstage2', 0.7, 0.7);

	makeAnimatedLuaSprite('cursedfan', 'cursedfan', 250, 250);
	setLuaSpriteScrollFactor('cursedfan', 1.2, 1.2);
	scaleObject('cursedfan', 0.7, 0.7);

	addAnimationByPrefix('cursedfan','cursedfan','idle',24,true);

	addLuaSprite('sbstage2', false);
	addLuaSprite('cursedfan', true);

	end
end