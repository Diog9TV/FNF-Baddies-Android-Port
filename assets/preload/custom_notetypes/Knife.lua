function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Knife' 
		then	setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteTypes/Knife'); 
		
		setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', true);
		
		end
	end
	--debugPrint('Script started!')
	function noteMiss(id, i, noteType, isSustainNote)
		if noteType == 'Knife' then
		characterPlayAnim('boyfriend', 'hurt', false);
	end
end
end
-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false
 

-- Called after the note hit calculations



function goodNoteHit(id, noteData, noteType, isSustainNote)
	if noteType == "Knife" then 
		playSound('slash', 1); 
		triggerEvent('Play Animation', 'stab', 'BF') 
		triggerEvent('Play Animation', 'stab', 'Dad') 
		setProperty('health', getProperty('health')-0.55);
		runTimer('bleed', 0.2, 30); 
		cameraFlash('camGame', '660000', 1, false)

	end

end

function onTimerCompleted(tag, loops, loopsLeft)
	if loopsLeft >= 1 then
		setProperty('health', getProperty('health')-0.015);
	end
end