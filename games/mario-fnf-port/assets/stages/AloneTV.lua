function onCreate()

	makeLuaSprite('stageback', 'anTV', -1050, -250)
	scaleObject('stageback', 1.35, 1.35)

	addLuaSprite('stageback', false)

end
function onCreatePost()
     setProperty('gf.visible',false)
setProperty('boyfriend.visible',false)
  setPropertyFromGroup('playerStrums',0,'x','92')
  setPropertyFromGroup('playerStrums',1,'x','204')
  setPropertyFromGroup('playerStrums',2,'x','316')
  setPropertyFromGroup('playerStrums',3,'x','428')
end
function onSongStart()
    triggerEvent('Note Fade')
end
function onEvent(name, value1,value2)
    if name == 'Note Fade' then
        noteTweenAlpha('moa',0,0,1,'linear')
        noteTweenAlpha('mo2a',1,0,1,'linear')
        noteTweenAlpha('moa3',2,0,1,'linear')
        noteTweenAlpha('moa4',3,0,1,'linear')
    end
end