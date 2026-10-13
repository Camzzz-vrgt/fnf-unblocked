function onCreate()
	-- background shit
	makeLuaSprite('bg', 'Bgs/weekMomichi/images/outsidethearcade', -1198, -525);
	setLuaSpriteScrollFactor('bg', 1.0, 1.0);
   scaleObject('bg', 1.6, 1.6);

   makeAnimatedLuaSprite('Mc', 'Bgs/weekMomichi/images/mane_comba', -945, -30);
   addAnimationByPrefix('Mc', 'Beat2', 'Carrito instance', 24, false);
   setScrollFactor('Mc', 1.0, 1.0);

   makeAnimatedLuaSprite('Db', 'Bgs/weekMomichi/images/backgrounddavebambi', -475, 340);
   addAnimationByPrefix('Db', 'Beat', 'dravebrambibg instance', 24, false);
   setScrollFactor('Db', 1.0, 1.0);

   makeLuaSprite('B', 'movieBars', 0, 0);
   setObjectCamera('B', 'hud')

   makeLuaSprite('B2', 'movieBars', 0, 0);
   setObjectCamera('B2', 'other')
   setProperty('B2.visible', false);

   makeLuaText('Lyrics1', "Ha", 1000, 150, 480)
  setTextAlignment('Lyrics1', 'Center')
  setTextColor('Lyrics1', 'bf3155')
  setTextSize('Lyrics1', 28)
  setObjectCamera("Lyrics1", 'other')
  setProperty('Lyrics1.visible', false);

  makeLuaText('Lyrics2', "Ha termino", 1000, 150, 480)
  setTextAlignment('Lyrics2', 'Center')
  setTextColor('Lyrics2', 'bf3155')
  setTextSize('Lyrics2', 28)
  setObjectCamera("Lyrics2", 'other')
  setProperty('Lyrics2.visible', false);

  makeLuaText('Lyrics3', "Ha termino bro", 1000, 150, 480)
  setTextAlignment('Lyrics3', 'Center')
  setTextColor('Lyrics3', 'bf3155')
  setTextSize('Lyrics3', 28)
  setObjectCamera("Lyrics3", 'other')
  setProperty('Lyrics3.visible', false);

  makeLuaText('Lyrics4', "Nah", 1000, 150, 480)
  setTextAlignment('Lyrics4', 'Center')
  setTextColor('Lyrics4', 'bf3155')
  setTextSize('Lyrics4', 28)
  setObjectCamera("Lyrics4", 'other')
  setProperty('Lyrics4.visible', false);

  makeLuaText('Lyrics5', "Nahh", 1000, 150, 480)
  setTextAlignment('Lyrics5', 'Center')
  setTextColor('Lyrics5', 'bf3155')
  setTextSize('Lyrics5', 28)
  setObjectCamera("Lyrics5", 'other')
  setProperty('Lyrics5.visible', false);

  makeLuaText('Lyrics6', "Nahhh", 1000, 150, 480)
  setTextAlignment('Lyrics6', 'Center')
  setTextColor('Lyrics6', 'bf3155')
  setTextSize('Lyrics6', 28)
  setObjectCamera("Lyrics6", 'other')
  setProperty('Lyrics6.visible', false);

  makeLuaText('Lyrics7', "Nahhh mentira", 1000, 150, 480)
  setTextAlignment('Lyrics7', 'Center')
  setTextColor('Lyrics7', 'bf3155')
  setTextSize('Lyrics7', 28)
  setObjectCamera("Lyrics7", 'other')
  setProperty('Lyrics7.visible', false);


	addLuaSprite('bg', false);
   addLuaSprite('Mc', false);
   addLuaSprite('Db', false);
   addLuaSprite('B', false);
   addLuaSprite('B2', false);
   addLuaText('Lyrics1')
   addLuaText('Lyrics2')
   addLuaText('Lyrics3')
   addLuaText('Lyrics4')
   addLuaText('Lyrics5')
   addLuaText('Lyrics6')
   addLuaText('Lyrics7')
   
	
end

function onCreatePost()
   setProperty("timeBar.color",getColorFromHex("e75563"))
end

function onCountdownTick(counter)
    if counter == 0 then
        objectPlayAnimation('Db', 'Beat', true)
        objectPlayAnimation('Mc', 'Beat2', true)
    end
    if counter == 1 then
        objectPlayAnimation('Db', 'Beat', true)
        objectPlayAnimation('Mc', 'Beat2', true)
    end
    if counter == 2 then
        objectPlayAnimation('Db', 'Beat', true)
        objectPlayAnimation('Mc', 'Beat2', true)
    end
    if counter == 3 then
        objectPlayAnimation('Db', 'Beat', true)
        objectPlayAnimation('Mc', 'Beat2', true)
    end
end


function onUpdate()
    if mustHitSection == false then
        doTweenZoom('Zoom', 'camGame', 0.85, 1, 'quadOut')
        setProperty('defaultCamZoom',0.85)
    elseif mustHitSection == true then
        doTweenZoom('Zoom', 'camGame', 0.6, 1, 'quadOut')
        setProperty('defaultCamZoom',0.6)
    end
end

function onBeatHit()
   if curBeat % 2 == 0 then
   objectPlayAnimation('Db', 'Beat', true)
   objectPlayAnimation('Mc', 'Beat2', true)
end
end

function onEvent(name, value1, value2)
if name == "GifTrif" then
if value1 == 'Ha' then
setProperty('Lyrics1.visible', true);
elseif value1 =='Termino' then
setProperty('Lyrics1.visible', false);
setProperty('Lyrics2.visible', true);
elseif value1 =='Bro' then
setProperty('Lyrics2.visible', false);
setProperty('Lyrics3.visible', true);
runTimer('adio1', 1);
elseif value1 == 'Nah' then
setProperty('Lyrics4.visible', true);
elseif value1 =='Nahh' then
setProperty('Lyrics4.visible', false);
setProperty('Lyrics5.visible', true);
elseif value1 =='Nahhh' then
setProperty('Lyrics5.visible', false);
setProperty('Lyrics6.visible', true);
elseif value1 =='Mentira' then
setProperty('Lyrics6.visible', false);
setProperty('Lyrics7.visible', true);
runTimer('adio2', 1);
elseif value1 =='Boom' then
setProperty('B2.visible', true);
elseif value1 =='BoomA' then
doTweenAlpha('2','B2',0,0.1)
      end
   end 

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'adio1' then
doTweenAlpha('1','Lyrics3',0,0.5)
elseif tag == 'adio2' then
doTweenAlpha('1','Lyrics7',0,0.5)
 end
end
end