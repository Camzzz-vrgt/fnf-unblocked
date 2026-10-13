function onCreate()
    luaDebugMode = true
    if buildTarget == 'windows' then
           local appIcon = 'ringIcon'
           addHaxeLibrary('Application', 'lime.app')
           addHaxeLibrary('Image', 'lime.graphics')
           runHaxeCode("Application.current.window.setIcon(Image.fromFile(Paths.modFolders('images/"..appIcon..".png')));")
       end
end