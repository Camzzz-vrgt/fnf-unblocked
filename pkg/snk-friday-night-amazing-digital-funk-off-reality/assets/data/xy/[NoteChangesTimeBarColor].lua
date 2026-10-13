local colors = {'C24B99', '00FFFF', '12FA05', 'F9393F', 'ffffff'}
function goodNoteHit(blahblah, direction, somethinghere, sus)
    cancelTween('UnGay')
    doTweenColor('GayTimeBar', 'timeBar', colors[direction + 1], 0.2, 'linear')
end
function onUpdate()
    if (getProperty('boyfriend.animation.curAnim.name') == 'idle')  then
        doTweenColor('UnGay', 'timeBar', colors[5], 0.2, 'linear')
    end
end