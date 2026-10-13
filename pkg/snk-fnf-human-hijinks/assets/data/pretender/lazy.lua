function onCreate()
    luaDebugMode = true

    setProperty('bluemira.x', -1440)
    setProperty('bluemira.y', 370)

    setProperty('deadmungus.x', 730)
    setProperty('deadmungus.y', 310)

    setProperty('rhmdead.x', 1340)
    setProperty('rhmdead.y', 750)

    addCharacterToList('hgreylines','dad')
    addCharacterToList('hgreylines2','dad')
    addCharacterToList('hgrey2','dad')

    --Text
    makeLuaText('subtitle', '', 0, 0,getProperty('botplayTxt.y') - 30)
    --Text Setting
    setProperty('subtitle.y',500)
    setTextAlignment('subtitle', 'center')
    setTextWidth('subtitle', getTextWidth('scoreTxt'))
    setTextBorder('subtitle',4,'000000')
    setTextSize('subtitle', 31)
    screenCenter('subtitle','x')
    setProperty('subtitle.alpha',0)

    addLuaText('subtitle')

    setPropertyFromClass('GameOverSubstate', 'characterName', 'hpretender');
    
end

function textup(text)


    setTextString('subtitle',text)

end


function onSongStart()

end

function onUpdate()

end

function onTweenCompleted(tag)

    if tag == 'zoomin' then
        setProperty('defaultCamZoom',1)
    end

    if tag == 'zoomout' then
        setProperty('defaultCamZoom',0.7)
    end

    if tag == 'zoomend' then
        setProperty('defaultCamZoom',0.5)
    end

end

