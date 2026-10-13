function onUpdatePost(e)
{    
    if (game.boyfriend.curCharacter != "bf-back-infected") return;

    game.iconP1.angle = game.healthBar.percent < 20 ? FlxG.random.float(-2, 2) : 0;
    game.iconP1.offset.set(game.healthBar.percent < 20 ? FlxG.random.float(-1, 1) : 0, game.healthBar.percent < 20 ? FlxG.random.float(-1, 1) : 0);
    game.healthBar.rightBar.color = game.healthBar.percent < 20 ? 0xFFEB6942 : 0xFF59A4CF;
}