recovery = false
haslives = true
livesleft = 3

function onCreate()
        setProperty('skipCountdown', true)

    
    	   makeLuaSprite('scary', '', 0, 0);
        makeGraphic('scary',1280,720,'000000')
	      setScrollFactor('scary',0,0)
		  addLuaSprite('scary', false);

          setProperty('scary.alpha', 0)

		  setProperty('scary.scale.y',2)
	      setProperty('scary.scale.x',2)

    	   makeLuaSprite('start', '', 0, 0);
        makeGraphic('start',1280,720,'FFFFFF')
	      setScrollFactor('start',0,0)
		  addLuaSprite('start', true);
		  setProperty('start.scale.y',2)
	      setProperty('start.scale.x',2)
              setObjectCamera('start', 'other')
            setBlendMode("start", 'add')

	if shadersEnabled == true then
        initLuaShader('adjustColor')
        for i, object in ipairs({'boyfriend', 'dad', 'gf'}) do
            setSpriteShader(object, 'adjustColor')
            setShaderFloat(object, 'hue', 32)
            setShaderFloat(object, 'saturation', -9)
            setShaderFloat(object, 'contrast', -4)
            setShaderFloat(object, 'brightness', 10)
        end
	end


    makeAnimatedLuaSprite('gfcutie','characters/cutiegf',1150,750)addAnimationByPrefix('gfcutie','dance','Symbol 16 instance 1',24,false)
    makeAnimatedLuaSprite('bfend','bfend', 950,410)addAnimationByPrefix('bfend','bfend','bfend',24,false)
    setProperty('bfend.alpha', 0)
   



	makeLuaSprite('nature','nature', 400,-600)
	scaleObject('nature', 0.85, 0.85)
	setScrollFactor('nature', 1, 1)
	updateHitbox('flnatureoor') -- dude
	addLuaSprite('nature',false)

	makeLuaSprite('blanket','blanket', 480,950)
	scaleObject('blanket', 0.75, 0.75)
	setScrollFactor('blanket', 1, 1)
	addLuaSprite('blanket',false)

    makeLuaSprite('1', 'sweetlicorice', 200, 50);
	setScrollFactor('1', 1, 1)
    setObjectCamera('1', 'other')
    addLuaSprite('1',false)
    screenCenter('1')
	updateHitbox('1')
    setProperty('1.alpha', 1)

    makeLuaSprite('2', 'byathena', 200, 50);
	setScrollFactor('2', 1, 1)
    setObjectCamera('2', 'other')
    addLuaSprite('2',false)
    screenCenter('2')
	updateHitbox('2')
    setProperty('2.alpha', 0)

    makeLuaSprite('3', 'bygazu', 200, 50);
	setScrollFactor('3', 1, 1)
    setObjectCamera('3', 'other')
    addLuaSprite('3',false)
    screenCenter('3')
	updateHitbox('3')
    setProperty('3.alpha', 0)

    makeLuaSprite('4', 'bychai', 200, 50);
	setScrollFactor('4', 1, 1)
    setObjectCamera('4', 'other')
    addLuaSprite('4',false)
    screenCenter('4')
	updateHitbox('4')
    setProperty('4.alpha', 0)

    makeLuaSprite('5', 'enjoy', 200, 50);
	setScrollFactor('5', 1, 1)
    setObjectCamera('5', 'other')
    addLuaSprite('5',false)
    screenCenter('5')
	updateHitbox('5')
    setProperty('5.alpha', 0)


	makeLuaSprite('light', 'lightadd', -400, -1450);
    addLuaSprite('light', true);
	setScrollFactor('light', 0, 0)
	updateHitbox('light')
    setBlendMode('light', 'add')

    
            
    	   makeLuaSprite('memestart', '', 0, 0);
        makeGraphic('memestart',1280,720,'000000')
	      setScrollFactor('memestart',0,0)
		  addLuaSprite('memestart', true);
		  setProperty('memestart.scale.y',2)
	      setProperty('memestart.scale.x',2)
		setProperty('memestart.camera', instanceArg('camHUD'), false, true)
        setProperty('memestart.alpha', 0)


    -- PEOPLE WALKING BY HERE OKAY!!!
    
    makeAnimatedLuaSprite('chaicute','chaicute',-350,620)addAnimationByPrefix('chaicute','chaicute','chai',24,false)addLuaSprite('chaicute', true);scaleObject('chaicute', 1.2, 1.2)
    makeAnimatedLuaSprite('jeef','jeef',-350,880)addAnimationByPrefix('jeef','jeef','geef',24,false)addLuaSprite('jeef', true);scaleObject('jeef', 1.2, 1.2)
    makeAnimatedLuaSprite('rukivurn','rukivurn',-350,880)addAnimationByPrefix('rukivurn','rukivurn','vurnuki',24,false)addLuaSprite('rukivurn', true);scaleObject('rukivurn', 1.2, 1.2)
    makeAnimatedLuaSprite('keckco','keckco',-350,820)addAnimationByPrefix('keckco','keckco','keckfuck',24,false)addLuaSprite('keckco', true);scaleObject('keckco', 1.2, 1.2)
    makeAnimatedLuaSprite('beetung','beetung',-350,800)addAnimationByPrefix('beetung','beetung','beeTUNG',24,false)addLuaSprite('beetung', true);scaleObject('beetung', 1.2, 1.2)
    makeAnimatedLuaSprite('magikrnk','magikrnk',-350,800)addAnimationByPrefix('magikrnk','magikrnk','skarlkrnk',24,false)addLuaSprite('magikrnk', true);scaleObject('magikrnk', 1.2, 1.2)    

    -- MEME PART!!! (scrapped)
    makeAnimatedLuaSprite('bfmeme','bfdance',1300,280)addAnimationByPrefix('bfmeme','bfmeme','bf',24,true)addLuaSprite('bfmeme', true);scaleObject('bfmeme', 1.2, 1.2)	setScrollFactor('bfmeme',0,0)
    makeLuaSprite('melodiameme', 'cat', -500, 320);addLuaSprite('melodiameme', true);scaleObject('melodiameme', 0.8, 0.8)	setScrollFactor('melodiameme',0,0)
    makeAnimatedLuaSprite('matzudance','matzudance',-500,220)addAnimationByPrefix('matzudance','matzudance','smurf',24,true)addLuaSprite('matzudance', true);scaleObject('matzudance', 1.4, 1.4)	setScrollFactor('matzudance',0,0)


