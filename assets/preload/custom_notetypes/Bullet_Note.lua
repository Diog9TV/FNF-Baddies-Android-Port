function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		--Check if the note is an Instakill Note
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet_Note' then
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteTypes/Bullet_Note'); 

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
			end
		end
	end
	--debugPrint('Script started!')
end

-- Function called when you hit a note (after note hit calculations)
-- id: The note member id, you can get whatever variable you want from this note, example: "getPropertyFromGroup('notes', id, 'strumTime')"
-- noteData: 0 = Left, 1 = Down, 2 = Up, 3 = Right
-- noteType: The note type string/tag
-- isSustainNote: If it's a hold note, can be either true or false


-- Called after the note miss calculations
-- Player missed a note by letting it go offscreen

function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet_Note' then
		playSound('gun', 1);
		triggerEvent('Play Animation', 'shoot', 'BF') 
		triggerEvent('Play Animation', 'shot', 'Dad') 
		cameraShake('camGame', 0.01, 0.2)
		setProperty('health', getProperty('health')+0.09);
	end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == "Bullet_Note" then
		setProperty('health', -500);
	end
end