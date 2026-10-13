import flixel.tweens.FlxEase;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import funkin.graphics.FunkinSprite;
import StringTools;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import funkin.save.Save;
import funkin.ui.MusicBeatSubState;
import funkin.modding.base.ScriptedMusicBeatSubState;
import funkin.ui.AtlasText;

import flixel.util.FlxStringUtil;

using StringTools;

class TrickyFanartState extends ScriptedMusicBeatSubState {
    var fanartPieces = [];

    var curSelected:Int = 0;

    var artists = ["___EEF_", 'amechiz', "asshole694209", "C0reMix_ - 1", "C0reMix_ - 2", "C0reMix_ - 3", "Cuteplushbros", "DaliDooped", "DanielPrime217", "Davemyster5", 'dlawe_', "FatSurvival", "GlonkerBonkers", "greeniodaboi", "HazyRiver", "JavDraws", 
    "jcundo_lol7777", "jellyfihhhh", "lazypunkarts", "leadsterInkest", "LeGooey", 'LOCOTIX', "MikeTheCat", "mugrilhos", "Narsh", "Playsty", "RADNESS_FLA", "Redgrave", 'SamBam1785', "voideyepanda", 'xilly', 'SammyPhox'];

    public override function create(){
        super.create();
        bgCamera = FlxG.camera = new FlxCamera(0, 0, FlxG.width, FlxG.height, 0);
		bgCamera.bgColor = 0xFF3a0000;
		FlxG.cameras.add(bgCamera);

        bgCamera.scroll.y += 600;

        fanartPieces = [];
        index = 0;
        padding = 20;
        for (i in artists){
            var piece = FunkinSprite.create(0, 0, 'trickyMenu/fanarts/' + i);
            piece.setGraphicSize(0,600);
            piece.updateHitbox();
            if (piece.width > 800) {
                piece.setGraphicSize(800,0);
                piece.updateHitbox();
            }
            if (index == 0) piece.setPosition(FlxG.width/2 - piece.width/2, FlxG.height/2 - piece.height/2 - 10 + 600);
            else {
                piece.setPosition(fanartPieces[index-1].x + fanartPieces[index-1].width + padding, FlxG.height/2 - piece.height/2 - 10 + 600);
                piece.color = 0xFF666666;
            }
            fanartPieces.push(piece);
            index++;
        }

        pieceDesc = new FlxText(0, 0, FlxG.width, 'Art by: ${artists[curSelected]}', 10);
        pieceDesc.setFormat(Paths.font('tahoma-bold.ttf'), 30, 0xFFff0000, "center");
        pieceDesc.setPosition(0, FlxG.height - pieceDesc.height - 20 + 600);
        fanartPieces.push(pieceDesc);

        for (i in fanartPieces){
            i.y += FlxG.height + 600;
            insert(1, i);
            FlxTween.num(i.y + 600, i.y - FlxG.height - 600, 0.5, {ease: FlxEase.expoOut}, (num) -> {
                i.y = num;
            });
        }
    }

    var replacementUtil = ['!2', '!3'];

    function conceptTrans(in:Bool = true){
        var set2 = fanartPieces;
        var amt = FlxG.height;
        if (!in){
            set1 = fanartPieces;
            set2 = mainButtons;
            amt = amt * -1;
        }
        for (o in set2){
            FlxTween.tween(o, {y: o.y + amt + 600}, 0.5, {ease: FlxEase.expoOut, onComplete: _ -> {
                if (set2.indexOf(o) == 0) {
                    if (set2 == mainButtons) resetFanart();
                }
            }});
        }
        curSelected = in ? 0 : 1;
    }

    function changeFanart(amt:Int, set:Bool = false){
        var target = curSelected + amt;
        if (set) target = amt;
        var range = fanartPieces.length - 1;
        if (target >= range) target = 0;
        else if (target < 0) target = range - 1;

        fanartPieces[curSelected].color = 0xFF666666;
        fanartPieces[target].color = 0xFFffffff;

        curSelected = target;

        pieceDesc.text = 'Art by: ${artists[curSelected]}';

        var amountToMove = fanartPieces[curSelected].x - (FlxG.width/2 - fanartPieces[curSelected].width/2);
        if (amt == 0) amountToMove = 0;

        for (i in fanartPieces){
            if (fanartPieces.indexOf(i) >= range) return;
            FlxTween.cancelTweensOf(i);
            FlxTween.tween(i, {x: i.x - amountToMove}, 0.5, {ease: FlxEase.expoOut});
        }
    }

