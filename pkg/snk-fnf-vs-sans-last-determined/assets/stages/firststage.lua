local u = false;
local r = 0;
local i =0
local shot = false;
local agent = 1
local health = 0;
local xx = 700
local yy = 550
local xx2 = 800
local yy2 = 550
local xx3 = 700
local yy3 = 375
local ofs = 15;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()
	-- background shit
	precacheImage('FlowerTrans')

	makeLuaSprite('bg1', 'ld/soat/BG1', -300, -120);
	setScrollFactor('bg1', 0.5, 0.5);

	makeLuaSprite('bg2', 'ld/soat/BG2', -300, -120);
	setScrollFactor('bg2', 0.6, 0.6);
	
	makeLuaSprite('bg3', 'ld/soat/BG3', -200, -130);
	setScrollFactor('bg3', 0.6, 0.6);

	if not lowQuality then
		makeLuaSprite('fg', 'ld/soat/BG4', -410, -100);
		setScrollFactor('fg', 1.3, 1.3);

		makeLuaSprite('bg6', 'ld/soat/BG6', -820, -120);
		setScrollFactor('bg6', 0.9, 0.9);
		setProperty('bg6.alpha', 0.4)
		setBlendMode('bg6', "add")

		makeLuaSprite('bg5', 'ld/soat/BG5', -800, -120);
		setScrollFactor('bg5', 0.9, 0.9);
		setProperty('bg5.alpha', 0.8)
		setBlendMode('bg5', "overlay") 
  
		makeAnimatedLuaSprite('BGparticles', 'ld/soat/particlesBG', -100, -120);
		setScrollFactor('BGparticles', 0.6, 0.6);
		addAnimationByPrefix('BGparticles', 'idle', 'particlesBG', 24, true)
		scaleObject('BGparticles', 0.8, 0.8)
		setProperty('BGparticles.blend', "add")
	
	end

	makeLuaSprite('black', '', -1000, -200);
	makeGraphic('black',1280,720,'000000')
	scaleObject('black', 2.5, 2.5)
	setObjectCamera('black', 'game')
	setProperty('black.alpha', 0)

	makeLuaSprite('black2', '', 0, 0);
	makeGraphic('black2',1280,720,'000000')
	setObjectCamera('black2', 'other')
	setProperty('black2.alpha', 1)

	makeLuaSprite('bones', 'ld/soat/bgbones', -400, 600);
	--scaleObject('bones', 2.5, 2.5)
	setObjectCamera('bones', 'game')
	setProperty('bones.visible', false)
	
	makeLuaSprite('blueGrad', 'ld/soat/blueGrad', -1000, -200);
	scaleObject('blueGrad', 2.5, 2.5)
	setObjectCamera('blueGrad', 'game')
	setProperty('blueGrad.alpha', 0)

	makeAnimatedLuaSprite('FlowerTrans', 'FlowerTrans', 0, 0);
	addAnimationByPrefix('FlowerTrans', 'FlowerTrans', 'FlowerTrans', 24, false)
	setObjectCamera('FlowerTrans','hud')

-- sec 2

	makeLuaSprite('bg21', 'ld/soat/2/SOAT1', -300, -120);
	setScrollFactor('bg21', 0.5, 0.5);
	setProperty('bg21.visible', false)

	makeLuaSprite('bg22', 'ld/soat/2/SOAT2', -300, -120);
	setScrollFactor('bg22', 0.6, 0.6);
	setProperty('bg22.visible', false)

	makeLuaSprite('bg23', 'ld/soat/2/SOAT3', -300, -120);
	setScrollFactor('bg23', 0.7, 0.7);
	setProperty('bg23.visible', false)

	makeLuaSprite('bg24', 'ld/soat/2/SOAT4OP', -160, -100);
	setScrollFactor('bg24', 0.8, 0.8);
	setProperty('bg24.visible', false)

	makeLuaSprite('bg25', 'ld/soat/2/SOAT5', -100, -120);
	setScrollFactor('bg25', 0.9, 0.9);
	setProperty('bg25.visible', false)
	setObjectOrder('bg25', getObjectOrder('boyfriendGroup') + 1)

	makeLuaSprite('bg26', 'ld/soat/2/SOAT6', -100, -100);
	setScrollFactor('bg26', 1, 1);
	setProperty('bg26.visible', false)

	makeLuaSprite('bg27', 'ld/soat/2/SOAT7', -80, -100);
	setScrollFactor('bg27', 1.1, 1.1);
	setProperty('bg27.visible', false)

	makeLuaSprite('bg210', 'ld/soat/2/SOAT10OP', -220, -100);
	setScrollFactor('bg210', 1.2, 1.2);
	setProperty('bg210.visible', false)
