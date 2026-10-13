gdjs.MenuCode = {};
gdjs.MenuCode.GDNewObjectObjects1= [];
gdjs.MenuCode.GDNewObjectObjects2= [];
gdjs.MenuCode.GDNewObject2Objects1= [];
gdjs.MenuCode.GDNewObject2Objects2= [];
gdjs.MenuCode.GDNewObject3Objects1= [];
gdjs.MenuCode.GDNewObject3Objects2= [];
gdjs.MenuCode.GDNewObject422Objects1= [];
gdjs.MenuCode.GDNewObject422Objects2= [];
gdjs.MenuCode.GDNewObject42Objects1= [];
gdjs.MenuCode.GDNewObject42Objects2= [];
gdjs.MenuCode.GDNewObject4Objects1= [];
gdjs.MenuCode.GDNewObject4Objects2= [];
gdjs.MenuCode.GDNewObject5Objects1= [];
gdjs.MenuCode.GDNewObject5Objects2= [];
gdjs.MenuCode.GDNewObject6Objects1= [];
gdjs.MenuCode.GDNewObject6Objects2= [];
gdjs.MenuCode.GDNewObject8Objects1= [];
gdjs.MenuCode.GDNewObject8Objects2= [];

gdjs.MenuCode.conditionTrue_0 = {val:false};
gdjs.MenuCode.condition0IsTrue_0 = {val:false};
gdjs.MenuCode.condition1IsTrue_0 = {val:false};
gdjs.MenuCode.condition2IsTrue_0 = {val:false};
gdjs.MenuCode.conditionTrue_1 = {val:false};
gdjs.MenuCode.condition0IsTrue_1 = {val:false};
gdjs.MenuCode.condition1IsTrue_1 = {val:false};
gdjs.MenuCode.condition2IsTrue_1 = {val:false};


gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject4Objects1Objects = Hashtable.newFrom({"NewObject4": gdjs.MenuCode.GDNewObject4Objects1});gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject4Objects1Objects = Hashtable.newFrom({"NewObject4": gdjs.MenuCode.GDNewObject4Objects1});gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject4Objects1Objects = Hashtable.newFrom({"NewObject4": gdjs.MenuCode.GDNewObject4Objects1});gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject422Objects1Objects = Hashtable.newFrom({"NewObject422": gdjs.MenuCode.GDNewObject422Objects1});gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject422Objects1Objects = Hashtable.newFrom({"NewObject422": gdjs.MenuCode.GDNewObject422Objects1});gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject422Objects1Objects = Hashtable.newFrom({"NewObject422": gdjs.MenuCode.GDNewObject422Objects1});gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject42Objects1Objects = Hashtable.newFrom({"NewObject42": gdjs.MenuCode.GDNewObject42Objects1});gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject42Objects1Objects = Hashtable.newFrom({"NewObject42": gdjs.MenuCode.GDNewObject42Objects1});gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject42Objects1Objects = Hashtable.newFrom({"NewObject42": gdjs.MenuCode.GDNewObject42Objects1});gdjs.MenuCode.eventsList0 = function(runtimeScene) {

{


{
gdjs.copyArray(runtimeScene.getObjects("NewObject5"), gdjs.MenuCode.GDNewObject5Objects1);
{for(var i = 0, len = gdjs.MenuCode.GDNewObject5Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject5Objects1[i].setXOffset(gdjs.MenuCode.GDNewObject5Objects1[i].getXOffset() + (1));
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject5Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject5Objects1[i].setYOffset(gdjs.MenuCode.GDNewObject5Objects1[i].getYOffset() + (1));
}
}}

}


{


{
}

}


{

gdjs.copyArray(runtimeScene.getObjects("NewObject4"), gdjs.MenuCode.GDNewObject4Objects1);

gdjs.MenuCode.condition0IsTrue_0.val = false;
gdjs.MenuCode.condition1IsTrue_0.val = false;
{
gdjs.MenuCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject4Objects1Objects, runtimeScene, true, false);
}if ( gdjs.MenuCode.condition0IsTrue_0.val ) {
{
gdjs.MenuCode.condition1IsTrue_0.val = gdjs.evtTools.input.isMouseButtonPressed(runtimeScene, "Left");
}}
if (gdjs.MenuCode.condition1IsTrue_0.val) {
{gdjs.evtTools.runtimeScene.replaceScene(runtimeScene, "Game", false);
}}

}


