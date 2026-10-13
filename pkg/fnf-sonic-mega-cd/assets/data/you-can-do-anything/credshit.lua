--Totally not a ripoff of Sonic exe's credits stuff mhmh by your favourite coder NickPlayyz :D (Writing this code is a pain)
function onCreate()
    runTimer('go', 8, 1);
    makeLuaSprite('blackbg', 'creds/black', -630, -2300);
    scaleObject('blackbg', 3.2, 3.2)
    addLuaSprite('blackbg', true);
    setObjectCamera('blackbg', 'hud')
    doTweenY('blackgodown', 'blackbg', -1000, 1, 'circIn');
    makeLuaText('art', 'Art By:', 100, 540, -100)
    scaleObject('art', 2, 2)
    addLuaText('art')
    doTweenY('arttext', 'art', 0, 1, 'circIn');
    makeLuaText('sticknick', 'StickNickProductions', 500, 265, -100)
    scaleObject('sticknick', 1.5, 1.5)
    addLuaText('sticknick')
    doTweenY('sticknickart', 'sticknick', 50, 1, 'circIn');
    makeLuaText('composer', 'Mashup By:', 200, 440, -100)
    scaleObject('composer', 2, 2)
    addLuaText('composer')
    doTweenY('composertext', 'composer', 100, 1, 'circIn');
    makeLuaText('youtube', 'Kitsura Fox (Youtube)', 200, 487, -100)
    scaleObject('youtube', 1.5, 1.5)
    addLuaText('youtube')
    doTweenY('youtubemusic', 'youtube', 150, 1, 'circIn');
    makeLuaText('charter', 'Charted By:', 200, 440, -100)
    scaleObject('charter', 2, 2)
    addLuaText('charter')
    doTweenY('chartertext', 'charter', 200, 1, 'circIn');
    makeLuaText('nickc', 'Nickplayz', 200, 485, -100)
    scaleObject('nickc', 1.5, 1.5)
    addLuaText('nickc')
    doTweenY('nickchart', 'nickc', 250, 1, 'circIn');
    makeLuaText('coder', 'Coded By:', 200, 440, -100)
    scaleObject('coder', 2, 2)
    addLuaText('coder')
    doTweenY('codertext', 'coder', 300, 1, 'circIn');
    makeLuaText('nick', 'NickPlayz', 200, 485, -100)
    scaleObject('nick', 1.5, 1.5)
    addLuaText('nick')
    doTweenY('nickcoder', 'nick', 350, 1, 'circIn');
    makeLuaText('beta', 'BetaBits', 200, 485, -100)
    scaleObject('beta', 1.5, 1.5)
    addLuaText('beta')
    doTweenY('betacoder', 'beta', 400, 1, 'circIn');
end

function onTimerCompleted(tag, loops, loopsLeft)
    doTweenY('blackgodownback', 'blackbg', -2300, 1, 'circOut');
    doTweenY('arttextback', 'art', -100, 1, 'circOut');
    doTweenY('sticknickartback', 'sticknick', -100, 1, 'circOut');
    doTweenY('composertextback', 'composer', -100, 1, 'circOut');
    doTweenY('youtubemusicback', 'youtube', -100, 1, 'circOut');
    doTweenY('chartertextback', 'charter', -100, 1, 'circOut');
    doTweenY('nickcchartback', 'nickc', -100, 1, 'circOut');
    doTweenY('codertextback', 'coder', -100, 1, 'circOut');
    doTweenY('nickcoderback', 'nick', -100, 1, 'circOut');
    doTweenY('betacoder', 'beta', -100, 1, 'circOut');
end