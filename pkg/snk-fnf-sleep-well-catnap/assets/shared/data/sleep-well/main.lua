local secondPart = false;
local iconsCreated = {}
local curDadIcon = ''
local curBfIcon = ''

local zoomDad = 0.5;
local zoomPlayer = 0.8;

local enableShaderGlitch = true;
local glitchCharacter = false;
local Chromacrap = 0;

function preloadCharacters()
    addCharacterToList('catnap','dad')

    addCharacterToList('crafty','boyfriend')
    addCharacterToList('dog','gf')
end

function boundTo(value, min, max)
    return math.max(min, math.min(max, value))
end

function math.lerp(from,to,i) return from+(to-from)*i end

function setChrome(chromeOffset)
    setShaderFloat("temporaryShader", "rOffset", chromeOffset);
    setShaderFloat("temporaryShader", "gOffset", 0.0);
    setShaderFloat("temporaryShader", "bOffset", chromeOffset * -1);
end

function opponentNoteHit(id, noteData, noteType, isSustainNote)
    Chromacrap = Chromacrap + 0.004; -- edit this
end

function createShaders()
    initLuaShader('TvEffect')
    initLuaShader('CameraGlitch')
    initLuaShader('AirSolidGlitch')
	initLuaShader('vcr')

    makeLuaSprite("cameraGlitchShader")
    setSpriteShader("cameraGlitchShader", "CameraGlitch")
    setShaderBool("cameraGlitchShader",'vignetteOn',true)
    setShaderBool("cameraGlitchShader",'distortionOn',false)
    setShaderBool("cameraGlitchShader",'vignetteMoving',true)
    setShaderBool("cameraGlitchShader",'perspectiveOn',true)
    setShaderBool("cameraGlitchShader",'scanlinesOn',true)
    setShaderFloat("cameraGlitchShader",'glitchModifier',0.5)

    makeLuaSprite('brightnessShader')
    setSpriteShader('brightnessShader', 'BrightnessEffect')

    makeLuaSprite('airSolidGlitch','',screenWidth, screenHeight)
    setSpriteShader('airSolidGlitch', 'AirSolidGlitch')
	
	makeLuaSprite('temporaryShader','',screenWidth, screenHeight)
	setSpriteShader('temporaryShader', 'vcr')
end

function onCreate()
    setProperty("skipCountdown", true)

    makeLuaSprite('black', '', 0, 0)
    setScrollFactor('black', 0, 0)
    makeGraphic('black', screenWidth, screenHeight, '000000')
    setObjectCamera("black",'camOther')
    screenCenter('black', 'xy')
    addLuaSprite('black', false)

    setProperty('timeBar.visible', false)
    setProperty('timeTxt.visible', false)
    setProperty('scoreTxt.visible', false);

    setTextString('botplayTxt', "");

    preloadCharacters()

    addLuaScript("custom_notetypes/Dog Note")
    createShaders()
end

function onCreatePost()
    setProperty('camHUD.alpha',0.001)
    setProperty('gf.alpha',1)
    setProperty('dad.alpha',0.001)
    setProperty('boyfriend.alpha',0.001)
    setMiddleScroll(true,0,false)

    setProperty('iconP1.visible', false)
    setProperty('iconP2.visible', false)
    setProperty('healthBarBG.visible', false)
	setProperty('healthBar.visible', false)

    setProperty('cameraSpeed',2)

    runHaxeCode([[
    
    var cameraGlitchShader = game.getLuaObject('cameraGlitchShader').shader;
    var brightness = game.getLuaObject('brightnessShader').shader;
    var airSolidGlitch = game.getLuaObject('airSolidGlitch').shader;
	var chromaGlitch = game.getLuaObject('temporaryShader').shader;
    
    game.camGame.setFilters([new ShaderFilter(cameraGlitchShader),new ShaderFilter(brightness),new ShaderFilter(airSolidGlitch),new ShaderFilter(chromaGlitch)]);
	game.camHUD.setFilters([new ShaderFilter(chromaGlitch)]);
    game.insert(game.members.indexOf(game.dadGroup)+ 1,game.gf);
    ]])
end

local time = 0;
function onUpdate(elapsed)
    time = time + elapsed;

    if curStep == 5 then
        doTweenAlpha("fadeInBlack", "black", 0.001, 2, "linear")
    end

    if curStep == 70 then
        doTweenAlpha('fadeInCamHud','camHUD',1,stepCrochet*0.001*8,'linear')
    end

    if secondPart then
        followZoom()
    end

    if enableShaderGlitch then
        setShaderFloat('airSolidGlitch','iTime',time*getSongPosition())
    end

    if glitchCharacter then
        setShaderFloat("dad", "iTime", os.clock())
    end

    setShaderFloat('cameraGlitchShader','iTime',os.clock())
	
	if (shadersEnabled) then
		Chromacrap = math.lerp(Chromacrap, 0, boundTo(elapsed * 20, 0, 1));
		setChrome(Chromacrap);
	end
