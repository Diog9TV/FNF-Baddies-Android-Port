local xx = 360;
local yy = 470;
local xx2 = 920;
local yy2 = 460;
local ofs = 20;
local followchars = true;
local del = 0;
local del2 = 0;

function onCreate()

	setProperty('cameraSpeed', 2)

	camX = 'camFollow.x';	
	camY = 'camFollow.y';

	setPropertyFromClass('GameOverSubstate', 'characterName', 'Casanova'); --Character json file for the death animation
	setPropertyFromClass('GameOverSubstate', 'deathSoundName', 'nova_death'); --put in mods/sounds/
	setPropertyFromClass('GameOverSubstate', 'loopSoundName', 'gameOverLatina'); --put in mods/music/
	setPropertyFromClass('GameOverSubstate', 'endSoundName', 'gameOverLatinaEnd'); --put in mods/music/

	doTweenColor('bfColorTween', 'boyfriend', 'FF3333', 2, 'linear');--d87f7f
	doTweenColor('dadColorTween', 'dad', 'FF3333', 2, 'linear')
	--the universe together

	makeLuaSprite('uniBG', 'universe/worldBG', -2150, -650);
	setScrollFactor('uniBG', 0.9, 0.9);
	scaleObject('uniBG', '1','1');
	scaleObject('uniBG', '1.3','1.2');
	addLuaSprite('uniBG',false)

   if not lowQuality then

	makeAnimatedLuaSprite('stuff1', 'universe/world', -700,-900) --the final bg shit
	addAnimationByPrefix('stuff1', 'ads', 'glowingShits',24,true)
	objectPlayAnimation('stuff1', 'ads',false)
	setScrollFactor('stuff1', 0.9, 0.9);
	scaleObject('stuff1', '2.6','2.4');
	setBlendMode('stuff1', 'add')
	targetAlpha = tonumber(0.95);
			setProperty('stuff1.alpha', targetAlpha);
   end

	makeAnimatedLuaSprite('faces', 'universe/fadeIn', 1900,-100) --the final bg shit
	addAnimationByPrefix('faces', 'portraitsNova', 'novaFadeIns',9,true)
	objectPlayAnimation('faces', 'portraitsNova',false)
	setScrollFactor('faces', 0.9, 0.9);
	scaleObject('faces', '2.4','2.4');
	setScrollFactor('faces', 0, 0);
	setObjectCamera('faces', 'game')
	
	targetAlpha = tonumber(0.7);
	setProperty('faces.alpha', targetAlpha);


	--jasmine's background (done)

	makeLuaSprite('victoriaSecret', 'universe/jasmineBG', -1700, -450);
	setScrollFactor('victoriaSecret', 0.9, 0.9);
	addLuaSprite('victoriaSecret', false);
	scaleObject('victoriaSecret', '2.6','2.2');
	
	addLuaSprite('victoriaSecret', false);
	addLuaSprite('broke',false)

	--pico background

	makeLuaSprite('pico', 'universe/picoBG', -900, -510);
	setScrollFactor('pico', 0.7, 0.9);
	scaleObject('pico', '2.2','2.4');


	if not lowQuality then

	makeAnimatedLuaSprite('fire', 'universe/fire', -750,-500)
	addAnimationByPrefix('fire', 'oops', 'fireBG',8,true)
	objectPlayAnimation('fire', 'oops',false)
	setScrollFactor('fire', 0.4, 0.4);
	scaleObject('fire', '2.6','2.2');
	setBlendMode('fire', 'add')
        
        end

	makeLuaSprite('ground', 'universe/picoRoof', -1000, -110);
	setScrollFactor('ground', 0.9, 0.9);
	scaleObject('ground', '2','2.4');

	if not lowQuality then
		makeAnimatedLuaSprite('ritzdeadlol', 'universe/picoMia', 800,190) --the final bg shit
		addAnimationByPrefix('ritzdeadlol', 'normal', 'pico',12,true)
		objectPlayAnimation('ritzdeadlol', 'normal',false)
		setScrollFactor('ritzdeadlol', 0.9, 0.9);

		makeAnimatedLuaSprite('chud', 'universe/darnell', -300,220) --the final bg shit
		addAnimationByPrefix('chud', 'normal', 'darnell',12,true)
		addAnimationByPrefix('chud', 'fire', 'darnellFire',12,true)
		setScrollFactor('chud', 0.9, 0.9);
		objectPlayAnimation('chud', 'normal',false)
		scaleObject('chud', '0.95','0.95');

		makeLuaSprite('trains', 'universe/blurredTrains', -2000, -110);
		setScrollFactor('trains', 0.9, 0.9);
		scaleObject('trains', '3.6','4');
	end

	addLuaSprite('pico', false);
	addLuaSprite('fire',false)
	addLuaSprite('ground', false);
	addLuaSprite('ritzdeadlol',false)
	addLuaSprite('chud',false)


	--tankman background

	makeLuaSprite('tank', 'universe/tankManBG', -1330, -500);
	setScrollFactor('tank', 0.9, 0.9);
	scaleObject('tank', '2.6','2.6');

	if not lowQuality then
		makeAnimatedLuaSprite('bops', 'universe/bops', 25,100)
		addAnimationByPrefix('bops', 'bgbops2', 'tankBops',24,true)
		objectPlayAnimation('bops', 'bgbops2',false)
		setScrollFactor('bops', 0.9, 0.9);
		scaleObject('bops', '1.1','1.1');
	end

	addLuaSprite('tank', false);
	addLuaSprite('bops',false);



	--weather/effects on top of sprites

	makeLuaSprite('light', 'universe/lights', -200, -100);
        scaleObject('light', '2','2');
	setScrollFactor('light', 0.9, 0.9);
	setBlendMode('light', 'add')

	if not lowQuality then
		makeLuaSprite('haze', 'newYork/groundHaze', -600, 300);
		scaleObject('haze', '4','4');
		setScrollFactor('haze', 0.9, 0.9);
		addLuaSprite('haze', true);

		makeAnimatedLuaSprite('rainDrop', 'cyberCity/rain', -510,-300)
		addAnimationByPrefix('rainDrop', 'bounce', 'rain tho',24,true)
		objectPlayAnimation('rainDrop', 'bounce',false)
		scaleObject('rainDrop', '4','4');
		setBlendMode('rainDrop', 'overlay')
		targetAlpha = tonumber(0.2);
			setProperty('rainDrop.alpha', targetAlpha);

		makeAnimatedLuaSprite('snowy', 'newYork/snow', -300,-100)
		addAnimationByPrefix('snowy', 'fall', 'daSnow',16,true)
		objectPlayAnimation('snowy', 'fall',false)
		scaleObject('snowy', '4','4');
		setScrollFactor('snowy', 1.4, 1.6);

		makeLuaSprite('action', 'tunnel/movie bars', -500, -210); --movie effect
		setScrollFactor('action', 0, 0);
		scaleObject('action', '10','10');
		--addLuaSprite('action', true);
		setObjectCamera('action', 'hud')
		--setObjectOrder('action',  1)
	end

	makeLuaSprite('dead', 'newYork/black', -120, -100); --hide the scene
	scaleObject('dead', '100','100');
	addLuaSprite('dead', true);
	setObjectCamera('dead', 'hud')

	makeAnimatedLuaSprite('rate', 'ratings', 300,300) --ratings
	addAnimationByPrefix('rate', 'sick', 'sickRating',24,false)
	setScrollFactor('rate', 0, 0);
	setObjectCamera('rate', 'hud')
	
	--gonna precache this shit so yall PC's won't explode

	precacheImage('newYork/groundHaze');
	precacheImage('universe/lights');


	--jasmineShit
	precacheImage('victoriaSecret/wall base');

	--picoShit
	precacheImage('universe/picoRoof');
	precacheImage('universe/picoBG');

	--tankmanShit
	precacheImage('universe/tankManBG');
        
        --precache for no low quality

   if not lowQuality then
	precacheImage('universe/bops');
	precacheImage('universe/darnell');
	precacheImage('universe/picoMia');
	precacheImage('universe/fire');
	precacheImage('universe/world');
	precacheImage('universe/jasmineShooting');
	precacheImage('newYork/snow');
	precacheImage('cyberCity/rain');
   end
	
	--lmao thats a lot of shit, sorry 
	

