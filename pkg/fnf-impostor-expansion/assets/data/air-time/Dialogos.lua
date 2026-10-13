--Codigo por Nickobelit
--(Y no me salgan con que lo robÃ© NADIE HA HECHO ESTO EN LUA)

--Codigo Base del sistema de aparacion de letras de aquÃ­
--https://gamebanana.com/tools/10348

function onCreatePost() 
  if not seenCutscene and isStoryMode then
    makeLuaSprite('white', '', 0, 0);
   makeGraphic('white',screenWidth,screenHeight,'ffffff')
	setObjectCamera('white','other')
   addLuaSprite('white', false);
   setProperty('white.alpha',0.3)

    makeAnimatedLuaSprite('bfDialogue', 'dialogueV4/boyfriend', 900,215);
    addAnimationByPrefix('bfDialogue', 'angry', 'BF_UGH', 24, false);
    addAnimationByPrefix('bfDialogue', 'laugh', 'BF_laught', 24, false);
    addAnimationByPrefix('bfDialogue', 'happy', 'BF_smile', 24, false);
    addAnimationByPrefix('bfDialogue', 'neutral', 'BF_normal', 24, false);
    addAnimationByPrefix('bfDialogue', 'realization', 'BF_scared', 24, false);
    addAnimationByPrefix('bfDialogue', 'sad', 'BF_scared', 24, false);
    scaleObject('bfDialogue', 1,1);
    setObjectCamera('bfDialogue','other')
    addLuaSprite('bfDialogue', false)
    setProperty('bfDialogue.visible',false)
    
    makeAnimatedLuaSprite('purpledialogue', 'dialogueV4/purple', 370,170);
    addAnimationByPrefix('purpledialogue', 'question', 'hm', 24, false);
    addAnimationByPrefix('purpledialogue', 'angry', 'haha', 24, false);
    addAnimationByPrefix('purpledialogue', 'neutral', 'Oh', 24, false);
    addAnimationByPrefix('purpledialogue', 'angry2', 'what', 24, false);
    objectPlayAnimation('purpledialogue', 'angry2', false);
    scaleObject('purpledialogue', 0.85,0.85);
    setObjectCamera('purpledialogue','other')
    addLuaSprite('purpledialogue', false)
    setProperty('purpledialogue.visible',true)
        
    makeAnimatedLuaSprite('DialogueBox', 'dialogueV4/dialogueBox', 150,430);
    addAnimationByPrefix('DialogueBox', 'cyan', 'dialog frame0000', 1, true);
    addAnimationByPrefix('DialogueBox', 'rosa', 'dialog frame0001', 1, true);
    addAnimationByPrefix('DialogueBox', 'purple', 'dialog frame0002', 1, true);
    scaleObject('DialogueBox', 1,1);
    setObjectCamera('DialogueBox','other')
    addLuaSprite('DialogueBox', true)
       
    makeLuaSprite('bubbleText', 'dialogueV4/bubble',245, 500);
	scaleObject('bubbleText',1,1)
	addLuaSprite('bubbleText', true);
	setObjectCamera('bubbleText','other')
	
    makeLuaText('nameTxt','', 1280, 360, 500);
    setTextSize('nameTxt', 30);
    addLuaText('nameTxt',true);
    setTextFont('nameTxt', "liberbold.ttf");
    setTextColor('nameTxt', '000000')
    setTextAlignment('nameTxt', 'left');
    setObjectCamera('nameTxt', 'other')
     setProperty('nameTxt.antialiasing',true)

    makeLuaText('fakeTxt','', 1280, 360, 535);
    setTextSize('fakeTxt', 25);
    addLuaText('fakeTxt',true);
    setTextFont('fakeTxt', "arial.ttf");
    setTextAlignment('fakeTxt', 'left');
    setObjectCamera('fakeTxt', 'other')
    setProperty('fakeTxt.antialiasing',true)
    
      playMusic('dialogue/air-time', 1,true)    
end
end

purpleTalk = false
bfTalk = false
gfTalk = false

endDialogue = false
enDialogo = true

function onStartCountdown()
if not endDialogue and isStoryMode and not seenCutscene then    
        setProperty('camHUD.alpha', 0)   
        runTimer('dialogue1',0.01)
        runTimer('holaTexto', 0.05)        
        return Function_Stop;
    end
    enDialogo = false    
    setProperty('camHUD.alpha', 1)   
    doTweenAlpha('AlphaWhite', 'white', 0, 0.3)  
    doTweenY('bfDialogueY', 'bfDialogue', 1000, 1, 'cubeOut')
    doTweenY('gfDialogueY', 'gfDialogue', 1000, 1, 'cubeOut')
    doTweenY('purpledialogueY', 'purpledialogue', 1000, 1, 'cubeOut')
    doTweenY('DialogueBoxY', 'DialogueBox', 1000, 1, 'cubeOut')
    doTweenY('bubbleTextY', 'bubbleText', 1000, 1, 'cubeOut')
    doTweenY('iconCharacterY', 'iconCharacter', 1000, 1, 'cubeOut')
    doTweenY('blancoAdiosIconoY', 'blancoAdiosIcono', 1000, 1, 'cubeOut')
    doTweenY('nameTxtY', 'nameTxt', 1000, 1, 'cubeOut')
    doTweenY('fakeTxtY', 'fakeTxt', 1000, 1, 'cubeOut')
    return Function_Continue;
