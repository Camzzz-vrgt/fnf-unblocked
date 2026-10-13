local xx = 150;
local yy = -950;
local xx2 = 820;
local yy2 = 450;
local ofs = 60;
local followchars = true;
local del = 0;
local del2 = 0;
function onCreate()
    makeLuaSprite('Sky', 'tord/bgsky2', -900, -800)
	setLuaSpriteScrollFactor('Sky', 0.9, 0.4);
    makeLuaSprite('BG', 'tord/bgdestroyed', -350, -150)
	makeAnimatedLuaSprite('bystanders', 'tord/old_edd_and_matt', 1085, 220);
	luaSpriteAddAnimationByPrefix('bystanders', 'idle', 'eddandmatt', 24, true);
    addLuaSprite('Sky',  false)
    addLuaSprite('BG',  false)
    addLuaSprite('bystanders',  false)
end