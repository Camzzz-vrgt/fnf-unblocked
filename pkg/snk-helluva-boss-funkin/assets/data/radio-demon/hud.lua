function onCreatePost()
makeLuaSprite('hbar', 'bar', 100, getProperty('healthBarBG.y') - 60);
setObjectCamera('hbar', 'hud');
scaleObject('hbar', 0.35,0.24)
addLuaSprite('hbar', false);

setObjectOrder('hbar', getObjectOrder('healthBar') + 1)
setObjectOrder('iconP2', getObjectOrder('hbar') + 1)
end


function onUpdatePost()
setProperty('hbar.visible', getProperty('iconP2.visible'))

setProperty('hbar.alpha', getProperty('iconP2.alpha'))
end