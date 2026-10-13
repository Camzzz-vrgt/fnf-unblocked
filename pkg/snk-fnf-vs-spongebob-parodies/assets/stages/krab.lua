local xx = 200;
local yy = 500;
local xx2 = 1200;
local yy2 = 500;
local ofs = 30;
local angleshit = 1;
local anglevar = 1;
local followchars = true;
function onCreate()

	makeLuaSprite('money_offer_bg', 'stages/bob sponge/money_offer_bg', -1000, -500);
	addLuaSprite('money_offer_bg', false);
	scaleObject('money_offer_bg', 0.8, 0.8);

	makeLuaSprite('picture 1', 'stages/bob sponge/picture 1', -300, 100);
	addLuaSprite('picture 1', false);
	scaleObject('picture 1', 0.8, 0.8);

	makeLuaSprite('picture 2', 'stages/bob sponge/picture 2', 100, 70);
	addLuaSprite('picture 2', false);
	scaleObject('picture 2', 0.8, 0.8);

	makeLuaSprite('picture 3', 'stages/bob sponge/picture 3', 1300, 50);
	addLuaSprite('picture 3', false);
	scaleObject('picture 3', 0.8, 0.8);

	makeLuaSprite('picture 4', 'stages/bob sponge/picture 4', 1000, 100);
	addLuaSprite('picture 4', false);
	scaleObject('picture 4', 0.8, 0.8);

	makeLuaSprite('picture 5', 'stages/bob sponge/picture 5', -650, 120);
	addLuaSprite('picture 5', false);
	scaleObject('picture 5', 0.8, 0.8);

    precacheImage('stages/bob sponge/cooloutline');
	makeLuaSprite('theblack', 'stages/bob sponge/cooloutline', 0, 0);
	setProperty('theblack.alpha', '0');
	setObjectCamera('theblack', 'other');

    precacheImage('stages/bob sponge/Red_Pulse');
	makeAnimatedLuaSprite('thered', 'stages/bob sponge/Red_Pulse', 0, 0);
	addAnimationByPrefix('thered', 'idle', 'Red Pulsing', 24, false);
	setGraphicSize('thered', 1280, 720);
	objectPlayAnimation('thered', 'idle');
	setProperty('thered.alpha', '0');
	setObjectCamera('thered', 'other');
end
function onBeatHit()
	objectPlayAnimation('cartoony', 'cartoony', true);
	objectPlayAnimation('sponge', 'sponge', true);
	addLuaSprite('theblack', true);
	addLuaSprite('thered', true);
end
