function onCreate()
	makeLuaSprite('purpledead', 'ourple/purpledead', 0, 0);
	scaleObject('purpledead', 2, 2)
	setScrollFactor('purpledead', 1, 1);
	addLuaSprite('purpledead', false);
	updateHitbox('purpledead')
	setProperty('purpledead.antialiasing', false)

   	makeAnimatedLuaSprite('cryingpieceofshit1','ourple/cryingpieceofshit', 1280, 500)
    	addAnimationByPrefix('cryingpieceofshit1','cryingpieceofshit1','cryingbopp',24,true);
    	objectPlayAnimation('cryingpieceofshit1','cryingpieceofshit1',false);
	setProperty('cryingpieceofshit1.antialiasing', false)
	scaleObject('cryingpieceofshit1', 0.5, 0.5)

	addLuaSprite('cryingpieceofshit1', false);

	function onBeatHit(beat)
		if (curBeat % 2 == 0) then
		objectPlayAnimation('cryingpieceofshit1','cryingbopp',true)
		end
	end

	   	makeAnimatedLuaSprite('cryingpieceofshit2','ourple/cryingpieceofshit', 1550, 500)
    	addAnimationByPrefix('cryingpieceofshit2','cryingpieceofshit2','cryingbopp',24,true);
    	objectPlayAnimation('cryingpieceofshit2','cryingpieceofshit2',false);
	setProperty('cryingpieceofshit2.antialiasing', false)
	scaleObject('cryingpieceofshit2', 0.5, 0.5)

	addLuaSprite('cryingpieceofshit2', false);

	function onBeatHit(beat)
		if (curBeat % 2 == 0) then
		objectPlayAnimation('cryingpieceofshit2','cryingbopp',true)
		end
	end

	   	makeAnimatedLuaSprite('emptyspringtrap','ourple/emptyspringtrap', -100, 500)
    	addAnimationByPrefix('emptyspringtrap','emptyspringtrap','emptyspring',24,true);
    	objectPlayAnimation('emptyspringtrap','emptyspringtrap',false);
	setProperty('emptyspringtrap.antialiasing', false)
	scaleObject('emptyspringtrap', 0.7, 0.7)

	addLuaSprite('emptyspringtrap', false);

	function onBeatHit(beat)
		if (curBeat % 2 == 0) then
		objectPlayAnimation('emptyspringtrap','emptyspring',true)
		end
	end



	close(true);
end

function onCreatePost()--this thing happens once the characters are spawned

end
