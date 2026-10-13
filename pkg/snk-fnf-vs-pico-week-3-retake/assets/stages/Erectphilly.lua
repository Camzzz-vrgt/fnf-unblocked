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
	scaleObject('train',1.2,1.2)
	scaleObject('train2',1.2,1.2)
	
	makeAnimatedLuaSprite('smoke','ErectPhilly/smoke',-620,-370)
	scaleObject('smoke',1.2,1.2)
	addAnimationByPrefix('smoke','idle','Smoke smoke',24, true)
	setScrollFactor('smoke', 0, 0)
	
	setScrollFactor('sky', 1.2, 1.2)
	setScrollFactor('buildings', 1.1, 1.1)
	setScrollFactor('buildings2', 1.16, 1.16)
	setScrollFactor('train', 1.0, 1.0)
	setScrollFactor('train2', 1.05, 1.05)
	setScrollFactor('smoke', 1.0, 1.0)
	
	addLuaSprite('sky',false)
	addLuaSprite('buildings2',false)
	addLuaSprite('buildings',false)
	addLuaSprite('train2',false)
	addLuaSprite('train',false)
	addLuaSprite('smoke',true)

end