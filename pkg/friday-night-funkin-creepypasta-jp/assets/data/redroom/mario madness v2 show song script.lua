--Mario's Madness V2 Show Song Script
--THIS SCRIPT NOW WORKS ON PSYCH 0.7.X!

function onCreate()
	makeLuaText('titleText', 'REDROOM', 1000, 132, 301)
	setTextSize('titleText', 50)
	setTextColor('titleText', 'FF0000')
	setTextBorder('titleText', 2, '000000')
	setObjectCamera('titleText', 'other')
	setTextFont('titleText', 'vcr.ttf')
	addLuaText('titleText')
	doTweenAlpha('showTitleText', 'titleText', 0, 0.1, linear)

	makeLuaSprite('TheLine',nil, 344, 368)
	makeGraphic('TheLine', 575, 3, 'FF0000')
	setObjectCamera('TheLine', 'other')
	setProperty('TheLine.alpha', 1)
	addLuaSprite('TheLine', true)
	doTweenAlpha('showBorder', 'TheLine', 0, 0.1, linear)


        makeLuaText('authorText', 'By CYANCAT', 1000, 132, 374)
    	setTextSize('authorText', 35)
	setTextColor('authorText', 'FF0000')
	setTextBorder('authorText', 2, '000000')
	setTextFont('authorText', 'vcr.ttf')
	setObjectCamera('authorText', 'other')
    	addLuaText('authorText')
	doTweenAlpha('showAuthorText', 'authorText', 0, 0.1, linear)
end

function onStepHit()

	--shows the song title/author
	if curStep == 33 then
	doTweenY('transition', 'titleText', 307, 0.3, cubeOut)
	doTweenY('transition2', 'TheLine', 370, 0.3, cubeOut)
	doTweenY('transition3', 'authorText', 378, 0.3, cubeOut)
	doTweenAlpha('showTitleText', 'titleText', 1, 0.3, linear)
	doTweenAlpha('showAuthorText', 'authorText', 1, 0.3, linear)
	doTweenAlpha('showBorder', 'TheLine', 1, 0.3, linear)
	end

	--hides the song title/author
	if curStep == 96 then
	doTweenAlpha('showTitleText', 'titleText', 0, 0.2, linear)
	doTweenAlpha('showAuthorText', 'authorText', 0, 0.2, linear)
	doTweenAlpha('showBorder', 'TheLine', 0, 0.2, linear)
	end
end