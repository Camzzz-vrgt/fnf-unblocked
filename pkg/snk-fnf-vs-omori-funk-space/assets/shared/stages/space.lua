function onCreatePost()
--emotion grafics--
makeAnimatedLuaSprite('BF!!','Emotion/Emotion_Graphics_Assets', 50, 220)
addAnimationByPrefix('BF!!', 'BF!!', 'A-AngryAnnoy instance', 18, false);
scaleObject('BF!!', 1.6, 1.6)
setProperty('BF!!.alpha', 0.00001)
addLuaSprite('BF!!', true)

makeAnimatedLuaSprite('Sad-Poem','Emotion/Emotion_Graphics_Assets', 120, 260)
addAnimationByPrefix('Sad-Poem', 'Sad-Poem', 'B-SadPoem instance', 24, false);
scaleObject('Sad-Poem', 1.5, 1.5)
setProperty('Sad-Poem.alpha', 0.00001)
addLuaSprite('Sad-Poem', true)

makeAnimatedLuaSprite('mano_pajera','Emotion/Emotion_Graphics_Assets', 120, 260)
addAnimationByPrefix('mano_pajera', 'mano_pajera', 'C-NeutralMassage instance', 18, false);
scaleObject('mano_pajera', 1.5, 1.5)
setProperty('mano_pajera.alpha', 0.00001)
addLuaSprite('mano_pajera', true)

-- White bg--
makeAnimatedLuaSprite('bg_white','omori/images/spaceBG/Background',-600, 0)
addAnimationByPrefix('bg_white', 'bg_white', 'Background_WHITE0000', 24, false);
scaleObject('bg_white', 3, 3)
addLuaSprite('bg_white')

makeAnimatedLuaSprite('hand1','omori/images/spaceBG/Red_Hands_Assets', -1000, 300)
addAnimationByPrefix('hand1', 'hand1', 'B-RedHandsLow', 18, true);
setProperty('hand1.alpha', 0.5)
scaleObject('hand1', 0.2, 0.2)
addLuaSprite('hand1')

makeAnimatedLuaSprite('hand2','omori/images/spaceBG/Red_Hands_Assets', -1800, 335)
addAnimationByPrefix('hand2', 'hand2', 'B-RedHandsLow', 18, true);
setProperty('hand2.alpha', 0.5)
scaleObject('hand2', 0.2, 0.2)
addLuaSprite('hand2')

makeAnimatedLuaSprite('hand3','omori/images/spaceBG/Red_Hands_Assets', -2200, 360)
addAnimationByPrefix('hand3', 'hand3', 'B-RedHandsLow', 18, true);
setProperty('hand3.alpha', 0.5)
scaleObject('hand3', 0.2, 0.2)
addLuaSprite('hand3')

makeAnimatedLuaSprite('Door','omori/images/spaceBG/Door_Assets', 560, 230)
addAnimationByPrefix('Door', 'r', 'A-DoorStatic instance', 24, true);
scaleObject('Door', 0.8, 0.8)
addLuaSprite('Door')

makeAnimatedLuaSprite('Lightbulb','omori/images/spaceBG/Lightbulb', -800, -250)
addAnimationByPrefix('Lightbulb', 'Lightbulb', 'Lightbulb_WHITE0000', 24, false);
scaleObject('Lightbulb', 0.8, 0.8)
addLuaSprite('Lightbulb')

makeAnimatedLuaSprite('hand1.5','omori/images/spaceBG/Red_Hands_Assets', -2000, 280)
addAnimationByPrefix('hand1.5', 'hand1.5', 'A-RedHands0', 18.5, true);
scaleObject('hand1.5', 0.3, 0.3)
addLuaSprite('hand1.5')

makeAnimatedLuaSprite('hand0','omori/images/spaceBG/Red_Hands_Assets', -1500, 360)
addAnimationByPrefix('hand0', 'hand', 'A-RedHands0', 17.5, true);
scaleObject('hand0', 0.25, 0.25)
addLuaSprite('hand0')

