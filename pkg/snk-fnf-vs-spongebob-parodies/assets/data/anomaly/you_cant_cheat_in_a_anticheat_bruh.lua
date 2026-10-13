function onUpdate(elapsed)
if getPropertyFromClass('flixel.FlxG', 'keys.justPressed.SEVEN') then
setProperty ('inCutscene', true)  
       close() --i am going to make a crash note with this and you cant stop me
end
end