clicks = 5
function mouseOverlaps(tag, camera)
  x = getMouseX(camera or 'camHUD')
  y = getMouseY(camera or 'camHUD')
  return (x > getProperty(tag..'.x') and y > getProperty(tag..'.y') and x < (getProperty(tag..'.x') + getProperty(tag..'.width')) and y < (getProperty(tag..'.y') + getProperty(tag..'.height')))
end

function onUpdatePost()
    if mouseOverlaps('cebolla_con_pelo','camHUD') and mouseClicked('left') and clicks > 0 then
        clicks = clicks - 1 
        objectPlayAnimation('cebolla_con_pelo','cebolla_con_pelohit', true)
        playSound('sprouts/punch2', 1)
    end
    if clicks <= 0 then
    doTweenY('cb','cebolla_con_pelo', -1400, 4.5, 'linear')
    objectPlayAnimation('cebolla_con_pelo','cebolla_con_pelo_muere', true)
    if downscroll then
          doTweenY('cb','cebolla_con_pelo', 1400, 4.5, 'linear')
          objectPlayAnimation('cebolla_con_pelo','cebolla_con_pelo_muere', true)
    end
end
end

function onEvent(n,v1,v2)
    if n == 'Appear thing' then
        clicks = 5
        playSound('sprouts/swish', 1)
        objectPlayAnimation('cebolla_con_pelo','cebolla_con_peloidle', true)
        doTweenY('cb','cebolla_con_pelo', -100, 1, 'linear')
        
    if downscroll then
    objectPlayAnimation('cebolla_con_pelo','cebolla_con_peloidle', true)
          doTweenY('cb','cebolla_con_pelo', 100, 1, 'linear')
end
end
end
--- script by flain me ayudo con la mayoría del código yo solo lo mejore algunos errores que habia XD--