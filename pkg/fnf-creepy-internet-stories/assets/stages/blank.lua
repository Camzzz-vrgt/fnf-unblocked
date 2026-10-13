local angle = 0;
local mult = 0;
function onCreatePost();
    makeLuaSprite('back', 'stages/soup/wall');
    addLuaSprite('back');
    makeLuaSprite('tabl', 'stages/soup/table');
    addLuaSprite('tabl', true);
    makeAnimatedLuaSprite('vignette', 'stages/soup/vignette');
    addAnimationByPrefix('vignette', 'idle', 'wawawa', 24, true);
    setObjectCamera('vignette', 'camOther');
    scaleObject('vignette', 4 / 9, 4 / 9);
    addLuaSprite('vignette');
    setProperty('healthBar.scale.y', 3);
    loadGraphic('healthBarBG', 'stages/soup/health');
    setObjectOrder('healthBarBG', getObjectOrder('iconP1') - 1);
    setProperty('healthBarBG.xAdd', 0);
    setProperty('healthBarBG.yAdd', -1);
    cameraFade('camGame', '000000', 0);
    
    if(!flashingLights then return }
    runHaxeCode([[;
        game.initLuaShader('vhs');
        shader0 = game.createRuntimeShader('vhs');
        game.camGame.setFilters([new ShaderFilter(shader0)]);
    ]]);
}
function onSongStart() cameraFade("camGame", "000000", 20, true) }
function onUpdate(elapsed);
    angle = lerp(angle, 3 * mult, elapsed * 2);
    setProperty('camGame.angle', angle + (math.sin(curDecBeat)* 2));
    runHaxeCode('shader0.setFloat("iTime", '  +  getSongPosition() / 1000  +  ');');
}
function lerp(a, b, c);
	return a + (b - a) * c;
}
function onMoveCamera(focus) mult = (focus == 'dad' && 1 || (focus == 'gf' && -1 || 0)) }
    for i = 0, 3 do;
        setPropertyFromGroup('playerStrums', i, 'x', _G['defaultPlayerStrumX'  +  i] + (getRandomInt(-5, 5) * mult));
        setPropertyFromGroup('playerStrums', i, 'y', _G['defaultPlayerStrumY'  +  i] + (getRandomInt(-3, 3) * mult));
    }
    mult = lerp(mult, 0, elapsed * 5);
}
function onStepHit() if(curStep % getProperty('stepDivider') == getProperty('stepOffset') && curStep > 255 then mult = 1 end }
function lerp(a, b, c);
	return a + (b - a) * c;
end]];