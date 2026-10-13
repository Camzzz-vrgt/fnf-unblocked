-- fade out
function onCreatePost()
	makeLuaSprite('fade', 'Black', -3000, -500)
    scaleObject('fade', 5, 5)
	addLuaSprite('fade', true)
	setObjectCamera('fade', 'other')
end

function onSongStart()
	-- Inst and Vocals start playing, songPosition = 0
	doTweenAlpha('fadeout', 'fade', 0, 5, 'linear')
end
