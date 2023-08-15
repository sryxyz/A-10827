local allowCountdown = false;
function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then
		runTimer('RunDiag', 0.5)
		allowCountdown = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onCreate()
	setProperty('skipCountdown', true)
	
	setProperty('iconP1.visible', false)
	setProperty('iconP2.visible', false)
	setProperty('scoreTxt.visible', false)
	setProperty('healthBar.visible', false)
	setProperty('healthBarBG.visible', false)
	
	if difficultyName == 'Normal' then
		makeLuaSprite('ponyback', 'ponyback', -400, -300)
		setProperty('ponyback.alpha', 0.001)
		addLuaSprite('ponyback', true)
		
		makeLuaSprite('ponyfront', 'ponyfront', getProperty('ponyback.x'), getProperty('ponyback.y')+getProperty('ponyback.height')-600)
		setProperty('ponyfront.alpha', 0.001)
		addLuaSprite('ponyfront', true)
	end
	if difficultyName == 'Hard' then
		setProperty('auraFunc', 'onUpdate')
	end
end

function onSongStart()
	if difficultyName == 'Easy' then
		setPropertyFromGroup('spawnNotes', i, 'noAnimation', true); --crash time!!
	end
	setProperty('camHUD.visible', false)setProperty('camHUD.visible', false)
	
	setProperty('songScore', 404)
end

function onCreatePost()
	if difficultyName == 'Hard' then
		makeLuaSprite('justhelpme', 'justhelpme', 0, 0)
		setObjectCamera('justhelpme', 'camHUD')
		addLuaSprite('justhelpme', true)
	end
end

function onNextDialogue(line)
	if line == 11 then
		doTweenAlpha('ponybackAlpha', 'ponyback', 1, 0.25)
		doTweenAlpha('ponyfrontAlpha', 'ponyfront', 1, 0.25)
	end
	if line == 16 then
		runTimer('Error', 0.1, 0)
	end
end

local hudShake = 0;

function onUpdate(elapsed)
	if difficultyName == 'Hard' then 
		setProperty('chromMinimum', getProperty('chromMinimum')+elapsed/500)
		cameraShake('hud', hudShake, 0.1)
		hudShake = hudShake + elapsed/10000;
		if keyJustPressed('accept') or keyJustPressed('space') then
			if getRandomBool(5) then
				exitSong();
			else
				playSound('Nope', 0.6)
			end
		end
	end
	
	setProperty('camFollowPos.x', getProperty('boyfriend.x'))
	setProperty('camFollowPos.y', getProperty('boyfriend.y')+50)
	setProperty('camFollow.x', getProperty('boyfriend.x'))
	setProperty('camFollow.y', getProperty('boyfriend.y')+50)
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'RunDiag' then
		if difficultyName == 'Easy' then
			startDialogue('easyprologue', 'breakfast')
		elseif difficultyName == 'Normal' then
			startDialogue('normalprologue', 'breakfast')
		else
			playMusic('pulse', 1)
			runTimer('DEMISE', 20)
			allowCountdown = true;
		end
	end
	if tag == 'Error' then
		playSound('Nope', 1)
	end
	if tag == 'DEMISE' then
		playSound('Nope', 1)
		setPropertyFromGroup('spawnNotes', i, 'noAnimation', true); --crash time!!
	end
end