--
	
	addLuaSprite('bg1', false);
	addLuaSprite('bg2', false);
	addLuaSprite('bg3', false);

	addLuaSprite('bg21', false);
	addLuaSprite('bg22', false);
	addLuaSprite('bg23', false);
	addLuaSprite('bg24', false);
	--addLuaSprite('bg25', false);

	addLuaSprite('fg', true);

	addLuaSprite('bg26', true);
	--addLuaSprite('bg27', true);
	addLuaSprite('bg210', true);

	addLuaSprite('bg5', true);
	addLuaSprite('bg6', true);
	addLuaSprite('BGparticles', false);
	addLuaSprite('black', false);
	addLuaSprite('bones', false);
	addLuaSprite('blueGrad', true);
	addLuaSprite('black2', true);
	addLuaSprite('FlowerTrans', false);
end

------------------------------------------------------------

function onBeatHit()
	if curBeat % 4 == 0 then
		setProperty('bones.y', 250)
		doTweenY('bones', 'bones', 200, 0.3, 'sineOut')
	end
end

------------------------------------------------------------
function onCreatePost()
	doTweenColor('darkershade', 'bg5', '212121', 0.2, 'linear')
	setProperty('gf.visible', false)
	--setProperty('FlowerTrans.visible', false)

   initLuaShader("imageScroll")

 setSpriteShader('bones',"imageScroll")
end

------------------------------------------------------------

function onCountdownTick(Counter)
	if Counter >= 0 then
		doTweenAlpha('darkershade2', 'bg5', 0.6, 1, 'linear')
		--setProperty('FlowerTrans.visible', false)
		--objectPlayAnimation('FlowerTrans', 'FlowerTrans');
	end
	if Counter == 0 then
		doTweenAlpha('darkFade', 'black2', 0, 1, 'sineInOut')
		objectPlayAnimation('FlowerTrans', 'FlowerTrans');
	end
	if Counter == 3 then
		setProperty('FlowerTrans.visible', false)
	end
end

------------------------------------------------------------

