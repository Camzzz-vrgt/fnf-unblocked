local crumble = 0;
local oppx = 340;
local oppy = 418;
local camoffs = 70;
local followchars = true;

function onCreate()
	
	-- background shit

	makeLuaSprite('stage1', 'encav/encavmabg1', -850, -765);
	makeLuaSprite('stage2', 'encav/encavmabg2', -850, -765);

	makeAnimatedLuaSprite('crumble', 'encav/breaking', 275, -300);
	addAnimationByPrefix('crumble', 'anim', 'brak', 24, true);
	scaleObject('crumble', 1.3, 1.3);

	addLuaSprite('stage1', false);
	addLuaSprite('stage2', false);
	setProperty('stage2.alpha', 0);

	addLuaSprite('crumble', true);
	setProperty('crumble.alpha', 0);

end

function opponentNoteHit(id, direction, noteType, isSustainNote)
    
	--make screen shake when auditor sings

	cameraShake('camGame', 0.01 * (crumble + 1), 0.1)
	
end

function onUpdate()
	if getProperty('health') >= 1 then
		setProperty('boyfriend.idleSuffix', '');
	else
		if getProperty('health') < 0.5 then
			setProperty('boyfriend.idleSuffix', '-alt2');
		else
			setProperty('boyfriend.idleSuffix', '-alt1');
		end
	end

	if crumble == 1 then
		setProperty('crumble.alpha', 1);	
	else
		setProperty('crumble.alpha', 0);
	end

	-- if keyJustPressed('space') == true then
	-- 	debugPrint(getProperty('camFollow.x'), getProperty('camFollow.y'));
	-- end

	if followchars == true then
		if mustHitSection == false then
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',oppx-camoffs,oppy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',oppx+camoffs,oppy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',oppx,oppy-camoffs)
			end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',oppx,oppy+camoffs)
			end
			if getProperty('dad.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',oppx,oppy);
			end
		else
			triggerEvent('Camera Follow Pos','','');
		end
	else
		triggerEvent('Camera Follow Pos','','');
	end
end


function onBeatHit()

	if curBeat % 4 == 0 then
		if getProperty('stage1.alpha') == 1 then
			setProperty('stage2.alpha', 1);
			setProperty('stage1.alpha', 0);
		else
			setProperty('stage1.alpha', 1);
			setProperty('stage2.alpha', 0);
		end
	end

	if crumble == 1 then
		characterPlayAnim('gf', 'scared', true)
	end

	if curBeat == 268 then
		-- debugPrint('crumble');
		crumble = 1;
	end

	if curBeat == 272 then
		-- debugPrint('stopcrumble');
		crumble = 0;
	end

	if curBeat == 300 then
		crumble = 1;
	end

	if curBeat == 304 then
		crumble = 0;
	end

	if curBeat == 336 then
		crumble = 1;
	end

	if curBeat == 352 then
		crumble = 0;
	end
end