function onStepHit()

    if curStep == 10 then
        doTweenZoom('zoomin','camGame',1,0.4,'cubeout')
    end

    if curStep == 128 then
        doTweenZoom('zoomin','camGame',1.2,0.4,'cubeout')
    end

    if curStep == 227 then
        doTweenZoom('zoomout','camGame',0.7,1,'cubeout')
    end

    if curStep == 260 then
        triggerEvent('Change Character','1','hgreylines')
        triggerEvent('Play Animation','over','dad')
        doTweenZoom('pink','camGame',1.2,0.5,'cubeout')
        triggerEvent('Camera Follow Pos',100-20,300)
        textup('It over...')
        

    end

    if curStep == 270 then
        doTweenZoom('zoomout','camGame',0.7,1,'cubeout')
        textup('PINK!')
        setTextColor('subtitle','f54b42')
    end

    if curStep == 288 then
        triggerEvent('Change Character','1','hgrey2')
        setProperty('defaultCamZoom',0.5)
        textup('')
    end

    if curStep == 338 or curStep == 464 then
        cancelTween('zoomout')
        doTweenZoom('zoomin','camGame',1,0.5,'quadin')
    end

    if curStep == 344 or curStep == 472 then
        cancelTween('zoomin')
        doTweenZoom('zoomout','camGame',0.7,0.5,'cubeout')
    end

    if curStep == 544 then
        setProperty('defaultCamZoom',0.5)
    end

    if curStep == 631 then
        doTweenZoom('zoomin','camGame',1.2,0.5,'cubeout')
    end

    if curStep == 664 then
        cancelTween('zoomin')
        doTweenZoom('zoomout','camGame',0.5,0.5,'cubeout')
    end

    if curStep == 688 then
        cancelTween('zoomout')
        doTweenZoom('zoomin','camGame',1,1,'quadin')
    end

    if curStep == 704 then
        cancelTween('zoomin')
        doTweenZoom('zoomout','camGame',0.5,3,'quadin')
    end

    if curStep == 752 then
        cancelTween('zoomout')
        doTweenZoom('zoomin','camGame',1,1,'quadin')
    end

    if curStep == 768 then
        cancelTween('zoomin')
        doTweenZoom('zoomout','camGame',0.7,3,'quadin')
    end

    if curStep == 800 then
        setProperty('defaultCamZoom',0.5)
    end

    if curStep == 864 or curStep == 880 then
        doTweenZoom('zoomin','camGame',1,0.3,'quadout')
    end

    if curStep == 873 or curStep == 888 then
        setProperty('defaultCamZoom',0.5)
    end

    if curStep == 928 then
        doTweenZoom('zoomin','camGame',1,7,'quadin')
    end

    --Verse 2
    if curStep == 1184 then
        doTweenZoom('zoomin','camGame',1.2,0.4,'cubeout')
    end

    if curStep == 1200 then
        doTweenZoom('zoomout','camGame',0.7,1,'cubeout')
    end

    if curStep == 1316 then
        triggerEvent('Change Character','1','hgreylines2')
        triggerEvent('Play Animation','pretend','dad')
        doTweenZoom('pink','camGame',1.2,0.5,'cubeout')
        triggerEvent('Camera Follow Pos',100-20,300)
        textup('Stop')
        setTextColor('subtitle','ffffff')
        

    end

    if curStep == 1325 then
        doTweenZoom('zoomout','camGame',0.7,1,'cubeout')
        textup('Pretending!')
        setTextColor('subtitle','f54b42')
    end


    if curStep == 1344 then
        triggerEvent('Change Character','1','hgrey2')
        setProperty('defaultCamZoom',0.5)
        textup('')
    end

    if curStep == 1392 or curStep == 1520 then
        cancelTween('zoomout')
        doTweenZoom('zoomin','camGame',1,0.5,'quadin')
    end

    if curStep == 1400 or curStep == 1528 then
        cancelTween('zoomin')
        doTweenZoom('zoomout','camGame',0.7,0.5,'cubeout')
    end

    --YOU HAVE TO KILL
    if curStep == 1600 then
        triggerEvent('Change Character','1','hgreylines2')
        triggerEvent('Play Animation','kill','dad')
         doTweenZoom('pink','camGame',1.2,0.5,'cubeout')
         triggerEvent('Camera Follow Pos',100-20,300)
         textup('You have to')
         setTextColor('subtitle','ffffff')
         
 
     end
 
     if curStep == 1622 then
         doTweenZoom('zoomout','camGame',0.7,1,'cubeout')
         textup('Kill')
         setTextColor('subtitle','f54b42')
     end

     if curStep == 1632 then
        triggerEvent('Change Character','1','hgrey2')
        setProperty('defaultCamZoom',1)
        textup('')
    end

    if curStep == 1692 then
        doTweenZoom('zoomout','camGame',0.7,7,'quadin')
    end


    if curStep == 1760 then
        setProperty('defaultCamZoom',0.7)
    end

    if curStep == 1888 then
        setProperty('defaultCamZoom',0.5)
    end

    if curStep == 1936 or curStep == 2064 then
        cancelTween('zoomout')
        doTweenZoom('zoomin','camGame',1,0.5,'quadin')
    end

    if curStep == 1944 or curStep == 2072 then
        cancelTween('zoomin')
        doTweenZoom('zoomout','camGame',0.7,0.5,'cubeout')
    end

    if curStep == 2144 then
        setProperty('defaultCamZoom',1)
    end

    if curStep == 2272 then
        setProperty('defaultCamZoom',0.7)
    end

    if curStep == 2400 or curStep == 2412 or curStep == 2421 then
        cancelTween('zoomin')
        doTweenZoom('zoomout','camGame',0.7,0.3,'quartout')
    end

    if curStep == 2406 or curStep == 2416 or curStep == 2428 then
        cancelTween('zoomout')
        doTweenZoom('zommin','camGame',1,0.2,'quartout')
    end

    if curStep == 2432 then
        doTweenZoom('zoomout','camGame',0.9,0.2,'quartout')
    end

    if curStep == 2437 then
        doTweenZoom('zoomin','camGame',1,0.3,'quadout')
    end

    if curStep == 2444 then
        doTweenZoom('zoomin','camGame',1.3,0.3,'quadout')
    end

    if curStep == 2451 then
        doTweenZoom('zoomend','camGame',0.5,0.3,'quadout')
    end
end