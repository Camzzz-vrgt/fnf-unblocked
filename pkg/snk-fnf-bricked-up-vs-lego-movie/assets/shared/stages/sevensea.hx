function onLoad()
{
	var bg = new FlxSprite(-180, -100, Paths.image("backgrounds/metalbeard/ocean"));
	bg.antialiasing = ClientPrefs.data.antialiasing;
	bg.scrollFactor.set(0.5, 0.5);
	add(bg);

	for (elm in ["bg", "fg"])
	{
		var water = new FlxSprite(0, 0);
		water.antialiasing = ClientPrefs.data.antialiasing;
		water.frames = Paths.getSparrowAtlas("backgrounds/metalbeard/" + elm + "-water");
		water.animation.addByPrefix("water", "water", 24, true);
		water.animation.play("water", true);

		if (elm == "fg")
		{
			water.scrollFactor.set(0.9, 0.9);
			water.y -= 5;
			water.zIndex = 100;
			add(water);
		}
		else
		{
			water.scale.set(2, 2);
			water.updateHitbox();

			water.y += 200;
			add(water);
		}
	}
}

function onCreatePost()
{
	gf.visible = false;
	GameOverSubstate.characterName = "deckbf-dead";

	camGame.flashSprite.scaleX = 1.05;
	camGame.flashSprite.scaleY = 1.05;
}

var sin = 0;

function onUpdatePost(elapsed)
{
	if (game.health > 0)
	{ // the stage camera stuff continues in death soooo :p
		sin += elapsed;
		dad.y = Math.sin(sin * 2) * 25;
		camGame.angle = Math.sin(sin * 2) * 1.25;
		camHUD.angle = Math.cos(sin * 2) * .75;

		boyfriend.y = 350 + Math.sin(sin * 2) * -2;
	}
}
