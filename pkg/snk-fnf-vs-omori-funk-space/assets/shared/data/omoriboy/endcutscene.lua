function onEndSong()
  if isStoryMode and not allowEnd then
    startVideo('omoriboyEND')
    allowEnd = true;
    return Function_Stop;
  end
  return Function_Continue;
end