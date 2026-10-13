function onCreate()

    makeLuaSprite('parede', 'parede', -600, -300);
    setScrollFactor('parede', 0.9, 0.9);

    makeLuaSprite('coisas', 'coisas', -600, -300);
    setScrollFactor('coisas', 0.9, 0.9);

    makeLuaSprite('overlay', 'overlay', -600, -300);
    setScrollFactor('overlay', 0.9, 0.9);

    addLuaSprite('parede', false);
    addLuaSprite('coisas', false);
    addLuaSprite('overlay', true);

end