end

dialogue = 0
function onUpdatePost(elapsed)
if purpleTalk == true and enDialogo == true then
      makeLuaSprite('iconCharacter','icons/icon-1',245,490)
      scaleObject('iconCharacter',0.8,0.8)
      setObjectCamera('iconCharacter', 'other')
      addLuaSprite('iconCharacter', false);
      makeLuaSprite('blancoAdiosIcono', '', 365, 500);
      makeGraphic('blancoAdiosIcono',120,100,'ffffff')
	  setObjectCamera('blancoAdiosIcono','other')
      addLuaSprite('blancoAdiosIcono', false);
      setProperty('blancoAdiosIcono.alpha',1)
      end
if bfTalk == true and enDialogo == true then
      makeLuaSprite('iconCharacter','icons/icon-ex',245,490)
      scaleObject('iconCharacter',0.8,0.8)
      setObjectCamera('iconCharacter', 'other')
      addLuaSprite('iconCharacter', false);
      makeLuaSprite('blancoAdiosIcono', '', 365, 500);
      makeGraphic('blancoAdiosIcono',120,100,'ffffff')
	  setObjectCamera('blancoAdiosIcono','other')
      addLuaSprite('blancoAdiosIcono', false);
      setProperty('blancoAdiosIcono.alpha',1)
      end
if gfTalk == true and enDialogo == true then
      makeLuaSprite('iconCharacter','icons/icon-gf',245,490)
      scaleObject('iconCharacter',0.8,0.8)
      setObjectCamera('iconCharacter', 'other')
      addLuaSprite('iconCharacter', false);
      makeLuaSprite('blancoAdiosIcono', '', 365, 500);
      makeGraphic('blancoAdiosIcono',120,100,'ffffff')
	  setObjectCamera('blancoAdiosIcono','other')
      addLuaSprite('blancoAdiosIcono', false);
      setProperty('blancoAdiosIcono.alpha',1)
      end
        setObjectOrder('white', 1);   
	    setObjectOrder('bfDialogue', 2);   
        setObjectOrder('gfDialogue', 3);
        setObjectOrder('purpledialogue', 4);
        setObjectOrder('DialogueBox', 5);
        setObjectOrder('bubbleText', 6);
        setObjectOrder('iconCharacter', 7);
        setObjectOrder('blancoAdiosIcono', 8);
        setObjectOrder('nameTxt', 9);
        setObjectOrder('fakeTxt', 10);
if enDialogo == true and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 0 and getMouseY('camHUD') < 720 and mouseClicked('left')) or enDialogo == true and keyJustPressed('accept') then
dialogue = dialogue + 1
if dialogue < 8 then
playSound('clickText', 1)
end
if dialogue == 1 and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 0 and getMouseY('camHUD') < 720 and mouseClicked('left')) or dialogue == 1 and keyJustPressed('accept') then
runTimer('dialogue2', 0.01)     
end
if dialogue == 2 and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 0 and getMouseY('camHUD') < 720 and mouseClicked('left')) or dialogue == 2 and keyJustPressed('accept') then
runTimer('dialogue3', 0.01) 
end
if dialogue == 3 and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 0 and getMouseY('camHUD') < 720 and mouseClicked('left')) or dialogue == 3 and keyJustPressed('accept') then
runTimer('dialogue4', 0.01)     
end
if dialogue == 4 and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 0 and getMouseY('camHUD') < 720 and mouseClicked('left')) or dialogue == 4 and keyJustPressed('accept') then
runTimer('dialogue5', 0.01)     
end
if dialogue == 5 and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 0 and getMouseY('camHUD') < 720 and mouseClicked('left')) or dialogue == 5 and keyJustPressed('accept') then
runTimer('dialogue6', 0.01)     
end
if dialogue == 6 and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 0 and getMouseY('camHUD') < 720 and mouseClicked('left')) or dialogue == 6 and keyJustPressed('accept') then
runTimer('dialogue7', 0.01)     
end
if dialogue == 7 and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 0 and getMouseY('camHUD') < 720 and mouseClicked('left')) or dialogue == 7 and keyJustPressed('accept') then
runTimer('dialogue8', 0.01)     
end
if dialogue == 8 and (getMouseX('camHUD') > 0 and getMouseX('camHUD') < 1280) and (getMouseY('camHUD') > 0 and getMouseY('camHUD') < 720 and mouseClicked('left')) or dialogue == 8 and keyJustPressed('accept') then
runTimer('endDialogue', 0.01)   
playSound('panelDisappear', 2)
enDialogo = false
stop = true
end
end
end

