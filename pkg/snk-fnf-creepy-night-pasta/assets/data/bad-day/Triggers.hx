import substates.CreepyPastaPauseSubState;

function onStepHit()
{
    if(curStep == 400)
    {
        CreepyPastaPauseSubState.index = "-alt";
    }
}