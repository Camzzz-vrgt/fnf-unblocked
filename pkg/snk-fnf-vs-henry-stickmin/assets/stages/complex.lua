
function onCreate()

    makeLuaSprite('night', 'ellie/night', -630, -200);
	setProperty('night.alpha', 1);
	scaleObject('night', 0.7, 0.7);
	setScrollFactor('night', 0.5, 0.5);
	addLuaSprite('night', false);

    makeLuaSprite('ground', 'ellie/snow ground', -630, -100);
	setProperty('ground.alpha', 1);
	scaleObject('ground', 0.8, 0.8);
	addLuaSprite('ground', false);

    makeLuaSprite('frontfront', 'ellie/front stuff', -540, -100);
	setProperty('frontfront.alpha', 1);
	scaleObject('frontfront', 0.8, 0.8);
	addLuaSprite('frontfront', false);

	makeLuaSprite('snowuwu', 'ellie/imsosorry', 0, 0);
	setProperty('snowuwu.alpha', .7);
	setScrollFactor('snowuwu', 0, 0);
	setObjectCamera('snowuwu', 'hud');
	addLuaSprite('snowuwu', true);

makeAnimatedLuaSprite('henry','ellie/henry_ellie_stage', -240, 300);
	addAnimationByPrefix('henry', 'henryfirst', 'henry idle 1', 24, false);
	addAnimationByPrefix('henry', 'henrysecond', 'henry idle 2', 24, false);
      setProperty('henry.alpha', 1)
	addLuaSprite('henry', false);

end

function onCreatePost()

    initLuaShader("scroll")

    setSpriteShader('snowuwu',"scroll")
end

function onUpdate()
    setShaderFloat("snowuwu", "iTime", os.clock())
end
