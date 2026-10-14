function onCreatePost()
  setPropertyFromGroup('opponentStrums',0,'x','-500')
  setPropertyFromGroup('opponentStrums',1,'x','-500')
  setPropertyFromGroup('opponentStrums',2,'x','-500')
  setPropertyFromGroup('opponentStrums',3,'x','-500')

  setPropertyFromGroup('playerStrums',0,'x','723')
  setPropertyFromGroup('playerStrums',1,'x','835')
  setPropertyFromGroup('playerStrums',2,'x','950')
  setPropertyFromGroup('playerStrums',3,'x','1061')

  addCharacterToList('x')
  addCharacterToList('Red x')
  addCharacterToList('LX')
  addCharacterToList('AngryGF')
  addCharacterToList('CryGF')
  addCharacterToList('bfcry')
end

function onStepHit()
	if curStep == 403 then

		setProperty("gf.visible", true)
	
	end

	if curStep == 1120 then
		setProperty('effect.visible', false)
		setProperty("gf.visible", false)
		cameraFlash('hud','FFFFFF','0.5')
		setProperty("stagefront.visible", false)
		setProperty("stagefront2.visible", false)

		setProperty("stagebackk.visible", false)
		setProperty("stick blood.visible", false)
		setProperty("stick.visible", false)



		setProperty("yes.visible", false)
		setProperty("mount.visible", false)
		setProperty("mount2.visible", false)

		setProperty('Floor.visible', true)
		setProperty('stand.visible', true)
	end
	if curStep == 1944 then
		setProperty('GraphicWhite.visible', true)
		setProperty('effect.visible', false)
		setProperty("gf.visible", false)
		cameraFlash('hud','FFFFFF','0.5')
		setProperty("stagefront.visible", false)
		setProperty("stagefront2.visible", false)

		setProperty("stagebackk.visible", false)
		setProperty("stick blood.visible", false)
		setProperty("stick.visible", false)



		setProperty("yes.visible", false)
		setProperty("mount.visible", false)
		setProperty("mount2.visible", false)

		setProperty('Floor.visible', false)
		setProperty('stand.visible', false)
	end

	if curStep == 2204 then
		setProperty('boyfriend.visible', false)

end
if curStep == 2432 then
	doTweenAlpha('X', 'x', 1.5, 1.5, 'linear')


end
            if curStep == 2464 then
				setProperty('stand.visible', false)
				setProperty('GraphicWhite.visible', false)
				setProperty('effect.visible', true)
				setProperty("gf.visible", true)
		cameraFlash('hud','FFFFFF','0.5')
		setProperty("stagefront.visible", true)
		setProperty("stagefront2.visible", true)

		setProperty("stagebackk.visible", true)
		setProperty("stick blood.visible", true)
		setProperty("stick.visible", true)

		setProperty('x.visible', false)

		setProperty("yes.visible", true)
		setProperty("mount.visible", true)
		setProperty("mount2.visible", true)

		setProperty('Floor.visible', false)
		setProperty('stand.visible', false)

      end
	  if curStep == 2720 then
		setProperty('effect.visible', false)
		setProperty("gf.visible", false)
		cameraFlash('hud','FFFFFF','0.5')
		setProperty("stagefront.visible", false)
		setProperty("stagefront2.visible", false)

		setProperty("stagebackk.visible", false)
		setProperty("stick blood.visible", false)
		setProperty("stick.visible", false)



		setProperty("yes.visible", false)
		setProperty("mount.visible", false)
		setProperty("mount2.visible", false)

		setProperty('Floor.visible', true)
		setProperty('stand.visible', true)
	end
	if curStep == 2848 then
		setProperty('effect.visible', true)
		setProperty("gf.visible", true)
		cameraFlash('hud','FFFFFF','0.5')
		setProperty("stagefront.visible", true)
		setProperty("stagefront2.visible", true)

		setProperty("stagebackk.visible", true)
		setProperty("stick blood.visible", true)
		setProperty("stick.visible", true)



		setProperty("yes.visible", true)
		setProperty("mount.visible", true)
		setProperty("mount2.visible", true)

		setProperty('Floor.visible', false)
		setProperty('stand.visible', false)

      end
	  if curStep == 3872 then
		setProperty('effect.visible', false)
		setProperty("gf.visible", false)
		cameraFlash('hud','FFFFFF','0.5')
		setProperty("stagefront.visible", false)
		setProperty("stagefront2.visible", false)

		setProperty("stagebackk.visible", false)
		setProperty("stick blood.visible", false)
		setProperty("stick.visible", false)



		setProperty("yes.visible", false)
		setProperty("mount.visible", false)
		setProperty("mount2.visible", false)

		setProperty('Floor.visible', true)
		setProperty('stand.visible', true)
	end
	if curStep == 4000 then
		setProperty('effect.visible', true)
		setProperty("gf.visible", true)
		cameraFlash('hud','FFFFFF','0.5')
		setProperty("stagefront.visible", true)
		setProperty("stagefront2.visible", true)

		setProperty("stagebackk.visible", true)
		setProperty("stick blood.visible", true)
		setProperty("stick.visible", true)



		setProperty("yes.visible", true)
		setProperty("mount.visible", true)
		setProperty("mount2.visible", true)

		setProperty('Floor.visible', false)
		setProperty('stand.visible', false)

      end
	  if curStep == 4256 then
		setProperty('effect.visible', false)
		setProperty("gf.visible", false)
		cameraFlash('hud','FFFFFF','0.5')
		setProperty("stagefront.visible", false)
		setProperty("stagefront2.visible", false)

		setProperty("stagebackk.visible", false)
		setProperty("stick blood.visible", false)
		setProperty("stick.visible", false)



		setProperty("yes.visible", false)
		setProperty("mount.visible", false)
		setProperty("mount2.visible", false)

		setProperty('Floor.visible', true)
		setProperty('stand.visible', true)
	end
	if curStep == 4288 then
		setProperty('effect.visible', true)
		setProperty("gf.visible", true)
		cameraFlash('hud','FFFFFF','0.5')
		setProperty("stagefront.visible", true)
		setProperty("stagefront2.visible", true)

		setProperty("stagebackk.visible", true)
		setProperty("stick blood.visible", true)
		setProperty("stick.visible", true)



		setProperty("yes.visible", true)
		setProperty("mount.visible", true)
		setProperty("mount2.visible", true)

		setProperty('Floor.visible', false)
		setProperty('stand.visible', false)
      end
end