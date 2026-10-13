function onCreate()
	makeLuaSprite('BG1', 'stage/stage_1/BG1', -420, -380);
	scaleObject('BG1', 1, 1);
	setScrollFactor('BG1', 1, 1);
	setProperty('BG1.antialiasing', true);
	setObjectOrder('BG1', 0);

	makeLuaSprite('BG2', 'stage/stage_1/BG2', -447, -380);
	scaleObject('BG2', 1, 1);
	setScrollFactor('BG2', 1, 1);
	setProperty('BG2.antialiasing', true);
	setObjectOrder('BG2', 1);

	makeLuaSprite('BG3', 'stage/stage_1/BG3', -424, -393);
	scaleObject('BG3', 1, 1);
	setScrollFactor('BG3', 1, 1);
	setProperty('BG3.antialiasing', true);
	setObjectOrder('BG3', 2);

	makeLuaSprite('BG4', 'stage/stage_1/BG4', -420, -393);
	scaleObject('BG4', 1, 1);
	setScrollFactor('BG4', 1, 1);
	setProperty('BG4.antialiasing', true);
	setObjectOrder('BG4', 3);

	setScrollFactor('gfGroup', 1, 1);
	setProperty('gfGroup.antialiasing', true);
	setObjectOrder('gfGroup', 4);

	makeLuaSprite('RED1', 'stage/stage_1/RED1', -420, -380);
	setProperty('RED1.antialiasing', true);
	setObjectOrder('RED1', 5);

	setScrollFactor('dadGroup', 1, 1);
	setProperty('dadGroup.antialiasing', true);
	setObjectOrder('dadGroup', 8);

	setScrollFactor('boyfriendGroup', 1, 1);
	setProperty('boyfriendGroup.antialiasing', true);
	setObjectOrder('boyfriendGroup', 9);

	if songName == 'Messer' then

		makeAnimatedLuaSprite('Cyan', 'stage/stage_1/Cyan', -700, 450);
		addAnimationByPrefix('Cyan','Beat','Beat', 24, false)
		setScrollFactor('Cyan', 1.5, 1.0);
		scaleObject('Cyan', 1.35, 1.35);
		setProperty('Cyan.antialiasing', true);
		setObjectOrder('Cyan', 10);

		makeAnimatedLuaSprite('White', 'stage/stage_1/White', 800, 400);--800 500
		addAnimationByPrefix('White','Beat','Beat', 24, false)
		setScrollFactor('White', 1.5, 1.0);
		scaleObject('White', 1.35, 1.35);
		setProperty('White.antialiasing', true);
		setObjectOrder('White', 11);

	end

	makeLuaSprite('RED2', 'stage/stage_1/RED2', -420, -380);
	setProperty('RED2.antialiasing', true);
	setObjectOrder('RED2', 20);

	makeLuaSprite('RED0', 'stage/stage_1/RED0', -420, -380);
	setProperty('RED0.antialiasing', true);
	setObjectOrder('RED0', 21);

	setProperty("RED1.alpha", 0)
	setProperty("RED2.alpha", 0)

	setProperty("RED0.alpha", 0)

end

function onBeatHit()
	if curBeat % 2 == 0 then
		playAnim("Cyan", "Beat", false)
	end
	if curBeat % 2 == 1 then
		playAnim("White", "Beat", false)
	end
end