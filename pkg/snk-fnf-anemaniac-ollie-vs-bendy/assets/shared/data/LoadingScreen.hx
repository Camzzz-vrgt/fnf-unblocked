function onCreate()
    {
        game.stateChangeDelay = 3;
    
        var bg = new FlxSprite().makeGraphic(1, 1, 0xFFCAFF4D);
        bg.scale.set(FlxG.width, FlxG.height);
        bg.updateHitbox();
        bg.screenCenter();
        addBehindBar(bg);
    
        funkay = new FlxSprite(0, 0).loadGraphic(Paths.image('background'));
        funkay.antialiasing = ClientPrefs.data.antialiasing;
        funkay.setGraphicSize(0, FlxG.height);
        funkay.color = 0xFF2E2E2E;
        funkay.scale.set(1.4, 1.35);
        funkay.updateHitbox();
        add(funkay);

        var ollie = new FlxSprite(100, 200).loadGraphic(Paths.image('ollieCutout'));
        ollie.antialiasing = ClientPrefs.data.antialiasing;
        ollie.setGraphicSize(0, 0);
        ollie.color = 0xFF2E2E2E;
        ollie.scale.set(0.7, 0.7);
        ollie.updateHitbox();
        add(ollie);

        var bendy = new FlxSprite(800, 230).loadGraphic(Paths.image('bendyCutout'));
        bendy.antialiasing = ClientPrefs.data.antialiasing;
        bendy.setGraphicSize(0, 0);
        bendy.color = 0xFF2E2E2E;
        bendy.scale.set(0.6, 0.6);
        bendy.updateHitbox();
        add(bendy);
        
        loading = new FlxSprite(0, 0).loadGraphic(Paths.image('LOADINGTXT'));
        loading.antialiasing = ClientPrefs.data.antialiasing;
        loading.setGraphicSize(0, 0);
        loading.scale.set(0.7, 0.7);
        loading.updateHitbox();
        loading.screenCenter();
        add(loading);

        blackScreen = new FlxSprite().makeGraphic(FlxG.width, FlxG.height, 0xFF000000);
        blackScreen.alpha = 0;
        add(blackScreen);
    }
    
    function onUpdate(elapsed:Float)
    {
        if (curPercent >= 1) {
            blackScreen.alpha += 0.2 * elapsed*2;
        }
    }