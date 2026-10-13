function onCreate() game.disableOpponentStrums = true;

function onCreatePost() {
    game.passiveHealthDrain = 0.000225;
    game.dad.singHealthDrain = 0.01175;

    game.healthBar.leftBar.loadGraphic(Paths.image("songs/aurora/healthBar"));
    game.healthBar.leftBar.scale.y += 0.75;
}

function onUpdatePost(e)
{    
    if (game.dad.curCharacter != "aurora") return;

    game.iconP2.angle = FlxG.random.float(-5, 5);
    game.iconP2.offset.set(FlxG.random.float(-2, 2), FlxG.random.float(-2, 2));
    game.healthBar.leftBar.color = game.healthBar.percent > 80 ? 0xFF775A5B : 0xFFB0A8A4;
}