function onEndSong()
  if not allowEnd then
    startVideo('whitespacePOST')
    allowEnd = true;
    return Function_Stop;
  end
  return Function_Continue;
end