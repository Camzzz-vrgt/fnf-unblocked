-- fade out
function onCreatePost()
	-- end of "create"
	
	makeLuaSprite('whiteflash', 'Black', -1000, -100)
	   scaleObject('whiteflash', 4, 4)
	addLuaSprite('whiteflash', true)
end

function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenAlpha('fadeout', 'whiteflash', 0, 20, 'linear')
end

