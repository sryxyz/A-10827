function onCreate()
	makeLuaSprite('paint', 'paint', -300, 170);
	scaleObject('paint', 2, 1.8, false)
	setScrollFactor('paint', 0.9, 0.9);	
	addLuaSprite('paint', false);
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end