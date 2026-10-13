function onCreate() --Or onCreatePost()
    makeLuaSprite('FadeName',nil)
    makeGraphic('FadeName', 1920, 1080, '000000')
    screenCenter("FadeName")
    setScrollFactor("FadeName",0,0)
    addLuaSprite('FadeName', true)
end

function onSongStart()
doTweenAlpha('FadeAlpha', 'FadeName', 0, 17 / playbackRate, 'linear') --Change your_desired_time to the amount of time you want the fade in to go for.
end