end

function onCreatePost()
    


    scaleObject('backdrop', 5)

    
    
    createInstance('cat', 'flixel.addons.display.FlxBackdrop', {nil, 0x01})
    loadGraphic('cat', 'caticon')
    addInstance('cat', false)
    setProperty('cat.y', 700)
    setScrollFactor('cat',1,1)
    setProperty('cat.alpha', 0)

    createInstance('bficon', 'flixel.addons.display.FlxBackdrop', {nil, 0x01})
    loadGraphic('bficon', 'bluicon')
    addInstance('bficon', false)
    setProperty('bficon.y', 1200)
    setScrollFactor('bficon',1,1)
    setProperty('bficon.alpha', 0)

    createInstance('smurficon', 'flixel.addons.display.FlxBackdrop', {nil, 0x01})
    loadGraphic('smurficon', 'smurficon')
    addInstance('smurficon', false)
    setProperty('smurficon.y', 1200)
    setScrollFactor('smurficon',1,1)
    setProperty('smurficon.alpha', 0)

    makeLuaSprite('downbar', '', -0, 600);
	makeGraphic('downbar',1280,720,'000000')
	setScrollFactor('downbar',0,0)
	addLuaSprite('downbar', true);
    scaleObject("downbar", 1.2, 1.2)

    makeLuaSprite('upbar', '', -0, -700);
	makeGraphic('upbar',1280,720,'000000')
	setScrollFactor('upbar',0,0)
	addLuaSprite('upbar', true);
    scaleObject("upbar", 1.2, 1.2)

    makeLuaSprite('REALdownbar', '', -0, 600);
	makeGraphic('REALdownbar',1280,720,'000000')
	setScrollFactor('REALdownbar',0,0)
	addLuaSprite('REALdownbar', false);
    scaleObject("REALdownbar", 1.2, 1.2)
    setObjectCamera('REALdownbar', 'HUD')
    setProperty('REALdownbar.alpha', 0)

    makeLuaSprite('REALupbar', '', -0, -700);
	makeGraphic('REALupbar',1280,720,'000000')
	setScrollFactor('REALupbar',0,0)
	addLuaSprite('REALupbar', false);
    scaleObject("REALupbar", 1.2, 1.2)
    setObjectCamera('REALupbar', 'HUD')
    setProperty('REALupbar.alpha', 0)

    createInstance('backdrop', 'flixel.addons.display.FlxBackdrop', {})
    loadGraphic('backdrop', 'shit')
    addInstance('backdrop')
    setProperty('backdrop.velocity.x', 100)
     setProperty('backdrop.velocity.y', 100)
    setProperty('backdrop.y', 100)
    setScrollFactor('backdrop',0,0)
    scaleObject("backdrop", 40, 40)
    setProperty('backdrop.alpha', 0)



    --is there any easier way to do this

	addLuaSprite('gfcutie', false);
	addLuaSprite('bfend', false);
    setObjectOrder('nature', 1)
    setObjectOrder('blanket', 2)
    setObjectOrder('backdrop', 3)
    setObjectOrder('cat', 4)
    setObjectOrder('smurficon', 5)
    setObjectOrder('bficon', 6)
    setObjectOrder('gfcutie', 7)
    setObjectOrder('dadGroup', 8)
    setObjectOrder('gfGroup',9)
    setObjectOrder('scary', 10) -- kill me bro
    setObjectOrder('boyfriendGroup', 11)
    setObjectOrder('chaicute', 12)
    setObjectOrder('jeef', 13)
    setObjectOrder('rukivurn', 14)
    setObjectOrder('keckco', 15)
    setObjectOrder('beetung', 16)
    setObjectOrder('light', 17)
    setObjectOrder('upbar', 18)
    setObjectOrder('bfend', 19)
    setObjectOrder('downbar', 20)

	setScrollFactor('gfGroup', 1, 1)
	setProperty('health', 2)
	setProperty('healthLoss', 2)

	setProperty('iconP1.alpha', 0)
	setProperty('iconP2.alpha', 0)
	setProperty('scoreTxt.alpha', 0)
	setProperty('healthBar.alpha', 0)
    setProperty('camHUD.alpha', 0)

