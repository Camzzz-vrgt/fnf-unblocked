--Original Script by MTFuture and Ms. Funky#7448

function onCreate() 
	precacheSound('countdown_giffany_broken')
	precacheImage('countdownimg_broken_3')
	precacheImage('countdownimg_broken_2')
	precacheImage('countdownimg_broken_1')
	precacheImage('countdownimg_broken_0')
	makeLuaSprite('three', 'countdownimg_broken_3', 0, 0)
	screenCenter('three', 'xy')
	setObjectCamera('three', 'other')
	makeLuaSprite('two', 'countdownimg_broken_2', 0, 0)
	screenCenter('two', 'xy')
	setObjectCamera('two', 'other')
	makeLuaSprite('one', 'countdownimg_broken_1', 0, 0)
	screenCenter('one', 'xy')
	setObjectCamera('one', 'other')
	makeLuaSprite('go', 'countdownimg_broken_0', 0, 0)
	screenCenter('go', 'xy')
	setObjectCamera('go', 'other')
	setProperty('countdownReady.visible', false)
	setProperty('countdownSet.visible', false)
	setProperty('countdownGo.visible', false)
	setProperty('introSoundsSuffix', '-NADALAVERGAEXACTO')
end
function onCountdownTick(counter)
	if counter == 0 then
		addLuaSprite('three')
		playSound('countdown_giffany_broken')
	elseif counter == 1 then
		removeLuaSprite('three', false)
		addLuaSprite('two')
		playSound('countdown_giffany_broken')
		setProperty('countdownReady.visible', false)		
	elseif counter == 2 then
		removeLuaSprite('two', false)
		addLuaSprite('one')
		playSound('countdown_giffany_broken')
		setProperty('countdownSet.visible', false)
	elseif counter == 3 then
		removeLuaSprite('one', false)
		addLuaSprite('go')
		playSound('countdown_giffany_broken')
		setProperty('countdownGo.visible', false)
	elseif counter == 4 then
		removeLuaSprite('go')
	end
end