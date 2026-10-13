var followchars:Bool = true;
var locX:Int = 370;
var locY:Int = 420;
var s:Float = 1.25;
var dimblack:FlxSprite;
var black:FlxSprite;
var white:FlxSprite;
var overlay1:FlxSprite;
var overlay2:FlxSprite;

var fog_back:FlxSprite;
var fog_opp:FlxSprite;
var fog_joka:FlxSprite;
var dap:FlxSprite;

//im too stupid for the sounds bro
var evoker:FlxSound;
var evokerchargeup:FlxSound;
var ambushSound:FlxSound;

var screenShader;
var multShader;

function onLoad() 
{
	game.skipCountdown = true;
	game.precacheList.set('characters/POV Yu', 'image');
	game.precacheList.set('characters/POV Joker', 'image');
	game.precacheList.set('roundStart', 'image');
	
	//overlays
    screenShader = newShader('screen');
	multShader = newShader('multiply');
	
    // Stage
    var bg:FlxSprite = new FlxSprite(locX, locY);
    bg.loadGraphic(Paths.image("bg/velvetground"));
    bg.scale.set(s,s);
    add(bg);
	
	var siren:FlxSprite = new FlxSprite(locX, locY);
    siren.loadGraphic(Paths.image("bg/velvetsiren"));
    siren.scale.set(s,s);
    add(siren);
	
	var table:FlxSprite = new FlxSprite(locX, locY);
    table.loadGraphic(Paths.image("bg/velvettable"));
    table.scale.set(s,s);
    add(table);

	dimblack = new FlxSprite(locX,locY).makeGraphic(3000, 2000, FlxColor.BLACK);
	dimblack.scale.set(s,s);
	dimblack.alpha = 0;
	add(dimblack);
	
	overlay1 = new FlxSprite(locX, locY);
    overlay1.loadGraphic(Paths.image("bg/velvetmultiply"));
    overlay1.scale.set(s,s);
	overlay1.alpha = 0.5;
    add(overlay1);
	foreground.add(overlay1);
	
	overlay2 = new FlxSprite(locX, locY);
    overlay2.loadGraphic(Paths.image("bg/velvetscreen"));
    overlay2.scale.set(s,s);
	overlay2.alpha = 0.5;
    add(overlay2);
	foreground.add(overlay2);
	
	//they dont work now for some reason
	//ExUtils.addShader(multShader, overlay1);
	//ExUtils.addShader(screenShader, overlay2);
	
	//the dap
	dap = new FlxSprite(0, 0);
    dap.loadGraphic(Paths.image("dapmeup"));
    dap.cameras = [game.camOverlay];
	dap.alpha = 0;
	dap.antialiasing = true;
    add(dap);
	
	black = new FlxSprite(0,0).makeGraphic(FlxG.width, FlxG.height, FlxColor.BLACK);
	black.cameras = [game.camOverlay];
	black.alpha = 0;
	add(black);
	
	white = new FlxSprite(0,0).makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
	white.cameras = [game.camOverlay];
	white.alpha = 0;
	add(white);
	
	//fog for mayonaka
	fog_back = new FlxSprite(locX, locY);
    fog_back.loadGraphic(Paths.image("bg/fog_behind"));
    fog_back.scale.set(s,s);
	fog_back.alpha = 0;
    add(fog_back);
	
	fog_opp = new FlxSprite(locX, locY);
    fog_opp.loadGraphic(Paths.image("bg/fog_opp"));
    fog_opp.scale.set(s,s);
	fog_opp.alpha = 0;
    add(fog_opp);
	foreground.add(fog_opp);
	
	fog_joka = new FlxSprite(locX, locY);
    fog_joka.loadGraphic(Paths.image("bg/fog_joka"));
    fog_joka.scale.set(s,s);
	fog_joka.alpha = 0;
    add(fog_joka);
	foreground.add(fog_joka);
	
	//lockin portraits for full moon
	makoto = new FlxSprite(0, 0);
    makoto.loadGraphic(Paths.image("bg/lock-in_makoto"));
    makoto.cameras = [game.camOther];
	makoto.alpha = 0;
    add(makoto);
	
	joker = new FlxSprite(0, 0);
    joker.loadGraphic(Paths.image("bg/lock-in_joker"));
    joker.cameras = [game.camOther];
	joker.alpha = 0;
    add(joker);
	
	evokerchargeup = new FlxSound().loadEmbedded(Paths.sound('evokerchargeup'));
    FlxG.sound.list.add(evokerchargeup);
	evoker = new FlxSound().loadEmbedded(Paths.sound('evoker'));
    FlxG.sound.list.add(evoker);
	ambushSound = new FlxSound().loadEmbedded(Paths.sound('ambushsfx'));
    FlxG.sound.list.add(ambushSound);
}

function onEvent(name, value1, value2)
{
	switch(name){
		case "zoomers":
			game.defaultCamZoom = value1;
		case "shloop": 
			FlxTween.tween(dimblack, {alpha : value1}, value2);
		case "shithimself": 
			FlxTween.tween(black, {alpha : value1}, value2);
		case "Philly Glow": //whitebuss
			FlxTween.tween(white, {alpha: 1}, 0.2, {
				onComplete: function(twn:FlxTween) {
					FlxTween.tween(white, {alpha : 0}, 0.2);
				}
			});
		case "lockin": //imsorry
			if (value1 == "makoto"){
				FlxTween.tween(makoto, {alpha : value2}, 0.3);
			}
			else{
				FlxTween.tween(joker, {alpha : value2}, 0.3);
			}
		case "Play Sound": //makoto sfx
			switch(value1){
				case "ambushsfx":
					ambushSound.play(true);
				case "evoker":
					evoker.play(true);
				case "evokerchargeup":
					evokerchargeup.play(true);
			}
		case "foggies": //yu shit
			FlxTween.tween(fog_back, {alpha : value1}, value2);
			FlxTween.tween(fog_opp, {alpha : value1}, value2);
			FlxTween.tween(fog_joka, {alpha : value1}, value2);
		case "throwhands": //shit after nevermore
			game.triggerEventNote('Change Character', 'dad', 'pov_yu');
			game.triggerEventNote('Change Character', 'bf', 'pov_joker');
		case "Kill Henchmen": //dap me up
			FlxTween.tween(white, {alpha: 1}, 0.2, {
				onComplete: function(twn:FlxTween) {
					dap.alpha = 1;
					FlxTween.tween(white, {alpha : 0}, 0.2);
				}
			});
	}	
}