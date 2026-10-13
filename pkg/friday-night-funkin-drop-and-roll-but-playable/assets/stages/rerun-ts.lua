function onCreate()
	precacheImage('1back');
	precacheImage('2fire');
	precacheImage('3firewall');
	precacheImage('4plants');
	precacheImage('5rocks');
	precacheImage('6bushes');
	precacheImage('7ground');
	precacheImage('rock');
	precacheImage('8foreground');
	precacheImage('Ctx');
	precacheImage('ptx');

	setProperty("skipCountdown", true)

        makeLuaSprite('1back','RerunTS/1back',0, 0);
		setLuaSpriteScrollFactor('1back', 0.6, 0.6);
        addLuaSprite('1back',false);
		
        makeLuaSprite('2fire','RerunTS/2fire',0, 0);
		setLuaSpriteScrollFactor('2fire', 0.6, 0.6);
        addLuaSprite('2fire',false);
		
        makeLuaSprite('3firewall','RerunTS/3firewall',0, 0);
		setLuaSpriteScrollFactor('3firewall', 0.6, 0.6);
        addLuaSprite('3firewall',false);
		
        makeLuaSprite('4plants','RerunTS/4plants',0, 0);
		setLuaSpriteScrollFactor('4plants', 0.7, 0.7);
        addLuaSprite('4plants',false);
		
        makeLuaSprite('5rocks','RerunTS/5rocks',0, 0);
		setLuaSpriteScrollFactor('5rocks', 0.8, 0.8);
        addLuaSprite('5rocks',false);
		
        makeLuaSprite('6bushes','RerunTS/6bushes',0, 0);
		setLuaSpriteScrollFactor('5rocks', 0.9, 0.9);
        addLuaSprite('6bushes',false);
	
	makeLuaSprite('ptx','greenhill/ptx',-200, -500);
		setLuaSpriteScrollFactor('ptx', 1, 1);
        addLuaSprite('ptx',false);


     		
        makeLuaSprite('rock','RerunTS/rock',1100, 725);
        addLuaSprite('rock',false);
		
        makeLuaSprite('8foreground','RerunTS/8foreground',0, 0);
        addLuaSprite('8foreground',true);


	  makeLuaSprite('Ctx','greenhill/Ctx',0, -700);
		setLuaSpriteScrollFactor('Ctx', 1, 1);
        addLuaSprite('Ctx',false);

	 makeLuaSprite('bgfire','greenhill/bgfire',0, -700);
		scaleObject('bgfire',1.5,1.5);
        addLuaSprite('bgfire',false);


makeAnimatedLuaSprite('fire', 'greenhill/FireBG', -600, -1000);
	addAnimationByPrefix('fire', 'Idle', 'FIRE instancia', 24, true);
	scaleObject('fire', 3, 3);
	addLuaSprite('fire',false);

makeLuaSprite('ptx','greenhill/ptx',-200, -425);
		setLuaSpriteScrollFactor('ptx', 1, 1);
        addLuaSprite('ptx',false);


	

 makeLuaSprite('7ground','RerunTS/7ground',0, 0);
        addLuaSprite('7ground',false);


			
	makeAnimatedLuaSprite('fire1', 'greenhill/Starman_BG_Fire_Assets', -1350, -900);
	addAnimationByPrefix('fire1', 'Idle', 'fire anim effects', 24, true);
	scaleObject('fire1', 1, 1);
	setProperty('fire1.visible',true)

	makeAnimatedLuaSprite('fire2', 'greenhill/Starman_BG_Fire_Assets', 1200, -900);
	addAnimationByPrefix('fire2', 'Idle', 'fire anim effects', 24, true);
	scaleObject('fire2', 1, 1);
	setProperty('fire2.flipX',true)
	setProperty('fire2.visible',true)

		addLuaSprite('fire1', true)
		addLuaSprite('fire2', true)


        makeLuaSprite('light','RerunTS/light',0, 120);
        scaleObject('light', 1, 1);
        addLuaSprite('light',false);

        makeLuaSprite('light2','RerunTS/light',1220, 120);
        scaleObject('light2', 1, 1);
        addLuaSprite('light2',false);

end

function onStepHit()
	if songName == "Drop And Roll" then
		if curStep == 1 then
		setProperty('fire1.visible',false)
		setProperty('fire2.visible',false)
            setCharacterX('boyfriend', 1500)
            setCharacterX('dad', 290)
            setProperty('gf.visible', false)
            setProperty('1back.visible', false)
            setProperty('2fire.visible', false)
            setProperty('3firewall.visible', false)
            setProperty('4plants.visible', false)
            setProperty('5rocks.visible', false)
            setProperty('6bushes.visible', false)
            setProperty('7ground.visible', false)
            setProperty('rock.visible', false)
            setProperty('8foreground.visible', false)
	    setProperty('Ctx.visible', false)
	     setProperty('ptx.visible', false)	
	setProperty('fire.alpha',false);
	setProperty('bgfire.alpha',false);
		end
        if curStep == 360 then
            setCharacterX('dad', 700)
            setCharacterY('dad', 320)
	 setProperty('gf.visible', true)
 setProperty('light.visible', false)
            setProperty('light2.visible', false)
setProperty('Ctx.visible', true)
	     setProperty('ptx.visible', true)
		end

	if curStep == 1224 then
		setProperty('Ctx.visible', false)
		setProperty('fire.alpha',true);
		setProperty('bgfire.alpha',true);
end
	if curStep == 2332 then
		setCharacterX('dad', 400)
		setProperty('bgfire.alpha',false)
		setProperty('ptx.visible', false)
		setProperty('fire1.visible',true)
		setProperty('fire2.visible',true)
            setProperty('1back.visible', true)
            setProperty('2fire.visible', true)
            setProperty('3firewall.visible', true)
            setProperty('4plants.visible', true)
            setProperty('5rocks.visible', true)
            setProperty('6bushes.visible', true)
            setProperty('7ground.visible', true)
            setProperty('rock.visible', true)
            setProperty('8foreground.visible', true)
          
        end
	if curStep == 2620 then
		setCharacterX('dad', 700)
		setProperty('bgfire.alpha',true)
		setProperty('ptx.visible', true)
		setProperty('fire1.visible',true)
		setProperty('fire2.visible',true)
            setProperty('1back.visible', false)
            setProperty('2fire.visible', false)
            setProperty('3firewall.visible', false)
            setProperty('4plants.visible', false)
            setProperty('5rocks.visible', false)
            setProperty('6bushes.visible', false)
            setProperty('7ground.visible', false)
            setProperty('rock.visible', false)
            setProperty('8foreground.visible', false)
		end
	if curStep == 2924 then
		setProperty('fire1.visible',false)
		setProperty('fire2.visible',false)
		end
	end
end