end

function onBeatHit()


    doTweenX('beatmove1', 'cat', getProperty('cat.x') + 50, 0.3, 'cubeOut')
    doTweenX('beatmove2', 'smurficon', getProperty('smurficon.x') + 50, 0.3, 'cubeOut')
    doTweenX('beatmove3', 'bficon', getProperty('bficon.x') + 50, 0.3, 'cubeOut')    
    
    if curBeat % 2 == 1 then
        setProperty('cat.angle', 10)
        setProperty('smurficon.angle', 10)
        setProperty('bficon.angle', 10)
    else
        setProperty('cat.angle', -10)
        setProperty('smurficon.angle', -10)
        setProperty('bficon.angle', -10)        
    end

    doTweenAngle('beatanglemoveback1', 'cat', 0, 0.3, 'cubeOut')
    doTweenAngle('beatanglemoveback2', 'smurficon', 0, 0.3, 'cubeOut')
    doTweenAngle('beatanglemoveback3', 'bficon', 0, 0.3, 'cubeOut')

    	playAnim('rukivurn','rukivurn',true)
        playAnim('jeef','jeef',true)
    	playAnim('chaicute','chaicute',true)
    	playAnim('keckco','keckco',true)
    	playAnim('beetung','beetung',true)
        playAnim('magikrnk','magikrnk',true)


   
    if curBeat >= 288 and curBeat <= 383 then
	playAnim('gfcutie','dance',true)
    end

        if curBeat % 2 == 1 then
            playAnim('gfcutie','dance',true)
        end

         if curBeat == 32 then
        doTweenAlpha('lalala', 'camHUD', 1, 1, 'linear')
        end

        if curBeat == 384 then
            doTweenAlpha('lalalscary', 'scary', 0.9, 15, 'linear')
            noteTweenAlpha('ayo1', 0, 0, 10, 'linear')
            noteTweenAlpha('ayo2', 1, 0, 10, 'linear')
            noteTweenAlpha('ayo3', 2, 0, 10, 'linear')
            noteTweenAlpha('ayo4', 3, 0, 10, 'linear')
        end

        
        if curBeat == 448 then
            doTweenAlpha('lalalscary', 'scary', 0, 2, 'cubeOut')
            playAnim('bfend','bfend',true)
            setProperty('bfend.alpha', 1)
            setProperty('boyfriend.alpha', 0)
        end

        if curBeat == 6 then
            doTweenAlpha('yuh1', '1', 0, 0.8, 'linear')
        end
        if curBeat == 8 then
            setProperty('2.alpha', 1)
        end
        if curBeat == 14 then
            doTweenAlpha('yuh2', '2', 0, 0.8, 'linear')
        end
        if curBeat == 16 then
            setProperty('3.alpha', 1)
        end
        if curBeat == 22 then
            doTweenAlpha('yuh3', '3', 0, 0.8, 'linear')
        end
        if curBeat == 24 then
            setProperty('4.alpha', 1)
        end
        if curBeat == 28 then
            setProperty('4.alpha', 0)
            setProperty('5.alpha', 1)
        end

        if curBeat == 28 then
            doTweenY('byeupbar', 'upbar', -1200, 3, 'cubeInOut')
            doTweenY('byedownbar', 'downbar', 1200, 3, 'cubeInOut')
        end

        if curBeat == 32 then

            doTweenAlpha('yuh5', '5', 0, 0.8, 'linear')
        end

        if curBeat == 34 then
         doTweenX('uhhhbeet', 'beetung', 1800, 20, 'linear')
        end
        if curBeat == 76 then
         doTweenX('save me im being so forced into finisheing this', 'magikrnk', 1800, 20, 'linear')  
        end         
        if curBeat == 120 then
            doTweenX('keckcoFUCKKKK', 'keckco', 1800, 20, 'linear')  
        end
        if curBeat == 160 then
            doTweenX('i want to freaking sleep bro', 'jeef', 1800, 20, 'linear')
        end
        if curBeat == 210 then

            doTweenX('chai,,heh,,,, hiii,,, :3', 'chaicute', 1800, 20, 'linear')
        end
        if curBeat == 286 then
            doTweenAlpha('burp', 'memestart', 1, 0.5, 'cubeInOut')
        end
        if curBeat == 288 then
            doTweenColor('backdropsecretchange', 'backdrop', '666666', 0.001, 'linear')
            setProperty('memestart.alpha', 0)
            setProperty('light.alpha', 0)
            setProperty('upbar.y', -700)
            setProperty('downbar.y', 600)
            setProperty('backdrop.alpha', 1)
            setProperty('gfcutie.alpha', 0)
            setProperty('cat.alpha', 0.2)
            setProperty('smurficon.alpha', 0.2)
            setProperty('bficon.alpha', 0.2)
            setProperty('REALdownbar.alpha', 1)
            setProperty('REALupbar.alpha', 1)
            setProperty('gfGroup.x', 250)
            setProperty('dadGroup.x', 250)
            setProperty('dadGroup.y', 380)            
            setProperty('boyfriendGroup.x', 2150)
            doTweenX('memehicat', 'gfGroup', 650, 2, 'cubeOut')
        end

        if curBeat == 351 then
           doTweenColor('backdropsecretchange', 'backdrop', '666666', 1, 'cubeOut')
        end
        if curBeat == 352 then
            doTweenX('memehismurf', 'dadGroup', 700, 1, 'cubeOut')
            doTweenY('memecatmoveupmiddle1', 'cat', 700, 1, 'cubeOut')    
            doTweenY('memebfmovemiddleup1', 'bficon', 1200, 1, 'cubeOut') 

        end       
        if curBeat == 304 then
            doTweenX('memebackoffcat', 'gfGroup', 550, 2, 'cubeOut')
            doTweenX('memehismurf', 'dadGroup', 800, 2, 'cubeOut')
            doTweenY('memesmurfmovedownup1', 'smurficon', 700, 1, 'cubeOut')
            doTweenY('memecatmovemiddledown1', 'cat', 300, 1, 'cubeOut')
        end
        if curBeat == 304 or curBeat == 356 then
            doTweenColor('backdropsecretchange', 'backdrop', '0099cc', 1, 'cubeOut')
        end
        if curBeat == 350 then
           doTweenX('memebackoffcat', 'gfGroup', 650, 1.5, 'cubeInOut')
        end
        if curBeat == 356 then
            doTweenX('memehismurf', 'dadGroup', 800, 1, 'cubeOut')   
            doTweenX('memebackoffcat', 'gfGroup', 550, 2, 'cubeOut')         
            doTweenY('memecatmovemiddledown1', 'cat', 1200, 1, 'cubeOut')
            doTweenY('memesmurfmoveupmiddle1', 'smurficon', 700, 1, 'cubeOut')
        end            
        if curBeat == 320 then
            doTweenX('memebackoffcat', 'boyfriendGroup', 1230, 2, 'cubeOut')            
            doTweenY('memesmurfmovemiddleup2', 'smurficon', 300, 1, 'cubeOut')    
            doTweenY('memebficondownmiddle1', 'bficon', 700, 1, 'cubeOut')
        end         
        if curBeat == 368 then
            doTweenY('memesmurfmovemiddledown2', 'smurficon', 300, 1, 'cubeOut')    
            doTweenY('memebficonupmiddle1', 'bficon', 700, 1, 'cubeOut')
        end

        if curBeat == 320 or curBeat == 368 then
           doTweenColor('backdropsecretchange', 'backdrop', '336699', 1, 'cubeOut')
        end
        if curBeat == 376 then
            doTweenAlpha('burp', 'memestart', 1, 1.5, 'cubeInOut')
        end
        if curBeat == 384 then
                cancelTween('fuck1')
                cancelTween('fuck2')
                cancelTween('fuck3')            
            setProperty('memestart.alpha', 0)
            setProperty('backdrop.alpha', 0)
            setProperty('smurficon.alpha', 0)
            setProperty('bficon.alpha', 0)
            setProperty('cat.alpha', 0)
            setProperty('gfcutie.alpha', 1)    
            setProperty('gfGroup.x', 570)
            setProperty('dadGroup.x', 760)
            setProperty('dadGroup.y', 300)            
            setProperty('boyfriendGroup.x', 1230)                    
        end
        
        if curBeat == 448 then
            doTweenAlpha('byehud', 'camHUD', 0, 0.3, 'cubeOut')
        end
