ESX = nil
Citizen.CreateThread(function()
    while true do
        Wait(1000)
        if ESX ~= nil then
            PlayerData = ESX.GetPlayerData()
            if PlayerData.job ~= nil then
                PlayerJob = PlayerData.job.name
            end
        else
            TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        end
    end
end)

-- Police Stuff
RegisterCommand("EvidenceLocker", function()
	if PlayerData.job.name == 'police' then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_STAND_MOBILE', 0, true)
		exports['progressBars']:startUI(10000, "Requesting Access")
		Wait(10000)	
		TriggerEvent('inventory:openStorage', "Evidence Locker", "evidence-locker-1", 1000, 1000, {"police"})
		TriggerEvent('phone:notify', { app = 'dispatch', title = 'Access Granted', content = 'Access to Evidence Locker Granted'})
		AddEventHandler("inventory:close", function()
			ClearPedTasks(GetPlayerPed(-1))
		end)
	else
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)		
	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_STAND_MOBILE', 0, true)
	exports['progressBars']:startUI(5000, "Requesting Access")
	Wait(5000)		
	exports['mythic_notify']:DoHudText('error', "Access to Evidence Food denied, Police have been called!", 8000)	
	TriggerEvent("tgiann-policeAlert:alert", "Reports of attempted access to Evidence Locker!", false, vector3, false)	
	ClearPedTasks(GetPlayerPed(-1))	
	end	
end)

RegisterCommand("EvidenceFood", function()
	if PlayerData.job.name == 'police' then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_STAND_MOBILE', 0, true)
		exports['progressBars']:startUI(10000, "Requesting Access")
		Wait(10000)	
		TriggerEvent('inventory:openStorage', "Evidence Food", "evidence-food-1", 500, 1000, {"police"})
		TriggerEvent('phone:notify', { app = 'dispatch', title = 'Access Granted', content = 'Access to Evidence Food Granted'})
		AddEventHandler("inventory:close", function()
			ClearPedTasks(GetPlayerPed(-1))
		end)
	else
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)		
	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_STAND_MOBILE', 0, true)
	exports['progressBars']:startUI(5000, "Requesting Access")
	Wait(5000)		
	exports['mythic_notify']:DoHudText('error', "Access to Evidence Food denied, Police have been called!", 8000)	
	TriggerEvent("tgiann-policeAlert:alert", "Reports of attempted access to Evidence Food!", false, vector3, false)
	ClearPedTasks(GetPlayerPed(-1))	
	end	
end)

RegisterCommand('911', function()
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)	
	exports['mythic_notify']:DoHudText('success', "911 Call send. Units will be dispatched soon!", 8000)	
	TriggerServerEvent('dispatch:send', 'police', '911 Caller, Respond ASAP', GetEntityCoords(PlayerPedId()))	
end)

-- EMS Stuff
RegisterCommand("MedbagFood", function()
	if PlayerData.job.name == 'ambulance' then
		local playerPed = PlayerPedId()
		local coords = GetEntityCoords(playerPed)
		TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_STAND_MOBILE', 0, true)
		exports['progressBars']:startUI(10000, "Requesting Access")
		Wait(10000)	
		TriggerEvent('inventory:openStorage', "Medbag Food", "medbag-food-1", 500, 1000, {"ambulance"})
		TriggerEvent('phone:notify', { app = 'dispatch', title = 'Access Granted', content = 'Access to Medbag Food Granted'})
		AddEventHandler("inventory:close", function()
			ClearPedTasks(GetPlayerPed(-1))
		end)
	else
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)	
	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_STAND_MOBILE', 0, true)
	exports['progressBars']:startUI(5000, "Requesting Access")
	Wait(5000)		
	exports['mythic_notify']:DoHudText('error', "Access to Evidence Food denied, Police have been called!", 8000)	
	TriggerEvent("tgiann-policeAlert:alert", "Reports of attempted access to Medbag Food!", false, vector3, false)
	ClearPedTasks(GetPlayerPed(-1))
	end
end)

RegisterCommand('311', function()
    local ped = PlayerPedId()
    local pedCoords = GetEntityCoords(ped)	
	exports['mythic_notify']:DoHudText('success', "311 Call send. Units will be dispatched soon!", 8000)	
	TriggerServerEvent('dispatch:send', 'ambulance', '311 Caller, Respond ASAP', GetEntityCoords(PlayerPedId()))	
end)

-- Police & EMS Stuff 