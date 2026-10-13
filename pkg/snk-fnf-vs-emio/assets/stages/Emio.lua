local directory = "emiostage/"

function onCreate() -- stupidly unoptimized but this needs to get done asap so FUCK IT -fp
    makeLuaSprite('BG', 'emiostage/BGEmio', -700, -700);
    scaleObject('BG', 1.2, 1.2);
    addLuaSprite('BG', false);

    makeLuaSprite('fog1', 'emiostage/fog', -1600, -1000);
    makeLuaSprite('fog2', 'emiostage/fog', -1600 - "fog1.width*5", -1000);
    makeLuaSprite('fog3', 'emiostage/fog', -1600 + "fog1.width*5", -1000);

    setProperty("fog1.alpha", 0.2);
    scaleObject('fog1', 5, 5);
    addLuaSprite('fog1', true);

    setProperty("fog2.alpha", 0.2);
    scaleObject('fog2', 5, 5);
    addLuaSprite('fog2', true);

    setProperty("fog3.alpha", 0.2);
    scaleObject('fog3', 5, 5);
    addLuaSprite('fog3', true);
end

function onSongStart()
    for i = 1, 3 do
        doTweenX("fogTween"..i, "fog"..i, getProperty("fog"..i..".x") + getProperty("fog1.width"), 10, "linear")
    end
end

function onTweenCompleted(t)
    if t:sub(1, 8) == "fogTween" then
        local i = tonumber(t:sub(9))
		setProperty("fog"..i..".x", getProperty("fog"..i..".x") - getProperty("fog"..i..".width"))
        doTweenX("fogTween"..i, "fog"..i, getProperty("fog"..i..".x") + getProperty("fog1.width"), 10, "linear")
    end
end