function onCreate()
	-- background shit

        makeLuaSprite('sky', 'sky', 100, 400);
        setScrollFactor('sky', 0.9, 0.9);

        makeLuaSprite('montañas', 'montañas', 100, 400);
        setScrollFactor('montañas', 0.9, 0.9);

	makeLuaSprite('arboles', 'arboles', 100, 400);
        setScrollFactor('arboles', 0.9, 0.9);

        makeLuaSprite('suelo', 'suelo', 100, 400);

        makeAnimatedLuaSprite('josie', 'josie', 1300, 1250);
	addAnimationByPrefix('josie', 'josie', 'josie', 24, true);
        objectPlayAnimation('josie', 'josie', true);
  
        makeAnimatedLuaSprite('villagers', 'villagers', 100, 1500);
	addAnimationByPrefix('villagers', 'villagers', 'villagers', 24, true);
        objectPlayAnimation('villagers', 'villagers', true);





        
	addLuaSprite('sky', false);
        addLuaSprite('montañas', false);
        addLuaSprite('arboles', false);
        addLuaSprite('suelo', false);
        addLuaSprite('josie',false);
       addLuaSprite('villagers', true);

end

function onBeatHit()
	-- triggered 2 times per section
	if curBeat % 4 == 0 then
	objectPlayAnimation('villagers', 'villagers');
end
end

function onBeatHit()
	-- triggered 2 times per section
	if curBeat % 4 == 0 then
	objectPlayAnimation('josie', 'josie');
end
end
