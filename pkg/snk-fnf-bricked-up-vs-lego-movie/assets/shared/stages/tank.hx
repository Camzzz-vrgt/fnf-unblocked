var blackscreen:FlxSprite;

function onLoad(){

    var farbg:FlxSprite = new FlxSprite(0, 0);
    farbg.loadGraphic(Paths.image("backgrounds/tankman/farbg"));
    farbg.antialiasing = true;
    farbg.scrollFactor.set(0.8, 0.8);
	add(farbg);

    var bg = new FlxSprite(0, 0);
    bg.frames = Paths.getSparrowAtlas("backgrounds/tankman/bg");
    bg.antialiasing = true;
    bg.animation.addByPrefix('bg', 'bg', 24, true);
    bg.animation.play("bg");
	add(bg); 

    blackscreen = new FlxSprite(0, 0).makeScaledGraphic(2000, 2000, 0xff000000);
    blackscreen.zIndex = 2020;
    blackscreen.visible = false;
    add(blackscreen);
}

function onCreatePost()
{
    game.gf.scrollFactor.set(1, 1);
    game.gfGroup.zIndex = game.dadGroup.zIndex + 1;
    game.boyfriendGroup.zIndex = game.gfGroup.zIndex + 1;
    refreshZ();
}

function onEvent(event, value1, value2){
    if (event == 'Pursuit Events')
    {
        if (value1 == 'blackscreen')
        {
            switch(value2)
            {
                case 'on':
                    blackscreen.visible = true;
                case 'off':
                    blackscreen.visible = false;
            }
        }
    }
}