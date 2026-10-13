-- A universal version of the Window Changer script used in Funk Mix Advance.
wideScreen = (26 * 6) + 4


function onCreate()
addHaxeLibrary("Lib", "openfl");
	if getPropertyFromClass("openfl.Lib", "application.window.width") ~= 960 then
		setPropertyFromClass("flixel.FlxG", "width", 960)
		setPropertyFromClass("openfl.Lib", "current.stage.stageWidth", 960)
		setPropertyFromClass("openfl.Lib", "application.window.width", 960)
		setPropertyFromClass("openfl.Lib", "application.window.height", 720)
		setPropertyFromClass("openfl.Lib", "application.window.x", getPropertyFromClass("openfl.Lib", "application.window.x") + wideScreen)
		setProperty("camGame.x", -wideScreen)
		setPropertyFromClass("openfl.Lib", "application.window.resizable", false)
		setPropertyFromClass('openfl.Lib', 'application.window.borderless', true)
	end
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
end

function onCreatePost()
	setArrows()
end

function onUpdatePost()
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
end

function setArrows()
	for i = 0,math.max(getProperty("opponentStrums.length")-1,getProperty("playerStrums.length"))-1 do

		noteTwnByX = (13 * 6) - 3
		noteTwnByY = (3 * 6)

		iPosX = _G["defaultOpponentStrumX"..i] - noteTwnByX -10000
		jPosX = _G["defaultPlayerStrumX"..i] - noteTwnByX + (2 * 6) - 2
		iPosY = _G["defaultOpponentStrumY"..i] - noteTwnByY
		jPosY = _G["defaultPlayerStrumY"..i] - noteTwnByY
		iPosD = _G["defaultOpponentStrumY"..i] + noteTwnByY - (1 * 6) + 1
		jPosD = _G["defaultPlayerStrumY"..i] + noteTwnByY - (1 * 6) + 1

		if downscroll then
			setPropertyFromGroup("playerStrums", i, "y", jPosD)
		else
			setPropertyFromGroup("playerStrums", i, "y", jPosY)
		end
		
		if middlescroll then
			setPropertyFromGroup("playerStrums", i, "x", _G["defaultPlayerStrumX"..i] + (2 * 6) + 240)
		else
			setPropertyFromGroup("playerStrums", i, "x", jPosX)
		end
		setPropertyFromGroup("opponentStrums", i, "x", iPosX)
	end
end

function onCountdownStarted()
	for i = 0,math.max(getProperty("opponentStrums.length"),getProperty("playerStrums.length"))-1 do
		setOnLuas("defaultOpponentStrumX"..i, getPropertyFromGroup("opponentStrums", i, "x"))
		setOnLuas("defaultOpponentStrumY"..i, getPropertyFromGroup("opponentStrums", i, "y"))
		setOnLuas("defaultPlayerStrumX"..i, getPropertyFromGroup("playerStrums", i, "x"))
		setOnLuas("defaultPlayerStrumY"..i, getPropertyFromGroup("playerStrums", i, "y"))
	end
end