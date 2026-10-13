function onCreate()
	makeAnimatedLuaSprite('gumball', 'characters/Gumball', -350, 160);
	addAnimationByPrefix('gumball', 'idle', 'Gumball0', 24, false);
	addAnimationByPrefix('gumball', 'left', 'Gumball Left', 24, false);
	addAnimationByPrefix('gumball', 'down', 'Gumball Down', 24, false);
	addAnimationByPrefix('gumball', 'up', 'Gumball Up', 24, false);
	addAnimationByPrefix('gumball', 'right', 'Gumball Right', 24, false);
	setProperty('gumball.scale.x', 0.58);
	setProperty('gumball.scale.y', 0.58);
	setProperty('gf.visible', true)
	setProperty('gf.x', 170)
	setProperty('gf.y', 120)
	setProperty('gf.scale.x', 0.58);
	setProperty('gf.scale.y', 0.58);
end