end

function onUpdate()

	setProperty('gf.scrollFactor.x', 0.9);
	setProperty('gf.scrollFactor.y', 0.9);

	setProperty('boyfriend.scrollFactor.x', 0.9);
	setProperty('boyfriend.scrollFactor.y', 0.9);
	
	setProperty('dad.scrollFactor.x', 0.9);
	setProperty('dad.scrollFactor.y', 0.9);

	if del > 0 then
		del = del - 1
	end
	if del2 > 0 then
		del2 = del2 - 1
	end
    if followchars == true then
        if mustHitSection == false then
            if getProperty('dad.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singLEFT-alt' then
                triggerEvent('Camera Follow Pos',xx-ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx+ofs,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx,yy-ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx,yy+ofs)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
            if getProperty('dad.animation.curAnim.name') == 'idle' then
                triggerEvent('Camera Follow Pos',xx,yy)
            end
           
        else
               
            if getProperty('boyfriend.animation.curAnim.name') == 'singLEFT' then
                triggerEvent('Camera Follow Pos',xx2-ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singRIGHT-alt' then
                triggerEvent('Camera Follow Pos',xx2+ofs,yy2)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singUP-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2-ofs)
            end
            if getProperty('boyfriend.animation.curAnim.name') == 'singDOWN-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2+ofs)
            end
	    if getProperty('boyfriend.animation.curAnim.name') == 'idle-alt' then
                triggerEvent('Camera Follow Pos',xx2,yy2)
            end
        end
    else
        triggerEvent('Camera Follow Pos','','') -- self explanatory
    end
    
end



function onBeatHit()
	
	objectPlayAnimation('stuff', 'bgbops',true)
	objectPlayAnimation('bops', 'bgbops2',false)
end

stepHitFuncs = { -- ah yeah, the shits
	

	[50] = function() --removes black screen
		
		removeLuaSprite('dead', true);
		cameraFlash('camGame', 'FFFFFF', 1, false)
		cameraShake('camGame', 0.15, 0.2)
		doTweenZoom('come on', 'camGame', 0.7, 4, 'circInOut');
		playSound('woosh', 1);
		triggerEvent('Play Animation', 'boring', 'Dad') 
	end,
	
	[512] = function() --adds red hue for the pico BG/removes tankman BG

		addLuaSprite('trains', true);
		setObjectOrder('ritzdeadlol',  8)
		removeLuaSprite('tank', false);
		cameraFlash('camGame', 'FFFFFF', 2, false)
		cameraShake('camGame', 0.15, 0.4)
		removeLuaSprite('bops',false)
		addLuaSprite('rainDrop',true)
		doTweenZoom('come on', 'camGame', 0.7, 2, 'circInOut');
		
	end,
	[836] = function()
		setProperty(camY,400)
		setProperty(camX,920)
		objectPlayAnimation('chud', 'darnellFire',false)
		doTweenZoom('come on', 'camGame', 0.65, 2, 'smootherStepOut');
	end,
	
	[882] = function() --removes picos BG and hue
		removeLuaSprite('ground', false);
		removeLuaSprite('ritzdeadlol',true)
		setProperty('gf.alpha', 0)
		removeLuaSprite('rainDrop',false)
		removeLuaSprite('pico', false);
		removeLuaSprite('fire', false);
		removeLuaSprite('blurr', false);
		removeLuaSprite('hue', false);
		--addLuaSprite('jazz',false)
		cameraFlash('camGame', 'FFFFFF', 2, false)
		cameraShake('camGame', 0.15, 0.4)
		targetAlpha = tonumber(0);
		playSound('woosh', 1);
		removeLuaSprite('chud',false)
	end,

	[1152] = function() --removes jasmines BG
		addLuaSprite('stuff1',false)
		addLuaSprite('faces',true)
		removeLuaSprite('broke',false)
		removeLuaSprite('victoriaSecret', false);
		cameraFlash('camGame', 'FFFFFF', 2, false)
		cameraShake('camGame', 0.15, 0.4)
		removeLuaSprite('jazz',false)
		addLuaSprite('light', true);
		targetAlpha = tonumber(0.5);
		setProperty('rainDrop.alpha', targetAlpha);
		addLuaSprite('snowy',true)
		doTweenZoom('come on', 'camGame', 0.75, 2, 'circInOut');
		
	end,

	[1275] = function() --the voices oh god
		
		doTweenX('move', 'faces', -500, 20, 'smootherStepOut')
		runTimer('daFaces', 18, 1);
	end,
	
	[1536] = function() --ending
		removeLuaSprite('freeze', false);
		cameraFlash('camGame', 'FFFFFF', 5, false)
		cameraShake('camGame', 0.15, 0.2)
		cameraFade('camGame', '000000', 1, false)
	end,

	[1552] = function() --ratings
		if rating > 0.95 then
			addLuaSprite('rate',true)
			objectPlayAnimation('rate', 'sick',false)
			runTimer('daRating', 1.6, 1);
			playSound('rate', 1);
		end
	end
	

}

function onStepHit()
	if stepHitFuncs[curStep] then
		stepHitFuncs[curStep]()
	end
end

function onBeatHit()
	objectPlayAnimation('bops', 'bgbops2',true)
	objectPlayAnimation('ritzdeadlol', 'normal',true)
	objectPlayAnimation('chud', 'normal',true)


	if getProperty('boyfriend.animation.curAnim.name') == 'idle' then
		characterPlayAnim('boyfriend','idle',true)
	end
end

function onTimerCompleted(tag, loops, loopsLeft)
	if tag == 'daRating' then
		removeLuaSprite('rate'); --removing her to make the game run slightly better
	end
	if tag == 'daFaces' then
		removeLuaSprite('faces'); --removing her to make the game run slightly better
	end
end