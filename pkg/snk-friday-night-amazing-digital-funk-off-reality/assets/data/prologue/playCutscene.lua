playVideo = true;
playDialogue = true;

function onCreate()
	makeLuaSprite('ggg', '', 0, 0)
	makeGraphic('ggg',1280,720,'000000')
	addLuaSprite('ggg', true)
	setProperty('ggg.alpha',0);
	setObjectCamera('ggg', 'other');
end

function onEndSong()
	if isStoryMode and not seenCutscene and not skipCinematic then
		if playVideo then --Video cutscene plays first
			startVideo('El prologo'); --Play video file from "videos/" folder
			setProperty('ggg.alpha',1);
			playVideo = false;
			return Function_Stop; --Prevents the song from starting naturally
		end
	end
	return Function_Continue; --Played video, now the song can start normally
end