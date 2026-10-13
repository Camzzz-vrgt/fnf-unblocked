import flixel.FlxG;
import flixel.FlxSprite;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import funkin.modding.base.ScriptedMusicBeatState;
import funkin.Conductor;
import funkin.Paths;
import funkin.audio.FunkinSound;
import funkin.graphics.FunkinSprite;
import flixel.util.FlxAxes;
import flixel.util.FlxColor;
import funkin.ui.AtlasText;
import flixel.group.FlxGroup;
import funkin.ui.FullScreenScaleMode;
import funkin.ui.MusicBeatState;
import funkin.ui.mainmenu.MainMenuState;
import funkin.save.Save;

import flixel.util.FlxGradient;
import flixel.util.FlxTimer;
import openfl.utils.Assets;

class TrickyTitleState extends ScriptedMusicBeatState {
    var coolTxts:FlxGroup;
    // fix until we figure out why this code won't work :(
    var introStuff = [
        ['the real', 'convict mod'],
        ['stop playing', 'minecraft'],
        ['banbuds', 'banned from buds'],
        ['YOU DO NOT KILL CLOWN', 'CLOWN KILLS YOU'],
        ['make music faster', 'damn it'],
        ['no clown', 'fuck the clown'],
        ['ninja muffin', 'add hank faster'],
        ['why is tricky', 'so angry'],
        ['he is not scary', 'he is clown'],
        ['no', 'he is very scary'],
        ['shut the', 'fuck up'],
        ['brb', 'leaking tricky remake mod'],
        ['clown man', 'bottom text'],
        ['top text', 'clown man'],
        ['have you seen the', 'bill cypher mod'],
        ['big dick', 'small balls'],
        ['small dick', 'big balls'],
        ['making', 'bank'],
        ['tricky', 'now'],
        ['tricky hd mod', 'real'],
        ['trojan horse', 'is real'],
        ['convict mod', 'never gonna happen'],
        ['family guy', 'funny moment'],
        ['creep tour', 'best song'],
        ['heres a leak', 'ship is sinking'],
        ['hi', 'krinkels'],
        ['egg', 'consumed'],
        ['funkin memes', 'i said funkin'],
        ['clip studio paint', 'clown mode'],
        ['guys i think', 'ritz is week nine'],
        ['hellclown', 'heavenclown'],
        ['top clown won', 'good job'],
        ['he does not', 'sound like whitty'],
        ['adding luigi', 'to orlando'],
        ['average whitty fan', 'average tricky enjoyer'],
        ['reggie x banbuds', 'no homo'],
        ['marc cea', 'is gae'],
        ['colon', 'three'],
        ['weretoons', 'BASEDTOONS'],
        ['ough', 'im banbuds ooooo'],
        ['prolapse', 'ejected'],
        ['godzilla', 'pogzilla']
    ];

    var skipped:Bool = false;
    var init:Bool = false;
    var done:Bool = false;

    override function create(){
        super.create();

        new FlxTimer().start(0.3, _ -> {
            init = FunkinSound.playMusic('honkers', {
                startingVolume: 0.0,
                overrideExisting: true,
                restartTrack: true,
                persist: true
            });
        });

        var l_ = 'trickyMenu/titlescreen';

        bg = FlxGradient.createGradientFlxSprite(FlxG.width, 720, [0xFF540201, 0xFF280101], 1, 90, true);

        tricky = new FunkinSprite(350, 100).loadTextureAtlas('$l_/trickyDJ', 'preload');
        tricky.scale.set(0.6, 0.6);

        logo = new FlxSprite(-100, -150).loadGraphic(Paths.image('$l_/logo', 'preload'));
        logo.scale.set(0.65, 0.65);

        coolTxts = new FlxGroup();
        add(coolTxts);

        titleText = FunkinSprite.createTextureAtlas(100 + (FullScreenScaleMode.gameCutoutSize.x / 2), FlxG.height * 0.8, 'title-screen-text');
        titleText.anim.addByFrameLabel('idle', "Idle", 24);
        titleText.anim.addByFrameLabel('press', "Confirm", 24);
        titleText.animation.play('idle');
        titleText.updateHitbox();

        for(i in [bg, tricky, logo, titleText]){
            i.visible = false;
            add(i);
        }
    }

    var textLengths:Int = 0;
    var curMember:Int = 0;

    function addText(text:String, texts:Int){
        if (coolTxts == null) return;
        var coolTxt:AtlasText = new AtlasText(0, 0, text, "bold");
        coolTxt.screenCenter(FlxAxes.X);
        textLengths = texts;
        curMember = 0;
        coolTxts.add(coolTxt);
        coolTxt.y = FlxG.height * (0.5) + (120 * (curMember - (textLengths * 0.5))) - (coolTxt.maxHeight * 0.5) + 67;
    }

