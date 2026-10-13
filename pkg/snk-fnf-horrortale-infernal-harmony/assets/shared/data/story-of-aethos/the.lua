function onCreatePost()
    --if getProperty('windowPosition.scale') < 0.5001 then
        doTweenX('windowScaleX','windowPosition.scale',0.5001,30.001,'cubeIn')
        doTweenY('windowScaleY','windowPosition.scale',0.5001,30.001,'cubeIn')
    end
--end

--Try putting this in your main script, it's to handle the full screen issue.