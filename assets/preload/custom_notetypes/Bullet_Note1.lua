function onCreate()
	--Iterate over all notes
	for i = 0, getProperty('unspawnNotes.length')-1 do
		if getPropertyFromGroup('unspawnNotes', i, 'noteType') == 'Bullet_Note1' then 
			setPropertyFromGroup('unspawnNotes', i, 'texture', 'noteTypes/Bullet_Note'); 
			

			if getPropertyFromGroup('unspawnNotes', i, 'mustPress') then 
				setPropertyFromGroup('unspawnNotes', i, 'ignoreNote', false); 
			end
		end
	end
end

local shootAnims = {"LEFTshoot", "DOWNshoot", "UPshoot", "RIGHTshoot"}
function goodNoteHit(id, direction, noteType, isSustainNote)
	if noteType == 'Bullet_Note1' then
	
		playSound('gun', 1);
		characterPlayAnim('dad', 'shot', true);
		characterPlayAnim('boyfriend', shootAnims[direction + 1], false);
		setProperty('boyfriend.specialAnim', true);
		cameraShake('camGame', 0.01, 0.2)
		setProperty('health', getProperty('health')+0.09);
    end
end

function noteMiss(id, direction, noteType, isSustainNote)
	if noteType == "Bullet_Note1" then
		setProperty('health', -500);
	end
end
