function onCreate()
	-- background shit

	makeLuaSprite('vingette', 'stages/story/stage2vingette', -150, -150);
	--setObjectCamera("vingette", 'Other')
	scaleObject("vingette", 1.2, 1.2)
	setScrollFactor("vingette", 0.4, 0.4)

	makeAnimatedLuaSprite("papyrus", 'stages/story/papyrus', 1400, 350);
	addAnimationByPrefix("papyrus", "idle", "idle", 16, true)
	scaleObject("papyrus", 0.8, 0.8)

	makeAnimatedLuaSprite("SANS", 'stages/story/SANS', 1100, 450);
	addAnimationByPrefix("SANS", "idle", "idle", 16, true)
	scaleObject("SANS", 0.7, 0.7)

	makeAnimatedLuaSprite("alphys", 'stages/story/alphys', 1800, 700);
	addAnimationByPrefix("alphys", "idle", "idle", 16, true)
	scaleObject("alphys", 0.7, 0.7)

	makeLuaSprite('restapre', 'stages/story/stage1', -230, 200);
	scaleObject("restapre", 1.7, 1.35)

	makeLuaSprite('resta', 'stages/story/stage2', 0, 0);
	scaleObject("resta", 1.0, 1.0)

	makeLuaSprite('alphys2', 'stages/story/stage2al', 0, 0);
	
	makeLuaSprite('bun1', 'stages/story/stage2bun', 0, 0);

	makeLuaSprite('bun2', 'stages/story/stage2bun2', 0, 0);

	makeLuaSprite('quack', 'stages/story/stage2quacks', 0, 0);
	setScrollFactor("quack", 1.2, 1.0)

	makeLuaSprite('random', 'stages/story/stage2random', 0, 0);

	makeLuaSprite('sans2', 'stages/story/stage2sans', 0, 0);

	makeLuaSprite('pappys', 'stages/story/stage2paps', 0, 0);

	setProperty('quack.visible', false)
	setProperty('bun2.visible', false)
	setProperty('alphys2.visible', false)
	setProperty('bun1.visible', false)
	setProperty('random.visible', false)
	setProperty('sans2.visible', false)
	setProperty('pappys.visible', false)
	setProperty('vingette.visible', false)

		addLuaSprite('vingette', true);	
		addLuaSprite('alphys', false);	
		addLuaSprite('SANS', false);	
		addLuaSprite('papyrus', false);	
		addLuaSprite('restapre', false);	
        addLuaSprite('resta', false);		        
        addLuaSprite('alphys2', false);	
		addLuaSprite('bun1', false);
        addLuaSprite('bun2', false);
		addLuaSprite('quack', true);		        
        addLuaSprite('random', false);	
		addLuaSprite('sans2', false);
        addLuaSprite('pappys', false);

		setObjectOrder("resta", 0)
		setObjectOrder("restapre", 1)
		setProperty('cameraSpeed', 0.5)
end

function onStepHit()
	if curStep == 128 then
		setProperty('cameraSpeed', 1.2)
		cameraFlash("Game", "FFFFFF", 1.0, nil)
		setProperty('restapre.visible', false)
		setProperty('alphys.visible', false)
		setProperty('SANS.visible', false)
		setProperty('papyrus.visible', false)
		setProperty('quack.visible', true)
		setProperty('bun2.visible', true)
		setProperty('alphys2.visible', true)
		setProperty('bun1.visible', true)
		setProperty('random.visible', true)
		setProperty('sans2.visible', true)
		setProperty('pappys.visible', true)
		setProperty('vingette.visible', true)
		
	end
end
function onBeatHit()
	playAnim("alphys", "idle")
	playAnim("SANS", "idle")
	playAnim("papyrus", "idle")
end

function onSectionHit()
	if getProperty("isCameraOnForcedPos") then
		return
	end
	if getProperty("defaultCamZoom") ~= (mustHitSection and 0.8 or 1.0) then
		setProperty('defaultCamZoom',mustHitSection and 0.8 or 1.0)
	end
end

function onCreatePost()
	setProperty('cameraSpeed', 10.5)
end

function onGameOverStart()
	if boyfriendName ~= 'bf' then
		setProperty('boyfriend.visible', false)
		makeLuaText("gameOverTxt", "GAME OVER\nU SUCK LMFAO", 1280, 0.0, 100)
		setObjectCamera("gameOverTxt", "HUD")
		addLuaText("gameOverTxt")
		setTextSize("gameOverTxt", 23)
	end
end