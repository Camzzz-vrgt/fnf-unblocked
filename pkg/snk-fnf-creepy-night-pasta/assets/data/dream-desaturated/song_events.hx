import flash.filters.ShaderFilter;
import flixel.addons.display.FlxRuntimeShader;
import flixel.text.FlxText;
import sys.io.File;
import objects.BGSprite;

// 134 sin título_20240308095147

var coso:FlxSprite;
var croma:FlxRuntimeShader;
var credit:FlxSprite;
var blackBack:FlxSprite;
var midblack:FlxSprite;
var midblack2:FlxSprite;
var values:Array<Float>=[0.0,0.001];
var camsZoom:Array<Float> = [0.7,0.6];
var alphaBF = 0.4;
var bg:BGSprite;
var bg2:BGSprite;
var bg3:BGSprite;
var bg4:BGSprite;
var bg5:BGSprite;
var filter2:FlxSprite;
var tweenAlert:FlxTween;
var bloom:FlxRuntimeShader;
var tv:FlxRuntimeShader;
var blur:FlxRuntimeShader;
var sexS:FlxSprite;
function onCreate() {
    game.skipCountdown = true;
   
    sexS = new FlxSprite().loadGraphic(Paths.image('sex'));
    sexS.cameras = [game.camHUD];
    sexS.screenCenter();
    sexS.alpha = 0;
    sexS.scale.set(1.8,1.8);
    add(sexS);
}


var chromacrap:Dynamic = 0.02;
var bloomL:Dynamic = 0.02;
var time:Float = 0.0;
var blurL:Float = 0.0;
var iRandom:Int;
var positions:Array<Float>=[];
var sex:Bool = false;

function onUpdatePost(elapsed:Float){

    chromacrap = FlxMath.lerp(chromacrap, 0, 0.025);
    bloomL = FlxMath.lerp(bloomL, 0, 0.015);
    blurL = FlxMath.lerp(blurL, 0, 0.015);
   
    time += elapsed;
    //tv.setFloat('iTime',time);
    croma.setFloat('rOffset',chromacrap);
    croma.setFloat('bOffset',chromacrap);
    bloom.setFloat("intensity",bloomL);
    blur.setFloat("focusPower",blurL);

    iRandom = FlxG.random.int(0, 5);
	positions[0] = FlxG.random.int(-100,2400);
	positions[1] = FlxG.random.int(-300,500);
    if (sex){
        game.isCameraOnForcedPos = true;
        game.camFollow.x = 640;
        game.camFollow.y = 100;
    }
}

