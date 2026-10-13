
local zoomshit = 0;


function onUpdate()
    setTextString('scoreTxt','Sacrifices: '..getProperty('songMisses') ..' | Accuracy: '..(string.sub(getProperty('ratingPercent')* 100,0,5)).. '% ['..getProperty('ratingFC')..']')
    if mustHitSection == false then
    end
end