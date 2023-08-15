local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then
		if songName == 'Whacked' then
			startDialogue('whackedD', 'freakyMenuMinus')
		elseif songName == 'Disturbance' then
			startDialogue('disturbanceD', 'freakyMenuMinus')
		end
		allowCountdown = true;
		return Function_Stop
	end
	return Function_Continue
end

function onCreate()
	addCharacterToList('bfkid', 'bf');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfkid');

	makeLuaSprite('unconscious', 'unconscious', -560, -260);
	addLuaSprite('unconscious', false);
	scaleObject('unconscious', 0.9, 0.9, false)
	setLuaSpriteScrollFactor('unconscious', 1, 1)
end

local xx = 530;
local yy = 400;
local xx2 = 780;
local yy2 = 520;
local ofs = 20;
local CZoom = 0.7;
local CZoom1 = 0.85;
local followchars = true;

function onUpdate(elapsed)
 	if followchars == true then
		if mustHitSection == false then
			setProperty('defaultCamZoom', CZoom)
			if getProperty('dad.animation.curAnim.name') == 'singLEFT' or getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
				triggerEvent('Camera Follow Pos',xx-ofs,yy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singRIGHT' or getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
				triggerEvent('Camera Follow Pos',xx+ofs,yy)
			end
			if getProperty('dad.animation.curAnim.name') == 'singUP' or getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
				triggerEvent('Camera Follow Pos',xx,yy-ofs)
			end
			if getProperty('dad.animation.curAnim.name') == 'singDOWN' or getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
				triggerEvent('Camera Follow Pos',xx,yy+ofs)
			end
			if getProperty('dad.animation.curAnim.name') == 'idle' or getProperty('dad.animation.curAnim.name') == 'idle-alt' then
				triggerEvent('Camera Follow Pos',xx,yy)
			end
		else
			setProperty('defaultCamZoom', CZoom1)
			if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' or getProperty('boyfriend.animation.curAnim.name') == 'singLEFT-alt' then
				triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' or getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
				triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singUP' or getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
				triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' or getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
				triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
			end
			if getProperty('boyfriend.animation.curAnim.name') == 'idle' or getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
				triggerEvent('Camera Follow Pos',xx2,yy2)
			end
		end
	else
		triggerEvent('Camera Follow Pos','','')
	end
end