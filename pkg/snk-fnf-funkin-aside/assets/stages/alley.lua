function onCreate()
	-- background shit
	makeLuaSprite('bg', 'Bgs/weekWhitty/images/street', -905, -370);
	setLuaSpriteScrollFactor('bg', 1.0, 1.0);
   scaleObject('bg', 1.3, 1.3);

   makeLuaSprite('B', 'movieBars', 0, 0);
   setObjectCamera('B', 'hud')

   makeLuaSprite('a','',-1250,-250)
   makeGraphic('a',1280,720,'17191b')
   setLuaSpriteScrollFactor('a',1,1)
   scaleObject('a', 5.6, 5.6);
   setProperty('a.alpha',0.4)

	addLuaSprite('bg', false);
   addLuaSprite('a', true);
   addLuaSprite('B', false);
	
end

function onCreatePost()
   setProperty("timeBar.color",getColorFromHex("443724"))
end

function onUpdate()
    if mustHitSection == false then
        doTweenZoom('Zoom', 'camGame', 0.55, 1, 'quadOut')
        setProperty('defaultCamZoom',0.55)
    elseif mustHitSection == true then
        doTweenZoom('Zoom', 'camGame', 0.85, 1, 'quadOut')
        setProperty('defaultCamZoom',0.85)
    end
end