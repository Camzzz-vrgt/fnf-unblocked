function onCountdownTick(counter)    if counter == 0 then -- three

        playSound('Normal/intro3',0.3);

    elseif counter == 1 then -- two

        playSound('Normal/intro2',0.3);

    elseif counter == 2 then -- one

        playSound('Normal/intro1',0.3);

    elseif counter == 3 then -- go

        playSound('Normal/introGo',0.3);

    end

end
