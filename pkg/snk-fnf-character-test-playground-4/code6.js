gdjs.hiddenCode = {};
gdjs.hiddenCode.GDimdoneObjects1= [];
gdjs.hiddenCode.GDimdoneObjects2= [];
gdjs.hiddenCode.GDimdone2Objects1= [];
gdjs.hiddenCode.GDimdone2Objects2= [];
gdjs.hiddenCode.GDimdone3Objects1= [];
gdjs.hiddenCode.GDimdone3Objects2= [];
gdjs.hiddenCode.GDimdone4Objects1= [];
gdjs.hiddenCode.GDimdone4Objects2= [];

gdjs.hiddenCode.conditionTrue_0 = {val:false};
gdjs.hiddenCode.condition0IsTrue_0 = {val:false};
gdjs.hiddenCode.condition1IsTrue_0 = {val:false};


gdjs.hiddenCode.eventsList0 = function(runtimeScene) {

{


gdjs.hiddenCode.condition0IsTrue_0.val = false;
{
gdjs.hiddenCode.condition0IsTrue_0.val = gdjs.evtTools.runtimeScene.sceneJustBegins(runtimeScene);
}if (gdjs.hiddenCode.condition0IsTrue_0.val) {
gdjs.copyArray(runtimeScene.getObjects("imdone4"), gdjs.hiddenCode.GDimdone4Objects1);
{gdjs.evtTools.sound.playSoundOnChannel(runtimeScene, "im_done.mp3", 1, false, 50, 1);
}{for(var i = 0, len = gdjs.hiddenCode.GDimdone4Objects1.length ;i < len;++i) {
    gdjs.hiddenCode.GDimdone4Objects1[i].setOpacity(0);
}
}}

}


{


gdjs.hiddenCode.condition0IsTrue_0.val = false;
{
gdjs.hiddenCode.condition0IsTrue_0.val = gdjs.evtTools.runtimeScene.timerElapsedTime(runtimeScene, 0.2, "im done2");
}if (gdjs.hiddenCode.condition0IsTrue_0.val) {
gdjs.copyArray(runtimeScene.getObjects("imdone4"), gdjs.hiddenCode.GDimdone4Objects1);
{gdjs.evtTools.camera.setCameraZoom(runtimeScene, gdjs.evtTools.camera.getCameraZoom(runtimeScene, "", 0) - 0.00025, "", 0);
}{gdjs.evtTools.runtimeScene.resetTimer(runtimeScene, "im done2");
}{for(var i = 0, len = gdjs.hiddenCode.GDimdone4Objects1.length ;i < len;++i) {
    gdjs.hiddenCode.GDimdone4Objects1[i].setOpacity((gdjs.hiddenCode.GDimdone4Objects1[i].getOpacity()) + 0.04);
}
}}

}


{



}


};

gdjs.hiddenCode.func = function(runtimeScene) {
runtimeScene.getOnceTriggers().startNewFrame();

gdjs.hiddenCode.GDimdoneObjects1.length = 0;
gdjs.hiddenCode.GDimdoneObjects2.length = 0;
gdjs.hiddenCode.GDimdone2Objects1.length = 0;
gdjs.hiddenCode.GDimdone2Objects2.length = 0;
gdjs.hiddenCode.GDimdone3Objects1.length = 0;
gdjs.hiddenCode.GDimdone3Objects2.length = 0;
gdjs.hiddenCode.GDimdone4Objects1.length = 0;
gdjs.hiddenCode.GDimdone4Objects2.length = 0;

gdjs.hiddenCode.eventsList0(runtimeScene);
return;

}

gdjs['hiddenCode'] = gdjs.hiddenCode;
