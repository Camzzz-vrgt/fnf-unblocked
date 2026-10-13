gdjs.InfoCode = {};
gdjs.InfoCode.GDNewObject5Objects1= [];
gdjs.InfoCode.GDNewObject5Objects2= [];
gdjs.InfoCode.GDNewObjectObjects1= [];
gdjs.InfoCode.GDNewObjectObjects2= [];
gdjs.InfoCode.GDNewObject2Objects1= [];
gdjs.InfoCode.GDNewObject2Objects2= [];
gdjs.InfoCode.GDNewObject3Objects1= [];
gdjs.InfoCode.GDNewObject3Objects2= [];
gdjs.InfoCode.GDNewObject4Objects1= [];
gdjs.InfoCode.GDNewObject4Objects2= [];

gdjs.InfoCode.conditionTrue_0 = {val:false};
gdjs.InfoCode.condition0IsTrue_0 = {val:false};
gdjs.InfoCode.condition1IsTrue_0 = {val:false};
gdjs.InfoCode.condition2IsTrue_0 = {val:false};


gdjs.InfoCode.mapOfGDgdjs_46InfoCode_46GDNewObject2Objects1Objects = Hashtable.newFrom({"NewObject2": gdjs.InfoCode.GDNewObject2Objects1});gdjs.InfoCode.eventsList0 = function(runtimeScene) {

{


{
gdjs.copyArray(runtimeScene.getObjects("NewObject3"), gdjs.InfoCode.GDNewObject3Objects1);
gdjs.copyArray(runtimeScene.getObjects("NewObject5"), gdjs.InfoCode.GDNewObject5Objects1);
{for(var i = 0, len = gdjs.InfoCode.GDNewObject5Objects1.length ;i < len;++i) {
    gdjs.InfoCode.GDNewObject5Objects1[i].setXOffset(gdjs.InfoCode.GDNewObject5Objects1[i].getXOffset() + (1));
}
}{for(var i = 0, len = gdjs.InfoCode.GDNewObject5Objects1.length ;i < len;++i) {
    gdjs.InfoCode.GDNewObject5Objects1[i].setYOffset(gdjs.InfoCode.GDNewObject5Objects1[i].getYOffset() + (1));
}
}{for(var i = 0, len = gdjs.InfoCode.GDNewObject3Objects1.length ;i < len;++i) {
    gdjs.InfoCode.GDNewObject3Objects1[i].setOutline("0;0;0", 15);
}
}}

}


{

gdjs.copyArray(runtimeScene.getObjects("NewObject2"), gdjs.InfoCode.GDNewObject2Objects1);

gdjs.InfoCode.condition0IsTrue_0.val = false;
gdjs.InfoCode.condition1IsTrue_0.val = false;
{
gdjs.InfoCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.InfoCode.mapOfGDgdjs_46InfoCode_46GDNewObject2Objects1Objects, runtimeScene, true, false);
}if ( gdjs.InfoCode.condition0IsTrue_0.val ) {
{
gdjs.InfoCode.condition1IsTrue_0.val = gdjs.evtTools.input.isMouseButtonPressed(runtimeScene, "Left");
}}
if (gdjs.InfoCode.condition1IsTrue_0.val) {
{gdjs.evtTools.runtimeScene.replaceScene(runtimeScene, "Menu", false);
}}

}


};

gdjs.InfoCode.func = function(runtimeScene) {
runtimeScene.getOnceTriggers().startNewFrame();

gdjs.InfoCode.GDNewObject5Objects1.length = 0;
gdjs.InfoCode.GDNewObject5Objects2.length = 0;
gdjs.InfoCode.GDNewObjectObjects1.length = 0;
gdjs.InfoCode.GDNewObjectObjects2.length = 0;
gdjs.InfoCode.GDNewObject2Objects1.length = 0;
gdjs.InfoCode.GDNewObject2Objects2.length = 0;
gdjs.InfoCode.GDNewObject3Objects1.length = 0;
gdjs.InfoCode.GDNewObject3Objects2.length = 0;
gdjs.InfoCode.GDNewObject4Objects1.length = 0;
gdjs.InfoCode.GDNewObject4Objects2.length = 0;

gdjs.InfoCode.eventsList0(runtimeScene);
return;

}

gdjs['InfoCode'] = gdjs.InfoCode;
