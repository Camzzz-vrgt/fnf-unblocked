-- gf icon script by Misha21220 [GD] (artycity21), dont delete this please
function onCreate()

        if getPropertyFromClass('ClientPrefs', 'hideHUD', false) then
		else if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gficon', 'icons/gf/gfidle', 635, 595)
                else
		makeLuaSprite('gficon', 'icons/gf/gfidle', 635, 50)
                end
                setObjectCamera('gficon', 'other')
                scaleObject('gficon', 0.2, 0.2)
                setProperty('gficon.visible', true)
                addLuaSprite('gficon', true)

		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gfsad', 'icons/gf/gfsad', 635, 595)
                else
		makeLuaSprite('gfsad', 'icons/gf/gfsad', 635, 50)
                end
                setObjectCamera('gfsad', 'other')
                scaleObject('gfsad', 0.2, 0.2)
                setProperty('gfsad.visible', false)
                addLuaSprite('gfsad', true)

		if not getPropertyFromClass('ClientPrefs', 'downScroll', true) then
		makeLuaSprite('gfsmile', 'icons/gf/gfsmile', 635, 595)
                else
		makeLuaSprite('gfsmile', 'icons/gf/gfsmile', 635, 50)
                end
                setObjectCamera('gfsmile', 'other')
                scaleObject('gfsmile', 0.2, 0.2)
                setProperty('gfsmile.visible', false)
                addLuaSprite('gfsmile', true)
       end
end

function onUpdate()
	if getProperty('healthBar.percent') > 51 then
                setProperty('gfsad.flipX', false)
                setProperty('gfsmile.flipX', true)
                setProperty('gficon.flipX', true)
        else
                setProperty('gfsad.flipX', false)
                setProperty('gfsmile.flipX', false)
                setProperty('gficon.flipX', false)
        end

	if getProperty('healthBar.percent') > 80 then
	setProperty('gfsmile.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gfsmile.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gfsmile.alpha', getProperty('healthBar.alpha'))
		setProperty('gfsad.visible', false)
		setProperty('gfsmile.visible', true)
		setProperty('gficon.visible', false)
        else if getProperty('healthBar.percent') < 25 then
	setProperty('gfsad.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gfsad.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gfsad.alpha', getProperty('healthBar.alpha'))
		setProperty('gfsmile.visible', false)
		setProperty('gfsad.visible', true)
		setProperty('gficon.visible', false)
        else
		setProperty('gfsad.visible', false)
		setProperty('gfsmile.visible', false)
		setProperty('gficon.visible', true)
        end
        end

	setProperty('gficon.scale.x', getProperty('iconP1.scale.x'))
	setProperty('gficon.scale.y', getProperty('iconP1.scale.y'))
	setProperty('gficon.alpha', getProperty('healthBar.alpha'))
end --this script is old, i mean this script is first what i made