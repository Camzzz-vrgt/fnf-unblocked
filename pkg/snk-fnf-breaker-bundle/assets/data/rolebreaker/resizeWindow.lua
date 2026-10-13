RESIZE_WINDOW = true -- for some reason if it's false, it breaks camera stuff when it leaves ??? just be mindful of that
local comboOffset = {}
local allowCountdown = false

function onStartCountdown()
	runHaxeCode([[
        game.camHUD.zoom = 1;
        game.timeTxt.y = ClientPrefs.downScroll ? 960 - 44 : 19;
        game.timeBarBG.y = game.timeTxt.y + (game.timeTxt.height / 4);
        game.timeBar.y = game.timeBarBG.y + 4;
        for (strum in game.strumLineNotes) {
            strum.y = ClientPrefs.downScroll ? 960 - 150 : 50;
        }
        game.healthBarBG.y = ClientPrefs.downScroll ? FlxG.height * 0.11 : 960 * 0.89;
        game.healthBar.y = game.healthBarBG.y + 4;
        game.iconP1.y = game.healthBar.y - 75;
        game.iconP2.y = game.healthBar.y - 75;
        game.scoreTxt.y = game.healthBarBG.y + 36;

        game.boyfriendCameraOffset[1] -= 120;
        game.opponentCameraOffset[1] -= 120;
        game.girlfriendCameraOffset[1] -= 120;
        game.moveCamera(true);
    ]])
	
	comboOffset = getPropertyFromClass('ClientPrefs', 'comboOffset')
    addHaxeLibrary('FlxTypedGroup', 'flixel.group')
    addHaxeLibrary('Application', 'lime.app')
    addHaxeLibrary('StrumNote')
    addHaxeLibrary('ClientPrefs')
    local func = RESIZE_WINDOW and function() runHaxeCode([[
        Application.current.window.x += 160;
        FlxG.resizeGame(960, 720);
        FlxG.resizeWindow(960, 720);
    ]]) end or function() runHaxeCode([[
        FlxG.resizeGame(960, 720);
		FlxG.width = 1280;
		FlxG.height = 960;
        var v = (1280 - 960) / 2;
        v += 50;
        game.camGame.x += v;
        game.camHUD.x += v;
        game.camOther.x += v;
    ]]) end
    func()
    runHaxeCode([[
        game.camHUD.y -= 120;  
        game.camHUD.height = 960;
        game.camOther.y -= 120;  
        game.camOther.height = 960;
        game.camGame.y -= 120;  
        game.camGame.height = 960;
        for (i in 0...4) {
            if ((i + 1) % 2 == 0) ClientPrefs.comboOffset[i] -= 120 * 2;
        }
    ]])
	
	return Function_Continue;
end

function onDestroy()
    setPropertyFromClass('ClientPrefs', 'comboOffset', comboOffset)
    if RESIZE_WINDOW then
        runHaxeCode([[  
            Application.current.window.x -= 160;
            FlxG.resizeWindow(1280, 720);
        ]])
    end
    runHaxeCode([[
        FlxG.resizeGame(1280, 720);
    ]])
end

--thanks neo
local shouldFixPause = false;
function onPause()
    shouldFixPause = true;
end

function onUpdatePost()
    if shouldFixPause then
        runHaxeCode([[
            game._requestedSubState.members[0].setGraphicSize(1280*3, 720*3);
            game._requestedSubState.members[0].updateHitbox();
            game._requestedSubState.members[0].screenCenter();
        ]])
        shouldFixPause = false;
    end
end