function onCreate()
   makeLuaSprite('wall', 'Bgs/weekGarcello/images/wall', 0, 0);
	setLuaSpriteScrollFactor('wall', 1.0, 1.0);
   scaleObject('wall', 1.0, 1.0);

	makeLuaSprite('floor', 'Bgs/weekGarcello/images/floor', 0, 0);
	setLuaSpriteScrollFactor('floor', 1.0, 1.0);
   scaleObject('floor', 1.0, 1.0);

   makeLuaSprite('Tables', 'Bgs/weekGarcello/images/daTables', 0, 0);
	setLuaSpriteScrollFactor('Tables', 0.865, 0.85);
   scaleObject('Tables', 1.0, 1.0);

   makeLuaText('Lyrics1', "Tight", 1000, 150, 480)
  setTextAlignment('Lyrics1', 'Center')
  setTextColor('Lyrics1', 'adf4bb')
  setTextSize('Lyrics1', 28)
  setObjectCamera("Lyrics1", 'other')
  setProperty('Lyrics1.visible', false);

  makeLuaText('Lyrics2', "Tight bars", 1000, 150, 480)
  setTextAlignment('Lyrics2', 'Center')
  setTextColor('Lyrics2', 'adf4bb')
  setTextSize('Lyrics2', 28)
  setObjectCamera("Lyrics2", 'other')
  setProperty('Lyrics2.visible', false);

  makeLuaText('Lyrics3', "Tight bars little", 1000, 150, 480)
  setTextAlignment('Lyrics3', 'Center')
  setTextColor('Lyrics3', 'adf4bb')
  setTextSize('Lyrics3', 28)
  setObjectCamera("Lyrics3", 'other')
  setProperty('Lyrics3.visible', false);

  makeLuaText('Lyrics4', "Tight bars little man", 1000, 150, 480)
  setTextAlignment('Lyrics4', 'Center')
  setTextColor('Lyrics4', 'adf4bb')
  setTextSize('Lyrics4', 28)
  setObjectCamera("Lyrics4", 'other')
  setProperty('Lyrics4.visible', false);


   makeLuaSprite('B', 'movieBars', 0, 0);
   setObjectCamera('B', 'hud')
	
	addLuaSprite('wall', false);
	addLuaSprite('floor', false);
   addLuaSprite('Tables', false);
	addLuaSprite('B', false);
   addLuaText('Lyrics1')
   addLuaText('Lyrics2')
   addLuaText('Lyrics3')
   addLuaText('Lyrics4')

end

function onCreatePost()
   setProperty("timeBar.color",getColorFromHex("1bbf94"))
end

function onEvent(name, value1, value2)
if name == "GifTrif" then
if value1 == '0' then
doTweenAlpha('1','healthBar',0,0.5)
doTweenAlpha('2','healthBarBG',0,0.5)
doTweenAlpha('3','scoreTxt',0,0.5)
doTweenAlpha('4','iconP1',0,0.5)
doTweenAlpha('5','iconP2',0,0.5)
doTweenAlpha('6','timeBar',0,0.5)
doTweenAlpha('7','timeBarBG',0,0.5)
doTweenAlpha('8','timeTxt',0,0.5)
doTweenAlpha('9','winningIconDad',0,0.5)
doTweenAlpha('10','winningIcon',0,0.5)
noteTweenAlpha('A', 0, 0, 0.5, 'circInOut')
noteTweenAlpha('B', 1, 0, 0.5, 'circInOut')
noteTweenAlpha('C', 2, 0, 0.5, 'circInOut')
noteTweenAlpha('D', 3, 0, 0.5, 'circInOut')
elseif value1 =='1' then
doTweenAlpha('1b','healthBar',1,1)
doTweenAlpha('2b','healthBarBG',1,1)
doTweenAlpha('3b','scoreTxt',1,1)
doTweenAlpha('4b','iconP1',1,1)
doTweenAlpha('5b','iconP2',1,1)
doTweenAlpha('6b','timeBar',1,1)
doTweenAlpha('7b','timeBarBG',1,1)
doTweenAlpha('8b','timeTxt',1,1)
doTweenAlpha('9b','winningIconDad',1,1)
doTweenAlpha('10b','winningIcon',1,1)
noteTweenAlpha('A2', 0, 1, 1, 'circInOut')
noteTweenAlpha('B2', 1, 1, 1, 'circInOut')
noteTweenAlpha('C2', 2, 1, 1, 'circInOut')
noteTweenAlpha('D2', 3, 1, 1, 'circInOut')
elseif value1 =='Tight' then
characterPlayAnim('dad', 'idle', true);
setProperty('dad.specialAnim', true);
setProperty('Lyrics1.visible', true);
elseif value1 =='Bars' then
setProperty('Lyrics1.visible', false);
setProperty('Lyrics2.visible', true);
elseif value1 =='Little' then
setProperty('Lyrics2.visible', false);
setProperty('Lyrics3.visible', true);
elseif value1 =='Man' then
setProperty('Lyrics3.visible', false);
setProperty('Lyrics4.visible', true);
runTimer('adio1', 1);
      end
   end 


function onUpdate()
    if mustHitSection == false then
        doTweenZoom('Zoom', 'camGame', 0.8, 1, 'quadOut')
        setProperty('defaultCamZoom',0.8)
    elseif mustHitSection == true then
        doTweenZoom('Zoom', 'camGame', 0.75, 1, 'quadOut')
        setProperty('defaultCamZoom',0.75)
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
if tag == 'adio1' then
doTweenAlpha('1','Lyrics4',0,0.5)
 end
end
end