makeAnimatedLuaSprite('hand','omori/images/spaceBG/Red_Hands_Assets', -1000, 420)
addAnimationByPrefix('hand', 'hand', 'A-RedHands0', 18.5, true);
scaleObject('hand', 0.3, 0.3)
addLuaSprite('hand')

makeAnimatedLuaSprite('hand0.5','omori/images/spaceBG/Red_Hands_Assets', -1800, 380)
addAnimationByPrefix('hand0.5', 'hand0.5', 'A-RedHands0', 18.5, true);
scaleObject('hand0.5', 0.3, 0.3)
addLuaSprite('hand0.5')

makeAnimatedLuaSprite('plataform','omori/images/spaceBG/Blanket',-300, 70)
addAnimationByPrefix('plataform', 'plataform', 'Blanket_WHITE0000', 24, false);
scaleObject('plataform', 1, 1)
addLuaSprite('plataform')

makeAnimatedLuaSprite('pañuelo','omori/images/spaceBG/Tissues', 60, 130)
addAnimationByPrefix('pañuelo', 'pañuelo', 'Tissues_WHITE', 24, false);
scaleObject('pañuelo', 0.8, 0.8)
addLuaSprite('pañuelo')

makeAnimatedLuaSprite('Laptop','omori/images/spaceBG/Laptop', -700, 80)
addAnimationByPrefix('Laptop', 'Laptop', 'Laptop_WHITE0000', 24, false);
scaleObject('Laptop', 1, 1)
addLuaSprite('Laptop')


----------------------------------------

makeAnimatedLuaSprite('whitespacemid','cutscene/whitespacemid', 0, 0)
addAnimationByPrefix('whitespacemid', 'whitespacemid', 'Symbol 1', 24, true);
scaleObject('whitespacemid', 2.4, 2.4)
setProperty('whitespacemid.alpha', 0)
setObjectCamera('whitespacemid','Other')
addLuaSprite('whitespacemid', true)

runTimer('hola de nuevo', 0.0001)

--Black bg--
makeAnimatedLuaSprite('bg_black','omori/images/spaceBG/Background',-600, 0)
addAnimationByPrefix('bg_black', 'bg_black', 'Background_BLACK0000', 24, false);
scaleObject('bg_black', 3, 3)
addLuaSprite('bg_black')

makeAnimatedLuaSprite('Lightbulb-dark','omori/images/spaceBG/Lightbulb', -800, -250)
addAnimationByPrefix('Lightbulb-dark', 'Lightbulb-dark', 'Lightbulb_BLACK0000', 24, false);
scaleObject('Lightbulb-dark', 0.8, 0.8)
addLuaSprite('Lightbulb-dark')

makeAnimatedLuaSprite('plataform-dark','omori/images/spaceBG/Blanket',-300, 70)
addAnimationByPrefix('plataform-dark', 'plataform-dark', 'Blanket_BLACK0000', 24, false);
scaleObject('plataform-dark', 1, 1)
addLuaSprite('plataform-dark')

makeAnimatedLuaSprite('Door_dark','omori/images/spaceBG/Door_Assets', 130, 120)
addAnimationByPrefix('Door_dark', 'z', 'E-BlackDoorOpen instance', 24, true);
scaleObject('Door_dark', 0.8, 0.8)
addLuaSprite('Door_dark')

makeAnimatedLuaSprite('bf-door','omori/images/spaceBG/Door_Assets', 130, 120)
addAnimationByPrefix('bf-door', 'bf-door', 'K-BoyfriendDoor instance', 24, true);
scaleObject('bf-door', 0.8, 0.8)
addLuaSprite('bf-door')

makeAnimatedLuaSprite('StrangerDoor','omori/images/spaceBG/Door_Assets', 130, 120)
addAnimationByPrefix('StrangerDoor', 'StrangerDoor', 'G-SomethingDoor instance', 24, true);
scaleObject('StrangerDoor', 0.8, 0.8)
addLuaSprite('StrangerDoor')

