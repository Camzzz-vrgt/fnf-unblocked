function onCountdownStarted()
    if middlescroll == false then
      noteTweenX('dadLeft', 0, defaultPlayerStrumX0, 0.05, 'linear');
      noteTweenX('dadDown', 1, defaultPlayerStrumX1, 0.05, 'linear');
      noteTweenX('dadUp', 2, defaultPlayerStrumX2, 0.05, 'linear');
      noteTweenX('dadRight', 3, defaultPlayerStrumX3, 0.05, 'linear');

      noteTweenX('bfLeft', 4, defaultOpponentStrumX0, 0.05, 'linear');
      noteTweenX('bfDown', 5, defaultOpponentStrumX1, 0.05, 'linear');
      noteTweenX('bfUp', 6, defaultOpponentStrumX2, 0.05, 'linear');
      noteTweenX('bfRight', 7, defaultOpponentStrumX3, 0.05, 'linear');
    end
  end