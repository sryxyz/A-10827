function onCreate()
	addCharacterToList('bftrigle', 'bf');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bftrigle');

	makeLuaSprite('theorybg', 'theorybg', -560, -300);
	scaleObject('theorybg', 1.5, 1.5, false)
	setScrollFactor('theorybg', 0.9, 0.9);	
	addLuaSprite('theorybg', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end