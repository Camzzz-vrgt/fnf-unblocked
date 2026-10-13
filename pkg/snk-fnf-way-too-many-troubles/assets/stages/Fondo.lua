function onCreate()
	
	makeLuaSprite('Fondo', 'exe1', -500, -300)
	setLuaSpriteScrollFactor('Fondo', 0.9, 0.9)
	addLuaSprite('Fondo', false)

	makeLuaSprite( 'Fondo2', 'exe2', -500, -300)
	setLuaSpriteScrollFactor('Fondo2', 0.9, 0.9)
	addLuaSprite('Fondo2', false)

	setProperty('Fondo2.visible', false)
          
        makeLuaSprite( 'Fondo3', 'exe3', -500, -300)
	setLuaSpriteScrollFactor('Fondo3', 0.9, 0.9)
	addLuaSprite('Fondo3', false)

	setProperty('Fondo3.visible', false)

        makeLuaSprite( 'Fondo4', 'exe4', -500, -300)
	setLuaSpriteScrollFactor('Fondo4', 0.9, 0.9)
	addLuaSprite('Fondo4', false)

	setProperty('Fondo4.visible', false)

        makeLuaSprite( 'Fondo6', 'exe6', -500, -300)
	setLuaSpriteScrollFactor('Fondo6', 0.9, 0.9)
	addLuaSprite('Fondo6', false)

	setProperty('Fondo6.visible', false)

        makeLuaSprite( 'Fondonegro', 'Black', -500, -300)
	setLuaSpriteScrollFactor('Fondonegro', 0.9, 0.9)
	addLuaSprite('Fondonegro', false)

	setProperty('Fondonegro.visible', false)

        makeLuaSprite( 'Fondo7', 'exe7', -500, -300)
	setLuaSpriteScrollFactor('Fondo7', 0.9, 0.9)
	addLuaSprite('Fondo7', false)

	setProperty('Fondo7.visible', false)

        makeLuaSprite( 'Fondots', 'exe1-ts', -500, -300)
	setLuaSpriteScrollFactor('Fondots', 0.9, 0.9)
	addLuaSprite('Fondots', false)

	setProperty('Fondots.visible', false)

        makeLuaSprite( 'Fondokc', 'exekc', -500, -300)
	setLuaSpriteScrollFactor('Fondokc', 0.9, 0.9)
	addLuaSprite('Fondokc', false)

	setProperty('Fondokc.visible', false)

         makeLuaSprite( 'Fondokc2', 'exekc2', -500, -300)
	setLuaSpriteScrollFactor('Fondokc2', 0.9, 0.9)
	addLuaSprite('Fondokc2', false)

	setProperty('Fondokc2.visible', false)

        makeLuaSprite( 'Fondoegg', 'exeegg', -500, -300)
	setLuaSpriteScrollFactor('Fondoegg', 0.9, 0.9)
	addLuaSprite('Fondoegg', false)

	setProperty('Fondoegg.visible', false)

        makeLuaSprite( 'Fondoegg2', 'exeegg2', -500, -300)
	setLuaSpriteScrollFactor('Fondoegg2', 0.9, 0.9)
	addLuaSprite('Fondoegg2', false)

	setProperty('Fondoegg2.visible', false)
 
        makeLuaSprite( 'Fondo8', 'exe8', -500, -300)
	setLuaSpriteScrollFactor('Fondo8', 0.9, 0.9)
	addLuaSprite('Fondo8', false)

	setProperty('Fondo8.visible', false)

        makeLuaSprite( 'Fondo9', 'exe9', -500, -300)
	setLuaSpriteScrollFactor('Fondo9', 0.9, 0.9)
	addLuaSprite('Fondo9', false)

	setProperty('Fondo9.visible', false)
      
         makeLuaSprite( 'Fondo10', 'exe10', -500, -300)
	setLuaSpriteScrollFactor('Fondo10', 0.9, 0.9)
	addLuaSprite('Fondo10', false)

	setProperty('Fondo10.visible', false)

        makeLuaSprite( 'Fondo11', 'exe11', -500, -300)
	setLuaSpriteScrollFactor('Fondo11', 0.9, 0.9)
	addLuaSprite('Fondo11', false)

	setProperty('Fondo11.visible', false)
 
        makeLuaSprite( 'Fondo12', 'exe12', -500, -300)
	setLuaSpriteScrollFactor('Fondo12', 0.9, 0.9)
	addLuaSprite('Fondo12', false)

	setProperty('Fondo12.visible', false)

         makeLuaSprite( 'Fondo13', 'exe13', -500, -300)
	setLuaSpriteScrollFactor('Fondo13', 0.9, 0.9)
	addLuaSprite('Fondo13', false)

	setProperty('Fondo13.visible', false)

        makeLuaSprite( 'Fondo14', 'exe14', -500, -300)
	setLuaSpriteScrollFactor('Fondo14', 0.9, 0.9)
	addLuaSprite('Fondo14', false)

	setProperty('Fondo14.visible', false)

        makeLuaSprite( 'Fondo15', 'exe15', -500, -300)
	setLuaSpriteScrollFactor('Fondo15', 0.9, 0.9)
	addLuaSprite('Fondo15', false)

	setProperty('Fondo15.visible', false)

        makeLuaSprite( 'Fondo20', 'exe20', -500, -300)
	setLuaSpriteScrollFactor('Fondo20', 0.9, 0.9)
	addLuaSprite('Fondo20', false)

	setProperty('Fondo20.visible', false)

         makeLuaSprite( 'Fondoxeno', 'exe2', -500, -300)
	setLuaSpriteScrollFactor('Fondoxeno', 0.9, 0.9)
	addLuaSprite('Fondoxeno', false)

	setProperty('Fondoxeno.visible', false)


