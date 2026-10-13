
-- original by: Piggyfriend1792

-- I just modified it a bit (dummy)

local offsetX = 12
local offsetY = 150
local objWidth = 400
local note_Name = "James Note"
local what_it_does = "Hurts When Hit"
local explaining = "James will Drain your health each time You hit His Notes!"

function onCreatePost()
    makeLuaSprite('box', 'empty', 0 - 400, 150)
    makeGraphic('box', 400, 150, '990000')
    setObjectCamera('box', 'other')
    setProperty("box.alpha", 0.7)
    addLuaSprite('box', true)

    makeLuaText('note_name', "James Note", 400, 12 - 400, 150+10)
    setTextSize('note_name', 35)
    setTextAlignment('note_name', 'left')
    setObjectCamera('note_name', 'other')
    addLuaText("note_name",true)

    makeLuaText('what_it_does', "Hurts When Hit", 400, 12 - 400, 150+60)
    setTextSize('what_it_does', 25)
    setTextAlignment('what_it_does', 'left')
    setObjectCamera('what_it_does', 'other')
    addLuaText("what_it_does",true)

    makeLuaText('explaining', "+.. James will Drain your health each time You hit His Notes!", 250, 12 - 400, 150+95)
    setTextSize('explaining', 17)
    setTextAlignment('explaining', 'left')
    setObjectCamera('explaining', 'other')
    addLuaText("explaining",true)

    makeLuaSprite('james_arrow', 'james_arrow', -150, 160)
    setObjectCamera('james_arrow', 'other')
    addLuaSprite('james_arrow', true)
    scaleObject('james_arrow', 0.45, 0.45);
end

function onStepHit()
    
    if curStep == 136 then
        doTweenX("boxTween", "box", "box.x" + 400, 1.8, "expoOut")
        doTweenX("note_nameTween", "note_name", "note_name.x + 400", 1.8, "expoOut")
        doTweenX("what_it_doesTween", "what_it_does", "what_it_does.x + 400", 1.8, "expoOut")
        doTweenX("explainingTween", "explaining", "explaining.x + 400", 1.8, "expoOut")
        doTweenX("james_arrowTween", "james_arrow", "james_arrow.x + 400", 1.8, "expoOut")
        runTimer("boxDisplay",5,1)
    end
end

function onTimerCompleted(timerName)

    if timerName == "boxDisplay" then
        doTweenX("boxTween", "box", "box.x" - 400, 1.8, "sineIn")
        doTweenX("note_nameTween", "note_name", "note_name.x - 400", 1.8, "sineIn")
        doTweenX("what_it_doesTween", "what_it_does", "what_it_does.x - 400", 1.8, "sineIn")
        doTweenX("explainingTween", "explaining", "explaining.x - 400", 1.8, "sineIn")
        doTweenX("james_arrowTween", "james_arrow", "james_arrow.x - 400", 1.8, "sineIn")

    end
end