function onCreatePost() {

    croma = game.createRuntimeShader("chromaticAberration");
    croma.setFloat('rOffset',0.0025);
    croma.setFloat('gOffset',0.0);
    croma.setFloat('bOffset',0.0025);

    bloom = game.createRuntimeShader("Blur");
    bloom.setFloat("blurSize",0.0);
    bloom.setFloat("intensity",0.1);

    blur = game.createRuntimeShader("ZoomBlur");
    blur.setFloat("posX",0.0);
    blur.setFloat("posY",0.0);
    blur.setFloat("focusPower",0.0);

    //tv = game.createRuntimeShader("tvold");

    //  game.camGame.setFilters([new ShaderFilter(croma),new ShaderFilter(bloom),new ShaderFilter(blur)]);
    // game.camHUD.setFilters([new ShaderFilter(croma),new ShaderFilter(bloom),new ShaderFilter(blur)]);
    FlxG.game.setFilters([new ShaderFilter(croma),new ShaderFilter(bloom),new ShaderFilter(blur)]);
    game.healthBar.bg.visible  = false;

    game.healthBar.x +=20;
    game.healthBar.y -=10;
    game.timeBar.visible = false;
    game.timeTxt.visible = false;
    game.healthBar.scale.set(0.98,1.2);

    FlxG.log.warn('FUE MI PENE!');

    bg = new BGSprite('stages_TMK/images/TMK/phase 1/821_sin_titulo_20240209135649-1', 120, 130, 0.35, 0.35);
    bg.scale.set(2.32,2.32);
    game.addBehindDad(bg);

    bg2 = new BGSprite('stages_TMK/images/TMK/phase 1/821_sin_titulo_20240209135705-1', 120,660,0.9,0.9);
    bg2.scale.set(2.32,2.32);
    game.addBehindDad(bg2);

    game.gf.kill();//muere perra
   // game.iconP1.kill();
   // game.iconP2.kill();

    blackBack = new FlxSprite().makeGraphic(FlxG.width,FlxG.height,FlxColor.BLACK);
    game.add(blackBack);
    blackBack.screenCenter();
    blackBack.cameras = [game.camHUD];
    blackBack.alpha = 0;

    midblack = new FlxSprite().makeGraphic(640,FlxG.height,FlxColor.BLACK);
    midblack.camera = camHUD;
    midblack.alpha = 0;
    insert(0, midblack);

    midblack2 = new FlxSprite().makeGraphic(640,FlxG.height,FlxColor.BLACK);
    midblack2.camera = camHUD;
    midblack2.alpha = 0;
    midblack2.x += 640;
    insert(0, midblack2);

    credit = new FlxSprite().loadGraphic(Paths.image('tmk'));
    game.add(credit);
    credit.screenCenter();
    credit.cameras = [game.camHUD];
    credit.scale.set(1.4,1.4);
    credit.alpha = 0;
}
function onDestroy(){
    FlxG.game._filters=[];
}
var palabras:Array<String>=['Remember?','Too much kir#','?????','.....','%%%%','######'];
var letrasActivadas:Bool=false;
var textAleatorie:FlxText;
function onStepHit(){
    switch(curStep){
       
        case 288:
            camsZoom[0] = 2;
            camsZoom[1] = 2;
            FlxTween.tween(blackBack,{alpha: 1},0.25);
            FlxTween.tween(credit,{alpha: 1},1);
        case 305:
            game.camHUD.shake(0.005,1.3);
        case 310:
            FlxTween.tween(credit,{alpha: 0},1);
        case 320:
            blackBack.alpha = 0;
            credit.destroy();
            bg.destroy();//bye bitches
            bg2.destroy();
            
            bg = new BGSprite('stages_TMK/images/TMK/phase 2/134 sin título_20240308094712', -100, -150, 0.35, 0.35);
            bg.scale.set(4,4);
            game.addBehindDad(bg);
       
            bg2 = new BGSprite('stages_TMK/images/TMK/phase 2/134 sin título_20240308095147', -440,-150,0.65,0.35);
            bg2.scale.set(4,4);
            game.addBehindDad(bg2);

            bg3 = new BGSprite('stages_TMK/images/TMK/phase 2/134 sin título_20240308095050', -100,-150,0.65,0.35);
            bg3.scale.set(4,4);
            game.addBehindDad(bg3);

            bg4 = new BGSprite('stages_TMK/images/TMK/phase 2/134 sin título_20240308095143', -100,700,0.65,0.65);
            bg4.scale.set(4,4);
            game.addBehindDad(bg4);
            
            bg5 = new BGSprite('stages_TMK/images/TMK/phase 2/134 sin título_20240308095202', 800,-150,1,1);
            bg5.scale.set(4,4);
            game.addBehindDad(bg5);

          
            filter2 = new FlxSprite().loadGraphic(Paths.image('stages_TMK/images/TMK/phase 2/alert'));
            filter2.cameras = [game.camHUD];
            filter2.alpha = 0;
            tweenAlert = FlxTween.tween(filter2, {alpha: 1}, 1, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});

            add(filter2);


            camsZoom[0] = 0.55;
            camsZoom[1] = 0.45;

            game.camHUD.flash(FlxColor.BLACK,3);

            case 576:

                letrasActivadas = true;
                FlxG.camera.zoom = game.defaultCamZoom = 0.3;
                for(tweens in [bg,bg2,bg3,bg4,bg5,scoreTxt,iconP1,iconP2,healthBar]){
                FlxTween.tween(tweens, {alpha: 0}, 1, {ease:FlxEase.quadInOut});
                }
            case 586:
                dad.x += 100;
                dad.y += 1600;

            case 1072:
                tweenAlert.cancel();
                letrasActivadas=false;
            for(tweens in [midblack,midblack2]){
            FlxTween.tween(tweens, {alpha: 1}, 1, {ease:FlxEase.quadInOut});
            }

            case 1098:
            dad.x -= 100;
            dad.y -= 1600;
            for(tweens in [bg,bg2,bg3,bg4,bg5]){
                FlxTween.tween(tweens, {alpha: 1}, 0.01, {ease:FlxEase.quadInOut});
                }

            case 1104:
            FlxTween.tween(midblack, {x:-640, y:0}, 2, {ease: FlxEase.quintOut, onComplete:alanconunculote});
            FlxTween.tween(midblack2, {x:1280, y:0}, 2, {ease: FlxEase.quintOut, onComplete:alanconunculote});
            for(tweens in [scoreTxt,healthBar,iconP1,iconP2]){
                FlxTween.tween(tweens, {alpha: 1}, 1, {ease:FlxEase.quadInOut});
                }
            case 1616:   tweenAlert = FlxTween.tween(filter2, {alpha: 1}, 1, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
         
            case 2383:
              
              
                game.camHUD.flash(FlxColor.BLACK,2);
        
            case 2384:   game.boyfriend.visible = false;
          
             for(bgs in [bg,bg2,bg3,bg4,bg5])bgs.destroy();

             bg = new BGSprite('stages_TMK/images/TMK/phase final/135 sin título_20240308095940', 250,-100,1,1);
             bg.scale.set(2.5,2.5);
             game.addBehindDad(bg);

             bg2 = new BGSprite('stages_TMK/images/TMK/phase final/135 sin título_20240308095946', 250,-100,1,1);
             bg2.scale.set(2.5,2.5);
             game.addBehindDad(bg2);


             bg3 = new BGSprite('stages_TMK/images/TMK/phase final/135 sin título_20240308100012', 250,-100,1,1);
             bg3.scale.set(2.5,2.5);
             game.addBehindDad(bg3);


             bg4 = new BGSprite('stages_TMK/images/TMK/phase final/135 sin título_20240308100035', 250,-100,1,1);
             bg4.scale.set(2.5,2.5);
             game.addBehindDad(bg4);
         
             camsZoom[0] = 0.85;
             camsZoom[1] = 0.85;
             sex = true;
             FlxTween.tween(dad, {y:1}, 1, {type:FlxTween.PINGPONG, ease:FlxEase.quadInOut});
             
             case 3656:
             blackBack.alpha = 1;
             case 3657:
             blackBack.alpha = 0;
             case 3658:
             blackBack.alpha = 1;
             case 3659:
             blackBack.alpha = 0;
             case 3660:
             blackBack.alpha = 1;
             case 3662:
             blackBack.alpha = 0;
             case 3663:
             blackBack.alpha = 1;
             case 3664:
             blackBack.alpha = 0;

            case 4208:
                
             FlxTween.tween(FlxG.camera,{zoom:2},2,{ease:FlxEase.quadInOut});
             game.defaultCamZoom = 2;
             FlxTween.tween(sexS,{alpha:1},1);
              
              
            blackBack.alpha = 0;
            case 4210:
            blackBack.alpha = 1;
            case 4212:
            blackBack.alpha = 0;
            case 4214:
            blackBack.alpha = 1;
            case 4216:
            blackBack.alpha = 0;
            case 4218:
            blackBack.alpha = 1;
            case 4219:
            blackBack.alpha = 0;
            case 4220:
            blackBack.alpha = 1;
            case 4221:
            blackBack.alpha = 0;
            case 4222:
            blackBack.alpha = 1;
            case 4223:
            blackBack.alpha = 0;
            case 4224:
            blackBack.alpha = 1;
            FlxTween.tween(blackBack,{alpha:0},2);
            //filter2.destroy();
            case 4540:   FlxTween.tween(blackBack,{alpha:1},2);
    }
  
}

