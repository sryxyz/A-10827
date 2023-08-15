local allowCountdown = false
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then
		if songName == 'Frustration' then
			startDialogue('frustrationD', 'freakyMenuMinus')
		end
		allowCountdown = true;
		return Function_Stop
	end
	return Function_Continue
end

function onCreate()
	addCharacterToList('bfkid', 'bf');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'bfkid');

	makeLuaSprite('unconsciousdark', 'unconsciousdark', -560, -260);
	addLuaSprite('unconsciousdark', false);
	scaleObject('unconsciousdark', 0.9, 0.9, false)
	setLuaSpriteScrollFactor('unconsciousdark', 1, 1)
end

function onCreatePost()
	makeLuaSprite('Vig', 'whitevignette', 0, 0)
	setObjectCamera('Vig', 'camOther')
	scaleObject('Vig', 0.64, 0.64)
	setBlendMode('Vig', 'ADD')
	setProperty('Vig.alpha', 0.01)
	setProperty('Vig.color', getColorFromHex('FF0000'))
	addLuaSprite('Vig', true)
end

function onCountdownTick(c)
	setProperty('Vig.alpha', getProperty('Vig.alpha')+0.25)
	doTweenAlpha('VigAlpha', 'Vig', 0, 0.75)
end

function onStepHit()
	cameraShake('hud', 0.0015, 0.05)
end

function onBeatHit()
	if curBeat % 4 == 0 then
		setProperty('Vig.alpha', 0.7)
		doTweenAlpha('VigAlpha', 'Vig', 0, 0.75)
	end
end

local xx = 580;
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