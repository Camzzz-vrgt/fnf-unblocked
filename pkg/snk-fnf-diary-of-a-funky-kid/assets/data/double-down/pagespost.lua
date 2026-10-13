local allowCountdown = false
local seenpages = false
local seeingend = false

local dacount = 0
local maxpages = 1
local typebeat = '';

function onCreate( )
		makeAnimatedLuaSprite('Page','pages/Post Double Down',360,-88)
		for i=0,maxpages,1 do
			addAnimationByIndices('Page', 'Post Double Down' .. i, 'Post Double Down Page','' .. i)
		end
		scaleLuaSprite('Page', 0.35, 0.35);
		makeLuaSprite('blac', '', -1756.05, -351.95);
        makeGraphic('blac',154000,104000,'000000')
	    setLuaSpriteScrollFactor('black', 0.9, 0.9);
end

function onEndSong()
	-- Block the first countdown and start a timer of 0.8 seconds to play the dialogue
	if not allowCountdown and isStoryMode then
		addLuaSprite('blac', true)
		setProperty('camHUD.visible',false)
		setProperty('inCutscene', true);
		addLuaSprite('Page',true)
		seeingend = true
		setLuaSpriteScrollFactor('Page',0,0);
		runTimer('startMus', 0.3, 1)
		return Function_Stop;
	end
	seenpages = true
	return Function_Continue;
end




function onUpdate()
	if seeingend then
		if keyJustPressed('accept') and getProperty('inCutscene') == true then

			--endSong()
			if dacount == maxpages then
				seenpages = true
				doTweenAlpha('endshit','Page',0,1)
				allowCountdown = true
				setProperty('inCutscene', false);
				seenCutscene = true
				soundFadeOut('',1,0)
				endSong()
			else
			playSound('dialogueClose')
			dacount = dacount + 1
			objectPlayAnimation('Page','Post Double Down' .. dacount)



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

