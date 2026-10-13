import flixel.tweens.FlxEase;
import flixel.text.FlxText;
import flixel.tweens.FlxTween;
import funkin.graphics.FunkinSprite;
import funkin.play.stage.Stage;
import StringTools;
import flixel.FlxCamera;
import flixel.addons.display.FlxBackdrop;
import funkin.save.Save;
import funkin.ui.MusicBeatSubState;
import funkin.modding.base.ScriptedMusicBeatSubState;
import funkin.ui.AtlasText;

class TrickyConceptArtState extends ScriptedMusicBeatSubState {
    var conceptPieces = [];

    var curSelected:Int = 0;

    public override function create(){
        super.create();
        bgCamera = FlxG.camera = new FlxCamera(0, 0, FlxG.width, FlxG.height, 0);
		bgCamera.bgColor = 0xFF3a0000;
		FlxG.cameras.add(bgCamera);

        bgCamera.scroll.y -= 600;

        conceptPieces = [];
        index = 0;
        padding = 20;
        for (i in ["Comic1_-_1", "Comic1_-_2", "Comic1_-_3", "Comic1_-_4", "Menu_characters1", "Menu_characters2", "trick1", "trick2", "trick3", "trick4", "Sketch_art_poses1", "Sketch_art_poses2", "assaultbg", 'Icon_Concept']){
            var piece = FunkinSprite.create(0, 0, 'trickyMenu/concepts/' + i);
            piece.setGraphicSize(0,600);
            piece.updateHitbox();
            if (piece.width > 800) {
                piece.setGraphicSize(800,0);
                piece.updateHitbox();
            }
            if (index == 0) piece.setPosition(FlxG.width/2 - piece.width/2, FlxG.height/2 - piece.height/2 - 10 - 600);
            else {
                piece.setPosition(conceptPieces[index-1].x + conceptPieces[index-1].width + padding, FlxG.height/2 - piece.height/2 - 10 - 600);
                piece.color = 0xFF666666;
            }
            conceptPieces.push(piece);
            index++;
        }

        pieceDesc = new FlxText(0, 0, FlxG.width, "Scrapped Comic Book Week Intro Page 1", 10);
        pieceDesc.setFormat(Paths.font('tahoma-bold.ttf'), 30, 0xFFff0000, "center");
        pieceDesc.setPosition(0, FlxG.height - pieceDesc.height - 20 - 600);
        conceptPieces.push(pieceDesc);

        for (i in conceptPieces){
            i.y -= FlxG.height - 600;
            insert(1, i);
            FlxTween.num(i.y - 600, i.y + FlxG.height - 600, 0.5, {ease: FlxEase.expoOut}, (num) -> {
                i.y = num;
            });
        }
    }

    function conceptTrans(in:Bool = true){
        var set2 = conceptPieces;
        var amt = FlxG.height;
        if (!in){
            set1 = conceptPieces;
            set2 = mainButtons;
            amt = amt * -1;
        }
        for (o in set2){
            FlxTween.tween(o, {y: o.y + amt - 600}, 0.5, {ease: FlxEase.expoOut, onComplete: _ -> {
                if (set2.indexOf(o) == 0) {
                    if (set2 == mainButtons) resetConcepts();
                }
            }});
        }
        curSelected = in ? 0 : 1;
    }

    function changeConcepts(amt:Int, set:Bool = false){
        var target = curSelected + amt;
        if (set) target = amt;
        var range = conceptPieces.length - 1;
        if (target >= range) target = 0;
        else if (target < 0) target = range - 1;

        conceptPieces[curSelected].color = 0xFF666666;
        conceptPieces[target].color = 0xFFffffff;

        curSelected = target;

        switch (curSelected){
            case 0,1,2,3: pieceDesc.text = "Scrapped Comic Book Week Intro Page " + (curSelected + 1);
            case 4,5: pieceDesc.text = "Menu Character Sketches";
            case 6: pieceDesc.text = "Improbable Outset Sketch";
            case 7: pieceDesc.text = "Madness Sketch";
            case 8: pieceDesc.text = "Hellclown Sketch";
            case 9: pieceDesc.text = "Expurgation Sketch";
            case 10,11: pieceDesc.text = "Tricky Pose Sketches";
            case 12: pieceDesc.text = "Assault Stage Sketch";
            case 13: pieceDesc.text = "Freeplay Icon Concepts/Final Results";
            default: pieceDesc.text = "";
        }

        var amountToMove = conceptPieces[curSelected].x - (FlxG.width/2 - conceptPieces[curSelected].width/2);
        if (amt == 0) amountToMove = 0;

        for (i in conceptPieces){
            if (conceptPieces.indexOf(i) >= range) return;
            FlxTween.cancelTweensOf(i);
            FlxTween.tween(i, {x: i.x - amountToMove}, 0.5, {ease: FlxEase.expoOut});
        }
    }

