--[[
	CREDITS:
        - script by Zbyszeq#9088
        - overhual and optimized by Cherri#0815
		
	--might change this idk
]]--
local generateSakura = false
local options = {
    Particle = {
        imagePath = 'bg/petal',
        name = 'petal',
        startY = -650,
        destinationY = 1500,
        minimumX = -500,
        maximumX = 3000,
		minvarX = -300,
		maxvarX = 300,
        speed = 4,
        overlapping = true,
        animated = true,
        commonity = 7,
        scaleX = 1,
        scaleY = 1,
        animationName = 'petal',
        frameRate = 24
    },
    ParticleNum = 0,
    generateParticles = true
}

function onEvent(name)
    if name == 'Toggle Sakura' then
        generateSakura = true
    end
end

function onUpdate()
	if generateSakura then
		if getRandomInt(1, options.Particle.commonity) == 1 then
			options.ParticleNum = options.ParticleNum + 1
			(options.Particle.animated and makeAnimatedLuaSprite or makeLuaSprite)(options.Particle.name .. options.ParticleNum, options.Particle.imagePath, getRandomInt(options.Particle.minimumX, options.Particle.maximumX), options.Particle.startY)
			scaleObject(options.Particle.name .. options.ParticleNum, options.Particle.scaleX, options.Particle.scaleY)
			addLuaSprite(options.Particle.name .. options.ParticleNum, options.Particle.overlapping)
			doTweenY('particleweeee' .. options.ParticleNum, options.Particle.name .. options.ParticleNum, options.Particle.destinationY, options.Particle.speed, 'sineInOut')
			doTweenX('particlewaaaa' .. options.ParticleNum, options.Particle.name .. options.ParticleNum, getRandomInt(options.Particle.minimumX, options.Particle.maximumX) + getRandomInt(options.Particle.minvarX, options.Particle.maxvarX), options.Particle.speed, 'sineInOut')
			if options.Particle.animated then 
				addAnimationByPrefix(options.Particle.name .. options.ParticleNum, 'particleanim', options.Particle.animationName, options.Particle.frameRate, true)
			end
		end
	end
end