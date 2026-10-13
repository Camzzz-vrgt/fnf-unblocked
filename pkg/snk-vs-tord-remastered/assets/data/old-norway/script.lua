timesended = 0

function onCreate()
	-- triggered when the lua file is started, some variables weren't created yet
    if isStoryMode then
        setProperty('inCutscene', true);
    end
end

function onCreatePost()
	-- end of "create"
    setProperty("gf.visible", false)
end

function onStartCountdown()
    -- countdown started, duh
	-- return Function_Stop if you want to stop the countdown from happening (Can be used to trigger dialogues and stuff! You can trigger the countdown with startCountdown())
    if isStoryMode and not seenCutscene == true then
        characterPlayAnim("dad", "nomic")
        playMusic("wind", 1, true)
        timesended = timesended + 1

        if timesended == 1 then
            triggerEvent("Camera Follow Pos", 520, 380 - 2000)
            runTimer("move camera down", 2)
            runTimer("start first dialogue", 4.5)
        end

        if timesended == 2 then
            runTimer("play pullout sound", 0.4)
            characterPlayAnim("dad", "cutscene")
            runTimer("start second dialogue", 1.5)
            soundFadeOut("", -1)
        end

        if timesended == 3 then
            characterPlayAnim("dad", "idle")
            soundFadeOut("", -1)
            return Function_Continue;
        else
            return Function_Stop;
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
	-- A loop from a timer you called has been completed, value "tag" is it's tag
	-- loops = how many loops it will have done when it ends completely
	-- loopsLeft = how many are remaining
    if tag == "start first dialogue" then
        startDialogue("dialoguepart1")
    end

    if tag == "start second dialogue" then
        startDialogue("dialoguepart2")
    end

    if tag == "play pullout sound" then
        playSound("pulloutguitar")
    end

    if tag == "move camera down" then
        triggerEvent("Camera Follow Pos", "700", "380")
    end

    if tag == "move camera down" then
        triggerEvent("Camera Follow Pos", "", "")
    end
end