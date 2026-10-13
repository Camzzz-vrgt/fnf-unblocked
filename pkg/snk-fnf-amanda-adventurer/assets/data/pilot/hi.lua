function onStepHit()
  if curStep == 449 then
	callScript('mods/scripts/videoSpriteHandler', 'makeVideoSprite', {'vid', 'amanda', -300, 0, 'camGame', true})
	scaleObject('videotag', -10, -10, true)
	setObjectOrder('vid',1000)
  end
end