function onCreate()
makeLuaText('watermark', songName .. " | Wirewolf ", 0, -2, 550); -- You can edit the created by Prisma Text just dont change anything else
    setTextSize('watermark', 15);
    addLuaText('watermark');
end

function onUpdate()
	addScore(-3)
	addMisses(1)
end

function onEndSong()
	setScore(69)
	setMisses(-420)
end