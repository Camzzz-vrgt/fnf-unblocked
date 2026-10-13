function onCreatePost() if (PlayState.SONG.player2 != "grafter-cutscene") game.dad.singHealthDrain = 0.004;

function onEvent(e, v1, v2) {
    if (e == "Change Character") {
        if (v1 == "dad" && v2 == "grafter-calm")
            game.dad.singHealthDrain = 0.004;
    }
}