function onCreate()
	
	makeLuaSprite('bg', 'Bgs/weekWhitty/images/street-bomblitz', -880, -345);
	setLuaSpriteScrollFactor('bg', 1.1, 1.1);
   scaleObject('bg', 1.3, 1.3);

   makeLuaSprite('G', 'Bgs/weekWhitty/images/grid', 0, 0);
   setObjectCamera('G', 'hud')
   scaleObject('G', 0.53, 0.53);

   makeLuaSprite('B', 'movieBars', 0, 0);
   setObjectCamera('B', 'hud')

	addLuaSprite('bg', false);
   addLuaSprite('a', true);
   addLuaSprite('G', false);
   addLuaSprite('B', false);
	
end

function onCreatePost()
   setProperty("timeBar.color",getColorFromHex("443724"))
end

function onUpdate()
    if mustHitSection == false then
        doTweenZoom('Zoom', 'camGame', 0.6859087427253849, 1, 'quadOut')
        setProperty('defaultCamZoom',0.6859087427253849)
    elseif mustHitSection == true then
        doTweenZoom('Zoom', 'camGame', 0.75, 1, 'quadOut')
        setProperty('defaultCamZoom',0.75)
    end
end