--custom HUD ("impostor")
--custom HUD "JadynSmellsMore"
--TF2 HUD script (unknown author)
--song credits script (unknown author) https://www.youtube.com/watch?v=DmXorF8PIxc&list=PLieiuudOXRG_U0DFUV1PXduTnFtiWMnrE&index=2
--Healthbar script by AquaStrikr (https://twitter.com/AquaStrikr_)

--Middlescroll event (fnf vs sonic psych engine) https://www.mediafire.com/file/k8ulkn7v04lahlq/middlescroll.rar/file





-- dialogue script by Kitcaato


--






function onCreate()

    -- create: HUD BG Image
        if not lowQuality then
            makeAnimatedLuaSprite('ra7-HUD-img-03', 'ra7-HUD-3', -253, 0);
            luaSpriteAddAnimationByPrefix('ra7-HUD-img-03', 'Anim', 'BH HUD', 10, true);
            addLuaSprite('ra7-HUD-img-03')
            setObjectOrder('ra7-HUD-img-03', 3)
            scaleObject('ra7-HUD-img-03', 6, 6)
            setProperty('ra7-HUD-img-03.antialiasing', false);
        else
            makeLuaSprite('ra7-HUD-img-03', 'ra7-HUD-3', -253, 0);            
            setObjectOrder('ra7-HUD-img-03', 3)
            scaleObject('ra7-HUD-img-03', 6, 6)
            setProperty('ra7-HUD-img-03.antialiasing', false);
        end


 
    -- create: FG glitchy radio
    if not lowQuality then
        makeAnimatedLuaSprite('glitchyRadio', 'GIFfany_RadioGlitch', 0, 0);
        luaSpriteAddAnimationByPrefix('glitchyRadio', 'Anim', 'GIFfany_Radio idle', 6, true);
        addLuaSprite('glitchyRadio',true)
        scaleObject('glitchyRadio', 3, 3);
        setProperty('glitchyRadio.antialiasing', false);
        setObjectCamera('glitchyRadio', 'hud')
    end

    -- create: FG glitchy chair
    if not lowQuality then
        makeLuaSprite('ra7-BH-chair', 'brokenheartware_chair', 1004, 505)
        addLuaSprite('ra7-BH-chair')
        setObjectCamera('ra7-BH-chair', 'hud')
    end
        
    -- create: HUD Heart
	    makeLuaSprite('ra7-HUD-heartBH', 'hp-heart-BH', 850, 650)
	    addLuaSprite('ra7-HUD-heartBH')
        setObjectCamera('ra7-HUD-heartBH', 'hud')

    -- make invisible: original HUD
        setProperty('scoreTxt.visible', false)
	    setProperty('iconP1.visible', false)
	    setProperty('iconP2.visible', false)
        setProperty('healthBar.alpha', 0)
        setProperty('health', 0.5)

    --timebar visible from start + text and bar format
        setProperty('timeBar.alpha', 1)
        setProperty('timeBarBG.alpha', 1)
        setProperty('timeTxt.alpha', 1)

        setTextSize('timeTxt', 23)
        setTextFont('timeTxt', 'MonsterFriendFore.otf')
        setTextBorder('timeTxt', '9', '6b0050')

        setProperty('timeBar.scale.x', 0.295)
        setProperty('timeBarBG.scale.x', 0.295)
        setProperty('timeBar.scale.y', 1.2)
        setProperty('timeBarBG.scale.y', 1.2)

    -- TIME bar reposition

        setProperty('timeBar.x', 782)
        setProperty('timeBar.y', 794)

        setProperty('timeBarBG.x', 582)
        setProperty('timeBarBG.y', 194)

        setProperty('timeTxt.x', 432)
        setProperty('timeTxt.y', 675)

    -- create: SCORE Text
	    makeLuaText("HUDscoreText", "SCORE", 0, 1123, 70)
	    setTextAlignment("HUDscoreText", "center")
	    addLuaText("HUDscoreText")
        setObjectCamera("HUDscoreText", 'arrows')
        setTextSize('HUDscoreText', 23)
        setTextFont('HUDscoreText', 'MonsterFriendFore.otf')
        setTextBorder('HUDscoreText', '9', '6b0050')

    -- create: SCORE Numbers
	    makeLuaText("HUDscoreNums", "00000", 0, 1130, 120)
	    setTextAlignment("HUDscoreNums", "center")
	    addLuaText("HUDscoreNums")
        setObjectCamera("HUDscoreNums", 'arrows')
        setTextSize('HUDscoreNums', 20)
        setTextFont('HUDscoreNums', 'MonsterFriendFore.otf')
        setTextBorder('HUDscoreNums', '9', '6b0050')



    -- create: HEALTH Numbers
	    makeLuaText("HUDhealthNums", realHealth, 0, 908, 655)
	    setTextAlignment("HUDhealthNums", "center")
	    addLuaText("HUDhealthNums")
        setObjectCamera("HUDhealthNums", 'hud')
        setTextSize('HUDhealthNums', 25)
        setTextFont('HUDhealthNums', 'MonsterFriendFore.otf')
        setTextBorder('HUDhealthNums', '9', '6b0050')



    -- create: MISSES Text
	    makeLuaText("HUDmissesText", "MISSES", 0, 1155, 300)
	    addLuaText("HUDmissesText")
        setTextSize('HUDmissesText', 23)
        setObjectOrder('HUDmissesText', 3)

    -- create: MISSES Numbers
	    makeLuaText("HUDmissesNums", misses, 0, 1130, 330)
	    setTextAlignment("HUDmissesNums", "center")
	    addLuaText("HUDmissesNums")
        setTextSize('HUDmissesNums', 20)
        setTextBorder('HUDmissesNums', '9', '6b0050')



    -- create: TIME Text
	    makeLuaText("HUDtimeText", "TIME", 0, 585, 890)
	    setTextAlignment("HUDtimeText", "right")
	    addLuaText("HUDtimeText")
        setObjectCamera("HUDtimeText", 'arrows')
        setTextSize('HUDtimeText', 23)
        setTextFont('HUDtimeText', 'MonsterFriendFore.otf')
        setTextBorder('HUDtimeText', '9', '6b0050')



    -- create: RANK Text
	    makeLuaText("HUDrankText", "RANK", 0, 52, 86)
	    setTextAlignment("HUDrankText", "right")
	    addLuaText("HUDrankText")
        setObjectCamera("HUDrankText", 'arrows')
        setTextSize('HUDrankText', 23)
        setTextFont('HUDrankText', 'MonsterFriendFore.otf')
        setTextBorder('HUDrankText', '9', '6b0050')



    -- create: RANK letters
	    makeLuaSprite('ra7-rankSS', 'ra7-rank-SS', -180, 282)
	    addLuaSprite('ra7-rankSS',true)
        scaleObject('ra7-rankSS', 1, 1)
        setProperty('ra7-rankSS.alpha', 0)

        makeLuaSprite('ra7-rankS', 'ra7-rank-S', -180, 282)
	    addLuaSprite('ra7-rankS',true)
        scaleObject('ra7-rankS', 0.9, 0.9)
        setProperty('ra7-rankS.alpha', 0)

        makeLuaSprite('ra7-rankA', 'ra7-rank-A', -180, 282)
	    addLuaSprite('ra7-rankA',true)
        scaleObject('ra7-rankA', 0.9, 0.9)
        setProperty('ra7-rankA.alpha', 0)

        makeLuaSprite('ra7-rankB', 'ra7-rank-B', -180, 282)
	    addLuaSprite('ra7-rankB',true)
        scaleObject('ra7-rankB', 0.9, 0.9)
        setProperty('ra7-rankB.alpha', 0)

        makeLuaSprite('ra7-rankC', 'ra7-rank-C', -180, 282)
	    addLuaSprite('ra7-rankC',true)
        scaleObject('ra7-rankC', 0.9, 0.9)
        setProperty('ra7-rankC.alpha', 0)

        makeLuaSprite('ra7-rankD', 'ra7-rank-D', -180, 282)
	    addLuaSprite('ra7-rankD',true)
        scaleObject('ra7-rankD', 0.9, 0.9)
        setProperty('ra7-rankD.alpha', 0)

        makeLuaSprite('ra7-rankE', 'ra7-rank-E', -180, 282)
	    addLuaSprite('ra7-rankE',true)
        scaleObject('ra7-rankE', 0.9, 0.9)
        setProperty('ra7-rankE.alpha', 0)

        makeLuaSprite('ra7-rankFp', 'ra7-rank-Fp', -180, 282)
	    addLuaSprite('ra7-rankFp',true)
        scaleObject('ra7-rankFp', 0.9, 0.9)
        setProperty('ra7-rankFp.alpha', 0)

        makeLuaSprite('ra7-rankF', 'ra7-rank-F', -180, 282)
	    addLuaSprite('ra7-rankF',true)
        scaleObject('ra7-rankF', 0.9, 0.9)
        setProperty('ra7-rankF.alpha', 0)

        makeLuaSprite('ra7-rankX', 'ra7-rank-X', -180, 282)
	    addLuaSprite('ra7-rankX',true)
        scaleObject('ra7-rankX', 0.9, 0.9)
        setProperty('ra7-rankX.alpha', 0)



    -- create: SONG Credits name
	    makeLuaText('watermark', songName, 0, 14, 655); -- You can edit the created by Prisma Text just dont change anything else
	    setTextAlignment("watermark", "left")
        addLuaText('watermark');
        setObjectCamera("watermark", 'hud')
        setTextSize('watermark', 20)
        setTextFont('watermark', 'MonsterFriendFore.otf')
        setTextBorder('watermark', '9', '6b0050')

    -- create: SONG Credits by
    makeLuaText('watermark2', "-by MAKYUNI-", 0, 14, 685); -- You can edit the created by Prisma Text just dont change anything else
    setTextAlignment("watermark2", "left")
    addLuaText('watermark2');
    setObjectCamera("watermark2", 'hud')
    setTextSize('watermark2', 15)
    setTextFont('watermark2', 'MonsterFriendFore.otf')
    setTextBorder('watermark2', '9', '6b0050')

    -- create: black
    makeLuaSprite('ra7-blackFG', 'ra7-black', -24, 0)
    addLuaSprite('ra7-blackFG',true)
    setObjectCamera('ra7-blackFG', 'hud')
    setProperty('ra7-blackFG.alpha', 0)
        
end









-- IDK what this is
function roundDecimal(num, numDecimalPlaces) -- stolen from stackoverflow :hue:
	local mult = 10^(numDecimalPlaces or 0);
	return math.floor(num * mult + 0.5) / mult;
end



function onUpdate()

    --arrows pos and alpha - BH

    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
    end




    -- health heart boppin
	scaleObject('ra7-HUD-heartBH', getProperty('iconP1.scale.x')/5, getProperty('iconP1.scale.y')/5)

    -- update: SCORE Numbers

        if score <= 0 then
            setTextString("HUDscoreNums", "00000")
        end

        if score > 0 and score < 10 then
            setTextString("HUDscoreNums", "00000" .. score / 10)
        end

        if score >= 10 and score < 100 then
            setTextString("HUDscoreNums", "0000" .. score / 10)
        end

        if score >= 100 and score < 1000 then
            setTextString("HUDscoreNums", "000" .. score / 10)
        end

        if score >= 1000 and score < 10000 then
            setTextString("HUDscoreNums", "00" .. score / 10)
        end

        if score >= 10000 then
            setTextString("HUDscoreNums", score)
        end

        if score >= 100000 then
            setProperty(score, 99999)
        end


    -- update: HEALTH Numbers
	realHealth = getProperty('health') * 100 / 2 
      
    if realHealth >= 100 then
        setTextString("HUDhealthNums", "100")  
    end

    if realHealth < 100 then
        setTextString("HUDhealthNums", "0" .. math.modf(realHealth))
    end

    if realHealth < 10 then
        setTextString("HUDhealthNums", "00" .. math.modf(realHealth))
    end



    -- update: MISS Numbers
	setTextString("HUDmissesNums", misses)

        if misses < 0 then
            setTextString("HUDmissesNums", "00000")
        end

        if misses >= 0 and misses < 10 then
            setTextString("HUDmissesNums", "0000" .. misses)
        end

        if misses >= 10 and misses < 100 then
            setTextString("HUDmissesNums", "000" .. misses)
        end

        if misses >= 100 and misses < 1000 then
            setTextString("HUDmissesNums", "00" .. misses)
        end

        if misses >= 1000 and misses < 10000 then
            setTextString("HUDmissesNums", "0" .. misses)
        end

        if misses >= 10000 then
            setTextString("HUDmissesNums", misses)
        end

        if misses >= 100000 then
            setProperty(misses, 99999)
        end





    --update: ranks part 1

    accuracy = tostring(roundDecimal(getProperty('ratingPercent') * 100, 2))
    if #accuracy == 1 then
        accuracy = '0' .. accuracy .. '.00'
    elseif #accuracy == 2 then
        accuracy = accuracy .. '.00'
    elseif #accuracy == 4 then
        accuracy = accuracy .. '0'
    end

    bruhaccuracy = roundDecimal(getProperty('ratingPercent') * 100, 2)

    --SS aka S+
    if bruhaccuracy >= 100 then
        setProperty('ra7-rankSS.alpha', 1)
    else
        setProperty('ra7-rankSS.alpha', 0)
    end

    --S
    if bruhaccuracy <= 99 and bruhaccuracy > 89 then
        setProperty('ra7-rankS.alpha', 1)
    else
        setProperty('ra7-rankS.alpha', 0)
    end

    if bruhaccuracy <= 89 and bruhaccuracy > 79 then
        setProperty('ra7-rankA.alpha', 1)
    else
        setProperty('ra7-rankA.alpha', 0)
    end

    if bruhaccuracy <= 79 and bruhaccuracy > 69 then
        setProperty('ra7-rankB.alpha', 1)
    else
        setProperty('ra7-rankB.alpha', 0)
    end

    if bruhaccuracy <= 69 and bruhaccuracy > 59 then -- nice
        setProperty('ra7-rankC.alpha', 1)
    else
        setProperty('ra7-rankC.alpha', 0)
    end

    if bruhaccuracy <= 59 and bruhaccuracy > 49 then
        setProperty('ra7-rankD.alpha', 1)
    else
        setProperty('ra7-rankD.alpha', 0)
    end

    if bruhaccuracy <= 49 and bruhaccuracy > 39 then
        setProperty('ra7-rankE.alpha', 1)
    else
        setProperty('ra7-rankE.alpha', 0)
    end

    if bruhaccuracy <= 39 and bruhaccuracy > 29 then
        setProperty('ra7-rankF.alpha', 1)
    else
        setProperty('ra7-rankF.alpha', 0)
    end

    if bruhaccuracy <= 29 and bruhaccuracy > 0 then
        setProperty('ra7-rankFp.alpha', 1)
    else
        setProperty('ra7-rankFp.alpha', 0)
    end

    if bruhaccuracy <= 0 then
        setProperty('ra7-rankX.alpha', 1)
    else
        setProperty('ra7-rankX.alpha', 0)
    end





end