makeAnimatedLuaSprite('pañuelo-dark','omori/images/spaceBG/Tissues', 60, 130)
addAnimationByPrefix('pañuelo-dark', 'pañuelo-dark', 'Tissues_BLACK0000', 24, false);
scaleObject('pañuelo-dark', 0.8, 0.8)
addLuaSprite('pañuelo-dark')

makeAnimatedLuaSprite('Laptop-dark','omori/images/spaceBG/Laptop', -700, 80)
addAnimationByPrefix('Laptop-dark', 'Laptop-dark', 'Laptop_BLACK0000', 24, false);
scaleObject('Laptop-dark', 1, 1)
addLuaSprite('Laptop-dark')

makeLuaSprite('dark-visual', 'omori/images/spaceBG/DarkOverlay',0,0)
setObjectCamera('dark-visual', 'Other')
addLuaSprite('dark-visual', false)

--bg battle--
makeAnimatedLuaSprite('bg_battle','omori/images/battleUI/Battle_White_Space_Background',-200, 0)
addAnimationByPrefix('bg_battle', 'bg_battle', 'A-BattleWhiteSpace instance', 24, true);
scaleObject('bg_battle', 1, 1)
addLuaSprite('bg_battle')

makeLuaSprite('commandsbox', 'omori/images/battleUI/commandsbox', 0, 600)
	setObjectCamera('commandsbox', 'HUD')
scaleObject('commandsbox', 0.4, 0.4)
	addLuaSprite('commandsbox', false)
	
	makeLuaSprite('messagebox', 'omori/images/battleUI/messagebox', 0, 0)
	setObjectCamera('messagebox', 'HUD')
scaleObject('messagebox', 0.6, 0.6)
	addLuaSprite('messagebox', false)

screenCenter('commandsbox', 'x')
screenCenter('messagebox', 'x')

makeLuaSprite('overlay', 'omori/images/battleUI/overlay', 0, 0)
	setObjectCamera('overlay', 'Other')
	scaleObject('overlay', 1, 1)
	addLuaSprite('overlay', true)
	
makeLuaSprite('gradient', 'omori/images/battleUI/gradient', 0, 0)
	setObjectCamera('gradient', 'Other')
	addLuaSprite('gradient', true)

setProperty('bg_battle.alpha', 0)
setProperty('overlay.alpha', 0)
setProperty('gradient.alpha', 0)
setProperty('messagebox.alpha', 0)
setProperty('commandsbox.alpha', 0)

setProperty('bg_black.alpha', 0)
setProperty('Lightbulb-dark.alpha', 0)
setProperty('plataform-dark.alpha', 0)
setProperty('Door_dark.alpha', 0)
setProperty('bf-door.alpha', 0)
setProperty('StrangerDoor.alpha', 0)
setProperty('CatDoor.alpha', 0)
setProperty('pañuelo-dark.alpha', 0)
setProperty('dark-visual.alpha', 0)
setProperty('Laptop-dark.alpha', 0)
end
function onTimerCompleted(tag, loops, loopsLeft)
if tag=='hola de nuevo' then
doTweenX('sensual','hand', 1800, 10, 'linear')
runTimer('bye', 12)
end
if tag=='hola de nuevo' then
doTweenX('sensual0.5','hand0.5', 1800, 15, 'linear')
runTimer('bye', 12)
end
if tag=='hola de nuevo' then
doTweenX('sensual0','hand0', 1800, 12, 'linear')
runTimer('bye', 14)
end
if tag=='hola de nuevo' then
doTweenX('sensual1','hand1', 1800, 14, 'linear')
runTimer('bye', 18)
end
if tag=='hola de nuevo' then
doTweenX('sensual1.5','hand1.5', 1800, 10, 'linear')
runTimer('bye', 18)
end
if tag=='hola de nuevo' then
doTweenX('sensual2','hand2', 1800, 20, 'linear')
runTimer('bye', 18)
end
if tag=='hola de nuevo' then
doTweenX('sensual3','hand3', 1800, 23, 'linear')
runTimer('bye', 25)
end
if tag=='bye' then
doTweenX('sensual1.5','hand1.5',-1000, 0.000001, 'linear')
doTweenX('sensual0','hand0', -1000, 0.00001, 'linear')
doTweenX('sensual0.5','hand0.5', -1000, 0.00001, 'linear')
doTweenX('sensual','hand', -1000, 0.001, 'linear')
doTweenX('sensual1','hand1', -1000, 0.001, 'linear')
doTweenX('sensual2','hand2', -1000, 0.000001, 'linear')
doTweenX('sensual3','hand3', -1000, 0.00000001, 'linear')
runTimer('hola de nuevo', 0.000001)
end
end

