function onCreate()

	makeLuaSprite("blackk", 0, 600)
	makeGraphic("blackk", 640, 720, "000000")
	addLuaSprite("blackk", true)
	scaleObject('blackk', 10, 10)
	setProperty("blackk.visible", true)
	
	makeLuaSprite('roughnight', 'titlecards/roughnight', -500, 15)
	setLuaSpriteScrollFactor('roughnight', 1.0, 1.0)
	scaleObject('roughnight', 0.35, 0.35)
	addLuaSprite('roughnight', true)
	setObjectCamera("roughnight", "hud")
	
	makeLuaSprite('hansmonochrome', 'titlecards/hansmonochrome', -1000, -25)
	setLuaSpriteScrollFactor('hansmonochrome', 1.0, 1.0)
	scaleObject('hansmonochrome', 0.35, 0.35)
	addLuaSprite('hansmonochrome', true)
	setObjectCamera("hansmonochrome", "hud")


end

function onSongStart()
    doTweenAlpha("blackkfade", "blackk", 0, 10)
	doTweenX("paka",'roughnight', -540, 0.5,"CubicIn")
	doTweenX("hanshand",'hansmonochrome', -1000, 0.5,"CubicIn")
end

function onBeatHit()
	
	if curBeat == 32 then
	doTweenX("paka",'roughnight', 10, 0.5,"CubicIn")
	doTweenX("hanshand",'hansmonochrome', -540, 0.5,"CubicIn")
	end
	
	if curBeat == 34 then
	doTweenX("hanshand",'hansmonochrome', -1000, 0.5,"CubicIn")
	end

	if curBeat == 40 then
	doTweenX("hanshand",'hansmonochrome', -540, 0.5,"CubicIn")
	end

	if curBeat == 42 then
	doTweenX("paka",'roughnight', -540, 0.5,"CubicIn")
	doTweenX("hanshand",'hansmonochrome', -1000, 0.5,"CubicIn")
	end

end

function onCreatePost()
    setProperty('iconP1.flipX', 1)
    setProperty('iconP2.flipX', 1)
    setProperty('healthBar.flipX', 1)
end

function onUpdatePost()
    setProperty('iconP1.x', -593+getProperty('healthBar.x') + (getProperty('healthBar.width')*(remapToRange(getProperty('healthBar.percent'), 0, -100, 100, 0)*0.01))-(150 * getProperty('iconP1.scale.x'))/2 - 26*2)
    setProperty('iconP2.x', -593+getProperty('healthBar.x') + (getProperty('healthBar.width')*(remapToRange(getProperty('healthBar.percent'), 0, -100, 100, 0)*0.01))+(150 * getProperty('iconP2.scale.x')-150)/2 - 26)
end

function remapToRange(value, start1, stop1, start2, stop2)
    return start2 + (value - start1) * ((stop2 - start2) / (stop1 - start1))
end

function onUpdate()

if curBeat == 0 then

 setPropertyFromGroup('playerStrums', 0, 'x', defaultOpponentStrumX0)
        setPropertyFromGroup('playerStrums', 1, 'x', defaultOpponentStrumX1)

        setPropertyFromGroup('playerStrums', 2, 'x', defaultOpponentStrumX2)

        setPropertyFromGroup('playerStrums', 3, 'x', defaultOpponentStrumX3)

        setPropertyFromGroup('playerStrums', 4, 'x', defaultOpponentStrumX4)

        setPropertyFromGroup('opponentStrums', 0, 'x', defaultPlayerStrumX0 + 0)

        setPropertyFromGroup('opponentStrums', 1, 'x', defaultPlayerStrumX1 + 0)

        setPropertyFromGroup('opponentStrums', 2, 'x', defaultPlayerStrumX2 + 0)

        setPropertyFromGroup('opponentStrums', 3, 'x', defaultPlayerStrumX3 + 0)

        setPropertyFromGroup('opponentStrums', 4, 'x', defaultPlayerStrumX4 + 0)
		end

end