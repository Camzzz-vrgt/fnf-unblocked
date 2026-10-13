function onCreate()
    directory = 'stages/discord_museum/'

    makeLuaSprite("wall", directory..'wall', -600, -320)
    setScrollFactor("wall", 0.8, 0.8)
    scaleObject("wall", 1.2, 1.2)
    addLuaSprite("wall")

    makeLuaSprite("picsBehind", directory..'pics-behind', -600, -320)
    setScrollFactor("picsBehind", 0.85, 0.85)
    scaleObject("picsBehind", 1.2, 1.2)
    addLuaSprite("picsBehind")

    makeLuaSprite("picsFront", directory..'pics-front', -600, -320)
    setScrollFactor("picsFront", 0.87, 0.87)
    scaleObject("picsFront", 1.2, 1.2)
    addLuaSprite("picsFront")

    makeLuaSprite("floor", directory..'floor', -600, -320)
    setScrollFactor("floor", 0.9, 0.9)
    scaleObject("floor", 1.2, 1.2)
    addLuaSprite("floor")
end