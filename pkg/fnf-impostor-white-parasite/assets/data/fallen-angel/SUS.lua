function onUpdate()

if curStep == 656 then
								setProperty('gf.visible', false)
								setProperty('dad.visible', false)
								setProperty('boyfriend.visible', false)
		                        setProperty('Sky.alpha', 0)
                                setProperty('clod.alpha', 0)
                                setProperty('clod2.alpha', 0)
                                setProperty('clod3.alpha', 0)
								setProperty('box.alpha', 0)
		end

if curStep == 818 then
								setProperty('gf.visible', true)
								setProperty('dad.visible', true)
								setProperty('boyfriend.visible', true)
		                        setProperty('Sky.alpha', 1)
                                setProperty('clod.alpha', 1)
                                setProperty('clod2.alpha', 1)
                                setProperty('clod3.alpha', 1)
								setProperty('box.alpha', 1)
        end
end