function onCreate()
 makeAnimatedLuaSprite('lol1', 'la-iglesia/sonic-pinga','dadGroup.x-500', 'dadGroup.y+40');
 addAnimationByPrefix('lol1', 'idle', 'idle-pizza',24,true);
 addLuaSprite('lol1');
 objectPlayAnimation('lol1','idle',false);
 scaleObject('lol1',1.5,1.5);

 makeAnimatedLuaSprite('lol2', 'la-iglesia/sex-doll', 'lol1.x-280', 'lol1.y+60');
 addAnimationByPrefix('lol2', 'idle', 'idle-mona',24,true);
 addLuaSprite('lol2');
 objectPlayAnimation('lol2','idle',false);

 scaleObject('lol2',2,2);


 makeAnimatedLuaSprite('lol3', 'la-iglesia/tilin_1', 'lol2.x-330', 'lol2.y+60');
 addAnimationByPrefix('lol3', 'idle', 'tilin 1',14,true);
 addLuaSprite('lol3');
 objectPlayAnimation('lol3','idle',false);
 scaleObject('lol3',1.5,1.5);


 makeAnimatedLuaSprite('lol4', 'la-iglesia/tilin_2', 'lol3.x+330', 'lol3.y+280');
 addAnimationByPrefix('lol4', 'idle', 'tilin 2',14,true);
 addLuaSprite('lol4');
 objectPlayAnimation('lol4','idle',false);
 scaleObject('lol4',1.5,1.5);

 makeAnimatedLuaSprite('lol45', 'la-iglesia/tilin_3', 'lol3.x+700', 'lol3.y+200');
 addAnimationByPrefix('lol45', 'idle', 'tilin 3',14,true);
 addLuaSprite('lol45');
 objectPlayAnimation('lol45','idle',false);
 scaleObject('lol45',1.3,1.3);
end    