    function resetFanart(){
        fanartPieces[0].color = 0xFFffffff;
        fanartPieces[curSelected].color = 0xFF666666;
        pieceDesc.text = "";
        var index = 0;
        var padding = 20;
        for (i in fanartPieces){
            if (fanartPieces.indexOf(i) >= fanartPieces.length - 1) return;
            if (index == 0) i.x = FlxG.width/2 - i.width/2;
            else i.x = fanartPieces[index-1].x + fanartPieces[index-1].width + padding;
            index ++;
        }
    }

    var backupInfo = 0;
    var allowMovement = [true, true];

    public override function update(){
        if(allowMovement[0]){
            if (controls.UI_LEFT_P || controls.UI_RIGHT_P) changeFanart(controls.UI_RIGHT_P ? 1 : -1);
            if(FlxG.keys.justPressed.ENTER && !FlxG.onMobile){
                allowMovement[0] = allowMovement[1] = false;
                backupInfo = fanartPieces[curSelected].scale.x;
                for(i=>fanartLol in fanartPieces){
                    if(i != curSelected){
                        FlxTween.tween(fanartLol, {alpha: 0.001}, 0.5, {onComplete: () -> {
                            allowMovement[1] = true;
                        }});
                    }
                }
            }
            if(controls.BACK_P){
                for (i in fanartPieces){
                    insert(1, i);
                    FlxTween.num(i.y, i.y + FlxG.height, 0.5, {ease: FlxEase.expoOut, onComplete: () -> {
                        FlxTween.num(600, 0, 0.5, {ease: FlxEase.expoOut, onComplete: () -> {
                            FlxG.state.menuControllable = true;
                            for(pieces in fanartPieces){
                                pieces.kill();
                                pieces.destroy();
                            }
                            close();
                        }}, (val) -> {
                            FlxG.camera.scroll.y = val;
                        });
                    }}, (num) -> {
                        i.y = num;
                    });
                }
            }
        } else {
            if(allowMovement[1]){
                if(FlxG.mouse.pressed) fanartPieces[curSelected].setPosition(fanartPieces[curSelected].x + FlxG.mouse.deltaScreenX, fanartPieces[curSelected].y + FlxG.mouse.deltaScreenY);
                if(FlxG.mouse.wheel != 0){
                    if(fanartPieces[curSelected].scale.x > backupInfo * 0.5 && fanartPieces[curSelected].scale.x < backupInfo * 2){
                        fanartPieces[curSelected].scale.x += (FlxG.mouse.deltaWheel.y * 0.1);
                        fanartPieces[curSelected].scale.y += (FlxG.mouse.deltaWheel.y * 0.1);
                    }
                }
                if(fanartPieces[curSelected].scale.x < backupInfo * 0.5) fanartPieces[curSelected].scale.set(backupInfo * 0.51, backupInfo * 0.51);
                else if(fanartPieces[curSelected].scale.x > backupInfo * 2) fanartPieces[curSelected].scale.set(backupInfo * 1.99, backupInfo * 1.99);

                if(FlxG.keys.justPressed.BACKSPACE || FlxG.mouse.justPressedRight){
                    allowMovement[1] = false;
                    FlxTween.tween(fanartPieces[curSelected], {x: (FlxG.width - fanartPieces[curSelected].width) * 0.5, y: ((FlxG.height - fanartPieces[curSelected].height) * 0.5) + 590, 'scale.x': backupInfo, 'scale.y': backupInfo}, 0.5, {ease: FlxEase.expoOut});
                    for(i=>fanartLol in fanartPieces){
                        if(i != curSelected){
                            FlxTween.tween(fanartLol, {alpha: 1}, 0.5, {onComplete: () -> {
                                allowMovement[0] = allowMovement[1] = true;
                            }});
                        }
                    }
                }
            }
        }
    }
}