function onUpdate(elapsed) --particle movement
	setShaderFloat("bones", "iTime", os.clock() / 5)

	if curStep >= 0 then
		  doTweenY('BGParticlesGoWheeee', 'BGparticles', 70-70*math.sin((((getSongPosition()/2000)*(bpm/120))*0.25)*math.pi),0.000001, 'circInOut')
		  doTweenX('BGParticlesGoWheee', 'BGparticles', -360 - 30+30*math.cos((((getSongPosition()/500)*(bpm/120))*0.25)*math.pi),0.0000001, 'circInOut')
	end
	if songName == 'start-of-a-tale' then
		if curStep >= 782 and curStep <= 1048 then
			doTweenAlpha('blueGradA', 'blueGrad', 2-4*math.sin((((getSongPosition()/2000)*(bpm/30))*0.1)*math.pi),0.000001, 'circInOut')
		end
	end
	if songName == 'the finale' then
		if curStep >= 784 and curStep <= 1040 then
			doTweenAlpha('blueGradA', 'blueGrad', 2-4*math.sin((((getSongPosition()/2000)*(bpm/30))*0.1)*math.pi),0.000001, 'circInOut')
		end
	end

	if songName == 'start-of-a-tale' then
		if curStep >= 504 and curStep <= 512 then
			xx = 500
			yy = 550
			xx2 = 500
			yy2 = 550
		end
		if curStep >= 512 then
			xx = 700
			yy = 550
			xx2 = 800
			yy2 = 550
		end
	end

	daElapsed = elapsed * 30
	i = i + daElapsed

	--daYvalue = 
	
	--setProperty('dad.y', (math.sin(i/20)*75) + 200)
	--yy = (math.sin(i/20)*75) + 650

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
	if followchars == true then
		if mustHitSection == false then
			--setProperty('defaultCamZoom', getProperty('defaultCamZoom'))
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx-ofs,yy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx+ofs,yy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',xx,yy-ofs)
			end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx,yy+ofs)
			end
			if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
				triggerEvent('Camera Follow Pos',xx-ofs,yy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
				triggerEvent('Camera Follow Pos',xx+ofs,yy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
				triggerEvent('Camera Follow Pos',xx,yy-ofs)
			end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
				triggerEvent('Camera Follow Pos',xx,yy+ofs)
			end
			if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
				triggerEvent('Camera Follow Pos',xx,yy)
			end
			if getProperty('dad.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',xx,yy)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'coolhey' then
				triggerEvent('Camera Follow Pos',xx2,yy2)
			end
			if getProperty('dad.animation.curAnim.name') == 'dead' then
				triggerEvent('Camera Follow Pos',450,500)
				setProperty('defaultCamZoom',0.9)
			end
			if getProperty('dad.animation.curAnim.name') == 'deadLoop' then
				--triggerEvent('Camera Follow Pos',450,500)
				setProperty('defaultCamZoom',0.9)
			end
			if getProperty('dad.animation.curAnim.name') == 'confirm' then
				triggerEvent('Camera Follow Pos',450,500)
				setProperty('defaultCamZoom',0.9)
			end
			if getProperty('dad.animation.curAnim.name') == 'confirmLoop' then
				triggerEvent('Camera Follow Pos',450,500)
				setProperty('defaultCamZoom',0.9)
			end
		else
	
			--setProperty('defaultCamZoom', getProperty('defaultCamZoom'))
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
				triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
				triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
				triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
				triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
				triggerEvent('Camera Follow Pos',xx2,yy2)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
				triggerEvent('Camera Follow Pos',xx2,yy2)
			end
			if gfSection == true then
				--setProperty('defaultCamZoom',1)
				if getProperty('gf.animation.curAnim.name') == 'singLEFT' then
					triggerEvent('Camera Follow Pos',xx3-ofs,yy3)
				end
				if getProperty('gf.animation.curAnim.name') == 'singRIGHT' then
					triggerEvent('Camera Follow Pos',xx3+ofs,yy3)
				end
				if getProperty('gf.animation.curAnim.name') == 'singUP' then
					triggerEvent('Camera Follow Pos',xx3,yy3-ofs)
				end
				if getProperty('gf.animation.curAnim.name') == 'singDOWN' then
					triggerEvent('Camera Follow Pos',xx3,yy3+ofs)
				end
				if getProperty('boyfriend.animation.curAnim.name') == 'coolhey' then
					triggerEvent('Camera Follow Pos',xx2,yy2)
				end
				if getProperty('gf.animation.curAnim.name') == 'hey' then
					triggerEvent('Camera Follow Pos',xx3,yy3)
				end
				if getProperty('gf.animation.curAnim.name') == 'danceLeft' then
					triggerEvent('Camera Follow Pos',xx3,yy3)
				end
				if getProperty('gf.animation.curAnim.name') == 'danceRight' then
					triggerEvent('Camera Follow Pos',xx3,yy3)
				end
			end
		end
	else
		triggerEvent('Camera Follow Pos','','')
	end
end

------------------------------------------------------------

function onStepHit()
	if songName == 'start-of-a-tale' then
		if curStep == 504 then
			doTweenZoom('camz', 'camGame', 1, 0.7, 'sineInOut')
		end
		if curStep == 512 then
			doTweenZoom('camz', 'camGame', 0.8, 1, 'sineInOut')
		end
		if curStep == 776 then
			setProperty('black.alpha', 1)
			doTweenAlpha('black', 'black', 0, 0.2, 'sineOut')
		end
		if curStep == 778 then
			setProperty('black.alpha', 1)
			doTweenAlpha('black', 'black', 0, 0.2, 'sineOut')
		end
		if curStep == 780 then
			setProperty('black2.alpha', 1)
		end
		if curStep == 782 then
			setProperty('black2.alpha', 0)
			setProperty('black.alpha', 1)
			setProperty('fg.alpha', 0)
			setProperty('bg5.visible', false)
			setProperty('bg6.visible', false)
	
			setProperty('blueGrad.alpha', 1)
			setProperty('bones.visible', true)
		end
		if curStep == 1040 then
			setProperty('FlowerTrans.visible', true)
			objectPlayAnimation('FlowerTrans', 'FlowerTrans');
		end
		if curStep == 1048 then
			--doTweenAlpha('black', 0, 0.5, 'sineInOut')
			setProperty('black.alpha', 0)
			setProperty('fg.alpha', 0)
			setProperty('bg5.visible', true)
			setProperty('bg6.visible', true)
			setProperty('bg5.alpha', 0.3)

			setProperty('bg5.x', -800 + 70)
			setProperty('bg6.x', -820 + 70)
	
			setProperty('blueGrad.visible', false)

			removeLuaSprite('bg1', true)
			removeLuaSprite('bg2', true)
			removeLuaSprite('bg3', true)
			removeLuaSprite('bones', true)

			setProperty('bg21.visible', true)
			setProperty('bg22.visible', true)
			setProperty('bg23.visible', true)
			setProperty('bg24.visible', true)
			setProperty('bg26.visible', true)
			setProperty('bg210.visible', true)

			setObjectOrder('dadGroup', getObjectOrder('bg25') + 1)

			setProperty('defaultCamZoom',0.7)
		end
		if curStep == 1936 then
			doTweenAlpha('darkFade', 'black2', 1, 14, 'linear')
		end
	end
	if songName == 'the finale' then
		if curStep == 776 then
			setProperty('black.alpha', 1)
			doTweenAlpha('black', 'black', 0, 0.2, 'sineOut')
		end
		if curStep == 777 then
			setProperty('black.alpha', 1)
			doTweenAlpha('black', 'black', 0, 0.2, 'sineOut')
		end
		if curStep == 778 then
			setProperty('black2.alpha', 1)
		end
		if curStep == 784 then
			setProperty('black2.alpha', 0)
			setProperty('black.alpha', 1)
			setProperty('fg.alpha', 0)
			setProperty('bg5.visible', false)
			setProperty('bg6.visible', false)
			setProperty('blueGrad.alpha', 1)
			setProperty('bones.visible', true)
		end
		if curStep == 1040 then
			setProperty('black.alpha', 0)
			setProperty('fg.alpha', 1)
			setProperty('bg5.visible', true)
			setProperty('bg6.visible', true)
			setProperty('blueGrad.visible', false)
			removeLuaSprite('bones', true)
		end
	end
end

------------------------------------------------------------

function onTweenCompleted(name)
	if name == 'camz' then
			setProperty("defaultCamZoom",getProperty('camGame.zoom')) 
	end
end