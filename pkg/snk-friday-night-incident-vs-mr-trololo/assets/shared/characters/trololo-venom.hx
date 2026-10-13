function onUpdatePost(e)
{    
    if (game.dad.curCharacter != "trololo-venom") return;

    game.healthBar.leftBar.color = game.healthBar.percent > 80 ? 0xFFCCCCCC : 0xFF000000;
}