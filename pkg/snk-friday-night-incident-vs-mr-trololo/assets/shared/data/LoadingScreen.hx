function onCreate()
{
    var curLoadingScreen = "Glad";
    if (PlayState.SONG != null) if (PlayState.SONG.song != "Prepare") curLoadingScreen = PlayState.SONG.song;

    var condition = Paths.fileExists("images/loadingScreens/" + curLoadingScreen + ".png", "IMAGE", false, "image") ? curLoadingScreen : "Glad";
    var funkay = new FlxSprite(0, 0).loadGraphic(Paths.image('loadingScreens/' + condition));
    funkay.antialiasing = ClientPrefs.data.antialiasing;
    funkay.setGraphicSize(0, FlxG.height);
    funkay.updateHitbox();
    addBehindBar(funkay);
}