function onCreatePost()
	-- end of "create"
    setProperty("scoreTxt.visible", false)
  
    makeLuaText("scoreText", "score: "..score)

    setProperty("scoreText.x", 800)
    setProperty("scoreText.y", getProperty("scoreTxt.y") - 15)

    setTextBorder("scoreText", 0)
    setTextFont("scoreText", "archivoblack.ttf")
    
    setProperty("scoreText.size", 18)

    addLuaText("scoreText")
end

function onUpdate(elapsed)
	-- start of "update", some variables weren't updated yet
    setProperty("scoreText.text", "score: "..score)
end