function onCreate()
makeLuaSprite('sombra', 'stages/altercat/sombra', 0, 600)
addLuaSprite('sombra', false)
scaleObject('sombra', 1.02, 1.02)
setObjectCamera('sombra', 'hud')

makeAnimatedLuaSprite('status', 'stages/altercat/status anim', 500, 600)
addLuaSprite('status', false)
addAnimationByPrefix('status', 'status', 'status', 24, true)
scaleObject('status', 0.8, 0.8)
setObjectCamera('status', 'hud')

makeLuaSprite('health-alter', 'stages/altercat/health bar', 10, 610)
addLuaSprite('health-alter', false)
scaleObject('health-alter', 0.7, 0.7)
setObjectCamera('health-alter', 'hud')

makeLuaSprite('health-alter-bg', 'stages/altercat/bar', 18, 670)
addLuaSprite('health-alter-bg', false)
scaleObject('health-alter-bg', 0.71, 0.82)
setObjectCamera('health-alter-bg', 'hud')
end

function onCreatePost()
setProperty('iconP1.alpha', 0)
setProperty('iconP2.alpha', 0)

doTweenX("healthBarX", "healthBar.scale", 0.78, 0.01, "sineOut")
doTweenY("healthBarY", "healthBar.scale", 1.35, 0.01, "sineOut")

if middlescroll and downscroll == true then
setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - -400);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - -400);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - -400);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - -405);
setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumX0 - -200);
setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumX0 - -200);
setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumX0 - -200);
setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumX0 - -200);

setProperty('healthBar.y', '670')
setProperty('healthBar.x', '-50')

setProperty('scoreTxt.y', '0')
end
if middlescroll and downscroll == false then
setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - -400);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - -400);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - -400);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - -405);
setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumX0 - 400);
setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumX0 - 400);
setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumX0 - 400);
setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumX0 - 400);

setProperty('sombra.y', '-120')
setProperty('status.y', '0')
setProperty('health-alter.y', '20')
setProperty('health-alter-bg.y', '80')

setProperty('healthBar.y', '79')
setProperty('healthBar.x', '-50')
end
if not middlescroll and downscroll == true then
setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - -70);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - -70);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - -70);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - -70);
setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumX0 - 130);
setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumX0 - 130);
setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumX0 - 130);
setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumX0 - 130);

setProperty('healthBar.y', '669')
setProperty('healthBar.x', '-50')

setProperty('scoreTxt.y', '0')
end
if not middlescroll and downscroll == false then
setPropertyFromGroup('playerStrums', 0, 'x', defaultPlayerStrumX0 - -70);
        setPropertyFromGroup('playerStrums', 1, 'x', defaultPlayerStrumX1 - -70);
        setPropertyFromGroup('playerStrums', 2, 'x', defaultPlayerStrumX2 - -70);
        setPropertyFromGroup('playerStrums', 3, 'x', defaultPlayerStrumX3 - -70);
setPropertyFromGroup('playerStrums', 0, 'y', defaultPlayerStrumX0 - 730);
setPropertyFromGroup('playerStrums', 1, 'y', defaultPlayerStrumX0 - 730);
setPropertyFromGroup('playerStrums', 2, 'y', defaultPlayerStrumX0 - 730);
setPropertyFromGroup('playerStrums', 3, 'y', defaultPlayerStrumX0 - 730);

setProperty('sombra.y', '-120')
setProperty('status.y', '0')
setProperty('health-alter.y', '20')
setProperty('health-alter-bg.y', '80')

setProperty('healthBar.y', '79')
setProperty('healthBar.x', '-50')
end
end

function onUpdatePost()
setHealthBarColors('3B2956', 'D7955D')
end

function onUpdate()
setProperty('timeTxt.alpha', 0)
setProperty('timeBar.alpha', 0)
setProperty('timeBarBG.alpha', 0)

setProperty('healthBar.bg.visible', false)

setProperty('healthBar.rightBar.scale.x', 0)
setProperty('healthBar.rightBar.scale.y', 0)

setPropertyFromGroup('opponentStrums',0,'alpha',0)
setPropertyFromGroup('opponentStrums',1,'alpha',0)
setPropertyFromGroup('opponentStrums',2,'alpha',0)
setPropertyFromGroup('opponentStrums',3,'alpha',0)
end