    function resetConcepts(){
        conceptPieces[0].color = 0xFFffffff;
        conceptPieces[curSelected].color = 0xFF666666;
        pieceDesc.text = "Scrapped Comic Book Week Intro Page 1";
        var index = 0;
        var padding = 20;
        for (i in conceptPieces){
            if (conceptPieces.indexOf(i) >= conceptPieces.length - 1) return;
            if (index == 0) i.x = FlxG.width/2 - i.width/2;
            else i.x = conceptPieces[index-1].x + conceptPieces[index-1].width + padding;
            index ++;
        }
    }

    var backupInfo = 0;
    var allowMovement = [true, true];

    public override function update(){
        if(allowMovement[0]){
            if (controls.UI_LEFT_P || controls.UI_RIGHT_P) changeConcepts(controls.UI_RIGHT_P ? 1 : -1);
            if(FlxG.keys.justPressed.ENTER && !FlxG.onMobile){
                allowMovement[0] = allowMovement[1] = false;
                backupInfo = conceptPieces[curSelected].scale.x;
                for(i=>concepts in conceptPieces){
                    if(i != curSelected){
                        FlxTween.tween(concepts, {alpha: 0.001}, 0.5, {onComplete: () -> {
                            allowMovement[1] = true;
                        }});
                    }
                }
            }
            if(controls.BACK_P){
                for (i in conceptPieces){
                    insert(1, i);
                    FlxTween.num(i.y, i.y - FlxG.height - 600, 0.5, {ease: FlxEase.expoOut, onComplete: () -> {
                        FlxTween.num(-600, 0, 0.5, {ease: FlxEase.expoOut, onComplete: () -> {
                            FlxG.state.menuControllable = true;
                            for(pieces in conceptPieces){
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
                if(FlxG.mouse.pressed) conceptPieces[curSelected].setPosition(conceptPieces[curSelected].x + FlxG.mouse.deltaScreenX, conceptPieces[curSelected].y + FlxG.mouse.deltaScreenY);
                if(FlxG.mouse.wheel != 0){
                    if(conceptPieces[curSelected].scale.x > backupInfo * 0.5 && conceptPieces[curSelected].scale.x < backupInfo * 3){
                        conceptPieces[curSelected].scale.x += (FlxG.mouse.deltaWheel.y * 0.1);
                        conceptPieces[curSelected].scale.y += (FlxG.mouse.deltaWheel.y * 0.1);
                    }
                }
                if(conceptPieces[curSelected].scale.x < backupInfo * 0.5) conceptPieces[curSelected].scale.set(backupInfo * 0.51, backupInfo * 0.51);
                else if(conceptPieces[curSelected].scale.x > backupInfo * 3) conceptPieces[curSelected].scale.set(backupInfo * 2.99, backupInfo * 2.99);

                if(FlxG.keys.justPressed.BACKSPACE || FlxG.mouse.justPressedRight){
                    allowMovement[1] = false;
                    FlxTween.tween(conceptPieces[curSelected], {x: (FlxG.width - conceptPieces[curSelected].width) * 0.5, y: ((FlxG.height - conceptPieces[curSelected].height) * 0.5) - 610, 'scale.x': backupInfo, 'scale.y': backupInfo}, 0.5, {ease: FlxEase.expoOut});
                    for(i=>concepts in conceptPieces){
                        if(i != curSelected){
                            FlxTween.tween(concepts, {alpha: 1}, 0.5, {onComplete: () -> {
                                allowMovement[0] = allowMovement[1] = true;
                            }});
                        }
                    }
                }
            }
        }
    }
}