function onStepHit()
if curStep == 382 then
setProperty('whitespacemid.alpha', 1)
playAnim('whitespacemid','whitespacemid', true)
makeLuaSprite("blackshit", "", -1050, -500)
	makeGraphic('blackshit', 3400, 2000, '000000')
	addLuaSprite('blackshit', false)
setObjectCamera('blackshit','other')
setProperty('gf.alpha', 0)
end
if curStep == 526 then
playAnim('BF!!','BF!!', true)
setProperty('BF!!.alpha', 1)
end
if curStep == 535 then
setProperty('BF!!.alpha', 0)
end
if curStep == 434 then
setProperty('whitespacemid.alpha', 0)
end
if curStep == 464 then
doTweenAlpha('black','blackshit', 0, 10, 'linear')
end
if curStep == 848 then
playSound('Omori_DoorOpen',1)
setProperty('bg_white.alpha', 0)
setProperty('Lightbulb.alpha', 0)
setProperty('plataform.alpha', 0)
setProperty('hand0.alpha', 0)
setProperty('hand.alpha', 0)
setProperty('hand1.alpha', 0)
setProperty('hand1.5.alpha', 0)
setProperty('hand2.alpha', 0)
setProperty('hand3.alpha', 0)
setProperty('Door..alpha', 0)
setProperty('pañuelo.alpha', 0)
setProperty('Laptop.alpha', 0)
--bg-dark--
setProperty('bg_black.alpha', 1)
setProperty('Lightbulb-dark.alpha', 1)
setProperty('plataform-dark.alpha', 1)
setProperty('Door_dark.alpha', 1)
setProperty('bf-door.alpha', 1)
setProperty('pañuelo-dark.alpha', 1)
setProperty('dark-visual.alpha', 1)
setProperty('Laptop-dark.alpha', 1)
end
if curStep == 1104 then
playSound('Omori_DoorClose',1)
setProperty('bg_white.alpha', 1)
setProperty('Lightbulb.alpha', 1)
setProperty('plataform.alpha', 1)
setProperty('Door..alpha', 1)
setProperty('hand0.alpha', 1)
setProperty('hand.alpha', 1)
setProperty('hand1.alpha', 0.5)
setProperty('hand1.5.alpha', 1)
setProperty('hand2.alpha', 0.5)
setProperty('hand3.alpha', 0.5)
setProperty('pañuelo.alpha', 1)
setProperty('Laptop.alpha', 1)
--bg black--
setProperty('bg_black.alpha', 0)
setProperty('Lightbulb-dark.alpha', 0)
setProperty('plataform-dark.alpha', 0)
setProperty('Door_dark.alpha', 0)
setProperty('bf-door.alpha', 0)
setProperty('pañuelo-dark.alpha', 0)
setProperty('dark-visual.alpha', 0)
setProperty('Laptop-dark.alpha', 0)
end
if curStep == 1264 then
setProperty('Sad-Poem.alpha', 1)
playAnim('Sad-Poem','Sad-Poem', true)
playSound('Omori_EmotionPoem',0.8)
end
if curStep == 1280 then
setProperty('Sad-Poem.alpha', 0)
end
if curStep == 1360 then
playSound('Omori_DoorOpen',1)
setProperty('bg_white.alpha', 0)
setProperty('Lightbulb.alpha', 0)
setProperty('plataform.alpha', 0)
setProperty('hand0.alpha', 0)
setProperty('hand.alpha', 0)
setProperty('hand1.alpha', 0)
setProperty('hand1.5.alpha', 0)
setProperty('hand2.alpha', 0)
setProperty('hand3.alpha', 0)
setProperty('Door..alpha', 0)
setProperty('pañuelo.alpha', 0)
setProperty('Laptop.alpha', 0)
--bg-dark--
setProperty('bg_black.alpha', 1)
setProperty('Lightbulb-dark.alpha', 1)
setProperty('plataform-dark.alpha', 1)
setProperty('Door_dark.alpha', 1)
setProperty('StrangerDoor.alpha', 1)
setProperty('pañuelo-dark.alpha', 1)
setProperty('dark-visual.alpha', 1)
setProperty('Laptop-dark.alpha', 1)
end
if curStep == 1615 then
playSound('Omori_DoorClose',1)
setProperty('bg_white.alpha', 1)
setProperty('Lightbulb.alpha', 1)
setProperty('plataform.alpha', 1)
setProperty('Door..alpha', 1)
setProperty('hand0.alpha', 1)
setProperty('hand.alpha', 1)
setProperty('hand1.alpha', 0.5)
setProperty('hand1.5.alpha', 1)
setProperty('hand2.alpha', 0.5)
setProperty('hand3.alpha', 0.5)
setProperty('pañuelo.alpha', 1)
setProperty('Laptop.alpha', 1)
--bg black--
setProperty('bg_black.alpha', 0)
setProperty('Lightbulb-dark.alpha', 0)
setProperty('plataform-dark.alpha', 0)
setProperty('Door_dark.alpha', 0)
setProperty('StrangerDoor.alpha', 0)
setProperty('pañuelo-dark.alpha', 0)
setProperty('dark-visual.alpha', 0)
setProperty('Laptop-dark.alpha', 0)
end
if curStep == 1616 then
playAnim('mano_pajera','mano_pajera', true)
setProperty('mano_pajera.alpha', 1)
playSound('Omori_EmotionNormal',1)
end
if curStep == 1624 then
setProperty('mano_pajera.alpha', 0)
end
if curStep == 1744 then
setProperty('iconP1.alpha', 0)
setProperty('iconP2.alpha', 0)
setProperty('healthBar.flipX', true)
setProperty('healthBar.scale.x', 0.35)
setProperty('healthBar.scale.y',5)
setProperty('healthBar.visible', true)
setProperty('base healt bf.visible', false)
setProperty('base healt dad.visible', false)
setProperty('ScoreBoy.alpha', 0)
setProperty('timeBar.alpha', 0)
setProperty('timeTxt.alpha', 0)