end

function onEvent(name,value1,value2)
	if name == 'Play Animation' then 
		
		if value1 == 'fondo1' then
			setProperty('Fondo2.visible', false);
			setProperty('Fondo.visible', true);
		end
		if value1 == 'fondo2' then
			setProperty('Fondo2.visible', true);
			setProperty('Fondo.visible', false);
		end
                if value1 == 'fondo3' then
			setProperty('Fondo3.visible', true);
			setProperty('Fondo.visible', false);
                end
                if value1 == 'fondo4' then
			setProperty('Fondo4.visible', true);
			setProperty('Fondo.visible', false);
                end
                if value1 == 'fondo1' then
			setProperty('Fondo1.visible', true);
                        setProperty('Fondo4.visible', false);		
                end
		if value1 == 'fondo1' then
			setProperty('Fondo1.visible', true);
                        setProperty('Fondo3.visible', false);
                end
                if value1 == 'fondo6' then
			setProperty('Fondo6.visible', true);
                        setProperty('Fondo2.visible', false);

                end
                if value1 == 'fondonegro' then
			setProperty('Fondonegro.visible', true);
                        setProperty('Fondo4.visible', false);
  
                end
                if value1 == 'fondo1' then
			setProperty('Fondonegro.visible', false);
			setProperty('Fondo.visible', true);

                end
                if value1 == 'fondonegro' then
			setProperty('Fondonegro.visible', true);
                        setProperty('Fondo6.visible', false);
      
                end
                if value1 == 'fondo7' then
			setProperty('Fondo7.visible', true);
                        setProperty('Fondonegro.visible', false);
                end
                 if value1 == 'fondots' then
			setProperty('Fondots.visible', true);
                        setProperty('Fondo.visible', false);
                end
                 if value1 == 'fondo1' then
			setProperty('Fondo1.visible', true);
                        setProperty('Fondots.visible', false);
                end
                if value1 == 'fondokc' then
			setProperty('Fondokc.visible', true);
                        setProperty('Fondo2.visible', false);
                end
                if value1 == 'fondokc2' then
			setProperty('Fondokc2.visible', true);
                        setProperty('Fondokc.visible', false);
                end
                 if value1 == 'fondokc' then
			setProperty('Fondokc.visible', true);
                        setProperty('Fondokc2.visible', false);
                end
                if value1 == 'fondo3' then
			setProperty('Fondo3.visible', true);
                        setProperty('Fondokc.visible', false);
                end
                if value1 == 'fondoegg' then
			setProperty('Fondoegg.visible', true);
                        setProperty('Fondo4.visible', false);
                end
                if value1 == 'fondoegg2' then
			setProperty('Fondoegg2.visible', true);
                        setProperty('Fondoegg.visible', false);
                end
                if value1 == 'fondoegg' then
			setProperty('Fondoegg.visible', true);
                        setProperty('Fondoegg2.visible', false);
                end
                 if value1 == 'fondo2' then
			setProperty('Fondo2.visible', true);
                        setProperty('Fondoegg.visible', false);
                end
                  if value1 == 'fondoegg' then
			setProperty('Fondoegg.visible', true);
                        setProperty('Fondonegro.visible', false);
                end
                 if value1 == 'fondo8' then
			setProperty('Fondo8.visible', true);
                        setProperty('Fondo7.visible', false);
                end
                 if value1 == 'fondo9' then
			setProperty('Fondo9.visible', true);
                        setProperty('Fondo8.visible', false);
                end
                if value1 == 'fondonegro' then
			setProperty('Fondonegro.visible', true);
                        setProperty('Fondo9.visible', false);
      
                end
                  if value1 == 'fondo10' then
			setProperty('Fondo10.visible', true);
                        setProperty('Fondonegro.visible', false);
      
                end
                if value1 == 'fondonegro' then
			setProperty('Fondonegro.visible', true);
                        setProperty('Fondo10.visible', false);
      
                end
                 if value1 == 'fondo11' then
			setProperty('Fondo11.visible', true);
                        setProperty('Fondonegro.visible', false);
      
                end
                 if value1 == 'fondonegro' then
			setProperty('Fondonegro.visible', true);
                        setProperty('Fondo11.visible', false);
      
                end
                if value1 == 'fondo12' then
			setProperty('Fondo12.visible', true);
                        setProperty('Fondonegro.visible', false);
      
                end
                if value1 == 'fondo13' then
			setProperty('Fondo13.visible', true);
                        setProperty('Fondo12.visible', false);
      
                end
                 if value1 == 'fondonegro' then
			setProperty('Fondonegro.visible', true);
                        setProperty('Fondo13.visible', false);
      
                end
                 if value1 == 'fondo14' then
			setProperty('Fondo14.visible', true);
                        setProperty('Fondonegro.visible', false);
      
                end
                if value1 == 'fondo1' then
			setProperty('Fondo.visible', true);
                        setProperty('Fondo14.visible', false);
      
                end
                if value1 == 'fondokc' then
			setProperty('Fondokc.visible', true);
                        setProperty('Fondo.visible', false);
      
                end
                 if value1 == 'fondo15' then
			setProperty('Fondo15.visible', true);
                        setProperty('Fondokc.visible', false);
      
                end
                 if value1 == 'fondoegg' then
			setProperty('Fondoegg.visible', true);
                        setProperty('Fondo15.visible', false);
      
                end
                 if value1 == 'fondo13' then
			setProperty('Fondo13.visible', true);
                        setProperty('Fondoegg.visible', false);
      
                end
                if value1 == 'fondo11' then
			setProperty('Fondo11.visible', true);
                        setProperty('Fondo13.visible', false);
      
                end
                if value1 == 'fondoegg' then
			setProperty('Fondoegg.visible', true);
                        setProperty('Fondo11.visible', false);
      
                end
                 if value1 == 'fondo20' then
			setProperty('Fondo20.visible', true);
                        setProperty('Fondoegg.visible', false);
      
                end
                  if value1 == 'fondonegro' then
			setProperty('Fondonegro.visible', true);
                        setProperty('Fondo20.visible', false);
      
                end
                 if value1 == 'fondoxeno' then
			setProperty('Fondoxeno.visible', true);
                        setProperty('Fondoegg.visible', false);
      
                end
                 if value1 == 'fondo6' then
			setProperty('Fondo6.visible', true);
                        setProperty('Fondoxeno.visible', false);
      
                end
	end
end