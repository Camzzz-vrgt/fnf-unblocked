function onCreate()
    --background
	makeLuaSprite('sky','ErectPhilly/sky',-680,-360)
	makeLuaSprite('train','ErectPhilly/train',-680,-360)
	makeLuaSprite('train2','ErectPhilly/train2',-680,-360)
	makeLuaSprite('buildings','ErectPhilly/buildings',-680,-360)
	makeLuaSprite('buildings2','ErectPhilly/buildings2',-680,-360)
	
	scaleObject('sky',1.2,1.2)
	scaleObject('buildings',1.2,1.2)
	scaleObject('buildings2',1.2,1.2)
	scaleObject('train2',1.2,1.2)
	
	makeAnimatedLuaSprite('smoke','ErectPhilly/smoke',-620,-370)
	scaleObject('smoke',1.2,1.2)
	addAnimationByPrefix('smoke','idle','Smoke smoke',24, true)
	setScrollFactor('smoke', 0, 0)
	
	makeAnimatedLuaSprite('train','ErectPhilly/trainA',-620,-370)
	scaleObject('train',1.2,1.2)
	addAnimationByPrefix('train','idle','trainA idle',24, true)
	setScrollFactor('train', 1.0, 1.0)
	
	makeAnimatedLuaSprite('AdalD','ErectPhilly/AD',-620,-370)
	scaleObject('AdalD',1.25,1.25)
	addAnimationByPrefix('AdalD','idle','AD idle',24, true)
	setScrollFactor('AdalD', 1.4, 1.4)
	
	setScrollFactor('sky', 1.2, 1.2)
	setScrollFactor('buildings', 1.1, 1.1)
	setScrollFactor('buildings2', 1.16, 1.16)
	setScrollFactor('train2', 1.05, 1.05)
	setScrollFactor('smoke', 1.0, 1.0)
	
	addLuaSprite('sky',false)
	addLuaSprite('buildings2',false)
	addLuaSprite('buildings',false)
	addLuaSprite('train2',false)
	addLuaSprite('train',false)
	addLuaSprite('smoke',true)
	addLuaSprite('AdalD',true)

end