--Recreation by RamenDominoes
--Credit appreciated, but not necessary thanks <3


function onCreate()

	--MAIN SECTION
	makeLuaSprite('Main', 'CREDITTEXT', 350, -1300)
	makeGraphic('Main', 570, 1300, '808080')
	setObjectCamera('Main', 'other')
	setProperty('Main.alpha', 0.4)
	addLuaSprite('Main', true)
	
	--BorderLeft
	makeLuaSprite('BorderLeft', 'OUTLINE', 350, -1300)
	makeGraphic('BorderLeft', 4, 1300, 'FFFFFF')
	setObjectCamera('BorderLeft', 'other')
	setProperty('BorderLeft.alpha', 0.6)
	addLuaSprite('BorderLeft', true)

	--BorderRight
	makeLuaSprite('BorderRight', 'OUTLINE', 920, -1300)
	makeGraphic('BorderRight', 4, 1300, 'FFFFFF')
	setObjectCamera('BorderRight', 'other')
	setProperty('BorderRight.alpha', 0.6)
	addLuaSprite('BorderRight', true)

-----------------------------------------------------------------------

	--CREDITS TEXT
	makeLuaText('CREDITS', 'CREDITS', 1000, 132, -1000)
	setTextAlignment('CREDITS', 'center')
	setTextSize('CREDITS', 50)
	setObjectCamera('CREDITS', 'other')
	addLuaText('CREDITS')
	
	--Fran
	makeLuaText('CODERS', 'Francescos Toon', 1000, 132, -1000)
	setTextAlignment('CODERS', 'center')
	setTextSize('CODERS', 35)
	setObjectCamera('CODERS', 'other')
	addLuaText('CODERS')

	--Noveni
	makeLuaText('ARTISTS', 'Noveni', 1000, 132, -1000)
	setTextAlignment('ARTISTS', 'center')
	setTextSize('ARTISTS', 35)
	setObjectCamera('ARTISTS', 'other')
	addLuaText('ARTISTS')
	
	--MarStarBro
	makeLuaText('MUSICIANS', 'MarStarBro & Saster', 1000, 132, -1000)
	setTextAlignment('MUSICIANS', 'center')
	setTextSize('MUSICIANS', 35)
	setObjectCamera('MUSICIANS', 'other')
	addLuaText('MUSICIANS')

-----------------------------------------------------------------------

	--Fran desc
	makeLuaText('CODER1', 'Remixed the song and made most of the main art', 1000, 132, -1000)
	setTextAlignment('CODER1', 'center')
	setTextSize('CODER1', 25)
	setObjectCamera('CODER1', 'other')
	addLuaText('CODER1')

	makeLuaText('CODER2', 'also the voice of Sonic.exa', 1000, 132, -1000)
	setTextAlignment('CODER2', 'center')
	setTextSize('CODER2', 25)
	setObjectCamera('CODER2', 'other')
	addLuaText('CODER2')
		
	--Noveni desc
	makeLuaText('ARTIST1', 'Made the pixel sprites', 1000, 132, -1000)
	setTextAlignment('ARTIST1', 'center')
	setTextSize('ARTIST1', 25)
	setObjectCamera('ARTIST1', 'other')
	addLuaText('ARTIST1')

	--Mar Desc
	makeLuaText('MUSICIAN1', 'OG composers of Too Slow Encore', 1000, 132, -1000)
	setTextAlignment('MUSICIAN1', 'center')
	setTextSize('MUSICIAN1', 25)
	setObjectCamera('MUSICIAN1', 'other')
	addLuaText('MUSICIAN1') 
end

--------TIME FOR THE MOVEMENT SHIT BABEY WOOOOOOOO!!!--------

function onCreatePost()
	runTimer('ENTRANCE', 0.5, 1)
end

function onTimerCompleted(tag, loops, loopsLeft)

	if tag == 'ENTRANCE' then
	--------UNDERLAY ENTRANCE--------
	
	doTweenY('UNDERLAY1', 'Main', 0, 0.5, 'linear')
	doTweenY('UNDERLAY2', 'BorderLeft', 0, 0.5, 'linear')
	doTweenY('UNDERLAY3', 'BorderRight', 0, 0.5, 'linear')

	
	--------TEXT ENTRANCE--------
	
	----CREDITS TEXT----
	doTweenY('CREDSTEXT', 'CREDITS', 60, 0.3, 'linear')

	----CODERS TEXT----
	doTweenY('CODETEXT', 'CODERS', 140, 0.3, 'linear')
	doTweenY('CODER1', 'CODER1', 180, 0.3, 'linear')
	doTweenY('CODER2', 'CODER2', 220, 0.3, 'linear')

	----ARTISTS TEXT----
	doTweenY('ARTTEXT', 'ARTISTS', 280, 0.3, 'linear')
	doTweenY('ARTIST1', 'ARTIST1', 320, 0.3, 'linear')

	----MUSICIANS TEXT----
	doTweenY('MUSICTEXT', 'MUSICIANS', 420, 0.3, 'linear')
	doTweenY('MUSICIAN1', 'MUSICIAN1', 460, 0.3, 'linear')

	----MAKE THE TEXT LEAVE SHIT----
	runTimer('ALL THE FUCKING THINGS', 2.8, 1)
	end

	if tag == 'ALL THE FUCKING THINGS' then

	--------UNDERLAY EXIT--------
	
	doTweenY('UNDERLAY1EXIT', 'Main', -1300, 0.2, 'linear')
	doTweenY('UNDERLAY2EXIT', 'BorderLeft', -1300, 0.2, 'linear')
	doTweenY('UNDERLAY3EXIT', 'BorderRight', -1300, 0.2, 'linear')

	
	--------TEXT EXIT--------
	
	----CREDITS TEXT----
	doTweenY('CREDSTEXTEXIT', 'CREDITS', -1000, 0.3, 'linear')

	----CODERS TEXT----
	doTweenY('CODETEXTEXIT', 'CODERS', -1000, 0.3, 'linear')
	doTweenY('CODER1EXIT', 'CODER1', -1000, 0.3, 'linear')
	doTweenY('CODER2EXIT', 'CODER2', -1000, 0.3, 'linear')

	----ARTISTS TEXT----
	doTweenY('ARTTEXTEXIT', 'ARTISTS', -1000, 0.3, 'linear')
	doTweenY('ARTIST1EXIT', 'ARTIST1', -1000, 0.3, 'linear')

	----MUSICIANS TEXT----
	doTweenY('MUSICTEXTEXIT', 'MUSICIANS', -1000, 0.3, 'linear')
	doTweenY('MUSICIAN1EXIT', 'MUSICIAN1', -1000, 0.3, 'linear')

end
end





