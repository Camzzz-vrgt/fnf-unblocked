function onStepHit()
	if curStep == 48 or curStep == 272 or curStep == 496 or curStep == 679 then
		playAnim('dad', 'clip', true);
		setProperty('dad.specialAnim', true);
	end

	if curStep == 55 or curStep == 120 or curStep == 176 or curStep == 184 or curStep == 264 
		or curStep == 287 or curStep == 311 or curStep == 449 or curStep == 544
		or curStep == 551 or curStep == 560 or curStep == 568 or curStep == 632 
		or curStep == 696 or curStep == 776 or curStep == 792 or curStep == 807 
		or curStep == 815 or curStep == 824 then
		playAnim('dad', 'shoot', true);
		setProperty('dad.specialAnim', true);
	end

	if curStep == 1088 and not isStoryMode then
		playAnim('dad', 'shoot', true);
		setProperty('dad.specialAnim', true);
	end

	if curStep == 1086 and isStoryMode then
		playAnim('boyfriend', 'pre-attack', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('boyfriend.heyTimer',6);
	end

	if curStep == 1087 and isStoryMode then
		playAnim('dad', 'shoot', true);
		setProperty('dad.heyTimer',6);
		setProperty('dad.specialAnim', true);
	end

	if curStep == 1104 and isStoryMode then
		makeLuaSprite('diaBGonStage', 'dialogue/Week 1 DialogBG', 0, 0);
		addLuaSprite('diaBGonStage', true);
		triggerEvent('startDiaEnd');
	end
end
function onStepHit()
	if curStep == 48 or curStep == 272 or curStep == 496 or curStep == 679 then
		playAnim('dad', 'clip', true);
		setProperty('dad.specialAnim', true);
	end

	if curStep == 55 or curStep == 120 or curStep == 176 or curStep == 184 or curStep == 264 
		or curStep == 287 or curStep == 311 or curStep == 449 or curStep == 544
		or curStep == 551 or curStep == 560 or curStep == 568 or curStep == 632 
		or curStep == 696 or curStep == 776 or curStep == 792 or curStep == 807 
		or curStep == 815 or curStep == 824 then
		playAnim('dad', 'shoot', true);
		setProperty('dad.specialAnim', true);
	end

	if curStep == 1088 and not isStoryMode then
		playAnim('dad', 'shoot', true);
		setProperty('dad.specialAnim', true);
	end

	if curStep == 1086 and isStoryMode then
		playAnim('boyfriend', 'pre-attack', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('boyfriend.heyTimer',6);
	end

	if curStep == 1087 and isStoryMode then
		playAnim('dad', 'shoot', true);
		setProperty('dad.heyTimer',6);
		setProperty('dad.specialAnim', true);
	end

	if curStep == 1104 and isStoryMode then
		makeLuaSprite('diaBGonStage', 'dialogue/Week 1 DialogBG', 0, 0);
		addLuaSprite('diaBGonStage', true);
		setObjectCamera('diaBGonStage', 'camhud');
		triggerEvent('startDiaEnd');
	end
end
