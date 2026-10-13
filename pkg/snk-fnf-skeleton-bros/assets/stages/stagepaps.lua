function onCreate()
	-- background shit
	makeLuaSprite('Wall', 'stagesans-Papyrus/Wall', -200, 250);
	scaleObject('Wall', 1.5, 0.8);
                addLuaSprite('Wall',false)

	makeLuaSprite('Ground', 'stagesans-Papyrus/Ground', 0, 450);
	scaleObject('Ground', 1, 1);
                addLuaSprite('Ground',false)

                makeAnimatedLuaSprite('SANS_TROMBON_TROLL','stagesans-Papyrus/SANS_TROMBON_TROLL',3000,850)
	addAnimationByPrefix('SANS_TROMBON_TROLL','idle','SANS TROMBON TROLL',24,ture)	
	setLuaSpriteScrollFactor('SANS_TROMBON_TROLL', 1.5, 1.5);
                addLuaSprite('SANS_TROMBON_TROLL',false)

	makeLuaSprite('Bibiloteca', 'stagesans-Papyrus/Bibiloteca', 850, 50);
	scaleObject('Bibiloteca', 1, 1);
                addLuaSprite('Bibiloteca',false)


    setProperty('gfGroup.visible', false)
    setProperty('SANS_TROMBON_TROLL.visible', false)
end
function onStepHit()
                if curStep == 632 then
    setProperty('SANS_TROMBON_TROLL.visible', true)
end
end
