function onCreate()
 makeLuaSprite('sky', 'stages/squid/skyBG', -600, -1200);
 makeLuaSprite('gr', 'stages/squid/sandBG', -630, -1230);
 makeLuaSprite('bg', 'stages/squid/main', -600, -1200);
 makeLuaSprite('stuff', 'stages/squid/stuff', -600, -1111);
 makeLuaSprite('pictures', 'stages/squid/pictures', -630, -1230);

 scaleObject('sky', 1, 1);
 scaleObject('gr', 1, 1);
 scaleObject('bg', 1, 1);
 scaleObject('stuff', 1, 1);
 scaleObject('pictures', 1, 1);
 
 addLuaSprite('sky',false)
 addLuaSprite('gr',false)
 addLuaSprite('bg',false)
 addLuaSprite('stuff',false)
 addLuaSprite('pictures',false)
end