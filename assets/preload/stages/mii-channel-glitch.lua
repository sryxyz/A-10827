function onCreate()
	addCharacterToList('BOYFRIENDMII', 'bf');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bf-mii');

	makeAnimatedLuaSprite('Glitchmiibuttons', 'Glitchmiibuttons', -600, -420);
	scaleObject('Glitchmiibuttons', 1.1, 1.1, false)
	setScrollFactor('stagecurtains', 0.9, 0.9);
	makeLuaSprite('corruptback', 'corruptback', -560, -300);
	scaleObject('corruptback', 1.1, 1.1, false)
	setScrollFactor('corruptback', 0.9, 0.9);

	addAnimationByPrefix('Glitchmiibuttons', 'Glitchmiibuttons', 'stagecurtains', 24, true)
	addLuaSprite('corruptback', false);
	addLuaSprite('Glitchmiibuttons', true);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end