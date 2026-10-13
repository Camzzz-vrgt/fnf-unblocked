function onCreate()
	makeLuaSprite('bruh','boners/PORNPORNPORNGAYSEXPORN',-75,-240)
	addLuaSprite('bruh',false)
	scaleObject('bruh',0.5,0.5)
end
function onSongStart()
	if not middlescroll then
		noteTweenX('0 to 4',0,defaultPlayerStrumX0,0.001,'elasticInOut')
		noteTweenX('1 to 5',1,defaultPlayerStrumX1,0.001,'elasticInOut')
		noteTweenX('2 to 6',2,defaultPlayerStrumX2,0.001,'elasticInOut')
		noteTweenX('3 to 7',3,defaultPlayerStrumX3,0.001,'elasticInOut')
		noteTweenX('4 to 0',4,defaultOpponentStrumX0,0.001,'elasticInOut')
		noteTweenX('5 to 1',5,defaultOpponentStrumX1,0.001,'elasticInOut')
		noteTweenX('6 to 2',6,defaultOpponentStrumX2,0.001,'elasticInOut')
		noteTweenX('7 to 3',7,defaultOpponentStrumX3,0.001,'elasticInOut')
		runTimer('notesSwapFin',0.6)
	end
end
function onBeatHit()
	if curBeat % 1 == 0 then
		noteTweenX('0 bop in',0,defaultPlayerStrumX0-20,0.05)
		noteTweenX('1 bop in',1,defaultPlayerStrumX1-20,0.05)
		noteTweenX('2 bop in',2,defaultPlayerStrumX2-20,0.05)
		noteTweenX('3 bop in',3,defaultPlayerStrumX3-20,0.05)
	end
end
function onTweenCompleted(tag)
	if tag == '0 bop in' then
		noteTweenX('0 bop out',0,defaultPlayerStrumX0,0.2)
		noteTweenX('1 bop out',1,defaultPlayerStrumX1,0.2)
		noteTweenX('2 bop out',2,defaultPlayerStrumX2,0.2)
		noteTweenX('3 bop out',3,defaultPlayerStrumX3,0.2)
	end
end