function onUpdatePost()
setObjectCamera('healthBar','HUD')
setProperty('healthBar.x', getProperty('boyfriend.x')- 70)
setProperty('healthBar.y', getProperty('boyfriend.y')+ 380)
setObjectCamera('boyfriend','Other')
setProperty('boyfriend.x', 60)
setProperty('boyfriend.y', 220)
end

noteTweenX('4N', 4, 450, 0.001, 'linear')
noteTweenX('5N', 5, 560, 0.001, 'linear')
noteTweenX('6N', 6, 670, 0.001, 'linear')
noteTweenX('7N', 7, 780, 0.001, 'linear')
noteTweenY('4', 4, 300, 0.001, 'linear')
noteTweenY('5', 5, 300, 0.001, 'linear')
noteTweenY('6', 6, 300, 0.001, 'linear')
noteTweenY('7', 7, 300, 0.001, 'linear')

noteTweenAlpha('0', 0, 0, 0.001, 'linear')
noteTweenAlpha('1', 1, 0, 0.001, 'linear')
noteTweenAlpha('2', 2, 0, 0.001, 'linear')
noteTweenAlpha('3', 3, 0, 0.001, 'linear')
setProperty('UpperBar(With HUD).alpha', 0)
setProperty('LowerBar(With HUD).alpha', 0)
setProperty('bg_white.alpha', 0)
setProperty('bg_battle.alpha', 1)
setProperty('messagebox.alpha', 1)
setProperty('commandsbox.alpha', 1)
setProperty('overlay.alpha', 1)
setProperty('gradient.alpha', 1)
setProperty('Lightbulb.alpha', 0)
setProperty('Door.alpha', 0)
setProperty('plataform.alpha', 0)
setProperty('hand0.alpha', 0)
setProperty('hand.alpha', 0)
setProperty('hand1.alpha', 0)
setProperty('hand1.5.alpha', 0)
setProperty('hand2.alpha', 0)
setProperty('hand3.alpha', 0)
setProperty('Door..alpha', 0)
setProperty('pañuelo.alpha', 0)
setProperty('Laptop.alpha', 0)
end
if curStep == 2000 then
setProperty('healthBar.flipX', false)
setProperty('healthBar.scale.x', 1)
setProperty('healthBar.scale.y',1)
playSound('Omori_DoorOpen',1)
setProperty('iconP1.alpha', 1)
setProperty('iconP2.alpha', 1)
setProperty('healthBar.visible', false)
setProperty('base healt bf.visible', true)
setProperty('base healt dad.visible', true)
setProperty('ScoreBoy.alpha', 1)
setProperty('timeBarTxt.alpha', 1)
setProperty('messagebox.alpha', 0)
setProperty('commandsbox.alpha', 0)
noteTweenX('4N', 4, 750, 0.001, 'linear')
noteTweenX('5N', 5, 860, 0.001, 'linear')
noteTweenX('6N', 6, 970, 0.001, 'linear')
noteTweenX('7N', 7, 1080, 0.001, 'linear')
noteTweenY('4', 4, 50, 0.001, 'linear')
noteTweenY('5', 5, 50, 0.001, 'linear')
noteTweenY('6', 6, 50, 0.001, 'linear')
noteTweenY('7', 7, 50, 0.001, 'linear')
function onUpdatePost()
setObjectCamera('boyfriend','camGame')
setObjectCamera('healthBar','HUD')
setProperty('healthBar.x', getProperty('base healt bf.x')- 0)
setProperty('healthBar.y', getProperty('base healt bf,y')+ 0)
end
noteTweenAlpha('0', 0, 1, 0.001, 'linear')
noteTweenAlpha('1', 1, 1, 0.001, 'linear')
noteTweenAlpha('2', 2, 1, 0.001, 'linear')
noteTweenAlpha('3', 3, 1, 0.001, 'linear')
setProperty('UpperBar(With HUD).alpha', 1)
setProperty('LowerBar(With HUD).alpha', 1)
setProperty('boyfriend.x', 770)
setProperty('boyfriend.y', 500)
setProperty('bg_battle.alpha', 0)
setProperty('overlay.alpha', 0)
setProperty('gradient.alpha', 0)
setProperty('bg_white.alpha', 0)
--bg-dark--
setProperty('bg_black.alpha', 1)
setProperty('Lightbulb-dark.alpha', 1)
setProperty('plataform-dark.alpha', 1)
setProperty('Door_dark.alpha', 1)
setProperty('StrangerDoor.alpha', 1)
setProperty('pañuelo-dark.alpha', 1)
setProperty('dark-visual.alpha', 1)
setProperty('Laptop-dark.alpha', 1)
end
if curStep == 2001 then
setProperty('health', 1)
end
end