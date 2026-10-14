function onCreatePost()
  setPropertyFromGroup('opponentStrums',0,'x','-500')
  setPropertyFromGroup('opponentStrums',1,'x','-500')
  setPropertyFromGroup('opponentStrums',2,'x','-500')
  setPropertyFromGroup('opponentStrums',3,'x','-500')

  setPropertyFromGroup('playerStrums',0,'x','723')
  setPropertyFromGroup('playerStrums',1,'x','835')
  setPropertyFromGroup('playerStrums',2,'x','950')
  setPropertyFromGroup('playerStrums',3,'x','1061')
end
didskip = false
function onUpdatePost()
    if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SPACE') and not getProperty('startingSong') and didskip == false then
            didskip = true
            setPropertyFromClass('Conductor', 'songPosition', 78000) --time in milliseconds
            setPropertyFromClass('flixel.FlxG', 'sound.music.time', getPropertyFromClass('Conductor', 'songPosition')) --to sync the inst with the song position
            setProperty('vocals.time', getPropertyFromClass('Conductor', 'songPosition')) --to sync the vocals with the song position
    end
end
function onStepHit()
	if curStep == 1056 then
		cameraFlash('hud','000000','0.5')
		setProperty("stagefront.visible", false)
		setProperty("stagefront2.visible", false)

		setProperty("stagebackk.visible", false)
		setProperty("stick blood.visible", false)
		setProperty("stick.visible", false)



		setProperty("yes.visible", false)
		setProperty("mount.visible", false)

		setProperty('Floor.visible', true)
	end

            if curStep == 2496 then
		cameraFlash('hud','000000','0.5')
		setProperty("stagefront.visible", true)
		setProperty("stagefront2.visible", true)

		setProperty("stagebackk.visible", true)
		setProperty("stick blood.visible", true)
		setProperty("stick.visible", true)



		setProperty("yes.visible", true)
		setProperty("mount.visible", true)

		setProperty('Floor.visible', false)

      end
	if curStep == 2560 then
		cameraFlash('hud','000000','0.5')
		setProperty("stagefront.visible", false)
		setProperty("stagefront2.visible", false)

		setProperty("stagebackk.visible", false)
		setProperty("stick blood.visible", false)
		setProperty("stick.visible", false)



		setProperty("yes.visible", false)
		setProperty("mount.visible", false)

		setProperty('Floor.visible', true)
	end
            if curStep == 2624 then
				cameraFlash('hud','000000','0.5')
				setProperty("stagefront.visible", true)
				setProperty("stagefront2.visible", true)
		
				setProperty("stagebackk.visible", true)
				setProperty("stick blood.visible", true)
				setProperty("stick.visible", true)
		
		
		
				setProperty("yes.visible", true)
				setProperty("mount.visible", true)
		
				setProperty('Floor.visible', false)

      end
	if curStep == 2688 then
		cameraFlash('hud','000000','0.5')
		setProperty("stagefront.visible", false)
		setProperty("stagefront2.visible", false)

		setProperty("stagebackk.visible", false)
		setProperty("stick blood.visible", false)
		setProperty("stick.visible", false)



		setProperty("yes.visible", false)
		setProperty("mount.visible", false)

		setProperty('Floor.visible', true)
	end
            if curStep == 2752 then
				cameraFlash('hud','000000','0.5')
				setProperty("stagefront.visible", true)
				setProperty("stagefront2.visible", true)
		
				setProperty("stagebackk.visible", true)
				setProperty("stick blood.visible", true)
				setProperty("stick.visible", true)
		
		
		
				setProperty("yes.visible", true)
				setProperty("mount.visible", true)
		
				setProperty('Floor.visible', false)

      end
	if curStep == 2784 then
		cameraFlash('hud','000000','0.5')
		setProperty("stagefront.visible", false)
		setProperty("stagefront2.visible", false)

		setProperty("stagebackk.visible", false)
		setProperty("stick blood.visible", false)
		setProperty("stick.visible", false)



		setProperty("yes.visible", false)
		setProperty("mount.visible", false)

		setProperty('Floor.visible', true)
	end
            if curStep == 2848 then
				cameraFlash('hud','000000','0.5')
				setProperty("stagefront.visible", true)
				setProperty("stagefront2.visible", true)
		
				setProperty("stagebackk.visible", true)
				setProperty("stick blood.visible", true)
				setProperty("stick.visible", true)
		
		
		
				setProperty("yes.visible", true)
				setProperty("mount.visible", true)
		
				setProperty('Floor.visible', false)

      end
end