    function addMoreText(text:String){
        if (coolTxts == null) return;
        var coolTxt:AtlasText = new AtlasText(0, 0, text, "bold");
        curMember++;
        coolTxt.screenCenter(FlxAxes.X);
        coolTxts.add(coolTxt);
        coolTxt.y = FlxG.height * (0.5) + (120 * (curMember - (textLengths * 0.5))) - (coolTxt.maxHeight * 0.5) + 67;
    }

    function deleteText(){
        if (coolTxts == null) return;
        while (coolTxts.members.length > 0) coolTxts.remove(coolTxts.members[0], true);
        curMember = 0;
    }

    override function update(elapsed){
        // playMusic maps Honkers' tempo before returning successfully.
        if (init && FlxG.sound.music != null) Conductor.instance.update(FlxG.sound.music.time);

        if ((FlxG.sound.music?.volume ?? 1.0) < 0.8) FlxG.sound.music.volume += 0.5 * elapsed;

        if(controls.ACCEPT_P && init){
            if(!skipped){
                skipped = true;
                startShit();
            } else {
                if(!done){
                    done = true;
                    titleText.animation.play('press');
                    FlxG.sound.music.fadeOut(1, 0, _ -> {
                        var useTrickyMenus:Bool = !Save.instance.modOptions.exists("shouldUseTrickyMenus") || Save.instance.modOptions.get("shouldUseTrickyMenus") != false;
                        var state:MusicBeatState = useTrickyMenus ? new TrickyMenuState() : new MainMenuState();
                        FlxG.switchState(state);
                    });
                    FlxG.camera.fade(FlxColor.BLACK, 1);
                }

            }
            
        }

        super.update(elapsed);
    }

    function initTexts(){
        var fullText:String = Assets.getText(Paths.txt('trickyText'));

        // Split into lines and remove empty lines
        var firstArray:Array<String> = fullText.split('\n');
        for (i in firstArray) introStuff.push(i.split('--'));
    }

    var oppBeat:Bool = false;
    var lastBeat:Int = 0;

    var grabbed:Array = [];
    var curQuote:Int = 0;

    override function beatHit():Bool{
        if (!init) return false;
        if (!super.beatHit()) return false;

        oppBeat = !oppBeat;
        tricky.animation.play(oppBeat ? 'danceLeft' : 'danceRight'); 
        logo.angle = oppBeat ? -5 : 5;
        logo.x -= oppBeat ? 80 : -80;
        logo.scale.set(0.7, 0.7);
        FlxTween.cancelTweensOf(logo);
        FlxTween.tween(logo, {"scale.x": 0.65, "scale.y": 0.65, angle: 0, x: logo.x + (oppBeat ? 80 : -80)}, 0.5, {ease: FlxEase.expoOut});

        if (Conductor.instance.currentBeat > lastBeat){
            if(!skipped){
                for (i in lastBeat...Conductor.instance.currentBeat){
                    switch (i + 1){
                        case 4: addText('BANBUDS', 3);
                        case 5: addMoreText('MARC CEA');
                        case 6: addMoreText('Present');
                        case 7: deleteText();
                        case 8: addText('With help from', 4);
                        case 10: addMoreText('FIFFI, LUSCIOUS, hxzelrxven');
                        case 12: addMoreText('MK, HARVEYZSTUFF, WERETOONS');
                        case 14: addMoreText('CHUBBYGAMER');
                        case 15: deleteText();
                        case 16:
                            curQuote = FlxG.random.int(0, introStuff.length - 1, grabbed);
                            grabbed.push(curQuote);
                            addText(introStuff[curQuote][0], 2);
                        case 17, 19, 21, 23: addMoreText(introStuff[curQuote][1]);
                        case 18, 20, 22:
                            deleteText();
                            curQuote = FlxG.random.int(0, introStuff.length - 1, grabbed);
                            grabbed.push(curQuote);
                            addText(introStuff[curQuote][0], 2);
                        case 24:
                            deleteText();
                            addText('check files', 2);
                        case 25: addMoreText('for surprise');
                        case 26:
                            deleteText();
                            addText('chicken dance remix', 2);
                        case 28: addMoreText('by Tsuraran');
                        case 30:
                            deleteText();
                            addText('Vs. Tricky', 2);
                        case 31: addMoreText('Clowned Out');
                        case 32:
                            deleteText();
                            startShit();
                    }
                }
            }
            lastBeat = Conductor.instance.currentBeat;
        }

        return true;
    }

    function startShit(){
        tricky.visible = logo.visible = bg.visible = titleText.visible = true;
        FlxG.camera.flash(FlxColor.WHITE, 4);
        skipped = true;
    }
}
