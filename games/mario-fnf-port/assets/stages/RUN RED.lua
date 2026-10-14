function onMoveCamera(focus);
    if(focus == 'boyfriend'){
        setProperty('defaultCamZoom', 0.7);
    else if(focus == 'dad'){
        setProperty('defaultCamZoom', 0.5);
    }
}
}
function onCreatePost();
    setProperty('gf.visible',false);
}
function onCreate();

    makeAnimatedLuaSprite('stand','luigi_stand',-1000, -450);
	addAnimationByPrefix('stand','luigi_stand','luigibg',24,true);
              scaleObject('stand', 1.55, 1.55);
    makeLuaSprite('yes', 'Red rock', -1000, -300);
	setLuaSpriteScrollFactor('yes', 1, 1);
	scaleObject('yes', 1.5, 1.5);
	makeLuaSprite('mount', 'Red mount', -1000, -600);
	setLuaSpriteScrollFactor('mount', 1, 1);
	scaleObject('mount', 1.7, 2.3);
    makeLuaSprite('mount2', 'Red mount2', -800, -800);
	setLuaSpriteScrollFactor('mount2', 1, 1);
	scaleObject('mount2', 1.2, 10);
	makeLuaSprite('stagebackk', 'Red back', -800, -800);
	setLuaSpriteScrollFactor('stagebackk', 1, 1);
	scaleObject('stagebackk', 1.5, 1.5);
    makeLuaSprite('stagefront', 'Red floor', -800, -300);
	setLuaSpriteScrollFactor('stagefront', 1, 1);
	scaleObject('stagefront', 1.5, 1.5);
    makeLuaSprite('stagefront2', 'Red floor2', -800, -300);
	setLuaSpriteScrollFactor('stagefront2', 1, 1);
	scaleObject('stagefront2', 1.5, 1.5);
    makeLuaSprite('stick', 'Red stick', -450, -1050);
	setLuaSpriteScrollFactor('stick', 1, 1);
	scaleObject('stick', 1.2, 1.5);
    makeLuaSprite('stick blood', 'Red blood', -800, -300);
	setLuaSpriteScrollFactor('stick blood', 1, 1);
	scaleObject('stick blood', 1.5, 1.5);
	makeLuaSprite('Floor', 'toolatefloor', -1100, 200);
	setLuaSpriteScrollFactor('Floor', 1, 1);
	scaleObject('Floor', 1.5, 1);
    makeLuaSprite('Movie', 'Movie', 0, -45);
	setLuaSpriteScrollFactor('Movie', 1, 1);
	scaleObject('Movie', 2, 0.9);
    setObjectCamera('Movie', 'camHUD');
    makeLuaSprite('HUD', 'fmShade', 0, 0);
	setLuaSpriteScrollFactor('HUD', 1, 1);
	scaleObject('HUD', 1, 1);
    setObjectCamera('HUD', 'camOther');
    makeLuaSprite('x', 'X', 700, 0);
	setLuaSpriteScrollFactor('x', 1, 1);
	scaleObject('x', 1.4, 1.4);
    addLuaSprite('stagebackk', false);
    addLuaSprite('mount', false);
    addLuaSprite('yes', false);
    addLuaSprite('mount2', false);
    addLuaSprite('stagefront2', false);
    addLuaSprite('stagefront', false);
    addLuaSprite('stick', false);
    addLuaSprite('stick blood', false);
    addLuaSprite('Floor', false);
    addLuaSprite('stand', false);
    setProperty('Floor.visible', false);
    setProperty('stand.visible', false);
    setProperty('x.alpha', 0);
    makeLuaSprite('GraphicWhite', nil, '-1000', '-500');
     makeGraphic('GraphicWhite', 5000, 5000, 'FFFFFF');
     addLuaSprite('GraphicWhite', false);
     setProperty('GraphicWhite.visible', false);
     addLuaSprite('x', false);
}