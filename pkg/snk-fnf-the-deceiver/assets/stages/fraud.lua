local xx = 250;
local yy = 300;
local xx2 = 500;
local yy2 = 300;
local ofs = 10;
local followchars = true;
local del = 100;
local del2 = 100;

function onCreatePost()
	function onUpdate()
		if del > 0 then
			del = del - 1
		end
		if del2 > 0 then
			del2 = del2 - 1
		end
		if followchars == true then
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
				if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
					triggerEvent('Camera Follow Pos',xx2,yy2)
				end
			end
		else
			triggerEvent('Camera Follow Pos','','')
		end
	end
end


function onCreate()
	-- dakr bg
	
	makeLuaSprite('Floor2', 'fraud/Floor2', -1700, -475);
	addLuaSprite('Floor2', false);
	scaleObject('Floor2', 0.65, 0.65);

	-- normal bg

	makeLuaSprite('Floor', 'fraud/Floor', -1700, -475);
	addLuaSprite('Floor', false);
	scaleObject('Floor', 0.65, 0.65);


	-- stan dark

	makeAnimatedLuaSprite('Stan2', 'fraud/Stan2', 25, 30); -- static layer
	addAnimationByPrefix('Stan2', 'fraud/Stan2', 'Stan2', 24, true);
	objectPlayAnimation('Stan2', 'fraud/Stan2');
	addLuaSprite('Stan2', false);
	scaleObject('Stan2', 0.65, 0.65);

	-- stan

	makeAnimatedLuaSprite('Stan', 'fraud/Stan', 25, 30); -- static layer
	addAnimationByPrefix('Stan', 'fraud/Stan', 'Stan', 24, true);
	objectPlayAnimation('Stan', 'fraud/Stan');
	addLuaSprite('Stan', false);
	scaleObject('Stan', 0.65, 0.65);
	
	-- ralph
	
	makeAnimatedLuaSprite('Ralph', 'fraud/Ralph', 240, -170); -- static layer
	addAnimationByPrefix('Ralph', 'fraud/Ralph', 'Ralph', 24, true);
	objectPlayAnimation('Ralph', 'fraud/Ralph');
	addLuaSprite('Ralph', false);
	scaleObject('Ralph', 0.85, 0.85);
	
	-- dark bg x2

	makeLuaSprite('Wall2', 'fraud/Wall2', -2000, -1050);
	addLuaSprite('Wall2', false);
	scaleObject('Wall2', 0.65, 0.65);

	-- normal bg x2

	makeLuaSprite('Wall', 'fraud/Wall', -2000, -1000);
	addLuaSprite('Wall', false);
	scaleObject('Wall', 0.65, 0.65);

	-- shader thing
	makeLuaSprite('fraudBGshade', 'fraud/fraudBGshade', -800, -400);
	setScrollFactor('fraudBGshade', 0.9, 0.9);
	addLuaSprite('fraudBGshade', true);

	-- stan hand
	
	makeAnimatedLuaSprite('hand', 'fraud/hand', 100, 200); -- static layer
	addAnimationByPrefix('hand', 'fraud/hand', 'hand', 24, true);
	objectPlayAnimation('hand', 'fraud/hand');
	scaleObject('hand', 0.8, 0.8);
	addLuaSprite('hand', false);

	-- stan and ralph mid song event appear thingie

	setProperty('hand.visible', false);
	setProperty('Stan.visible', false);
	setProperty('Ralph.visible', false);

	setProperty('Stan2.visible', false);

	-- blackout event thingie

	setProperty('Wall2.visible', false);
	setProperty('Floor2.visible', false);
end