end

function onSongStart() 
	doTweenAlpha('start','start',0,1,'linear')
end

function onUpdate(elapsed)
    if curBeat >= 288 and curBeat <= 382 then
        function onEvent(event, value1, value2, strumTime)
            if event == 'Add Camera Zoom' then
                cancelTween('fuck1')
                cancelTween('fuck2')
                cancelTween('fuck3')
                setProperty('boyfriendGroup.y', 410)
                setProperty('gfGroup.y', 360)
                setProperty('dadGroup.y', 390)
                doTweenY('fuck1', 'boyfriendGroup', 400, 0.3, 'cubeOut')
                doTweenY('fuck2', 'gfGroup', 350, 0.3, 'cubeOut')
                doTweenY('fuck3', 'dadGroup', 380, 0.3, 'cubeOut')
            end
            
        end
    end
end

-- SCRIPT BY ADA_FUNNI
-- Do not remove this watermark, or you have zero rights to use this script.

local dadOffset = 5
local bfOffset = 5
local gfOffset = 5

local holdTime = 0.1

        
function onUpdatePost()


    if mustHitSection and getProperty('boyfriend.animation.curAnim') == 'idle' then
        runTimer('move it back', holdTime)
    elseif not mustHitSection and getProperty('dad.animation.curAnim') == 'idle' then
        runTimer('move it back', holdTime)
    end
