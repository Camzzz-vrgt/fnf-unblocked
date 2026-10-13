local xx = 180;
local yy = 200;
local xx2 = 430;
local yy2 = 200;
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
	-- radio locker hallway
	
	makeAnimatedLuaSprite('bg', 'maze3/bg', -450, -50); -- static layer
	addAnimationByPrefix('bg', 'maze3/bg', 'bg bop', 12, true);
	objectPlayAnimation('bg', 'maze3/bg');
	setScrollFactor('bg', 0.9, 0.9);
	addLuaSprite('bg', false);
	scaleObject('bg', 0.85, 0.85);

	-- normal bg

	makeLuaSprite('front', 'maze3/front', -1200, -300);
	addLuaSprite('front', false);
	scaleObject('front', 0.8, 0.8);

	-- bulb

	makeAnimatedLuaSprite('bulb', 'maze3/bulb', -400, -500); -- static layer
	addAnimationByPrefix('bulb', 'maze3/bulb', 'bulb', 24, true);
	objectPlayAnimation('bulb', 'maze3/bulb');
	addLuaSprite('bulb', true);
	scaleObject('bulb', 0.8, 0.8);

	-- blub overlay
	
	makeLuaSprite('overlay', 'maze3/overlay', -2000, -500);
	addLuaSprite('overlay', true);
end