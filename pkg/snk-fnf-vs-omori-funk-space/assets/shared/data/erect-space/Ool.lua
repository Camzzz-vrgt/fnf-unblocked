function onCreatePost()
    if not lowQuality then
        loadGraphic('healthBarBG', 'healthBar/healthBar_crae-bf-erect')
        addHaxeLibrary('FlxBar', 'flixel.ui')
        addHaxeLibrary('Std')
        runHaxeCode([[
            game.remove(game.healthBarBG);
            game.healthBar.createImageEmptyBar(Paths.image('healthBar/healthBar_crae_erect-omori-erect'), 0xFFFFFFFF);
            game.healthBar.createImageFilledBar(Paths.image('healthBar/healthBar_crae_erect-bf-erect'), 0xFFFFFFFF);
            game.healthBar.barWidth = Std.int(game.healthBarBG.width);
            game.healthBar.barHeight = Std.int(game.healthBarBG.height);
        ]])
        setProperty('healthBar.antialiasing', getProperty('healthBarBG.antialiasing'))
        screenCenter('healthBar')  -- I'll do it on both axes
        setProperty('healthBar.y', getProperty('healthBar.y') + (downscroll and - 280 or 280))
        setProperty('iconP2.y', getProperty('iconP2.y') - 5)
    end
    setProperty('dad.danceEveryNumBeats', 2)

    if isStoryMode and not seenCutscene then  -- Cutscene
        addHaxeLibrary('CutsceneHandler')
        addHaxeLibrary('PauseSubState')
        runHaxeCode([[
            // Imma do now the cutscene lol
            var cutsceneHandler:CutsceneHandler = new CutsceneHandler();
            cutsceneHandler.endTime = 17;
            cutsceneHandler.music = 'monke';
            game.camHUD.visible = false;
            FlxG.camera.zoom *= 1.5;

            var tv:FlxSprite = new FlxSprite().loadGraphic(Paths.image('ui/beep'));
            tv.scrollFactor.set(0.01, 0.01);
            tv.scale.set(4.5, 4.5);
            tv.screenCenter();
            tv.visible = false;
            cutsceneHandler.push(tv);
            game.add(tv);

            game.triggerEventNote('Change Character', 'dad', 'saruwave-cutscene');
            game.triggerEventNote('Change Character', 'gf', 'clusterfucks-cutscene');

            cutsceneHandler.timer(0.1, function()
			{
                game.dad.playAnim('drink', true);
                game.dad.specialAnim = true;
            });

            cutsceneHandler.timer(3.9, function()
			{
                game.dad.playAnim('explosion 1', true);
                game.dad.specialAnim = true;
            });

            cutsceneHandler.timer(5.9, function()
			{
                game.dad.playAnim('throw', true);
                game.dad.specialAnim = true;
            });

            cutsceneHandler.timer(6.5, function()
			{
                game.dad.playAnim('explosion 2', true);
                game.dad.specialAnim = true;

                game.gf.playAnim('explosion', true);
                game.gf.specialAnim = true;
            });

            cutsceneHandler.timer(7, function() tv.visible = true);

            cutsceneHandler.timer(7.4, function()
			{
                tv.visible = false;

                game.dad.playAnim('giggle', true);
                game.dad.specialAnim = true;

                game.gf.playAnim('giggle', true);
                game.gf.specialAnim = true;
            });

            cutsceneHandler.timer(8, function()
			{
                game.moveCamera(false);
            });

            cutsceneHandler.timer(9.2, function()
            {
                game.boyfriend.playAnim('singUP', true);
				game.boyfriend.specialAnim = true;
            });

            cutsceneHandler.timer(9.4, function()
            {
                game.moveCamera(true);
            });

            cutsceneHandler.timer(9.8, function()
            {
                game.dad.playAnim('look', true);
                game.dad.specialAnim = true;
            });

            cutsceneHandler.timer(10.8, function()
            {
                game.dad.playAnim('mic', true);
                game.dad.specialAnim = true;
            });

            cutsceneHandler.timer(11.3, function()
            {
                game.moveCamera(false);
            });

            cutsceneHandler.timer(11.95, function()
            {
                game.boyfriend.playAnim('singUP', true);
				game.boyfriend.specialAnim = true;
            });

            cutsceneHandler.timer(12.35, function()
            {
                game.boyfriend.playAnim('singRIGHT', true);
				game.boyfriend.specialAnim = true;
            });

            cutsceneHandler.timer(12.55, function()
            {
                game.boyfriend.playAnim('singDOWN', true);
				game.boyfriend.specialAnim = true;
            });

            cutsceneHandler.timer(13, function()
            {
                game.moveCamera(true);
            });

            cutsceneHandler.timer(13.5, function()
            {
                game.dad.playAnim('blink', true);
                game.dad.specialAnim = true;
            });

            cutsceneHandler.finishCallback = function()
            {
                PauseSubState.restartSong();  // SHUT UP ILL USE THIS FIX OTHERWHISE THERES A BUG THAT IF I DELAY THE COUNTDOWN THE SPECIAL NOTES WONT WORK AAAAAA
            }
        ]])
    end
end

function onRecalculateRating()
    if rating >= 0.999935 then
        ratingName = 'AAAAA'
        ratingFC = 'MFC'
    elseif rating >= 0.99980 then
        ratingName = 'AAAA:'
    elseif rating >= 0.99970 then
        ratingName = 'AAAA.'
    elseif rating >= 0.99955 then
        ratingName = 'AAAA'
    elseif rating >= 0.9990 then
        ratingName = 'AAA:'
    elseif rating >= 0.9980 then
        ratingName = 'AAA.'
    elseif rating >= 0.9970 then
        ratingName = 'AAA'
    elseif rating >= 0.99 then
        ratingName = 'AA:'
    elseif rating >= 0.9650 then
        ratingName = 'AA.'
    elseif rating >= 0.93 then
        ratingName = 'AA'
    elseif rating >= 0.90 then
        ratingName = 'A:'
    elseif rating >= 0.85 then
        ratingName = 'A.'
    elseif rating >= 0.80 then
        ratingName = 'A'
    elseif rating >= 0.70 then
        ratingName = 'B'
    elseif rating >= 0.60 then
        ratingName = 'C'
    else
        ratingName = 'D'
        ratingFC = '?'
    end
    if true then
        setTextString('ScoreAmogus', 'Score: '.. score .. ' / Misses: '.. misses .. ' / Accuracy: '.. floorInDecimal(rating*100, 2) .. '%' .. ' - ' ..ratingFC)
    end
end