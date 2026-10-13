function onCreatePost()
makeLuaSprite('BG','bonus/images/sweetheartBG/sweetheartBG',-400, -300)
addLuaSprite('BG')

makeAnimatedLuaSprite('omori-x-vieja-sabrosa', 'bonus/images/sweetheartBG/sweetheart_party', 1000, 0)
scaleObject('omori-x-vieja-sabrosa', 0.6, 0.6);
addAnimationByPrefix('omori-x-vieja-sabrosa', 'omori-x-vieja-sabrosa-idle', 'B-OmoriKelDance', 18, true);
	addLuaSprite('omori-x-vieja-sabrosa')

makeAnimatedLuaSprite('personas_sexo', 'bonus/images/sweetheartBG/sweetheart_party', -300, -50)
scaleObject('personas_sexo', 0.6, 0.6);
addAnimationByPrefix('personas_sexo', 'idle', 'A-AubreyHeroDance', 18, true);
	addLuaSprite('personas_sexo')

makeAnimatedLuaSprite('GF', 'bonus/images/sweetheartBG/sweetheart_mikeGF', 300, 0)
scaleObject('GF', 0.5, 0.5);
addAnimationByPrefix('GF', 'bop', 'bop', 18, true);
	addLuaSprite('GF')
end