end

function onUpdatePost(elapsed)
    local iconDadPos = 0
    local iconBfPos = 0


    for icon, iconFiles in pairs(iconsCreated) do
        if iconsCreated[icon] ~= nil and iconsCreated[icon].activated and luaSpriteExists(icon) then
            local followIcon = 'iconP2'
            if iconFiles.isPlayer then
                followIcon = 'iconP1'
            end
            local x = getProperty(followIcon..'.x')
            local y = getProperty(followIcon..'.y')
            local scale = iconFiles.scale

            if not iconFiles.isPlayer and icon ~= curDadIcon or iconFiles.isPlayer and icon ~= curBfIcon then
                local offsetX = 0
                local offsetY = 0
                if iconFiles.isPlayer then
                    offsetX = 60
                    iconBfPos = iconBfPos + 1
                    if iconBfPos == 1 then
                        offsetY = -60
                    elseif iconBfPos == 2 then
                        offsetY = 125
                    end
                else
                    offsetX = -90
                    iconDadPos = iconDadPos + 1
                    if iconDadPos == 1 then
                        offsetY = -70
                    elseif iconDadPos == 2 then
                        offsetY = 50
                    end
                end
                
                scale = math.max(0,scale - 0.2)
                x = x + (offsetX*scale)
                y = y + offsetY
            end
            if iconFiles.followScale then
                if iconFiles.lerpScale then
                    setProperty(icon..'.scale.x',lerp(getProperty(icon..'.scale.x'),scale * getProperty(followIcon..'.scale.x'),iconFiles.lerpSpeed))
                    setProperty(icon..'.scale.y',lerp(getProperty(icon..'.scale.y'),scale * getProperty(followIcon..'.scale.y'),iconFiles.lerpSpeed))
                else
                    setProperty(icon..'.scale.x',(scale * getProperty(followIcon..'.scale.x')))
                    setProperty(icon..'.scale.y',(scale * getProperty(followIcon..'.scale.y')))
                end
            end
            if iconFiles.followPos then
                if iconFiles.lerpPos then
                    setProperty(icon..'.x',lerp(getProperty(icon..'.x'),x,iconFiles.lerpSpeed))
                    setProperty(icon..'.y',lerp(getProperty(icon..'.y'),y,iconFiles.lerpSpeed))
                else
                    setProperty(icon..'.x',x)
                    setProperty(icon..'.y',y)
                end
            end
            if iconFiles.followAlpha then
                setProperty(icon..'.alpha',getProperty(followIcon..'.alpha'))
            end
            setProperty(icon..'.animation.curAnim.curFrame',getProperty(followIcon..'.animation.curAnim.curFrame'))
        end
    end
end

local aux = false;
function onBeatHit()
    if curBeat % 4 == 0 and glitchCharacter then
        if aux then
            doTweenAlpha('fadeInGf','gf',0.001,stepCrochet*0.001*4,'linear')
            doTweenAlpha('fadeInDad','dad',0.8,stepCrochet*0.001*4,'linear')
        else
            doTweenAlpha('fadeOutGf','gf',0.4,stepCrochet*0.001*4,'linear')
            doTweenAlpha('fadeOutDad','dad',0.7,stepCrochet*0.001*4,'linear')
        end

        aux = not aux;
    end
end

