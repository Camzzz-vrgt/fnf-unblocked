local downscrollIsLame = 0

function onCreatePost()

	local texture = '' .. 'minecraftNOTE_assets'
	if downscroll then
		downscrollIsLame = 720 else downscrollIsLame = 0
	end

	for i = 0, 3 do setPropertyFromGroup('playerStrums', i, 'texture', texture) end
	
    for i = 0, getProperty('unspawnNotes.length') - 1 do
        if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
            setPropertyFromGroup('unspawnNotes', i, 'texture', texture)
			setPropertyFromGroup('unspawnNotes', i, 'scale.x', 8)
			setPropertyFromGroup('unspawnNotes', i, 'scale.y', 8)
			setPropertyFromGroup('unspawnNotes', i, 'antialiasing', false)
			setPropertyFromGroup('unspawnNotes', i, 'noteSplashDisabled', true)
			if isSustainNote and animation.curAnim.name:endswith('hold') then
				setPropertyFromGroup('unspawnNotes', i, 'scale.y', 24)
			end
        end
    end
	
	for i = 0, 3 do
		setPropertyFromGroup('playerStrums', i, 'scale.x', 8)
		setPropertyFromGroup('playerStrums', i, 'scale.y', 8)
		setPropertyFromGroup('playerStrums', i, 'antialiasing', false)
	end
	
	makeLuaSprite('mcNoteUnderlay', 'minecraftNOTE_assetsBACK', 306, 40 + downscrollIsLame)
	scaleObject('mcNoteUnderlay', 8, 8)
	setProperty('mcNoteUnderlay.antialiasing', false)
	setObjectCamera('mcNoteUnderlay', 'camHUD')
	setObjectOrder('mcNoteUnderlay', 0)
	addLuaSprite('mcNoteUnderlay', true)
	
	for i = 0, 3 do
		noteTweenY('play'..i..'y', i+4, 123 + downscrollIsLame, 0.0001, 'linear')
	end
	noteTweenX('oppo0', 0, -1000, 0.001, 'quartInOut')
	noteTweenX('oppo1', 1, -1000, 0.001, 'quartInOut')
	noteTweenX('oppo2', 2, -1000, 0.001, 'quartInOut')
	noteTweenX('oppo3', 3, -1000, 0.001, 'quartInOut')
	noteTweenX('play0x', 4, 390, 2, 'quartInOut')
	noteTweenX('play1x', 5, 550, 2, 'quartInOut')
	noteTweenX('play2x', 6, 710, 2, 'quartInOut')
	noteTweenX('play3x', 7, 870, 2, 'quartInOut')
	noteTweenAngle('playrotate0', 4, 360, 2, 'quartInOut')
	noteTweenAngle('playrotate1', 5, 360, 2, 'quartInOut')
	noteTweenAngle('playrotate2', 6, 360, 2, 'quartInOut')
	noteTweenAngle('playrotate3', 7, 360, 2, 'quartInOut')
	
end

function onUpdate()
    for i = 0, getProperty('notes.length') do
        if getPropertyFromGroup('notes', i, 'isSustainNote') then
            setPropertyFromGroup('notes', i, 'offset.x', 39)
        end
    end
end