function onCreate()
	-- background shit
	makeLuaSprite('Hospital_BG', 'stages/sickpants/Hospital_BG', -1500, -730);
        setScrollFactor('Hospital_BG', 0.9, 0.9);
	scaleObject('Hospital_BG', 0.6, 0.6);

        makeAnimatedLuaSprite('hospital_crowd','stages/sickpants/hospital_crowd',-700,220)addAnimationByPrefix('hospital_crowd','crowd idle','crowd',24,true)
        objectPlayAnimation('hospital_crowd','dance',false)
        setScrollFactor('hospital_crowd', 0.9, 0.9);
	scaleObject('hospital_crowd', 0.6, 0.6);

	addLuaSprite('Hospital_BG', false);
	addLuaSprite('hospital_crowd', false);

	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end