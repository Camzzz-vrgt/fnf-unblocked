function onCreate()
	-- background shit
	makeLuaSprite('limoSunset2', 'HD LIMO/limoSunset', -520, -200);
	setLuaSpriteScrollFactor('limoSunset2', 0.1, 0.1);
    scaleObject('limoSunset2', 2.2, 2.2);

	makeAnimatedLuaSprite('limoDrive2', 'HD LIMO/limoDrive',-420, 550);
    setLuaSpriteScrollFactor('limoDrive2', 1, 1);
		  scaleObject('limoDrive2', 1.4, 1.4);
	makeAnimatedLuaSprite('street', 'HD LIMO/street',-1300, 550);
  
	makeAnimatedLuaSprite('bgLimo2','HD LIMO/bgLimo', -150, 480);
	setLuaSpriteScrollFactor('bgLimo2', 0.4, 0.4);


	addLuaSprite('limoSunset2', false);

	addLuaSprite('HD LIMO/street', false);
	addAnimationByPrefix('street', 'idle', 'street', 24, true);
	
	addLuaSprite('bgLimo2', false);
	addAnimationByPrefix('bgLimo2', 'idle', 'BG limo instance', 20, true); 
	addLuaSprite('limoDancer2', false);
	addAnimationByPrefix('limoDancer2', 'idle', 'bg dancer sketch PINK', 24, true); 
	addLuaSprite('limoDancer3', false);
	addAnimationByPrefix('limoDancer3', 'idle', 'bg dancer sketch PINK', 24, true);
	addLuaSprite('limoDancer4', false);
	addAnimationByPrefix('limoDancer4', 'idle', 'bg dancer sketch PINK', 24, true);
	addLuaSprite('limoDancer5', false);
	addAnimationByPrefix('limoDancer5', 'idle', 'bg dancer sketch PINK', 24, true);
	addLuaSprite('limoDrive2', false);

   
	
	makeAnimatedLuaSprite('rain', 'rain', 0, 0);

	setLuaSpriteScrollFactor('rain', 0.3, 0.3);

	scaleObject('rain', 0.85, 0.85);

	makeAnimatedLuaSprite('splash', 'splash', 0, 50);

	addLuaSprite('splash', false);
	addAnimationByPrefix('splash', 'loop', 'splash loop', 15, true);
	addLuaSprite('rain', true);
	addAnimationByPrefix('rain', 'loop', 'rain loop', 15, true);
    makeLuaText("Maker", '', 0, 25, 25)
    makeLuaText("Charter", "man", 0, 25, 75)
    setTextSize("Maker", 27)
    setTextFont("Maker", "vcr.ttf");
    setTextSize("Charter", 25)
    setTextFont("Charter", "vcr.ttf");
    makeLuaSprite("Disk", "other/disk", 325, 0)
    scaleObject('Disk', 0.4, 0.4);
    makeLuaSprite('Image', 0, 0)
    makeGraphic('Image', 400, 150, 'FF6ECC') --azul 00A6FF
    makeLuaSprite('Image2', 0, 0)
    makeGraphic('Image2', 400, 150, '000000')

    setProperty('Maker.y', 330);
    setProperty('Charter.y', 370); --este va 50 mas 
    setProperty('Disk.y', 364);
    setProperty('Image.y', 300);
    setProperty('Image2.y', 290);
-- Put the camera they will be in
    setObjectCamera("Maker", "other")
    setObjectCamera("Charter", "other")
    setObjectCamera('Disk', 'other')
    setObjectCamera('Image2', 'other')
    setObjectCamera('Image', 'other')
-- order of that they will be displayed in
    setObjectOrder('Maker', 4)
    setObjectOrder('Charter', 4)
    setObjectOrder('Disk', 3)
    setObjectOrder('Image2', 2)
    setObjectOrder('Image', 1)
-- Mix The stuff togheter
    addLuaSprite("Disk")
    addLuaText("Maker")
    addLuaText("Charter")
    addLuaSprite("Image")
    addLuaSprite("Image2")
-- Go out when the song starts just to come back when it starts. use your brain to caculate where they will go
-- so if the bg or here "Image" x is going to -500 and the text x is in 50 so you do -500+25 and thats -475 you do that so you wouldnt have delay belive me in the first version they were all going to -500
    doTweenX("Slideoutstart1", "Image", -480, 0.1, linear)
    doTweenX("Slideoutstart2", "Image2", -500, 0.1, linear)
    doTweenX("Slideoutstart3", "Maker", -475, 0.1, linear)
    doTweenX("Slideoutstart4", "Charter", -475, 0.1, linear)
    doTweenX("Slideoutstart5", "Disk", -175, 0.1, linear)

    setTextString("Maker", 'Music  :  ' ..songName)
    setTextString("Charter", "OPTIMIZED BY: BUNNY SKR")
end
function onSongStart()
        if songName == "Que buscas" then
            SongCharter = "Jeje"
        end
        setTextString("Charter", "ladro " .. SongCharter)
    end
function onStepHit()
-- Make it slide in and out
    if curStep == 1 then
        doTweenX("ImageTweenX", "Image", -20, 2.6, 'expoOut')
        doTweenX("Image2TweenX", "Image2", 0, 3.1, 'expoOut')
        doTweenX("SlideIn3", "Maker", 25, 2.6, 'expoOut')
        doTweenX("SlideIn4", "Charter", 25, 2.6, 'expoOut')
        doTweenX("SlideIn5", "Disk", 325, 3.1, 'expoOut')
        doTweenAngle("Spin", "Disk", 2000, 10, 'expoOut')
    end
    if curStep == 25 then
        doTweenX("ImageTweenX", "Image", -500, 2.9, 'expoIn')
        doTweenX("Image2TweenX", "Image2", -500, 2.6, 'expoIn')
        doTweenX("SlideOut3", "Maker", -475, 2.6, 'expoIn')
        doTweenX("SlideOut4", "Charter", -475, 2.6, 'expoIn')
        doTweenX("SlideOut5", "Disk", -175, 2.6, 'expoIn')
    end
end

function onTweenComplete(tag)
    if tag == "Spin" then
        removeLuaSprite("Image")
        removeLuaSprite("Image2")
        removeLuaSprite("Maker")
        removeLuaSprite("Charter")
        removeLuaSprite("Disk")
    end
-- OPTI BY BUNNYSKR
end