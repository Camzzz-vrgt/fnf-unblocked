import Std;
import funkin.ui.options.OptionsState;
import funkin.modding.module.Module;
import funkin.save.Save;

class TrickyPussyMode extends Module
{
  public function new()
  {
    super('TrickyPussyMode', 1, {state: OptionsState});

    if (!Save.instance.modOptions.exists(TrickyPussyMode.SAVE_KEY_PUSSYMODE)) Save.instance.modOptions.set(TrickyPussyMode.SAVE_KEY_PUSSYMODE, false);
  }

  public static var SAVE_KEY_PUSSYMODE:String = "shouldUsePussyMode";

  override function onStateChangeEnd(event:StateChangeScriptEvent)
  {
    if (!Std.isOfType(event.targetState, OptionsState)) return;

    addTrickyMenuOption(event.targetState);
  }

  function addTrickyMenuOption(options:OptionsState)
  {
    var preferencesPage = options.optionsCodex.pages.get("preferences");
    if (preferencesPage != null)
    {
      preferencesPage.createPrefItemCheckbox("Pussy Mode", "Toggle this if ur a pussy LOLZ (Makes gameplay easier on Expurgation)", function(value:Bool):Void
      {
        Save.instance.modOptions.set("shouldUsePussyMode", value);
        Save.instance.flush();
      }, togglePussyMode());
    }
  }

  function togglePussyMode():Bool
  {
    if (!Save.instance.modOptions.exists("shouldUsePussyMode")) return true;
    return Save.instance.modOptions.get("shouldUsePussyMode");
  }
}
