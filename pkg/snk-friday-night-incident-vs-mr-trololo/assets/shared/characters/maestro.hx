var defendAnim:Bool = true;

function onCreate() {
    if (PlayState.SONG.song == "Evacuate") return;
    game.disableOpponentStrums = true;
}

function onCreatePost() {
    if (game.curSong == "Evacuate") return;
    game.passiveHealthDrain = game.curSong == "Maestro" ? 0 : 0.00028375;
    game.dad.singHealthDrain = 0.01375;
}

function onStepHit()
{
    if (game.curSong == "Maestro")
    {
        switch (curStep)
        {
            case 124: game.passiveHealthDrain = 0.00028375;
        }
    }
}

function goodNoteHit(n)
{
    if (n.noteType == "Bullet Note") {
        defendAnim = !defendAnim;
        game.triggerEvent("Play Animation", defendAnim ? "defend0" : "defend1", "dad");
        game.callOnScripts("startStunCallback", [game.dad]);
    }
}

function onEvent(e, v1, v2) {
    if (e == "Change Character") {
        if (v1 == "dad" && v2 == "maestro") {
            game.dad.singHealthDrain = 0.01375;
            game.passiveHealthDrain = 0.00028375;
        }
    }
}