{

gdjs.copyArray(runtimeScene.getObjects("NewObject4"), gdjs.MenuCode.GDNewObject4Objects1);

gdjs.MenuCode.condition0IsTrue_0.val = false;
gdjs.MenuCode.condition1IsTrue_0.val = false;
{
gdjs.MenuCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject4Objects1Objects, runtimeScene, true, false);
}if ( gdjs.MenuCode.condition0IsTrue_0.val ) {
{
{gdjs.MenuCode.conditionTrue_1 = gdjs.MenuCode.condition1IsTrue_0;
gdjs.MenuCode.conditionTrue_1.val = runtimeScene.getOnceTriggers().triggerOnce(23292836);
}
}}
if (gdjs.MenuCode.condition1IsTrue_0.val) {
/* Reuse gdjs.MenuCode.GDNewObject4Objects1 */
{for(var i = 0, len = gdjs.MenuCode.GDNewObject4Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject4Objects1[i].setScale(1.25);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject4Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject4Objects1[i].setX(875);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject4Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject4Objects1[i].setY(45);
}
}{gdjs.evtTools.sound.playSound(runtimeScene, "scrollMenu.mp3", false, 100, 1);
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject4Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject4Objects1[i].getBehavior("Tween").addObjectColorTween("d", "100;100;100", "easeInOutQuint", 250, false);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject4Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject4Objects1[i].getBehavior("Tween").resumeTween("d");
}
}{runtimeScene.getGame().getVariables().getFromIndex(6).setNumber(1);
}}

}


{


gdjs.MenuCode.condition0IsTrue_0.val = false;
gdjs.MenuCode.condition1IsTrue_0.val = false;
{
gdjs.MenuCode.condition0IsTrue_0.val = !(gdjs.evtTools.sound.isSoundOnChannelPlaying(runtimeScene, 2));
}if ( gdjs.MenuCode.condition0IsTrue_0.val ) {
{
{gdjs.MenuCode.conditionTrue_1 = gdjs.MenuCode.condition1IsTrue_0;
gdjs.MenuCode.conditionTrue_1.val = runtimeScene.getOnceTriggers().triggerOnce(23295180);
}
}}
if (gdjs.MenuCode.condition1IsTrue_0.val) {
{gdjs.evtTools.sound.playSoundOnChannel(runtimeScene, "inst\\inst\\title.mp3", 2, true, 25, 1);
}}

}


{

gdjs.copyArray(runtimeScene.getObjects("NewObject4"), gdjs.MenuCode.GDNewObject4Objects1);

gdjs.MenuCode.condition0IsTrue_0.val = false;
gdjs.MenuCode.condition1IsTrue_0.val = false;
{
gdjs.MenuCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject4Objects1Objects, runtimeScene, true, true);
}if ( gdjs.MenuCode.condition0IsTrue_0.val ) {
{
{gdjs.MenuCode.conditionTrue_1 = gdjs.MenuCode.condition1IsTrue_0;
gdjs.MenuCode.conditionTrue_1.val = runtimeScene.getOnceTriggers().triggerOnce(23296764);
}
}}
if (gdjs.MenuCode.condition1IsTrue_0.val) {
/* Reuse gdjs.MenuCode.GDNewObject4Objects1 */
{for(var i = 0, len = gdjs.MenuCode.GDNewObject4Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject4Objects1[i].setScale(1);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject4Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject4Objects1[i].setX(900);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject4Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject4Objects1[i].setY(80);
}
}{gdjs.evtTools.sound.playSound(runtimeScene, "scrollMenu.mp3", false, 100, 1);
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject4Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject4Objects1[i].getBehavior("Tween").addObjectColorTween("w", "255;255;255", "easeInOutQuint", 250, false);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject4Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject4Objects1[i].getBehavior("Tween").resumeTween("w");
}
}}

}


