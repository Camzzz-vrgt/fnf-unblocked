function onCreate()
   addCharacterToList("banette-edgy", "dad")

   makeLuaSprite('darling', 'room/darling', -240, -600);
   scaleObject('darling', 0.85, 0.85);
   setScrollFactor('darling', 0.85, 0.85) 
   setProperty('darling.alpha', 1)
   addLuaSprite('darling', false);
   setProperty('darling.visible', true)

   makeLuaSprite('darling2', 'room/darling2', -240, -600);
   scaleObject('darling2', 0.85, 0.85);
   setScrollFactor('darling2', 0.85, 0.85) 
   setProperty('darling2.alpha', 1)
   addLuaSprite('darling2', false);
   setProperty('darling2.visible', false)

   makeLuaSprite('bg', 'room/room_bg', -990, -800);
   scaleObject('bg', 0.605, 0.57);
   setScrollFactor('bg', 0.9, 0.9) 
   setProperty('bg.alpha', 1)
   addLuaSprite('bg', false);
   setObjectOrder('bg', 4);
   setProperty('bg.visible', true)

   makeLuaSprite('bed', 'room/bed', -903, 240);
   scaleObject('bed', 0.6, 0.6);
   setScrollFactor('bed', 0.8, 0.8) 
   setProperty('bed.alpha', 1)
   setObjectOrder('bed', 5);
   addLuaSprite('bed', false);
   setProperty('bed.visible', true)

   makeLuaSprite('window', 'room/window', -135, -580);
   scaleObject('window', 0.65, 0.68);
   setScrollFactor('window', 0.9, 0.9) 
   setProperty('window.alpha', 1)
   addLuaSprite('window', false);
   setObjectOrder('window', 6);
   setProperty('window.visible', true)

end

function onCreatePost()
    setScrollFactor('dadGroup', 0.85, 0.85) 
if not middlescroll then 
for i=0, getProperty('playerStrums.length')-1 do 
	setPropertyFromGroup('playerStrums', i, 'x', getPropertyFromGroup('opponentStrums', i, 'x'))
end
for i=0, getProperty('opponentStrums.length')-1 do 
	setPropertyFromGroup('opponentStrums', i, 'x', 732 + i*112)
     end
  end
end

function onUpdatePost()
        setProperty('healthBar.flipX', true)
        p1 = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) + (150 * getProperty('iconP1.scale.x') - 150) / 2 - 26)
        setProperty('iconP1.x', p1 - 110)
        setProperty('iconP1.origin.x', 240)
        setProperty('iconP1.flipX', true)
    
        p2 = getProperty('healthBar.x') + ((getProperty('healthBar.width') * getProperty('healthBar.percent') * 0.01) - (150 * getProperty('iconP2.scale.x')) / 2 - 26 * 2)
        setProperty('iconP2.x', p2 + 110)
        setProperty('iconP2.origin.x', -100)
        setProperty('iconP2.flipX', true)
end