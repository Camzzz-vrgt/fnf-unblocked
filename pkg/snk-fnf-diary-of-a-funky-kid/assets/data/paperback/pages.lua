local allowCountdown = false
local seenpages = false

local dacount = 0
local maxpages = 1
local typebeat = '';

function  onCreate( )
	if isStoryMode and not seenCutscene then
		setPropertyFromClass('PlayState','seenCutscene',true)
		setProperty('camHUD.visible',false)
		makeAnimatedLuaSprite('Page','pages/Paperback',360,-88)
		for i=0,maxpages,1 do
			addAnimationByIndices('Page', 'Paperback' .. i, 'Paperback Page','' .. i)
		end
		makeLuaSprite('black', '', -756.05, -151.95);
        makeGraphic('black',8000,8000,'000000')
	    setLuaSpriteScrollFactor('black', 0.9, 0.9);
        addLuaSprite('black', true)
		addLuaSprite('Page',true)
		scaleLuaSprite('Page', 0.35, 0.35);
		setLuaSpriteScrollFactor('Page',0,0);
		runTimer('startMus', 0.3, 1)
	end
end

function onStartCountdown()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode and not seenCutscene then
		setProperty('inCutscene', true);
		--runTimer('startDialogue', 0.8);
		--allowCountdown = true;
		return Function_Stop;
	end
	seenpages = true
	return Function_Continue;
end




function onUpdate()
	if not seenpages then
		if keyJustPressed('accept') and getProperty('inCutscene') == true then

			--endSong()
			if dacount == maxpages then
				seenpages = true
				doTweenAlpha('endshit','Page',0,1)
				allowCountdown = true
				setProperty('inCutscene', false);
				seenCutscene = true
				soundFadeOut('',1,0)
			else
			playSound('dialogueClose')
			dacount = dacount + 1
			objectPlayAnimation('Page','Paperback' .. dacount)



			end

		end
	end

end
function onTweenCompleted(t)

	if t == 'endshit' then
		setProperty('camHUD.visible',true)
			startCountdown()
		close(true)
	end

end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'breakfast');
	end
	if tag == 'startMus' then -- Timer completed, play dialogue
		playMusic('pagemusic',1,true)
	end
end

-- Dialogue (When a dialogue is finished, it calls startCountdown again)
function onNextDialogue(count)



	

	-- triggered when the next dialogue line starts, 'line' starts with 1
end






function onSkipDialogue(count)


	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end

