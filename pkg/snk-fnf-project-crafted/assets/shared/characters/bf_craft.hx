if (Paths.formatToSongPath(PlayState.SONG.song) != "papaya") { //I hate it

    import substates.GameOverSubstate;
    import haxe.ds.StringMap;
    
    var cancelZoom:Bool = false;
    var isSecret:Bool = false;
    var oldKeyBinds:StringMap<Array<FlxKey>>;
    var returnedKeyBinds:Bool = false;

    var deadCharName:String = 'bf-craft-dead';
    var deathSoundName:String = "gameOver/death";
    var loopSoundName:String = "gameOver-crafted";
    var endSoundName:String = "gameOverEnd-crafted";

    function onCreate() {
        
        if (FlxG.random.int(0, 25) == 0)
            isSecret = true;
        
        if (isSecret) {
            deadCharName = 'bf-craft-dead-microphone';
            
            // TODO: add a new sound for the secret game over
            // Actually, there's no reason to use a separate audio for the secret game over
            deathSoundName = "gameOver/death-secret";
        }
        
        GameOverSubstate.characterName = deadCharName;
        GameOverSubstate.deathSoundName = deathSoundName;
        GameOverSubstate.loopSoundName = loopSoundName;
        GameOverSubstate.endSoundName = endSoundName;
    }

    function onCreatePost() {
        //precache
        addCharacterToList(deadCharName, 0);

        Paths.music(loopSoundName);
        Paths.music(endSoundName);

        if (!isSecret) {
            Paths.sound("gameOver/ahh");
            Paths.sound("gameOver/phew");
        }
        
    }
    
    function onGameOverStart()
    {
        // Called when you have entered the game over screen and "onGameOver" wasn't stopped
        if (camGame.zoom > 0.6 && !cancelZoom)
            FlxTween.tween(camGame, { zoom: 0.6 }, 7.5, { ease: FlxEase.circOut});
        
        if (isSecret) changeKeyBinds();
    }

    function onGameOverConfirm(retry) {
        // Called when you Press Enter/Esc on Game Over
        // If you've pressed Esc, value "retry" will be false
        if (retry) {
            if (!isSecret) {
                FlxG.sound.play(Paths.sound("gameOver/ahh")).volume = 0.2;
                new FlxTimer().start(10 / 24, function(tmr:FlxTimer) {
                    FlxG.sound.play(Paths.sound("gameOver/phew")).volume = 0.4;
                });
            }
            else {
                //FlxG.sound.play(Paths.sound("ui/freeplay/click")).volume = 1;
            }
        }
    }
    
    function onUpdatePost() {
        if (isSecret && GameOverSubstate.instance != null && FlxG.sound.music.playing && !returnedKeyBinds) {
            returnKeyBinds();
            returnedKeyBinds = true;
        }
    }

    // lets hope that the player wont press ALT F4 during the secret firstDeath animation 
    function onDestroy() {
        if (isSecret && GameOverSubstate.instance != null)
            returnKeyBinds();
    }
    
    function onEvent(event, v1, v2, time) {
        switch event {
            case "cancelGameOverZoom":
                cancelZoom = true;
        }
    }
    
    


    function changeKeyBinds() {
        oldKeyBinds = new StringMap();
        for (i in ["accept", "back"]) {
            oldKeyBinds[i] = ClientPrefs.keyBinds.get(i);
            ClientPrefs.keyBinds.set(i, "NONE");
        }
    }
    
    function returnKeyBinds() {
        for (i in ["accept", "back"])
            ClientPrefs.keyBinds.set(i, oldKeyBinds[i]);
    }
}