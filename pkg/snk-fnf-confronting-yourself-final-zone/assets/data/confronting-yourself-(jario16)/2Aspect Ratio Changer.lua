-- A universal version of the Window Changer script used in Funk Mix Advance.
wideScreen = (26 * 6) + 4

local widescreentog = false

function onCreate()
	addHaxeLibrary("Lib", "openfl");
	if difficulty == 0 then
		widescreentog = false
	else
		widescreentog = true
	end
	
	if widescreentog == false then
		if getPropertyFromClass("openfl.Lib", "application.window.width") ~= 960 then
			setPropertyFromClass("flixel.FlxG", "width", 960)
			setPropertyFromClass("openfl.Lib", "current.stage.stageWidth", 960)
			setPropertyFromClass("openfl.Lib", "application.window.width", 960)
			setPropertyFromClass("openfl.Lib", "application.window.height", 720)
			setProperty("camGame.x", -wideScreen)
			setPropertyFromClass("openfl.Lib", "application.window.resizable", false)
		end
	end
end

function onCreatePost()
	setArrows()
end

function setArrows()
	for i = 0,math.max(getProperty("opponentStrums.length")-1,getProperty("playerStrums.length"))-1 do

		noteTwnByX = (13 * 6) - 3
		noteTwnByY = (3 * 6)

		iPosX = _G["defaultOpponentStrumX"..i] - noteTwnByX
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
			if widescreentog == false then
				setPropertyFromGroup("playerStrums", i, "x", _G["defaultPlayerStrumX"..i] + (2 * 6) + 240)
			else
				setPropertyFromGroup("playerStrums", i, "x", _G["defaultPlayerStrumX"..i] + (2 * 6) + 360)
			end
		else
			if widescreentog == false then
				setPropertyFromGroup("playerStrums", i, "x", jPosX)
			else
				setPropertyFromGroup("playerStrums", i, "x", jPosX + 140)
			end
		end
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

function onUpdate()
	for i = 4,7 do
		setPropertyFromGroup("strumLineNotes", i, "scale.x", 0.6)
		setPropertyFromGroup("strumLineNotes", i, "scale.y", 0.6)
	end

if curStep >= 0 and curStep <= 1 then
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
end

function onSpawnNote(index, direction, noteType, isSustainNote, strumTime)

-- thank you neb for this
    setPropertyFromGroup("unspawnNotes", index, "scale.x", 0.6)
   

    local anim = getPropertyFromGroup("unspawnNotes", index, "animation.name")
    local isEnd = anim:sub(#anim-2,#anim)=='end';
    if (isEnd or not isSustainNote) then
        setPropertyFromGroup("unspawnNotes", index, "scale.y", 0.6)
    end
   if(isEnd)then
     setPropertyFromGroup("unspawnNotes", index, "offsetY", getPropertyFromGroup("unspawnNotes", index, "offsetY") - 17)
   end
end

function onExitSong()
	if widescreentog == false then
		setPropertyFromClass("flixel.FlxG", "width", 1280)
	end
end

function onOpenChartEditor()
	if widescreentog == false then
		setPropertyFromClass("flixel.FlxG", "width", 1280)
	end
end

function onOpenCharacterEditor()
	if widescreentog == false then
		setPropertyFromClass("flixel.FlxG", "width", 1280)
	end
end

function onDestroy()
	if widescreentog == false then
		setPropertyFromClass("flixel.FlxG", "width", 1280)
		setPropertyFromClass("openfl.Lib", "current.stage.stageWidth", 1280)
		setPropertyFromClass("openfl.Lib", "application.window.width", 1280)
		setPropertyFromClass("openfl.Lib", "application.window.height", 720)
		setPropertyFromClass("openfl.Lib", "application.window.x", getPropertyFromClass("openfl.Lib", "application.window.x") - wideScreen)
		setPropertyFromClass("openfl.Lib", "application.window.resizable", true)
	end
end