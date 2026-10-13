lastNotes = {}
isShooting = false
function onCreate()
	-- triggered when the lua file is started, some variables weren't created yet
    precacheImage("characters/tordbot/idle")
    precacheImage("characters/tordbot/left")
    precacheImage("characters/tordbot/down")
    precacheImage("characters/tordbot/up")
    precacheImage("characters/tordbot/right")
    precacheImage("characters/tordbot/shoot")
end

function opponentNoteHit(id, direction, noteType, isSustainNote)
	-- Works the same as goodNoteHit, but for Opponent's notes being hit
    if isShooting == false then
        setProperty("dad.visible", false)

        anims = {"left", "down", "up", "right"}
        noteAnim = anims[direction + 1]

        table.insert(lastNotes, 1, noteAnim)
        table.remove(lastNotes, 3)

        cancelTimer("play idle")

        removeLuaSprite(lastNotes[2])

        removeLuaSprite("shoot")

        makeAnimatedLuaSprite(noteAnim, "characters/tordbot/"..noteAnim, defaultOpponentX, defaultOpponentY)
        addAnimationByPrefix(noteAnim, "sing"..string.upper(noteAnim), "tordbot "..noteAnim, 24, false)

        addLuaSprite(noteAnim, true)

        if noteAnim == "left" then
            setProperty(noteAnim..".offset.x", 507)
            setProperty(noteAnim..".offset.y", 51)
        end
        if noteAnim == "down" then
            setProperty(noteAnim..".offset.x", 591)
            setProperty(noteAnim..".offset.y", -43)
        end
        if noteAnim == "up" then
            setProperty(noteAnim..".offset.x", 563)
            setProperty(noteAnim..".offset.y", 78)
        end
        if noteAnim == "right" then
            setProperty(noteAnim..".offset.x", 586)
            setProperty(noteAnim..".offset.y", 26)
        end

        objectPlayAnimation(noteAnim, "sing"..string.upper(noteAnim), true)

        runTimer("play idle", 1)
    end
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
    if noteType == "Bullet_Note" then
        isShooting = true

        setProperty("dad.visible", false)

        cancelTimer("play idle")

        removeLuaSprite(lastNotes[1])
        removeLuaSprite(lastNotes[2])

        table.insert(lastNotes, 1, "shoot")
        table.remove(lastNotes, 3)

        makeAnimatedLuaSprite("shoot", "characters/tordbot/shoot", defaultOpponentX, defaultOpponentY)
        addAnimationByPrefix("shoot", "shoot", "tordbot shoot", 24, false)

        addLuaSprite("shoot", true)

        setProperty("shoot.offset.x", 669)
        setProperty("shoot.offset.y", 35)

        objectPlayAnimation("shoot", "shoot", true)

        runTimer("play idle", 0.5)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
    if tag == "play idle" then
        isShooting = false

        removeLuaSprite(lastNotes[1])
        removeLuaSprite(lastNotes[2])

        setProperty("dad.visible", true)

        lastNotes = {}
    end
end