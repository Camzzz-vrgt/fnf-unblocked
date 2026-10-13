function onStepHit() -- subtitles with lua
	if subsEnabled then
		if curStep == 512 then
			triggerEvent('karaokelyrics','set','HEY RUNT');
			triggerEvent('karaokelyrics','sung','HEY');
		end
		if curStep == 517 then
			triggerEvent('karaokelyrics','set','HEY RUNT');
			triggerEvent('karaokelyrics','sung','HEY RUNT');
		end
		if curStep == 528 then
			triggerEvent('karaokelyrics','set','MISSED ME?');
			triggerEvent('karaokelyrics','sung','MISSED');
		end
		if curStep == 531 then
			triggerEvent('karaokelyrics','set','MISSED ME?');
			triggerEvent('karaokelyrics','sung','MISSED ME?');
		end
		if curStep == 539 then
			triggerEvent('karaokelyrics','set','');
		end
		if curStep == 1076 then
			triggerEvent('karaokelyrics','set','Clown.');
		end
		if curStep == 1095 then
			triggerEvent('karaokelyrics','set','HEY');
		end
		if curStep == 1104 then
			triggerEvent('karaokelyrics','set','HEY HANK!');
		end
		if curStep == 1114 then
			triggerEvent('karaokelyrics','set','GIVE ME SOME SUGAR');
			triggerEvent('karaokelyrics','sung','GIVE');
		end
		if curStep == 1118 then
			triggerEvent('karaokelyrics','set','GIVE ME SOME SUGAR');
			triggerEvent('karaokelyrics','sung','GIVE ME');
		end
		if curStep == 1120 then
			triggerEvent('karaokelyrics','set','GIVE ME SOME SUGAR');
			triggerEvent('karaokelyrics','sung','GIVE ME SOME');
		end
		if curStep == 1125 then
			triggerEvent('karaokelyrics','set','GIVE ME SOME SUGAR');
			triggerEvent('karaokelyrics','sung','GIVE ME SOME SU');
		end
		if curStep == 1129 then
			triggerEvent('karaokelyrics','set','GIVE ME SOME SUGAR');
			triggerEvent('karaokelyrics','sung','GIVE ME SOME SUGAR');
		end
		if curStep == 1145 then
			if not familyFriendly then
			triggerEvent('karaokelyrics','set','*dies*');
			else
			triggerEvent('karaokelyrics','set','*demonetized*');
			end
		end
		if curStep == 1158 then
			triggerEvent('karaokelyrics','set','');
		end
	end
end