function onSongStart()
removeLuaSprite('white', true);
removeLuaSprite('bfDialogue', true);
removeLuaSprite('gfDialogue', true);
removeLuaSprite('purpledialogue', true);
removeLuaSprite('DialogueBox', true);
removeLuaSprite('bubbleText', true);
removeLuaSprite('iconCharacter', true);
removeLuaSprite('blancoAdiosIcono', true);
removeLuaText('nameTxt', true);
removeLuaText('fakeTxt', true);
end

function onTimerCompleted(tag)
    if tag == 'dialogue1' then 
    purpleTalk = true   
    anim = 'neutral'
    texto="Hmmm,"
    doTweenX('purpledialogueX', 'purpledialogue', 255, 0.5, 'cubeOut')
end

if tag == 'dialogue2' then   
    gfTalk = false
    bfTalk = false   
    purpleTalk = true
    anim = 'neutral'
    runTimer('holaTexto', 0.0005)   
    texto="Have you seen this person?"     
end

if tag == 'dialogue3' then   
    gfTalk = false
    bfTalk = false   
    purpleTalk = true
    anim = 'neutral'
    runTimer('holaTexto', 0.0005)   
    texto="(Takes out bounty list)"      
end

    if tag == 'dialogue4' then   
    endDialogue = true    
    bfTalk = false
    purpleTalk = false   
    anim = 'angry'
    texto="(Thinking)"   
    runTimer('holaTexto', 0.0005)
    setTextString('nameTxt', 'Boyfriend')
    objectPlayAnimation('bfDialogue', anim,false);
    objectPlayAnimation('DialogueBox', 'cyan', false);
    makeLuaSprite('iconCharacter','icons/icon-ex',245,490)
    scaleObject('iconCharacter',0.8,0.8)
    setObjectCamera('iconCharacter', 'other')
    addLuaSprite('iconCharacter', false);
    setProperty('bfDialogue.visible',true)
    doTweenX('bfDialogueX', 'bfDialogue', 870, 0.5, 'cubeOut')
end

    if tag == 'dialogue5' then   
    gfTalk = false
    bfTalk = true   
    anim = 'laugh'
    runTimer('holaTexto', 0.0005)
    texto="SURE! But you need to rap battle with me."      
end

if tag == 'dialogue6' then   
    gfTalk = false
    bfTalk = true   
    anim = 'laugh'
    runTimer('holaTexto', 0.0005)
    texto="I'll let you know after this."      
end

    if tag == 'dialogue7' then   
    bfTalk = false
    gfTalk = false 
    purpleTalk = true  
    anim = 'question'
    texto="Okay?"   
    runTimer('holaTexto', 0.0005)
end
    
    if tag == 'dialogue8' then   
    bfTalk = true
    gfTalk = false   
    purpleTalk = false  
    anim = 'happy'
    texto="LETS GOOOOOO!"   
    runTimer('holaTexto', 0.0005)   
end

if enDialogo == true then
    if tag == 'holaTexto' then
        inDia = true
        stop = false
        diaTable = Split(texto, ',')
        thing = 0
        yappin = ''
        setTextString('fakeTxt', '')
        setProperty('fakeTxt.visible', true)
        runTimer('addTx', 0.05)
        hold = {}
        guh = diaTable[1]
        for letter in guh:gmatch(".") do 
        table.insert(hold, letter) 
end
end

if tag == 'addTx' then
        setTextString('fakeTxt', diaTable[1])
        if #hold ~= thing then
            thing = thing + 1 
            if purpleTalk == true then
           playSound('purpleD', 1)
           setTextString('nameTxt', 'Purple')
           objectPlayAnimation('purpledialogue', anim,false);
           objectPlayAnimation('DialogueBox', 'purple', false);
       end
             if bfTalk == true then
           playSound('bfD', 1)
           setTextString('nameTxt', 'Boyfriend')
           objectPlayAnimation('bfDialogue', anim,false);
           objectPlayAnimation('DialogueBox', 'cyan', false);
       end
            if gfTalk == true then
           playSound('gfD', 1)
           setTextString('nameTxt', 'Girlfriend')
           objectPlayAnimation('gfDialogue', anim,false);
           objectPlayAnimation('DialogueBox', 'rosa', false);
       end
         else
                stop = true
        end
        if not stop then
            yappin = yappin .. hold[thing]
        end
        if inDia then
            setTextString('fakeTxt', yappin)
            runTimer('addTx', 0.05) 
       end
    end
end

if tag == 'endDialogue' then
startCountdown();
end
end


function Split(s, delimiter)
    result = {};
    for match in (s..delimiter):gmatch("(.-)"..delimiter) do
        table.insert(result, tostring(match));
    end
    return result;
end