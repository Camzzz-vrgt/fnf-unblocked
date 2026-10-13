// i cant comment in jsons (i think) so i want to put this here
// Despite the fact that Aurora is not capable enough to actually defend against or dodge bullets, the animation is called defend anyways :babyhap:

function onCreate() game.disableOpponentStrums = true;

function onCreatePost() {
    if (game.dad.curCharacter != "aurora-bloodlust-eyes") game.passiveHealthDrain = 0.000275;
    game.healthBar.leftBar.loadGraphic(Paths.image("songs/aurora/healthBar"));
    game.healthBar.leftBar.scale.y += 0.75;
    game.dad.singHealthDrain = game.dad.curCharacter == "aurora-bloodlust-eyes" ? 0.0125 : 0.01565;
}

function onUpdatePost(e)
{
    if (game.dad.curCharacter != "aurora-bloodlust") return;

    game.iconP2.angle = FlxG.random.float(-7, 7);
    game.iconP2.offset.set(FlxG.random.float(-4, 4), FlxG.random.float(-4, 4));
}

function onEvent(e, v1, v2) {
    if (e == "Change Character" && v1 == "dad" && v2 == "aurora-bloodlust") {
        game.passiveHealthDrain = 0.000275;
        game.dad.singHealthDrain = 0.01565;
    }
}