function onCreate()
	-- background shit
	makeLuaSprite('Jotaro', 'street/Jotaro', -520, 210);
	scaleObject('Jotaro', 1, 1, false)
	setScrollFactor('Jotaro', 1, 1);
	makeLuaSprite('Lampposts', 'street/Lampposts', -520, -270);
	scaleObject('Lampposts', 1, 1, false)
	setScrollFactor('Lampposts', 1, 1);
	makeLuaSprite('PonyTree', 'street/PonyTree', 1480, 790);
	scaleObject('PonyTree', 1, 1, false)
	setScrollFactor('PonyTree', 1, 1);
	makeLuaSprite('Trees', 'street/Trees', -520, -270);
	scaleObject('Trees', 1, 1, false)
	setScrollFactor('Trees', 1, 1);
	makeLuaSprite('Street', 'street/Street', -520, -270);
	scaleObject('Street', 1, 1, false)
	setScrollFactor('Street', 1, 1);
	makeLuaSprite('PonyBusStopUp', 'street/PonyBusStopUp', 1172,780);
	scaleObject('PonyBusStopUp', 1, 1, false)
	setScrollFactor('PonyBusStopUp', 1, 1);
	makeLuaSprite('Griffon', 'street/Griffon', 1680, 800);
	scaleObject('Griffon', 1, 1, false)
	setScrollFactor('Griffon', 0.9, 1);
	makeLuaSprite('BusStop', 'street/BusStop', -520, -270);
	scaleObject('BusStop', 1, 1, false)
	setScrollFactor('BusStop', 1, 1);
	makeLuaSprite('PonyBusStopDown', 'street/PonyBusStopDown', 1110, 810);
	scaleObject('PonyBusStopDown', 1, 1, false)
	setScrollFactor('PonyBusStopDown', 1, 1);
	makeLuaSprite('Bus', 'street/Bus', -520, -270);
	scaleObject('Bus', 1, 1, false)
	setScrollFactor('Bus', 1, 1);
	makeLuaSprite('BuildingFront', 'street/BuildingFront', -560, -270);
	scaleObject('BuildingFront', 1, 1, false)
	setScrollFactor('BuildingFront', 0.9, 0.9);
	makeLuaSprite('Sun', 'street/Sun', 1340, -170);
	scaleObject('Sun', 1, 1, false)
	setScrollFactor('Sun', 0.6, 0.7);
	makeLuaSprite('BuildingBack', 'street/BuildingBack', -590, -270);
	scaleObject('BuildingBack', 1, 1, false)
	setScrollFactor('BuildingBack', 0.8, 0.9);
	makeLuaSprite('Sky', 'street/Sky', -520, -270);
	scaleObject('Sky', 1, 1, false)

	
	addLuaSprite('Sky', false);
	addLuaSprite('BuildingBack', false);
	addLuaSprite('Sun', false);
	addLuaSprite('BuildingFront', false);
	addLuaSprite('Bus', false);
	addLuaSprite('PonyBusStopDown', false);
	addLuaSprite('Street', false);
	addLuaSprite('Jotaro', false);
	addLuaSprite('Lampposts', false);
	addLuaSprite('BusStop', false);
	addLuaSprite('PonyBusStopUp', false);
	addLuaSprite('Griffon', false);
	addLuaSprite('Trees', false);
	addLuaSprite('PonyTree', false);
	
	
	close(true); --For performance reasons, close this script once the stage is fully loaded, as this script won't be used anymore after loading the stage
end