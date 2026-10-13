function onCreate()
    setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', false)
    setTextFont("scoreTxt", "VOC-IT.ttf")
    setTextFont('timeTxt',"VOC-IT.ttf")

    setTextColor("timeTxt", "4BCDFF")
    setTextColor("scoreTxt", "4BCDFF")
    setProperty('timeBar.leftBar.color',getColorFromHex('10C2BB'))

    setTextString("botplayTxt", "[BOTPLAY]")
    setTextColor("botplayTxt", "4BCDFF")
    setTextSize("botplayTxt", 20)
    setTextFont("botplayTxt", "VOC-IT.ttf")
    setProperty("botplayTxt.x",960)
    setProperty("botplayTxt.y",140)

    if downscroll then
        setProperty('scoreTxt.y',getProperty('scoreTxt.y') - 100)
    end

    if not lowQuality then
        runHaxeCode([[
            var noteCam:FlxCamera;
            var mikuCam:FlxCamera;
            var extraHUD:FlxCamera;
            var overHUD: FlxCamera;

            for (cam in [game.camGame, game.camHUD, game.camOther]) FlxG.cameras.remove(cam, false);

            noteCam = new FlxCamera(0,FlxG.height/4 - FlxG.width/4, FlxG.width + 50, FlxG.width + 100);

            noteCam.angle = 150;
            noteCam.zoom = 1.2;
            noteCam.alpha = 0.001;

            mikuCam = new FlxCamera();
            mikuCam.zoom = 2;

            extraHUD = new FlxCamera();
            overHUD = new FlxCamera();

            game.camGame.bgColor = 0x00000000; 
            FlxG.cameras.add(game.camGame, true);

            noteCam.bgColor = 0x00000000; 
            FlxG.cameras.add(noteCam, false);

            mikuCam.bgColor = 0x00000000;
            FlxG.cameras.add(mikuCam, false);

            game.camHUD.bgColor = 0x00000000; 
            FlxG.cameras.add(game.camHUD, false);

            extraHUD.bgColor = 0x00000000; 
            FlxG.cameras.add(extraHUD, false);

            overHUD.bgColor = 0x00000000; 
            FlxG.cameras.add(overHUD, false);

            game.camOther.bgColor = 0x00000000; 
            FlxG.cameras.add(game.camOther, false);

            setVar('mikuCam',mikuCam);
            setVar('noteCam',noteCam);
            setVar('extraHUD',extraHUD);

            game.scoreTxt.cameras = [overHUD];
        ]])
    else 
        runHaxeCode([[
            var extraHUD:FlxCamera;
            var overHUD: FlxCamera;

            for (cam in [game.camGame, game.camHUD, game.camOther]) FlxG.cameras.remove(cam, false);

            extraHUD = new FlxCamera();
            overHUD = new FlxCamera();

            game.camGame.bgColor = 0x00000000; 
            FlxG.cameras.add(game.camGame, true);

            game.camHUD.bgColor = 0x00000000; 
            FlxG.cameras.add(game.camHUD, false);

            extraHUD.bgColor = 0x00000000; 
            FlxG.cameras.add(extraHUD, false);

            overHUD.bgColor = 0x00000000; 
            FlxG.cameras.add(overHUD, false);

            game.camOther.bgColor = 0x00000000; 
            FlxG.cameras.add(game.camOther, false);

            setVar('extraHUD',extraHUD);
        ]])
    end
end

function onCreatePost()

    setProperty('dad.x',150)
    setProperty('dad.y',0)

    setProperty('iconP2.visible',false)
    setProperty('dad.visible',false)
    setProperty('boyfriend.visible',true)

    local posYangleNoteCam;
    if downscroll then
        posYangleNoteCam = 1250;
    else
        posYangleNoteCam = 360;
    end

    setVar('posYangleNoteCam',posYangleNoteCam)

    if not lowQuality then
        runHaxeCode([[
            var mikuCam = getVar('mikuCam');
            var noteCam = getVar('noteCam');
            var extraHUD = getVar('extraHUD');
            var gradient = game.getLuaObject('gradient');

            var incrementeX = 0;
            var incrementY = 0;
            for(strum in opponentStrums){
                strum.camera = noteCam;
                strum.x = 300 + incrementeX;
                strum.y = getVar('posYangleNoteCam') + incrementY;

                incrementeX += 170;
                incrementY += 20;
            }
                
            for(note in unspawnNotes){
                if(!note.mustPress){
                    note.camera = noteCam;
                }
            }

            for(strum in playerStrums){
                strum.camera = extraHUD;
            }

            for(note in unspawnNotes){
                if(note.mustPress){
                    note.camera = extraHUD;
                }
            }

            grpNoteSplashes.camera = extraHUD;

            game.boyfriend.cameras = [mikuCam];
            game.getLuaObject('base').cameras = [mikuCam];

            if (gradient != null) {
                gradient.cameras = [mikuCam, game.camGame];
            }

            mikuCam.scroll = FlxG.camera.scroll;
        ]])
    else
        runHaxeCode([[
            var extraHUD = getVar('extraHUD');

            for(strum in opponentStrums){
                strum.visible = false;
            }
                
            for(note in unspawnNotes){
                if(!note.mustPress){
                    note.visible = false;
                }
            }

            for(strum in playerStrums){
                strum.camera = extraHUD;
            }

            for(note in unspawnNotes){
                if(note.mustPress){
                    note.camera = extraHUD;
                }
            }

            grpNoteSplashes.camera = extraHUD;
        ]])
    end

    runHaxeCode([[
        game.healthBar.angle = 90;
        game.healthBar.x = 920;
        game.healthBar.y = 180;
        game.healthBar.scale.x = 0.7;
        game.healthBar.scale.y = 0.93;
    ]])
