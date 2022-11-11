--replace default event `'esx_status:onTick'` with this below

local startEffectHunger = false
local startEffectThirst = false
AddEventHandler('esx_status:onTick', function(data)
	local playerPed  = PlayerPedId()
	for k, v in pairs(data) do
		
		--SCREEN EFFECT FOR HUNGER
		if v.name == 'hunger' and v.percent == 0 then
			startEffectHunger = true
			if startEffectHunger then
				StartScreenEffect('MP_Celeb_Lose', 0, true)	
				ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.1)
				RequestAnimSet("move_m@drunk@slightlydrunk", 1)
				SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
				--- ADD MORE IF U WANT BUT DONT FORGET TO STOP IT BELOW
			end
		else
			if v.name == 'hunger' and v.percent > 0 and startEffectHunger then
				StopScreenEffect('MP_Celeb_Lose')
				ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.0)
				ResetPedMovementClipset(playerPed)
				startEffectHunger = false
			end
		end
		
		--SCREEN EFFECT FOR THIRST
		if v.name == 'thirst' and v.percent == 0 then
			startEffectThirst = true
			if startEffectThirst then
				StartScreenEffect('MP_Celeb_Lose', 0, true)	
				ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.1)
				RequestAnimSet("move_m@drunk@slightlydrunk", 1)
				SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
				--- ADD MORE IF U WANT BUT DONT FORGET TO STOP IT BELOW
			end
		else
			if v.name == 'thirst' and v.percent > 0 and startEffectThirst then
				StopScreenEffect('MP_Celeb_Lose')
				ShakeGameplayCam("SMALL_EXPLOSION_SHAKE", 0.0)
				ResetPedMovementClipset(playerPed)
				startEffectThirst = false
			end
		end
	end
end)
