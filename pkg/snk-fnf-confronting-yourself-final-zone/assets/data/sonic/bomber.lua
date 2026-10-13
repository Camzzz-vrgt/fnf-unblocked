local bomber = false

function onCreate()
	setProperty('cameraSpeed', 99)
	addHaxeLibrary("Lib", "openfl");
	
	precacheVideos('bomber')
	
	setProperty('gf.alpha', 0)
	setProperty('dad.alpha', 0)
	setProperty('boyfriend.alpha', 0)
end

function onUpdatePost()
	setProperty('timeBar.alpha', 0)
	setProperty('timeBarBG.alpha', 0)
	setProperty('timeTxt.alpha', 0)

	setProperty('iconP2.alpha', 0)
	setProperty('healthBar.alpha', 0)
	setProperty('healthBarBG.alpha', 0)
	setProperty('scoreTxt.alpha', 0)	
	setProperty('iconP1.alpha', 0)
	setProperty('showRating', false)
	setProperty('showComboNum', false)
	
	setTextString("botplayTxt", "")
	
	setProperty('gf.visible', false)
	setProperty('boyfriend.visible', false)
	setProperty('dad.visible', false)
end

function onStepHit()
if curStep == 1 then
	bomber = true
	makeVideoSprite('bomber', 'bomber', 300, 250, 'camGame', false) -- tag, videoFile, x, y, camera, shouldLoop
	setProperty('bomber_video.alpha', 1) -- when you setProperty add _video
	scaleObject('bomber_video', 1.7, 1.7)
	setScrollFactor('bomber',1,1)
end
end

function onDestroy()
if bomber == true then

runHaxeCode([[
    var stage = Lib.current.stage;
    var resolutionX = 0;
    var resolutionY = 0;

    if (stage.window != null)
    {
        var display = stage.window.display;

        if (display != null)
        {
            resolutionX = Math.ceil(display.currentMode.width * stage.window.scale);
            resolutionY = Math.ceil(display.currentMode.height * stage.window.scale);
        }
    }

    if(resolutionX <= 0){
        resolutionX = stage.stageWidth;
        resolutionY = stage.stageHeight;
    }

  Lib.application.window.x = (resolutionX - Lib.application.window.width)/2;
  Lib.application.window.y = (resolutionY - Lib.application.window.height)/2;
]]);
		setPropertyFromClass("flixel.FlxG", "width", 1280)
		setPropertyFromClass("openfl.Lib", "current.stage.stageWidth", 1280)
		setPropertyFromClass("openfl.Lib", "application.window.width", 1280)
		setPropertyFromClass("openfl.Lib", "application.window.height", 720)
		setPropertyFromClass("openfl.Lib", "application.window.x", getPropertyFromClass("openfl.Lib", "application.window.x") - wideScreen)
		setPropertyFromClass("openfl.Lib", "application.window.resizable", true)
end
end