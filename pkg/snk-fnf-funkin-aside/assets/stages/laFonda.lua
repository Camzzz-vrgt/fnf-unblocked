function onCreate()
	makeLuaSprite('bg', 'Bgs/weekMostaza/images/BG', 0, 0);
	setLuaSpriteScrollFactor('bg', 1.0, 1.0);
	
	makeLuaSprite('Eatingtable', 'Bgs/weekMostaza/images/Eatingtable', 0, 0);
	setLuaSpriteScrollFactor('Eatingtable', 1.0, 1.0);

   makeLuaSprite('Tables', 'Bgs/weekMostaza/images/Tables', -150, 0);
	setLuaSpriteScrollFactor('Tables', 0.9, 0.9);
   
   makeLuaSprite('overlayMexicano', 'Bgs/weekMostaza/images/overlayMexicano', 0, 0);
	setLuaSpriteScrollFactor('overlayMexicano', 1.0, 1.0);
   setProperty('overlayMexicano.alpha',0.3)

   makeLuaSprite('a','',-1250,-250)
   makeGraphic('a',1280,720,'afc921')
   setLuaSpriteScrollFactor('a',1,1)
   scaleObject('a', 5.6, 5.6);
   setProperty('a.alpha',0.2)

   makeLuaSprite('B', 'movieBars', 0, 0);
   setObjectCamera('B', 'hud')


	addLuaSprite('bg', false);
   addLuaSprite('Eatingtable', false);
   addLuaSprite('Tables', true);
   addLuaSprite('a', true);
   addLuaSprite('overlayMexicano', true);
   addLuaSprite('B', false);
	
end

function onCreatePost()
   setProperty("timeBar.color",getColorFromHex("aaab2c"))
end


function onUpdate()
    if mustHitSection == false then
        doTweenZoom('Zoom', 'camGame', 0.592418369059017, 1, 'quadOut')
        setProperty('defaultCamZoom',0.592418369059017)
    elseif mustHitSection == true then
        doTweenZoom('Zoom', 'camGame', 0.7, 1, 'quadOut')
        setProperty('defaultCamZoom',0.7)
    end
end