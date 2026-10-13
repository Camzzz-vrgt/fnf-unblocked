local xx =  685;
local yy =  710;
local xx2 = 1350;
local yy2 = 710;
local ofs = 20;

function onCreate()
	-- background shit
	makeLuaSprite('main', 'erasureassets/main', 0, 0);
	setScrollFactor('main', 1, 1);
	makeLuaSprite('switch', 'erasureassets/main switch', 0, 0);
	setScrollFactor('switch', 1, 1);
	makeLuaSprite('shine', 'erasureassets/glow add', 0, 0);
	setScrollFactor('shine', 1, 1);
    makeLuaSprite('defeat', 'erasureassets/red add', 0, 0);
	setScrollFactor('defeat', 1, 1);
	
	    makeLuaSprite('defeat2', 'erasureassets/red add', 0, 0);
	setScrollFactor('defeat2', 1, 1);
	
		makeAnimatedLuaSprite('t', 'textboxchara', 510, 350);
		addAnimationByPrefix('t', 'idle', 'tbstatic', 24, true)
	
		makeAnimatedLuaSprite('bgmo', 'monsterbg', -500, -400);
		addAnimationByPrefix('bgmo', 'idle', 'bgscroll', 24, true)
	
    
    makeLuaSprite('9s', '9s', -500, -400);

    setBlendMode('shine', 'add')
    setBlendMode('defeat', 'add')
	    setBlendMode('defeat2', 'add')

	addLuaSprite('switch', false);
	addLuaSprite('main', false);
    addLuaSprite('defeat', false);
	addLuaSprite('shine', true);
	addLuaSprite('defeat2', true);
	setProperty('defeat2.visible', false)
	    addLuaSprite('bgmo', false);
		scaleObject('bgmo', 3,3)
		 setProperty('bgmo.alpha', 0)

        addLuaSprite('9s', false);
		scaleObject('9s', 3,3)
		setProperty('9s.alpha', 0)	
	--screen shit
	if downscroll == false then
     makeLuaSprite('ui','HealtBarUT', 0, 0)
	 else
	 makeLuaSprite('ui','HealtBarUT', 0,-160)
	 end
	setGraphicSize('ui',1280,720)
	setObjectCamera('ui','hud')
	updateHitbox('ui')
  setProperty('ui.visible', false)
  
  	if downscroll == false then
       makeLuaSprite('hp','HP', 270, 641)
	 else
	  makeLuaSprite('hp','HP', 270, 80)
	 end
	setObjectCamera('hp','hud')
	updateHitbox('hp')
    setProperty('hp.visible', false)
	
    addLuaSprite('ui', true);
    addLuaSprite('hp', true);
	
	--addLuaSprite('t', true);
	precacheImage('NOTE_assets_UT');
	precacheImage('charanotes');
end

function onCreatePost()
doTweenY('ytup','t',400,1.5,'sineInOut')
	
doTweenAlpha('flicker', 't', 0, 0.25, 'bounceInOut')
   doTweenAngle('rightangle','t',4,2.5,'sineInOut')
setProperty('gf.visible',true)
end

function onTweenCompleted(tag)

	if tag == 'flicker' then
	doTweenAlpha('flicker2', 't', 0.8, 0.4, 'expoOut')
	end
	
	if tag == 'flicker2' then
	doTweenAlpha('flicker', 't', 0, 0.4, 'bounceInOut')
	end
	
	 if tag == 'rightangle' then
      doTweenAngle('leftangle','t',-4,2.5,'sineInOut')
   end
   if tag == 'leftangle' then
      doTweenAngle('rightangle','t',4,2.5,'sineInOut')
   end
   
   	 if tag == 'ytup' then
      doTweenY('ytup2','t',300,1.5,'sineInOut')
   end
   if tag == 'ytup2' then
      doTweenY('ytup','t',400,1.5,'sineInOut')
   end

end

function onStepHit()
   if curStep == 12 then
     xx =  1065;
     yy =  710;
     xx2 = 1450;
     yy2 = 710;
   end
   if curStep == 288 then
     xx =  1450;
     yy =  710;
     xx2 = 950;
     yy2 = 710;
   end
   if curStep == 539 then
     xx =  1450;
     yy =  710;
     xx2 = 1450;
     yy2 = 710;
   end
   if curStep == 544 then
     xx =  1065;
     yy =  710;
     xx2 = 1450;
     yy2 = 710;
   end
   if curStep == 1340 then
      misses = getProperty('songMisses')
      if misses <9 then
         xx =  1840;
         yy =  710;
         xx2 = 1840;
         yy2 = 710;
      elseif misses >8 then
         xx =  1265;
         yy =  710;
         xx2 = 1265;
         yy2 = 710;
      end
   end
end


function onUpdate()
    if mustHitSection == false then
        if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx-ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx+ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',xx,yy-ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx,yy+ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
            triggerEvent('Camera Follow Pos',xx-ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
            triggerEvent('Camera Follow Pos',xx+ofs,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
            triggerEvent('Camera Follow Pos',xx,yy-ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
            triggerEvent('Camera Follow Pos',xx,yy+ofs)
        end
        if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
            triggerEvent('Camera Follow Pos',xx,yy)
        end
        if getProperty('dad.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx,yy)
        end
    else
        if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
            triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
            triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
            triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
            triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
            triggerEvent('Camera Follow Pos',xx2,yy2)
        end
        if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
            triggerEvent('Camera Follow Pos',xx2,yy2)
        end
    end
end