coolAccuracy = 0
coolValue = 0
coolRating = "N/A"
coolRanking = ""
hasCalculated = false

function onCreatePost()
	-- end of "create"
    setProperty("scoreTxt.visible", false)
  
    makeLuaText("scoreText", "Score: "..score.." | Combo Breaks: "..misses.." | Accuracy: "..coolAccuracy.."% | "..coolRating)

    screenCenter("scoreText", "x")
    setProperty("scoreText.y", getProperty("healthBarBG.y") + 50)
    
    --setProperty("scoreText.size", 18)

    addLuaText("scoreText")
end

function onUpdate(elapsed)
	-- start of "update", some variables weren't updated yet
    coolValue = 10^2
    coolAccuracy = math.floor((rating * 100) * coolValue) / coolValue

    if hasCalculated == true then
        if misses == 0 and getProperty("bads") == 0 and getProperty("shits") == 0 and getProperty("goods") == 0 then
            coolRating = "(MFC)"
        elseif misses == 0 and getProperty("bads") == 0 and getProperty("shits") == 0 and getProperty("goods") >= 0 then
            coolRating = "(GFC)"
        elseif misses == 0 and getProperty("bads") == 0 then
            coolRating = "(FC)"
        elseif misses < 10 then
            coolRating = "(SDCB)"
        else
            coolRating = "(Clear)"
        end
        
        if coolAccuracy >= 99.99 then
            coolRanking = "AAAAA"
        elseif coolAccuracy >= 99.98 then
            coolRanking = "AAAA:"
        elseif coolAccuracy >= 99.97 then
            coolRanking = "AAAA."
        elseif coolAccuracy >= 99.95 then
            coolRanking = "AAAA"
        elseif coolAccuracy >= 99.90 then
            coolRanking = "AAA:"
        elseif coolAccuracy >= 99.80 then
            coolRanking = "AAA."
        elseif coolAccuracy >= 99.70 then
            coolRanking = "AAA"
        elseif coolAccuracy >= 99 then
            coolRanking = "AA:"
        elseif coolAccuracy >= 99 then
            coolRanking = "AA:"
        elseif coolAccuracy >= 96.50 then
            coolRanking = "AA."
        elseif coolAccuracy >= 93 then
            coolRanking = "AA"
        elseif coolAccuracy >= 90 then
            coolRanking = "A:"
        elseif coolAccuracy >= 85 then
            coolRanking = "A."
        elseif coolAccuracy >= 80 then
            coolRanking = "A"
        elseif coolAccuracy >= 70 then
            coolRanking = "B"
        elseif coolAccuracy >= 60 then
            coolRanking = "C"
        elseif coolAccuracy < 60 then
            coolRanking = "D"
        end
    end

    setProperty("scoreText.text", "Score: "..score.." | Combo Breaks: "..misses.." | Accuracy: "..coolAccuracy.."% | "..coolRating.." "..coolRanking)
    screenCenter("scoreText", "x")
end

function goodNoteHit(id, direction, noteType, isSustainNote)
	-- Function called when you hit a note (after note hit calculations)
	-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
	-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
	-- noteType: The note type string/tag
	-- isSustainNote: If it's a hold note, can be either true or false
    hasCalculated = true
end

function noteMiss(id, direction, noteType, isSustainNote)
	-- Called after the note miss calculations
	-- Player missed a note by letting it go offscreen
    hasCalculated = true
end