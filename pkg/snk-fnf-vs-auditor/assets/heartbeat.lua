function onCreate()
	makeLuaSprite('heartbeatvg', 'hellbg/redVGveins', 0, 0);
	setObjectCamera('heartbeatvg', 'camOther');
	setProperty('heartbeatvg.alpha', 0);
	addLuaSprite('heartbeatvg', true);
end


function onEvent(name, value1, value2)

    if name == "heartbeat" then
		if value1 == '' then
			setProperty('heartbeatvg.alpha', 1);
		else
			setProperty('heartbeatvg.alpha', value1);
		end
		setProperty('heartbeatvg.alpha', 1);
		doTweenAlpha('heartbeatvgalpha', 'heartbeatvg', 0, 0.6, 'quadOut');
        setProperty('camGame.zoom', getProperty('defaultCamZoom') + 0.05);
        doTweenZoom('thump', 'camGame', getProperty('defaultCamZoom'), 0.6, 'quadOut');
	end
end