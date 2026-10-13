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
        if downscroll == true then
	        makeLuaSprite('ra7-HUD-img-01', 'ra7-HUD-1-down', -24, 0)
	        addLuaSprite('ra7-HUD-img-01')
	        setObjectCamera('ra7-HUD-img-01', 'hud')
            scaleObject('ra7-HUD-img-01', 6, 6)
            setProperty('ra7-HUD-img-01.antialiasing', false);
        else
            makeLuaSprite('ra7-HUD-img-01', 'ra7-HUD-1-up', -24, 0)
	        addLuaSprite('ra7-HUD-img-01')
	        setObjectCamera('ra7-HUD-img-01', 'hud') 
            scaleObject('ra7-HUD-img-01', 6, 6)
            setProperty('ra7-HUD-img-01.antialiasing', false);      
        end

    -- create: HUD Heart
	    makeLuaSprite('ra7-HUD-heart', 'hp-heart', 1123, 92)
	    addLuaSprite('ra7-HUD-heart')
	    setObjectCamera('ra7-HUD-heart', 'hud')

    -- make invisible: original HUD
        setProperty('scoreTxt.visible', false)
	    setProperty('iconP1.visible', false)
	    setProperty('iconP2.visible', false)
	    setProperty('iconP1.y', 540)
	    setProperty('iconP2.y', 540)
        setProperty('healthBar.alpha', 0)
        setProperty('health', 1)

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

        setProperty('timeBar.x', 982)
        setProperty('timeBar.y', 594)

        setProperty('timeBarBG.x', 982)
        setProperty('timeBarBG.y', 594)

        setProperty('timeTxt.x', 982)
        setProperty('timeTxt.y', 545)

    -- create: SCORE Text
	    makeLuaText("HUDscoreText", "SCORE", 0, 1123, 180)
	    setTextAlignment("HUDscoreText", "center")
	    addLuaText("HUDscoreText")
        setObjectCamera("HUDscoreText", 'hud')
        setTextSize('HUDscoreText', 23)
        setTextFont('HUDscoreText', 'MonsterFriendFore.otf')
        setTextBorder('HUDscoreText', '9', '6b0050')

    -- create: SCORE Numbers
	    makeLuaText("HUDscoreNums", "00000", 0, 1130, 250)
	    setTextAlignment("HUDscoreNums", "center")
	    addLuaText("HUDscoreNums")
        setObjectCamera("HUDscoreNums", 'hud')
        setTextSize('HUDscoreNums', 20)
        setTextFont('HUDscoreNums', 'MonsterFriendFore.otf')
        setTextBorder('HUDscoreNums', '9', '6b0050')



    -- create: HEALTH Text
	    makeLuaText("HUDhealthText", "HEALTH", 0, 1112, 30)
	    setTextAlignment("HUDhealthText", "center")
	    addLuaText("HUDhealthText")
        setObjectCamera("HUDhealthText", 'hud')
        setTextSize('HUDhealthText', 23)
        setTextFont('HUDhealthText', 'MonsterFriendFore.otf')
        setTextBorder('HUDhealthText', '9', '6b0050')

    -- create: HEALTH Numbers
	    makeLuaText("HUDhealthNums", realHealth, 0, 1168, 96)
	    setTextAlignment("HUDhealthNums", "center")
	    addLuaText("HUDhealthNums")
        setObjectCamera("HUDhealthNums", 'hud')
        setTextSize('HUDhealthNums', 25)
        setTextFont('HUDhealthNums', 'MonsterFriendFore.otf')
        setTextBorder('HUDhealthNums', '9', '6b0050')



    -- create: MISSES Text
	    makeLuaText("HUDmissesText", "MISSES", 0, 1115, 330)
	    setTextAlignment("HUDmissesText", "center")
	    addLuaText("HUDmissesText")
        setObjectCamera("HUDmissesText", 'hud')
        setTextSize('HUDmissesText', 23)
        setTextFont('HUDmissesText', 'MonsterFriendFore.otf')
        setTextBorder('HUDmissesText', '9', '6b0050')

    -- create: MISSES Numbers
	    makeLuaText("HUDmissesNums", misses, 0, 1130, 400)
	    setTextAlignment("HUDmissesNums", "center")
	    addLuaText("HUDmissesNums")
        setObjectCamera("HUDmissesNums", 'hud')
        setTextSize('HUDmissesNums', 20)
        setTextFont('HUDmissesNums', 'MonsterFriendFore.otf')
        setTextBorder('HUDmissesNums', '9', '6b0050')



    -- create: TIME Text
	    makeLuaText("HUDtimeText", "TIME", 0, 1136, 480)
	    setTextAlignment("HUDtimeText", "right")
	    addLuaText("HUDtimeText")
        setObjectCamera("HUDtimeText", 'hud')
        setTextSize('HUDtimeText', 23)
        setTextFont('HUDtimeText', 'MonsterFriendFore.otf')
        setTextBorder('HUDtimeText', '9', '6b0050')



    -- create: RANK Text
	    makeLuaText("HUDrankText", "RANK", 0, 52, 216)
	    setTextAlignment("HUDrankText", "right")
	    addLuaText("HUDrankText")
        setObjectCamera("HUDrankText", 'hud')
        setTextSize('HUDrankText', 23)
        setTextFont('HUDrankText', 'MonsterFriendFore.otf')
        setTextBorder('HUDrankText', '9', '6b0050')



    -- create: RANK letters
	    makeLuaSprite('ra7-rankSS', 'ra7-rank-SS', 42, 282)
	    addLuaSprite('ra7-rankSS')
	    setObjectCamera('ra7-rankSS', 'hud')
        scaleObject('ra7-rankSS', 1, 1)
        setProperty('ra7-rankSS.alpha', 0)

        makeLuaSprite('ra7-rankS', 'ra7-rank-S', 42, 282)
	    addLuaSprite('ra7-rankS')
	    setObjectCamera('ra7-rankS', 'hud')
        scaleObject('ra7-rankS', 0.9, 0.9)
        setProperty('ra7-rankS.alpha', 0)

        makeLuaSprite('ra7-rankA', 'ra7-rank-A', 42, 282)
	    addLuaSprite('ra7-rankA')
	    setObjectCamera('ra7-rankA', 'hud')
        scaleObject('ra7-rankA', 0.9, 0.9)
        setProperty('ra7-rankA.alpha', 0)

        makeLuaSprite('ra7-rankB', 'ra7-rank-B', 42, 282)
	    addLuaSprite('ra7-rankB')
	    setObjectCamera('ra7-rankB', 'hud')
        scaleObject('ra7-rankB', 0.9, 0.9)
        setProperty('ra7-rankB.alpha', 0)

        makeLuaSprite('ra7-rankC', 'ra7-rank-C', 42, 282)
	    addLuaSprite('ra7-rankC')
	    setObjectCamera('ra7-rankC', 'hud')
        scaleObject('ra7-rankC', 0.9, 0.9)
        setProperty('ra7-rankC.alpha', 0)

        makeLuaSprite('ra7-rankD', 'ra7-rank-D', 42, 282)
	    addLuaSprite('ra7-rankD')
	    setObjectCamera('ra7-rankD', 'hud')
        scaleObject('ra7-rankD', 0.9, 0.9)
        setProperty('ra7-rankD.alpha', 0)

        makeLuaSprite('ra7-rankE', 'ra7-rank-E', 42, 282)
	    addLuaSprite('ra7-rankE')
	    setObjectCamera('ra7-rankE', 'hud')
        scaleObject('ra7-rankE', 0.9, 0.9)
        setProperty('ra7-rankE.alpha', 0)

        makeLuaSprite('ra7-rankFp', 'ra7-rank-Fp', 42, 282)
	    addLuaSprite('ra7-rankFp')
	    setObjectCamera('ra7-rankFp', 'hud')
        scaleObject('ra7-rankFp', 0.9, 0.9)
        setProperty('ra7-rankFp.alpha', 0)

        makeLuaSprite('ra7-rankF', 'ra7-rank-F', 42, 282)
	    addLuaSprite('ra7-rankF')
	    setObjectCamera('ra7-rankF', 'hud')
        scaleObject('ra7-rankF', 0.9, 0.9)
        setProperty('ra7-rankF.alpha', 0)

        makeLuaSprite('ra7-rankX', 'ra7-rank-X', 42, 282)
	    addLuaSprite('ra7-rankX')
	    setObjectCamera('ra7-rankX', 'hud')
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
        
end









-- IDK what this is
function roundDecimal(num, numDecimalPlaces) -- stolen from stackoverflow :hue:
	local mult = 10^(numDecimalPlaces or 0);
	return math.floor(num * mult + 0.5) / mult;
end



function onUpdate()

    -- health heart boppin
	scaleObject('ra7-HUD-heart', getProperty('iconP1.scale.x')/5, getProperty('iconP1.scale.y')/5)

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



    --arrows pos and alpha

    for i = 0,3 do
        setPropertyFromGroup('strumLineNotes', i, 'alpha', 0)
    end






end