function onEvent(name,v1,v2)
    if name == 'Change Character' then
        if v1 == 'dad' then
            setProperty('iconP2.angle',-720)
            doTweenAngle('extraIconAngleP2','iconP2',0,0.5,'backOut')
        end
    
        if v1 == 'boyfriend' then
            setProperty('iconP1.angle',-720)
            doTweenAngle('extraIconAngleP1','iconP1',0,0.5,'backOut')
        end
    
        if v1 == 'gf' then
            setProperty('gfIcon.angle',-720)
            doTweenAngle('extraIconAnglegfIcon','gfIcon',0,0.5,'backOut')
        end
    end


	if name == 'Triggers Sleep Well' then

        if v1 == 'zoom' then
            doTweenZoom('zoomOutCamGame','camGame',v2,stepCrochet*0.001,'linear')
        end

		if v1 == '1' then
			if v2 == 'show-cat' then

                cancelTween('fadeInGf')
                cancelTween('fadeInDad')
                cancelTween('fadeOutGf')
                cancelTween('fadeOutDad')

                doTweenAlpha('fadeInCat','gf',1,stepCrochet*0.001*8,'linear')
                doTweenAlpha('fadeOutTeo','dad',0.001,stepCrochet*0.001*8,'linear')

                glitchCharacter = false;

                removeSpriteShader('dad')
                removeSpriteShader('gf')
            end

            if v2 == 'zoom-end' then
                doTweenZoom('zoomInEndCamGame','camGame',2.4,stepCrochet*0.001,'linear')
                doTweenAlpha('fadeInCamGame','camGame',0.001,stepCrochet*0.001,'linear')
            end

            if v2 == 'init' then
                doTweenAlpha("fadeOutBlack", "black", 0.001, stepCrochet*0.001*8, "linear")
                setObjectCamera("black",'camHUD')
                screenCenter('black', 'xy')
            end

            if v2 == 'glitch' then
                glitchCharacter = true;
            end
		end
        
        if v1 == '2' then
            if v2 == '1' then
                
                removeSpriteShader("dad",'Glitchy')
                removeSpriteShader("gf",'Glitchy')

                triggerEvent('Change Character','dad','catnap')

                setProperty('dad.alpha',1)
                setProperty('boyfriend.alpha',1)
                setProperty('gf.alpha',0.001)

                setProperty('scoreTxt.visible', true);

                setMiddleScroll(false,2,false)
                setProperty('defaultCamZoom',0.9)

                secondPart = true;
                zoomDad = 0.55;
                zoomPlayer = 0.8;
                glitchCharacter = false;

                setProperty('iconP1.visible', true)
                setProperty('iconP2.visible', true)
                setProperty('healthBarBG.visible', true)
                setProperty('healthBar.visible', true)
            end

            if v2 == '2' then
                triggerEvent('Change Character','boyfriend','crafty')
                triggerEvent('Change Character','gf','dog')

                addExtraIcon('gfIcon','dog',true)

                setProperty('gf.alpha',1)
                setProperty('gf.x',1250)
                setProperty('gf.y',200)

                setProperty('boyfriend.x',1550)
                setProperty('boyfriend.y',300)
            end

            if v2 == '3' then
                doTweenAlpha("fadeInBlack", "black", 1, stepCrochet*0.001*4, "linear")
            end
    
            if v2 == '4' then
                doTweenAlpha("fadeOutBlack", "black", 0.001, stepCrochet*0.001*4, "linear")
            end

            if v2 == '5' then
                triggerEvent('Change Character','boyfriend','bf')
                setProperty('gf.alpha',0.001)
                removeExtraIcon('gfIcon')
            end
    
            if v2 == '6' then
                cameraFlash("camGame", "FF0000", stepCrochet*0.001*1.5)
            end

            if v2 == '7' then
                setProperty('cameraSpeed',50)
                triggerEvent('Camera Follow Pos',350,-200)
                zoomDad = 1;
                zoomPlayer = 1;
            end

            if v2 == '8' then
                triggerEvent('Camera Follow Pos',1200,450)
                triggerEvent('Change Character','boyfriend','bf')
                setProperty('gf.alpha',0.001)
                removeExtraIcon('gfIcon')
            end

            if v2 == '9' then
                setProperty('cameraSpeed',2)
                doTweenZoom("zoomCamGame", "camGame", 0.55, stepCrochet*0.001*8, "linear")
                zoomDad = 0.55;
                zoomPlayer = 0.8;
            end
        end
	end
end

function onTweenCompleted(tag)
    if tag == 'zoomInEndCamGame' then
        setProperty('defaultCamZoom',1.2)
        setProperty('black.alpha',1)
        runHaxeCode([[
            game.camGame.zoom = 1.2;
                
            var cameraGlitchShader = game.getLuaObject('cameraGlitchShader').shader;
            var brightness = game.getLuaObject('brightnessShader').shader;
			var chromaGlitch = game.getLuaObject('temporaryShader').shader;
        
            game.camGame.setFilters([new ShaderFilter(cameraGlitchShader),new ShaderFilter(brightness),new ShaderFilter(chromaGlitch)]);
        ]])

        setProperty('dad.alpha',1)
        setProperty('gf.alpha',0.001)
        setProperty('camGame.alpha',1)

        enableShaderGlitch = false;
    end
end

