function onCreate() {
    game.disableOpponentStrums = true;
    game.passiveHealthDrain = 0.000225;
}

var healthDrain:Float = 0.009;
function opponentNoteHit(n) {
    if (game.dad.curCharacter != "screaming-tree") return;

    game.camGame.shake(0.005, 0.1);
    game.camHUD.shake(0.003, 0.1);

    if (game.health > healthDrain * (treeDrain / 2)) {
        if (ClientPrefs.data.guitarHeroSustains && !n.isSustainNote || !ClientPrefs.data.guitarHeroSustains)
            game.health -= healthDrain * (treeDrain / 2);
    }
}