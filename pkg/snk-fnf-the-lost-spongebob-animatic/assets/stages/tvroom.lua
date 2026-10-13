function onCreate()

	makeLuaSprite('roughbg2', 'roughbg2', 320, 30);
	setLuaSpriteScrollFactor('roughbg2', 1.0, 1.0);
	scaleObject('roughbg2', 1, 1)
	addLuaSprite('roughbg2', false);

	makeLuaSprite('roughbg', 'roughbg', 620, 30);
	setLuaSpriteScrollFactor('roughbg', 1.0, 1.0);
	scaleObject('roughbg', 1, 1)
	addLuaSprite('roughbg', false);
	setProperty("roughbg.visible", true)
	
	makeLuaSprite('hit1', 'hit1', 0, 0);
	setLuaSpriteScrollFactor('hit1', 1.0, 1.0);
	scaleObject('hit1', 0.67, 0.67)
	addLuaSprite('hit1', false);
	setProperty("hit1.visible", false)
	setObjectCamera("hit1", "hud")
	
	makeLuaSprite('hit2', 'hit2', 0, 0);
	setLuaSpriteScrollFactor('hit2', 1.0, 1.0);
	scaleObject('hit2', 0.67, 0.67)
	addLuaSprite('hit2', false);
	setProperty("hit2.visible", false)
	setObjectCamera("hit2", "hud")
	
	makeLuaSprite('hit3', 'hit3', 0, 0);
	setLuaSpriteScrollFactor('hit3', 1.0, 1.0);
	scaleObject('hit3', 0.67, 0.67)
	addLuaSprite('hit3', false);
	setProperty("hit3.visible", false)
	setObjectCamera("hit3", "hud")
	
	makeLuaSprite('hit4', 'hit4', 0, 0);
	setLuaSpriteScrollFactor('hit4', 1.0, 1.0);
	scaleObject('hit4', 0.67, 0.67)
	addLuaSprite('hit4', false);
	setProperty("hit4.visible", false)
	setObjectCamera("hit4", "hud")
	
	makeLuaSprite('hit5', 'hit5', 0, 0);
	setLuaSpriteScrollFactor('hit5', 1.0, 1.0);
	scaleObject('hit5', 0.67, 0.67)
	addLuaSprite('hit5', false);
	setProperty("hit5.visible", false)
	setObjectCamera("hit5", "hud")
	
end

function onStepHit()

	if curStep == 896 then
	setProperty("hit1.visible", true)
	end

	if curStep == 932 then
	setProperty("hit1.visible", false)
	end

	if curStep == 932 then
	setProperty("hit2.visible", true)
	end

	if curStep == 954 then
	setProperty("hit2.visible", false)
	end

	if curStep == 954 then
	setProperty("hit3.visible", true)
	end

	if curStep == 988 then
	setProperty("hit3.visible", false)
	end

	if curStep == 988 then
	setProperty("hit4.visible", true)
	end

	if curStep == 997 then
	setProperty("hit4.visible", false)
	end

	if curStep == 997 then
	setProperty("hit5.visible", true)
	end

	if curStep == 1024 then
	setProperty("hit5.visible", false)
	end

	if curStep == 1024 then
	setProperty("roughbg.visible", false)
	end

end