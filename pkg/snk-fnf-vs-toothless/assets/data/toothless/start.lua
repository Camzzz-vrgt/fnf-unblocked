function onCreate()

	      makeLuaSprite('flash5', '', 0, 0);
              makeGraphic('flash5',1280,720,'ffffff')
	      addLuaSprite('flash5', false);
	      setProperty('flash5.scale.x',11)
	      setProperty('flash5.scale.y',11)

end


function onSongStart()
   		doTweenX('goT','dad', 50, 3,'linear')
end

function onStartCountdown()
                     doTweenColor('ndad','dad','000000',0.0001)
                     doTweenColor('nbf','boyfriend','000000',0.0001)
                     doTweenColor('ngf','gf','000000',0.0001)
end

function onTweenCompleted(tag)
   if tag == 'goT' then
                   doTweenColor('odad','dad','FFFFFF',0.0001)
                   doTweenColor('obf','boyfriend','FFFFFF',0.0001)  
                   doTweenColor('ogf','gf','FFFFFF',0.0001)
                   runTimer('gonne', 1)
    end
end

function onTimerCompleted(tag)
  if tag == 'gonne' then
   		doTweenAlpha('gre','flash5', 0, 3,'linear')
    end
end
