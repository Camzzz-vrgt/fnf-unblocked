local nameStage1 = 'room';
local nameStage2 = 'lab';

local sprMarqData = {};

function preloadImages(stage)
	local path = 'backgrounds/'..stage.. '/';

	if stage == nameStage1 then
		preloadImages(path..'orphanage');
	end

	if stage == nameStage2 then
		precacheImage(path..'Fondonegro');
		precacheImage(path..'Niebla_1');
		precacheImage(path..'Niebla_2');
		precacheImage(path..'stage2');
		precacheImage(path..'prototype');
	end
end

function createStage(stage)
	local path = 'backgrounds/'..stage.. '/';

	if stage == nameStage1 then
		makeLuaSprite('orphanage',path..'orphanage', 0, -200);
		addLuaSprite('orphanage',false);
	end

	if stage == nameStage2 then
		makeLuaSprite('bgBlack',path..'Fondonegro',-600,-600)
		scaleObject("bgBlack", 1.5,1.5)
		addLuaSprite('bgBlack',false)

		makeLuaSprite('stage2',path..'stage2',-600,-600)
		scaleObject("stage2", 1.5,1.5)
		addLuaSprite('stage2',false)

		makeAnimatedLuaSprite('prototype', path..'prototype', -600, -600)
		addAnimationByPrefix('prototype', 'anim', 'Manoprot0', 24, true)
		scaleObject("prototype", 1.5,1.5)
		addLuaSprite('prototype',false)

		addMarqueeSprite('bg5', path..'Niebla_1', -800, -1920, 3000, 5, -50, true);
		addMarqueeSprite('bg6', path..'Niebla_2', -900, -2000, 3000, 4, 30, false);
		for i = 0,5,1 do
			doTweenColor('nb1_'..i, 'mqspr:bg5_'..i, 'ff0000', 0.1, 'linear');
		end
		for i = 0,4,1 do
			doTweenColor('nb2_'..i, 'mqspr:bg6_'..i, 'ff0000', 0.1, 'linear');
		end
	end
end

function removeStage(stage,destroy)
	if stage == nameStage1 then
		removeLuaSprite('orphanage',destroy)
	end
end

function onCreate()
	preloadImages(nameStage1)
	preloadImages(nameStage2)

	createStage(nameStage1)
end

function onUpdate(elapsed)

end

function removeMarqueeSprite(name)
	local sprData = sprMarqData[name];
	if (sprData) then
		for i = 0,copies,1 do
			local sprName = 'mqspr:'..name..'_'..i;
			removeLuaSprite(sprName, true);
		end
	end
end

function addMarqueeSprite(name, src, x, y, width, copies, speed, ontop)
	removeMarqueeSprite(name);
	local sprData = {};
	sprData.name = name;
	sprData.src = src;
	sprData.width = width;
	sprData.copies = copies;
	copies = copies - 1;
	for i = 0,copies,1 do
		local sprName = 'mqspr:'..name..'_'..i;
		makeLuaSprite(sprName, src, x, y);
		local offset = i * width;
		if (speed >= 0) then
			offset = 0 - offset;
		end
		setProperty(sprName..'.x', x + offset);
		setProperty(sprName..'.velocity.x', speed);
		addLuaSprite(sprName, ontop);
	end
	sprMarqData[name] = sprData;
end

function onEvent(name,v1,v2)
	if name == 'Triggers Sleep Well' then
		if v1 == '2' then
			if v2 == '0' then
				cameraFlash("camGame", "FF0000", stepCrochet*0.001*4)
				createStage(nameStage2)
				removeStage(nameStage1,true)
			end
		end
	end
end