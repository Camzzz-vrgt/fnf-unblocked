function onCreatePost() {
    game.defaultZooms = [0.45, 0.65, 0.65];

    for (i in [game.getLuaObject("spotlightL"), game.getLuaObject("spotlightR")]) i.blend = 0;
}