{

gdjs.copyArray(runtimeScene.getObjects("NewObject422"), gdjs.MenuCode.GDNewObject422Objects1);

gdjs.MenuCode.condition0IsTrue_0.val = false;
gdjs.MenuCode.condition1IsTrue_0.val = false;
{
gdjs.MenuCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject422Objects1Objects, runtimeScene, true, false);
}if ( gdjs.MenuCode.condition0IsTrue_0.val ) {
{
{gdjs.MenuCode.conditionTrue_1 = gdjs.MenuCode.condition1IsTrue_0;
gdjs.MenuCode.conditionTrue_1.val = runtimeScene.getOnceTriggers().triggerOnce(23298892);
}
}}
if (gdjs.MenuCode.condition1IsTrue_0.val) {
/* Reuse gdjs.MenuCode.GDNewObject422Objects1 */
{for(var i = 0, len = gdjs.MenuCode.GDNewObject422Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject422Objects1[i].setScale(1.25);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject422Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject422Objects1[i].setX(875);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject422Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject422Objects1[i].setY(465);
}
}{gdjs.evtTools.sound.playSound(runtimeScene, "scrollMenu.mp3", false, 100, 1);
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject422Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject422Objects1[i].getBehavior("Tween").addObjectColorTween("d", "100;100;100", "easeInOutQuint", 250, false);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject422Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject422Objects1[i].getBehavior("Tween").resumeTween("d");
}
}{runtimeScene.getGame().getVariables().getFromIndex(6).setNumber(3);
}}

}


{

gdjs.copyArray(runtimeScene.getObjects("NewObject422"), gdjs.MenuCode.GDNewObject422Objects1);

gdjs.MenuCode.condition0IsTrue_0.val = false;
gdjs.MenuCode.condition1IsTrue_0.val = false;
{
gdjs.MenuCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject422Objects1Objects, runtimeScene, true, true);
}if ( gdjs.MenuCode.condition0IsTrue_0.val ) {
{
{gdjs.MenuCode.conditionTrue_1 = gdjs.MenuCode.condition1IsTrue_0;
gdjs.MenuCode.conditionTrue_1.val = runtimeScene.getOnceTriggers().triggerOnce(23301044);
}
}}
if (gdjs.MenuCode.condition1IsTrue_0.val) {
/* Reuse gdjs.MenuCode.GDNewObject422Objects1 */
{for(var i = 0, len = gdjs.MenuCode.GDNewObject422Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject422Objects1[i].setScale(1);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject422Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject422Objects1[i].setX(900);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject422Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject422Objects1[i].setY(480);
}
}{gdjs.evtTools.sound.playSound(runtimeScene, "scrollMenu.mp3", false, 100, 1);
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject422Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject422Objects1[i].getBehavior("Tween").addObjectColorTween("w", "255;255;255", "easeInOutQuint", 250, false);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject422Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject422Objects1[i].getBehavior("Tween").resumeTween("w");
}
}}

}


{

gdjs.copyArray(runtimeScene.getObjects("NewObject422"), gdjs.MenuCode.GDNewObject422Objects1);

gdjs.MenuCode.condition0IsTrue_0.val = false;
gdjs.MenuCode.condition1IsTrue_0.val = false;
{
gdjs.MenuCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject422Objects1Objects, runtimeScene, true, false);
}if ( gdjs.MenuCode.condition0IsTrue_0.val ) {
{
gdjs.MenuCode.condition1IsTrue_0.val = gdjs.evtTools.input.isMouseButtonPressed(runtimeScene, "Left");
}}
if (gdjs.MenuCode.condition1IsTrue_0.val) {
{gdjs.evtTools.runtimeScene.stopGame(runtimeScene);
}}

}


{

gdjs.copyArray(runtimeScene.getObjects("NewObject42"), gdjs.MenuCode.GDNewObject42Objects1);

gdjs.MenuCode.condition0IsTrue_0.val = false;
gdjs.MenuCode.condition1IsTrue_0.val = false;
{
gdjs.MenuCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject42Objects1Objects, runtimeScene, true, false);
}if ( gdjs.MenuCode.condition0IsTrue_0.val ) {
{
gdjs.MenuCode.condition1IsTrue_0.val = gdjs.evtTools.input.isMouseButtonPressed(runtimeScene, "Left");
}}
if (gdjs.MenuCode.condition1IsTrue_0.val) {
{gdjs.evtTools.runtimeScene.replaceScene(runtimeScene, "Info", false);
}}

}


