function onCreate()

	makeAnimatedLuaSprite("stage","x/bg",-700,-360)
	addAnimationByPrefix('stage', 'idle', 'idle', 100, false)

	makeLuaSprite("shadow","x/shadow", -700,-200)
	setLuaSpriteScrollFactor("shadow",0.8,0.8)

	makeLuaSprite("synt","x/synt", 50, -0)
	setLuaSpriteScrollFactor("synt",0.0,0.0)
	scaleObject('synt', 0.9, 0.9);
	setObjectCamera('synt', 'other');
	setProperty('synt.visible', false)

        makeAnimatedLuaSprite('static','effects/static', -0, 0)
        addAnimationByPrefix('static','idle','idle',24,true)
	setObjectCamera('static', 'other');
        setScrollFactor('static', 0, 0)

	addLuaSprite("stage",false)
	addLuaSprite("shadow",false)
	addLuaSprite("synt",true)
	addLuaSprite("static",true)

	setObjectOrder('stage', '1')
	setObjectOrder('boyfriendGroup', '2')
	setObjectOrder('shadow', '3')
	setObjectOrder('dadGroup', '4')

end
function onBeatHit()
	if curBeat % 2 == 0 then
luaSpritePlayAnimation('stage', 'idle', true);
	end
end