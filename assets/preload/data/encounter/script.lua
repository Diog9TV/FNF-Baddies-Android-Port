local allowCountdown = false;
local playDialogue = true;

function onStartCountdown()
	if not allowCountdown and isStoryMode and not seenCutscene then --Block the first countdown
		startVideo('steph');
		allowCountdown = true;
		playDialogue = true;
		return Function_Stop;

	elseif playDialogue then

		setProperty('inCutscene', true);
		runTimer('startDialogue', 0.8);
		playDialogue = true;
		return Function_Stop;
	end
	return Function_Continue;
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'startDialogue' then -- Timer completed, play dialogue
		startDialogue('dialogue', 'encounter');
	end
end

function onNextDialogue(count)
	-- triggered when the next dialogue line starts, 'line' starts with 1
end

function onSkipDialogue(count)
	-- triggered when you press Enter and skip a dialogue line that was still being typed, dialogue line starts with 1
end
