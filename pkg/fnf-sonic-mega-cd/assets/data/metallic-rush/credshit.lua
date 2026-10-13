--Totally not a ripoff of Sonic exe's credits stuff mhmh by your favourite coder NickPlayyz :D (Writing this code is a pain)
function onCreate()
    runTimer('go', 10, 1);
    makeLuaSprite('blackbg', 'creds/black', -630, -2300);
    scaleObject('blackbg', 3.2, 3.2)
    addLuaSprite('blackbg', true);
    setObjectCamera('blackbg', 'hud')
    doTweenY('blackgodown', 'blackbg', -1000, 1, 'circIn');
    makeLuaText('art', 'Art By:', 100, 540, -100)
    scaleObject('art', 2, 2)
    addLuaText('art')
    doTweenY('arttext', 'art', 0, 1, 'circIn');
    makeLuaText('sonicprime', 'The Sonic Prime', 500, 265, -100)
    scaleObject('sonicprime', 1.5, 1.5)
    addLuaText('sonicprime')
    doTweenY('sonicprimeart', 'sonicprime', 50, 1, 'circIn');
    makeLuaText('composer', 'Composed By:', 200, 440, -100)
    scaleObject('composer', 2, 2)
    addLuaText('composer')
    doTweenY('composertext', 'composer', 100, 1, 'circIn');
    makeLuaText('jer', 'JerProductions', 200, 487, -100)
    scaleObject('jer', 1.5, 1.5)
    addLuaText('jer')
    doTweenY('jermusic', 'jer', 150, 1, 'circIn');
    makeLuaText('charter', 'Charted By:', 200, 440, -100)
    scaleObject('charter', 2, 2)
    addLuaText('charter')
    doTweenY('chartertext', 'charter', 200, 1, 'circIn');
    makeLuaText('igloo', 'Igloo', 200, 485, -100)
    scaleObject('igloo', 1.5, 1.5)
    addLuaText('igloo')
    doTweenY('igloochart', 'igloo', 250, 1, 'circIn');
    makeLuaText('coder', 'Coded By:', 200, 440, -100)
    scaleObject('coder', 2, 2)
    addLuaText('coder')
    doTweenY('codertext', 'coder', 300, 1, 'circIn');
    makeLuaText('nick', 'NickPlayz', 200, 485, -100)
    scaleObject('nick', 1.5, 1.5)
    addLuaText('nick')
    doTweenY('nickcoder', 'nick', 350, 1, 'circIn');
end

function onTimerCompleted(tag, loops, loopsLeft)
    doTweenY('blackgodownback', 'blackbg', -2300, 1, 'circOut');
    doTweenY('arttextback', 'art', -100, 1, 'circOut');
    doTweenY('sonicprimeartback', 'sonicprime', -100, 1, 'circOut');
    doTweenY('composertextback', 'composer', -100, 1, 'circOut');
    doTweenY('jermusicback', 'jer', -100, 1, 'circOut');
    doTweenY('chartertextback', 'charter', -100, 1, 'circOut');
    doTweenY('igloochartback', 'igloo', -100, 1, 'circOut');
    doTweenY('codertextback', 'coder', -100, 1, 'circOut');
    doTweenY('nickcoderback', 'nick', -100, 1, 'circOut');
end