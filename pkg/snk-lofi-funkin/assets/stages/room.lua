function onCreate()
	-- background shit
	makeLuaSprite('room', 'W1/room', -1410, -230);
	setLuaSpriteScrollFactor('room', 0.9, 0.9);
    scaleObject('room', 1.3, 1.3);
    addLuaSprite('room', false);

    makeAnimatedLuaSprite('lofi_cat', 'W1/lofi_cat', -729, 520)
    addAnimationByPrefix('lofi_cat', 'idle', 'cat', 20, true)
	setLuaSpriteScrollFactor('lofi_cat', 0.9, 0.9);
    addLuaSprite('lofi_cat', false);
	
	function onUpdatePost()
	setProperty('timeBar.alpha', 0.0);
	setProperty('timeBar.alpha', 0.0);
	end
end