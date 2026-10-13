function onCreate()
      if getPropertyFromClass('ClientPrefs', 'downScroll') == true then
        setProperty("healthBarBG.visible", false);     
        scaleObject("healthBar", 0.46, 0.17);
        setProperty("healthBar.x", 253);
        setProperty("healthBar.y", 16);

        makeLuaSprite("heal", "healthbar", 240, 0);
        setObjectCamera("heal", "HUD");
        scaleObject("heal", 0.48, 0.48);

        makeLuaSprite('effect', 'effect',235,0)
        scaleObject('effect', 0.47, 0.47);       
        setObjectCamera("effect", "HUD")
        setBlendMode("effect", "multiply")

        makeLuaSprite('overlay', 'overlay',235,0)
        scaleObject('overlay', 0.47, 0.47);       
        setObjectCamera("overlay", "HUD")


        addLuaSprite('heal', true);
        addLuaSprite('effect', true);
        addLuaSprite('overlay', true);
     else
        setProperty("healthBarBG.visible", false);
        scaleObject("healthBar", 0.46, 0.17);
        setProperty("healthBar.x", 253);
        setProperty("healthBar.y", 696);

        makeLuaSprite("heal", "healthbar", 240, 680);
        setObjectCamera("heal", "HUD");
        scaleObject("heal", 0.48, 0.48);

        makeLuaSprite('effect', 'effect',235,0)
        scaleObject('effect', 0.47, 0.47);       
        setObjectCamera("effect", "HUD")
        setBlendMode("effect", "multiply")

        makeLuaSprite('overlay', 'overlay',235,0)
        scaleObject('overlay', 0.47, 0.47);       
        setObjectCamera("overlay", "HUD")


        addLuaSprite('heal', true);
        addLuaSprite('effect', true);
        addLuaSprite('overlay', true);
end
end
