local seenDiaEnd = false;

function onCreatePost()
	setProperty('boyfriendCameraOffset[0]', 200);
end

function onMoveCamera(focus)
	if focus == 'boyfriend' then
		doTweenZoom('camZoom', 'camGame', 0.9, 60 / curBpm);
	elseif focus == 'dad' then
		doTweenZoom('camZoom', 'camGame', 1, 60 / curBpm);
	end
end

function onStepHit()
	if curStep == 124 or curStep == 188 then
		playAnim('boyfriend','hey', true);
		setProperty('boyfriend.specialAnim', true);
		setProperty('boyfriend.heyTimer', 0.8);
		playAnim('dad','cheer', true);
		setProperty('dad.specialAnim', true);
		setProperty('dad.heyTimer', 0.8);
	end
end

function onEndSong()
	if not seenDiaEnd and isStoryMode then
		makeLuaSprite('diaBGonStage', 'dialogue/Week 1 DialogBG', 0, 0);
		addLuaSprite('diaBGonStage', true);
		setObjectCamera('diaBGonStage', 'camhud');
		triggerEvent('startDiaEnd');
		seenDiaEnd = true;
		return Function_Stop;
	end

	return Function_Continue;
end