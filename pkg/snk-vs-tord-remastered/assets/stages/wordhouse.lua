-- Lua stuff
function onCreate()
    makeLuaSprite('Sky', 'word/wordsky', -300, -350)
    makeLuaSprite('BG', 'word/backgroundword', -350, -150)
    addLuaSprite('Sky',  false)
    addLuaSprite('BG',  false)
end