function onEvent(name:String, value1:String, value2:String, strumTime:Float)
{
    if (name == "Add Camera Zoom"){
        chromacrap += 0.005; 
        bloomL += 0.5; 
        blurL += 2;
    }
}


function onBeatHit(){
    if (letrasActivadas){
        //FlxG.camera.zoom = game.defaultCamZoom = 0.05;
		textAleatorie = new FlxText(0, 0,1000, '', 50, false);
		textAleatorie.setFormat(Paths.font("vcr.ttf"), 50, FlxColor.WHITE);
		textAleatorie.screenCenter();
		textAleatorie.text= palabras[iRandom];
		textAleatorie.setPosition(textAleatorie.x + positions[0] ,textAleatorie.y +  positions[1]);
		textAleatorie.alpha = 1;
		FlxTween.tween(textAleatorie, {alpha: 0,y:textAleatorie.y+150}, 0.8, {ease:FlxEase.quadInOut,onComplete:textAleatorie.kill});
		add(textAleatorie);
	}
}

function alanconunculote(){
    midblack.destroy();
    midblack2.destroy();
}

function onMoveCamera(focus:String)
{
    if (focus == 'boyfriend')
    {
       game.defaultCamZoom = camsZoom[0];
      
    }
    else if (focus == 'dad')
    {
        game.defaultCamZoom = camsZoom[1];

    }
}