{

gdjs.copyArray(runtimeScene.getObjects("NewObject42"), gdjs.MenuCode.GDNewObject42Objects1);

gdjs.MenuCode.condition0IsTrue_0.val = false;
gdjs.MenuCode.condition1IsTrue_0.val = false;
{
gdjs.MenuCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject42Objects1Objects, runtimeScene, true, false);
}if ( gdjs.MenuCode.condition0IsTrue_0.val ) {
{
{gdjs.MenuCode.conditionTrue_1 = gdjs.MenuCode.condition1IsTrue_0;
gdjs.MenuCode.conditionTrue_1.val = runtimeScene.getOnceTriggers().triggerOnce(23305364);
}
}}
if (gdjs.MenuCode.condition1IsTrue_0.val) {
/* Reuse gdjs.MenuCode.GDNewObject42Objects1 */
{for(var i = 0, len = gdjs.MenuCode.GDNewObject42Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject42Objects1[i].setScale(1.25);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject42Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject42Objects1[i].setX(875);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject42Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject42Objects1[i].setY(255);
}
}{gdjs.evtTools.sound.playSound(runtimeScene, "scrollMenu.mp3", false, 100, 1);
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject42Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject42Objects1[i].getBehavior("Tween").addObjectColorTween("d", "100;100;100", "easeInOutQuint", 250, false);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject42Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject42Objects1[i].getBehavior("Tween").resumeTween("d");
}
}{runtimeScene.getGame().getVariables().getFromIndex(6).setNumber(2);
}}

}


{

gdjs.copyArray(runtimeScene.getObjects("NewObject42"), gdjs.MenuCode.GDNewObject42Objects1);

gdjs.MenuCode.condition0IsTrue_0.val = false;
gdjs.MenuCode.condition1IsTrue_0.val = false;
{
gdjs.MenuCode.condition0IsTrue_0.val = gdjs.evtTools.input.cursorOnObject(gdjs.MenuCode.mapOfGDgdjs_46MenuCode_46GDNewObject42Objects1Objects, runtimeScene, true, true);
}if ( gdjs.MenuCode.condition0IsTrue_0.val ) {
{
{gdjs.MenuCode.conditionTrue_1 = gdjs.MenuCode.condition1IsTrue_0;
gdjs.MenuCode.conditionTrue_1.val = runtimeScene.getOnceTriggers().triggerOnce(23307772);
}
}}
if (gdjs.MenuCode.condition1IsTrue_0.val) {
/* Reuse gdjs.MenuCode.GDNewObject42Objects1 */
{for(var i = 0, len = gdjs.MenuCode.GDNewObject42Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject42Objects1[i].setScale(1);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject42Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject42Objects1[i].setX(900);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject42Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject42Objects1[i].setY(280);
}
}{gdjs.evtTools.sound.playSound(runtimeScene, "scrollMenu.mp3", false, 100, 1);
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject42Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject42Objects1[i].getBehavior("Tween").addObjectColorTween("w", "255;255;255", "easeInOutQuint", 250, false);
}
}{for(var i = 0, len = gdjs.MenuCode.GDNewObject42Objects1.length ;i < len;++i) {
    gdjs.MenuCode.GDNewObject42Objects1[i].getBehavior("Tween").resumeTween("w");
}
}}

}


};

gdjs.MenuCode.func = function(runtimeScene) {
runtimeScene.getOnceTriggers().startNewFrame();

gdjs.MenuCode.GDNewObjectObjects1.length = 0;
gdjs.MenuCode.GDNewObjectObjects2.length = 0;
gdjs.MenuCode.GDNewObject2Objects1.length = 0;
gdjs.MenuCode.GDNewObject2Objects2.length = 0;
gdjs.MenuCode.GDNewObject3Objects1.length = 0;
gdjs.MenuCode.GDNewObject3Objects2.length = 0;
gdjs.MenuCode.GDNewObject422Objects1.length = 0;
gdjs.MenuCode.GDNewObject422Objects2.length = 0;
gdjs.MenuCode.GDNewObject42Objects1.length = 0;
gdjs.MenuCode.GDNewObject42Objects2.length = 0;
gdjs.MenuCode.GDNewObject4Objects1.length = 0;
gdjs.MenuCode.GDNewObject4Objects2.length = 0;
gdjs.MenuCode.GDNewObject5Objects1.length = 0;
gdjs.MenuCode.GDNewObject5Objects2.length = 0;
gdjs.MenuCode.GDNewObject6Objects1.length = 0;
gdjs.MenuCode.GDNewObject6Objects2.length = 0;
gdjs.MenuCode.GDNewObject8Objects1.length = 0;
gdjs.MenuCode.GDNewObject8Objects2.length = 0;

gdjs.MenuCode.eventsList0(runtimeScene);
return;

}

gdjs['MenuCode'] = gdjs.MenuCode;
