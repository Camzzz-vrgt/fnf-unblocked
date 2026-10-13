function onCreate()
   makeLuaSprite('awa', 'purin/stage', -600, -780);
   scaleObject('awa', 1.25, 1.25);
   setScrollFactor('awa', 1.0, 1.0) 
   addLuaSprite('awa', false);

   makeLuaSprite('awa2', 'purin/stage2', -600, -780);
   scaleObject('awa2', 1.25, 1.25);
setScrollFactor('awa2', 1.0, 1.0) 
addLuaSprite('awa2', false);

makeAnimatedLuaSprite("charmander",'purin/charmander_death', -400, -200)
addAnimationByPrefix("charmander", "idle", "charmander idle0", 24, true)
setScrollFactor('charmander', 1.0, 1.0) 
scaleObject("charmander", 0.8, 0.8)
addLuaSprite("charmander", false)

makeAnimatedLuaSprite("cleafa",'purin/cleafa', 250, -180)
addAnimationByPrefix("cleafa", "idle",'clefa0',24, true)
setScrollFactor('cleafa', 1.0, 1.0) 
scaleObject("cleafa", 1.3,1.3)
addLuaSprite("cleafa",false)

makeAnimatedLuaSprite("squirtle",'purin/squirtle_death', 150, -130)
addAnimationByPrefix("squirtle",'idle','squirtle idle0',24,true)
setScrollFactor('squirtle', 1.0, 1.0) 
scaleObject("squirtle", 0.8, 0.8)
addLuaSprite("squirtle",false)

makeAnimatedLuaSprite('snub','purin/snub', -350, 50)
addAnimationByPrefix('snub', "idle",'snub0',24,true)
setScrollFactor('snub', 1.0, 1.0) 
scaleObject('snub', 1.15,1.15)
addLuaSprite('snub', false)
end

function onCreatePost()
setProperty('boyfriend.visible', false)
end