function onCreate()
  makeLuaSprite('back', 'tadcstage/back', -250,-250);
	setScrollFactor('back', 0.75, 0.75);
        scaleObject('back', 2.75, 2.75);
        addLuaSprite('back', false);

  makeLuaSprite('stagefloor', 'tadcstage/stagefloor', -250,-250);
	setScrollFactor('stagefloor', 1, 1);
        scaleObject('stagefloor', 2.75, 2.75);
        addLuaSprite('stagefloor', false);

  makeLuaSprite('curtains', 'tadcstage/curtains', -250,-250);
	setScrollFactor('curtains', 1, 1);
        scaleObject('curtains', 2.75, 2.75);
        addLuaSprite('curtains', false);

end

function onBeatHit()
    if curBeat % 2 == 0 then
        objectPlayAnimation('pibby','dance',true)
    end
end

function onStepHit( ... )--for every step
	-- body
end

function onUpdate( ... )
	-- body
end
