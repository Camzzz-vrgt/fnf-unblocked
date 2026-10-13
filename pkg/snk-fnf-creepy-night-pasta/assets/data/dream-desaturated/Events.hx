import flixel.math.FlxMath;
var bfturn:Bool;
function onMoveCamera(focus:String){
 if (focus == 'boyfriend') bfturn = true;
 if (focus == 'dad') bfturn = false;
 
}
function onUpdate(elapsed:Float) {
    if (bfturn){
        switch(game.boyfriend.getAnimationName()){
           
            case 'singLEFT': FlxG.camera.angle = FlxMath.lerp(FlxG.camera.angle,-1.47,0.05); 
            case 'singRIGHT': FlxG.camera.angle = FlxMath.lerp(FlxG.camera.angle,1.47,0.05); 
            case 'singDOWN':FlxG.camera.angle = FlxMath.lerp(FlxG.camera.angle,0,0.05); 
            case 'singUP':FlxG.camera.angle = FlxMath.lerp(FlxG.camera.angle,0,0.05); 

        }
    }else{
        switch(game.dad.getAnimationName()){
 
            case 'singLEFT': FlxG.camera.angle = FlxMath.lerp(FlxG.camera.angle,-1.47,0.05); 
            case 'singRIGHT': FlxG.camera.angle = FlxMath.lerp(FlxG.camera.angle,1.47,0.05); 
            case 'singDOWN':FlxG.camera.angle = FlxMath.lerp(FlxG.camera.angle,0,0.05); 
            case 'singUP':FlxG.camera.angle = FlxMath.lerp(FlxG.camera.angle,0,0.05); 

        }

    }
}