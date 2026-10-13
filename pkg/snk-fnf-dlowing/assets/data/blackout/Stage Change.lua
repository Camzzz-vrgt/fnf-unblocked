function onCreatePost()
    makeLuaSprite('void','black', 0, 0)
	setGraphicSize('void',1280,720)
	setObjectCamera('void','camHud')
	updateHitbox('void')
	setBlendMode('void','multiply')
    addLuaSprite('void', false);
    setProperty('void.visible', true);
end

function onStepHit()
   if curStep == 3 then
      doTweenAlpha('black', 'void',0,2, 'linear');
	  setProperty('cinema.visible', false);
   end
    if curStep == 1344 then
    setProperty('stage.visible', false)
    setProperty('corpse2.visible', false)
    setProperty('corpse3.visible', false)
    setProperty('doors.visible', false)
    setProperty('cs.visible', false)
    setProperty('crown.visible', false)
    setProperty('corpse1.visible', false)
    setProperty('ov.visible', false)
    setProperty('cinema.visible', true)

-- setProperty('lb.visible', false)
 -- setProperty('db.visible', false)
  
    setPropertyFromGroup('playerStrums', 0, 'texture', 'NOTE_assets_bw');
	setPropertyFromGroup('playerStrums', 1, 'texture', 'NOTE_assets_bw');
	setPropertyFromGroup('playerStrums', 2, 'texture', 'NOTE_assets_bw');
	setPropertyFromGroup('playerStrums', 3, 'texture', 'NOTE_assets_bw');
	setPropertyFromGroup('opponentStrums', 0, 'texture', 'NOTE_assets_bw');
	setPropertyFromGroup('opponentStrums', 1, 'texture', 'NOTE_assets_bw');
	setPropertyFromGroup('opponentStrums', 2, 'texture', 'NOTE_assets_bw');
	setPropertyFromGroup('opponentStrums', 3, 'texture', 'NOTE_assets_bw');
	
	--notesplash change
	for i = 0, getProperty('unspawnNotes.length')-1 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteSplashesBW');
				end
			end
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteSplashesBW');
				end
			end
	end
		

	if curStep == 1616 then
    setProperty('cinema.visible', false)
    setProperty('stage.visible', true)
    setProperty('corpse2.visible', true)
    setProperty('corpse3.visible', true)
    setProperty('doors.visible', true)
    setProperty('cs.visible', true)
    setProperty('crown.visible', true)
    setProperty('corpse1.visible', true)
    setProperty('ov.visible', true)

  setProperty('lb.visible', true)
    setProperty('db.visible', true)

	setPropertyFromGroup('playerStrums', 0, 'texture', 'NOTE_assets');
	setPropertyFromGroup('playerStrums', 1, 'texture', 'NOTE_assets');
	setPropertyFromGroup('playerStrums', 2, 'texture', 'NOTE_assets');
	setPropertyFromGroup('playerStrums', 3, 'texture', 'NOTE_assets');
	setPropertyFromGroup('opponentStrums', 0, 'texture', 'NOTE_assets');
	setPropertyFromGroup('opponentStrums', 1, 'texture', 'NOTE_assets');
	setPropertyFromGroup('opponentStrums', 2, 'texture', 'NOTE_assets');
	setPropertyFromGroup('opponentStrums', 3, 'texture', 'NOTE_assets');
	
		--notesplash change
	for i = 0, getProperty('unspawnNotes.length')-1 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') == false then
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteSplashes');
				end
			end
			for i = 0, getProperty('unspawnNotes.length')-1 do
				if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then
				setPropertyFromGroup('unspawnNotes', i, 'noteSplashTexture', 'noteSplashes');
				end
		
		end
end
end

