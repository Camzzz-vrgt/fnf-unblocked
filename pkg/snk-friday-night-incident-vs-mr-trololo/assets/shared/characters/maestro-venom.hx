var defendAnim:Bool = true;

function onCreate() {
    if (PlayState.SONG.player2 == "maestro") return;
    game.disableOpponentStrums = true;
}

function onCreatePost() {
    if (game.dad.curCharacter == "maestro") return;
    game.passiveHealthDrain = 0.00028375;
    game.dad.singHealthDrain = 0.01215;
}

function onUpdatePost(e)
{    
    if (game.dad.curCharacter != "maestro-venom") return;

    game.healthBar.leftBar.color = game.healthBar.percent > 80 ? 0xFFFFFFFF : 0xFF000000;
}

function onEvent(e, v1, v2) {
    if (e == "Change Character") {
        if (v1 == "dad" && v2 == "maestro-venom") {
            game.passiveHealthDrain = 0.00028375;
            game.dad.singHealthDrain = 0.01215;
        }
    }
}