end

function gfFunction(noteData) -- Can't focus it on GF most of the time, kinda not too good with LUA.
    cameraSetTarget('girlfriend')
    if noteData == 0 then
        setProperty('camFollow.x', getProperty('camFollow.x') - gfOffset)
    elseif noteData == 1 then
        setProperty('camFollow.y', getProperty('camFollow.y') + gfOffset)
    elseif noteData == 2 then
        setProperty('camFollow.y', getProperty('camFollow.y') - gfOffset)
    elseif noteData == 3 then
        setProperty('camFollow.x', getProperty('camFollow.x') + gfOffset)
    end
end

function goodNoteHit(membersIndex, noteData, noteType, isSustainNote)

    setProperty('bfmeme.y', 320)
    cancelTween('thingbackup')
    doTweenY('thingbackup', 'bfmeme', 280, 0.5, 'cubeOut')

    if mustHitSection then
        if not gfSection then
        cameraSetTarget('boyfriend')
        if noteData == 0 then
            setProperty('camFollow.x', getProperty('camFollow.x') - bfOffset)
            setProperty("_camRotation", getProperty("defaultCamRotation"))
        elseif noteData == 1 then
            setProperty('camFollow.y', getProperty('camFollow.y') + bfOffset)
            setProperty("_camRotation", 0)
        elseif noteData == 2 then
            setProperty('camFollow.y', getProperty('camFollow.y') - bfOffset)
            setProperty("_camRotation", 0)
        elseif noteData == 3 then
            setProperty('camFollow.x', getProperty('camFollow.x') + bfOffset)
            setProperty("_camRotation", -getProperty("defaultCamRotation"))
        end
        else
        gfFunction(noteData)
        end
    end
end

function opponentNoteHit(membersIndex, noteData, noteType, isSustainNote)


    if not mustHitSection then
        if not gfSection then
        cameraSetTarget('dad')
        if noteData == 0 then
            setProperty('camFollow.x', getProperty('camFollow.x') - dadOffset)
            setProperty("_camRotation", getProperty("defaultCamRotation"))
        elseif noteData == 1 then
            setProperty('camFollow.y', getProperty('camFollow.y') + dadOffset)
            setProperty("_camRotation", 0)
        elseif noteData == 2 then
            setProperty('camFollow.y', getProperty('camFollow.y') - dadOffset)
            setProperty("_camRotation", 0)
        elseif noteData == 3 then
            setProperty('camFollow.x', getProperty('camFollow.x') + dadOffset)
            setProperty("_camRotation", -getProperty("defaultCamRotation"))
        end
        else
        gfFunction(noteData)
        end
    end
end

function onTimerCompleted(tag, loops, loopsLeft)
    if tag == 'move it back' then
        if mustHitSection then
            if gfSection then
                cameraSetTarget('gfcutie')
            else
                cameraSetTarget('boyfriend')
            end
        else
            cameraSetTarget('dad')
        end
    end
end