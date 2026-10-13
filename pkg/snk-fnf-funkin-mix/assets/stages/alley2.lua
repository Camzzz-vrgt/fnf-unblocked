function onCreate()
	makeAnimatedLuaSprite('base', 'Base', 0, 0);
	addAnimationByPrefix('base', 'idle', 'Base0000', 24, false);
	addAnimationByPrefix('base', 'lightOn', 'Base', 24, false);
	playAnim('base', 'idle', false);

	makeAnimatedLuaSprite('graffiti', 'Graffiti', 85, 160);
	addAnimationByPrefix('graffiti', 'idle', 'Graffiti0000', 24, false);
	addAnimationByPrefix('graffiti', 'flash', 'Graffiti', 24, false);
	playAnim('graffiti', 'idle', false);
	
	makeAnimatedLuaSprite('signal', 'Light', 0, 0)
	addAnimationByPrefix('signal', 'green', 'Green Light', 24, false);
	addAnimationByPrefix('signal', 'red', 'Red Light', 24, false);
	setProperty('signal.alpha', 0);
	playAnim('signal', 'green', false);

	makeAnimatedLuaSprite('left_light', 'Left_Light', 0, 0);
	addAnimationByPrefix('left_light', 'idle', 'Left light0000', 24, false);
	addAnimationByPrefix('left_light', 'lightOn', 'Left light', 24, false);
	playAnim('left_light', 'idle', false);


	makeAnimatedLuaSprite('right_light', 'Right_Light', 0, 0);
	addAnimationByPrefix('right_light', 'idle', 'Right light0000', 24, false);
	addAnimationByPrefix('right_light', 'lightOn', 'Right light', 24, false);
	playAnim('right_light', 'idle', false);

	makeAnimatedLuaSprite('wire_pole', 'Middle', 0, 0);
	addAnimationByPrefix('wire_pole', 'idle', 'Middle0000', 24, false);
	addAnimationByPrefix('wire_pole', 'lightOn', 'Middle', 24, false);
	playAnim('wire_pole', 'idle', false);

	makeAnimatedLuaSprite('wire_netting', 'Top', 0, 0);
	addAnimationByPrefix('wire_netting', 'idle', 'Top0000', 24, false);
	addAnimationByPrefix('wire_netting', 'lightOn', 'Top', 24, false);
	playAnim('wire_netting', 'idle', false);

	addLuaSprite('base', false);
	addLuaSprite('graffiti', false);
	addLuaSprite('signal', false);
	addLuaSprite('left_light', true);
	addLuaSprite('right_light', true);
	addLuaSprite('wire_pole', true);
	addLuaSprite('wire_netting', true);
end
