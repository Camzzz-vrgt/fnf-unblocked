function onCreate()
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf_ourple')
	makeLuaSprite('backstage','bgs/safi', 0,0)
	scaleObject('backstage', 1, 1)
	updateHitbox('backstage')
	setProperty('backstage.antialiasing', true)
    setObjectCamera('backstage', 'other')
	addLuaSprite('backstage',false)
	makeLuaSprite('backstage2','bgs/safi2', 0,0)
	scaleObject('backstage2', 1, 1)
	updateHitbox('backstage2')
	setProperty('backstage2.antialiasing', true)
    setObjectCamera('backstage2', 'other')
	addLuaSprite('backstage2',false)
	setProperty('backstage2.visible', false)
end

function onStepHit()
    if curStep == 618 then
        setProperty('backstage.visible', false)
		setProperty('backstage2.visible', true)

	end
end