function setMiddleScroll(middle,speed,visibleOpponentNotes)
    if speed == nil then
        speed = 2
    end
    for strums = 0,7 do
        if strums < 4 then
            cancelTween('noteUniAlpha'..strums)
            if middle then
                if speed ~= 0 then
                    if not visibleOpponentNotes then
                        noteTweenAlpha('noteUniAlpha'..strums,strums,0,speed,'expoOut')
                    end
                else
                    setPropertyFromGroup('strumLineNotes',strums,'alpha',0)
                end
            else
                if speed ~= 0 then
                    if middlescroll then
                        noteTweenAlpha('noteUniAlpha'..strums,strums,0.35,speed,'expoOut')
                    elseif visibleOpponentNotes then
                        noteTweenAlpha('noteUniAlpha'..strums,strums,1,speed,'expoOut')
                    end
                    
                else
                    if middlescroll and visibleOpponentNotes then
                        setPropertyFromGroup('strumLineNotes',strums,'alpha',0.35)
                    elseif visibleOpponentNotes then
                        setPropertyFromGroup('strumLineNotes',strums,'alpha',1)
                    end
                end
            end
        else
            cancelTween('noteUniX'..strums)
            if not middlescroll then
                if middle then
                    if speed ~= 0 then
                        noteTweenX('noteUniX'..strums,strums,412 + (112*(strums-4)),speed,'expoInOut')
                    else
                        setPropertyFromGroup('strumLineNotes',strums,'x',412 + (112*(strums-4)))
                    end
                else
                    if speed ~= 0 then
                        noteTweenX('noteUniX'..strums,strums,732 + (112*(strums-4)),stepCrochet*0.003,'expoOut')
                    else
                        setPropertyFromGroup('strumLineNotes',strums,'x',732 + (112*(strums-4)))
                    end
                end
            end
        end
    end
end

function followZoom()
    if mustHitSection then
        setProperty('defaultCamZoom',zoomPlayer)
    else
        setProperty('defaultCamZoom',zoomDad)
    end
end

function addExtraIcon(tag,imagePath,isPlayer,addBehind)
    if not hideHud then
        local target = 'iconP2'
        if imagePath == nil then
            if tag == 'gfIcon' then
                imagePath = getProperty('gf.healthIcon')
            elseif tag == 'dadIcon' then
                imagePath = getProperty('dad.healthIcon')
            elseif tag == 'bfIcon' then
                imagePath = getProperty('boyfriend.healthIcon')
            else
                imagePath = 'face'
            end
        end
        makeLuaSprite(tag,nil,0,0)
        setObjectCamera(tag,'hud')
        setProperty(tag..'.flipX',isPlayer == true)
        if isPlayer then
            target = 'iconP1'
        end
        setProperty(tag..'.x',getProperty(target..'.x'))
        setProperty(tag..'.y',getProperty(target..'.y'))
        setProperty(tag..'.visible',not hideHud)
        iconsCreated[tag] = {
            scale = 1,
            isPlayer = (isPlayer == true),
            activated = true,
            imageFile = '',
            lerpScale = false,
            lerpPos = false,
            followScale = true,
            followPos = true,
            followAlpha = true,
            lerpSpeed = 0.2,
            followCharacterImage = true
        }
        loadIconGraphic(tag,imagePath)
        if addBehind then
            runHaxeCode(
                [[
                    game.uiGroup.members.insert(game.uiGroup.members.indexOf(game.]]..target..[[),game.getLuaObject("]]..tag..[["));
                    return;
                ]]
            )
        else
            runHaxeCode(
                [[
                    game.uiGroup.members.insert(game.uiGroup.members.indexOf(game.]]..target..[[) + 2,game.getLuaObject("]]..tag..[["));
                    return;
                ]]
            )
        end

        setProperty(tag..'.angle',-720)
        doTweenAngle('extraIconAngle',tag,0,0.5,'backOut')
    end
end

function getIconImage(image)
    local imagePath = 'icons/icon-face'
    if not checkFileExists('images/'..image..'.png') then
        imagePath = 'icons/'..image
    end
    if not checkFileExists('images/icons/'..image..'.png') then
        if checkFileExists('images/icons/icon-'..image..'.png') then
            imagePath = 'icons/icon-'..image
        end
    else
        imagePath = 'icons/'..image
    end
    return imagePath
end

function loadIconGraphic(icon,image)
    image = getIconImage(image)
    makeLuaSprite('imageIcon',image)
    loadGraphic(icon,image,getProperty('imageIcon.width')/2,getProperty('imageIcon.height'))
    addAnimation(icon,'anim',{0,1},0,false)
    removeLuaSprite('imageIcon',true)
    
    iconsCreated[icon].imageFile = image
end

function removeExtraIcon(tag)
    if tag ~= 'all' then
        if iconsCreated[tag] ~= nil then
            removeLuaSprite(tag,true)
            iconsCreated[tag] = nil
        end
    else
        for icons,i in pairs(iconsCreated) do
            removeLuaSprite(icons,true)
            iconsCreated[icons] = nil
        end
    end
end

function lerp(a,b,c)
    return a + (b-a)*c
end