function onCreate()
-- background shit

makeLuaSprite('bg','alastor/bg',-1250,-750)
scaleObject('bg', 1.5, 1.5)
addLuaSprite('bg')

makeLuaSprite('bench','alastor/bench',-1250, -750)
scaleObject('bench', 1.5, 1.5)
addLuaSprite('bench')

makeLuaSprite('roses','alastor/roses',0, 0)
scaleObject('roses', 1.3, 1.3)
setScrollFactor('roses',0.25,0)
screenCenter('roses')
addLuaSprite('roses', true)

makeLuaSprite('effect','alastor/effect',0, 0)
scaleObject('effect', 1.5, 1.5)
setScrollFactor('effect', 0, 0)
screenCenter('effect')
addLuaSprite('effect', true)


makeLuaSprite('bg2','alastor/bg',-1250,-750)
scaleObject('bg2', 1.5, 1.5)
setProperty('bg2.alpha', 0)
addLuaSprite('bg2')

makeLuaSprite('bench2','alastor/bench',-1250, -750)
setProperty('bench2.alpha', 0)
scaleObject('bench2', 1.5, 1.5)
addLuaSprite('bench2')

makeLuaSprite('roses2','alastor/roses',0, 0)
setProperty('roses2.alpha', 0)
scaleObject('roses2', 1.3, 1.3)
setScrollFactor('roses2',0.25,0)
screenCenter('roses2')
addLuaSprite('roses2', true)

makeLuaSprite('effect2','alastor/effect',0, 0)
setProperty('effect2.alpha', 0)
scaleObject('effect2', 1.5, 1.5)
setScrollFactor('effect2', 0, 0)
screenCenter('effect2')
addLuaSprite('effect2', true)

close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end