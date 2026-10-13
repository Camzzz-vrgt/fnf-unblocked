function onCreate()

    -- create: SONG Credits name
    makeLuaText('watermark', songName, 0, 14, 655); -- You can edit the created by Prisma Text just dont change anything else
    setTextAlignment("watermark", "left")
    addLuaText('watermark');
    setObjectCamera("watermark", 'hud')
    setTextSize('watermark', 20)
    setTextBorder('watermark', '9', '6b0050')

    -- create: SONG Credits by
    makeLuaText('watermark2', "-by MAKYUNI-", 0, 14, 685); -- You can edit the created by Prisma Text just dont change anything else
    setTextAlignment("watermark2", "left")
    addLuaText('watermark2');
    setObjectCamera("watermark2", 'hud')
    setTextSize('watermark2', 15)
    setTextBorder('watermark2', '9', '6b0050')

end




function onUpdate()

    doTweenAngle('opponentRotate', 'dad', -12, 0.1, linear)

end














