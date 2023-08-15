local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and not isStoryMode and not seenCutscene then
		if songName == 'Filmetup' then
			startDialogue('filmetupD', 'freakyMenuMinus')
		end
		allowCountdown = true;
		return Function_Stop
	end
	return Function_Continue
end