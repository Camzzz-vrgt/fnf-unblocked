function onCreate()
    makeLuaSprite('sky', 'stages/spongequan/spongequanBG_sky', -850, -690);
    makeLuaSprite('gr', 'stages/spongequan/spongequanBG_main', -850, -690);
    makeLuaSprite('bg', 'stages/spongequan/spongequanBG_shits', -870, -660);
    makeLuaSprite('light', 'stages/spongequan/spongequanBG_lighting', -850, -730);

    scaleObject('sky', 1, 1);
    scaleObject('gr', 1, 1);
    scaleObject('bg', 1, 1);
    scaleObject('light', 1, 1);

    addLuaSprite('sky', false)
    addLuaSprite('gr', false)
    addLuaSprite('bg', false)
    addLuaSprite('light', false)
end
