function onCreate()
    	setTextFont('scoreTxt', 'TRIGLE.TTF')
    	setTextFont('timeTxt', 'TRIGLE.TTF')
	precacheImage('arrow');
	addCharacterToList('garDTface', 'dad');
	addCharacterToList('annieDTface', 'bf');
	addCharacterToList('karaDTDeath', 'bf');
	setPropertyFromClass('GameOverSubstate', 'characterName', 'karaDTDeath'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'DilemmaDeath'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'DilemmaGameOver'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'DilemmaRetry'); --put in mods/music/
end

function onStepHit()
	if curStep == 15 then
		makeAnimatedLuaSprite('funnyarrow', 'arrow', 340, 120)
		addAnimationByPrefix('funnyarrow','loop','arrow loop','24',true)
		objectPlayAnimation('funnyarrow','loop',false)
		scaleObject('funnyarrow', 1, 1);

		addLuaSprite('funnyarrow', true);
	end

	if curStep == 31 then
		doTweenAlpha('byebye', 'funnyarrow', 0, 0.5, 'linear');
	end
end