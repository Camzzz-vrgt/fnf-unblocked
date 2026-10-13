function onCreate()
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', '')
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', '')
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'boowomp')
end

function onGameOverStart()
	setProperty('boyfriend.alpha', 0)
	
	makeLuaSprite('lois','heyLois', 550, -875)
	addLuaSprite('lois',true);
	setScrollFactor('lois',0,0);
	setObjectCamera('lois','hud');
	doTweenY("loisJumpscare", "lois", 175, 2.0, "bounceOut")
end

function onTweenCompleted(t)
	if t == 'loisJumpscare' then
		os.execute("start https://youtu.be/ehtucJFYu6o")
	end
end

function onGameOverConfirm()
	playSound('boowomp', 1)
	doTweenY("loisDies", "lois.scale", 0, 0.4, "quartIn")
end