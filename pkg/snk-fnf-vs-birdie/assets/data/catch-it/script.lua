local angleshit = 0.5;
local anglevar = 0.5;
run = false

function onStepHit()
if curStep == 986 then
makeLuaText("Lyricss", "*GASP*", 900, 200, 30)
setTextSize("Lyricss", 70)
addLuaText("Lyricss")
end
if curStep == 996 then
setTextString("Lyricss", "Its")
end
if curStep == 999 then
setTextString("Lyricss", "Its Pretty!")
end
if curStep == 1006 then
setTextString("Lyricss", "")
end
if curStep == 1014 then
setTextString("Lyricss", "Lets Catch it!")
end
if curStep == 1021 then
setTextString("Lyricss", "")
end
if curStep == 1008 then
setProperty('gf.visible', true)
doTweenX('run', 'gf', -300, 1, 'quadOut')
end
if curStep == 2175 then
run = true
end
end

function onUpdate()
if run == true then
setProperty('dad.x', getProperty('dad.x') - 7)
end
end

