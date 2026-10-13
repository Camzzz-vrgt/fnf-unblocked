
function onUpdate()
   
   noteTweenAlpha('alt001','0','0','0.01','circInOut')
   noteTweenAlpha('alt002','1','0','0.01','circInOut')
   noteTweenAlpha('alt003','2','0','0.01','circInOut')
   noteTweenAlpha('alt004','3','0','0.01','circInOut')
   noteTweenX('alt0011','0','-400','0.01','circInOut')
   noteTweenX('alt0021','1','-400','0.01','circInOut')
   noteTweenX('alt0031','2','-400','0.01','circInOut')
   noteTweenX('alt0041','3','-400','0.01','circInOut')
   --[[
   setPropertyFromGroup('opponentStrums', 0, 'alpha', 0)
   setPropertyFromGroup('opponentStrums', 1, 'alpha', 0)
   setPropertyFromGroup('opponentStrums', 2, 'alpha', 0)
   setPropertyFromGroup('opponentStrums', 3, 'alpha', 0)
   ]]
   
end