end


local equationPart 
local per = 50;
function onUpdatePost(e)
	updateHitbox('healthBar')
		
	per = math.min(math.lerp(per, getProperty('healthBar.percent'), (e * 10)), 100)
	setProperty('healthBar.percent', per)
	equationPart = (getProperty('healthBar.width') * per * (getProperty('healthBar.scale.y') * 0.0055)) -- the 0.0095 is to try to keep the icons from going past the screen
	
	local P1Mult = getProperty('healthBar.y') - (equationPart + (150 * getProperty('iconP1.scale.x') - 150)) + 370
	local P2Mult = getProperty('healthBar.y') - (equationPart - (150 * getProperty('iconP2.scale.x'))) + 140
	
	setProperty('iconP1.y', P1Mult + (getProperty('iconP1.offset.y') / 2))
	setProperty('iconP2.y', P2Mult + (getProperty('iconP2.offset.y') / 2))
		
	setProperty('iconP1.x', getProperty('healthBar.x') + 215)
	setProperty('iconP2.x', getProperty('healthBar.x') + 215)

	setProperty('iconP1.origin.y', -150)
	setProperty('iconP2.origin.y', 300)		
end

function math.lerp(a, b, t)
    return (b - a) * t + a
end

function onEvent(eventName, value1, value2)
    if eventName == 'Camera Effects' then
        if value1 == 'zoom-tween' then
            local values = split(value2, ',')
            doTweenZoom('camGameInZoom','camGame',values[1], values[2], 'linear')
            if not lowQuality then
                doTweenZoom('doZoomInCamGameMiku','mikuCam',values[1],values[2], 'linear')
            end
        end

        if value1 == 'insta-focus' then

            setProperty('cameraSpeed',100)
            cameraFlash('camHUD','FFFFFF',0.3)

            local values = split(value2, ',');
            setProperty('camFollow.x',values[1])
            setProperty('camFollow.y,',values[2])
        end

        if value1 == 'reset' then
            cameraFlash('camHUD','FFFFFF',0.3)
            setProperty('cameraSpeed',5)

            setProperty('camGame.angle',0)
            setProperty('defaultCamZoom',0.6)

            if not lowQuality then
                setProperty('mikuCam.zoom',0.6)
                setProperty('mikuCam.angle',0)
            end

            setProperty('camFollow.x',400)
            setProperty('camFollow.y',300)
        end

        if value1 == 'angle' then
            setProperty('camGame.angle',value2)
            if not lowQuality then
                setProperty('mikuCam.angle',value2)
            end
        end

        if value1 == 'zoom' then
            setProperty('defaultCamZoom',value2)
            if not lowQuality then
                setProperty('mikuCam.zoom',value2)
            end
        end

        if value1 == 'flash' then
            cameraFlash('camHUD','FFFFFF',1)
        end

        if value1 == 'inzoom' then
            doTweenZoom('camHUD','camHUD',1,1.8, 'linear')
        end
        if value1 == 'fadein' then
            doTweenAlpha('camHUDAlpha','camHUD',1,0.5, 'linear')
        end
        if value1 == 'almostend' then
            setProperty('camGame.visible',false)
        end
        if value1 == 'notend' then
            setProperty('camGame.visible',true)
            setProperty('camHUD.visible',true)
        end
        if value1 == 'end' then
            setProperty('camGame.visible',false)
            setProperty('camHUD.visible',false)
        end
    end
end


function split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, tostring(match));
    end
    return result;
end

function onDestroy()
    if middlescroll then
        setPropertyFromClass('backend.ClientPrefs', 'data.middleScroll', true)
    end
end

function onGameOverStart()
    cancelTween('camGameInZoom')
    runHaxeCode([[
        game.camGame.zoom = 0.8;
        game.camGame.scroll.x = 500;
        game.camGame.scroll.y = 500;
    ]])
end