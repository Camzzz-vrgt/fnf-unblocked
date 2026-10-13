function onCreatePost() {
    switch (PlayState.SONG.song)
    {
        default: game.defaultZooms = [0.7, 0.65, 0.85];
        case "Rainbow Trololo": game.defaultZooms = [0.7, 0.6, 0.7];
    }

    if (game.dad.curCharacter == "eduard") {
        game.dad.x += 130;
        game.dad.y = game.boyfriend.y;
        game.dad.cameraPosition[1] = game.boyfriend.cameraPosition[1];
    }
}

function onBeatHit() if (curBeat % 4 == 0) game.getLuaObject("speakers").animation.play("idle", true);