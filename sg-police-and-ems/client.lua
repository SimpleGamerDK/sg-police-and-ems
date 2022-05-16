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
-- Start of Work Benches --
Citizen.CreateThread(function()
	exports['qtarget']:AddBoxZone("SandyPDCrafting", vector3(1838.99, 3686.67, 34.19), 2.0, 0.85, {
	  name="SandyPDCrafting",
	  heading=30,
	  --debugPoly=true,
	  minZ=33.19,
	  maxZ=35.39
	}, {
		options = {
			{
			event = "sg-police-and-ems:PDCrafting",
			icon = "fas fas-hand-holding-droplet",
			label = "Open Workbench",
			},
		},
			distance = 1.5 
	})
	
	exports['qtarget']:AddBoxZone("PaletoPDCrafting", vector3(-447.69, 6016.96, 37.0), 2.05, 0.9, {
	  name="PaletoPDCrafting",
	  heading=315,
	  --debugPoly=true,
	  minZ=36.0,
	  maxZ=38.2
	}, {
		options = {
			{
			event = "sg-police-and-ems:PDCrafting",
			icon = "fas fas-hand-holding-droplet",
			label = "Open Workbench",
			},
		},
			distance = 1.5 
	})
	
	exports['qtarget']:AddBoxZone("DavisPDCrafting", vector3(361.94, -1603.72, 25.45), 0.9, 2.05, {
	  name="DavisPDCrafting",
	  heading=320,
	  --debugPoly=true,
	  minZ=24.45,
	  maxZ=26.65
	}, {
		options = {
			{
			event = "sg-police-and-ems:PDCrafting",
			icon = "fas fas-hand-holding-droplet",
			label = "Open Workbench",
			},
		},
			distance = 1.5 
	})
	
	exports['qtarget']:AddBoxZone("MRPDCrafting", vector3(488.01, -997.02, 30.69), 2.05, 0.85, {
	  name="MRPDCrafting",
	  heading=0,
	  --debugPoly=true,
	  minZ=29.69,
	  maxZ=31.89
	}, {
		options = {
			{
			event = "sg-police-and-ems:PDCrafting",
			icon = "fas fas-hand-holding-droplet",
			label = "Open Workbench",
			},
		},
			distance = 1.5 
	})	
end)

RegisterNetEvent('sg-police-and-ems:PDCrafting')
AddEventHandler('sg-police-and-ems:PDCrafting',function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local items = {
      {type = 'item', name = '12gauge', count = 12, time = 5, ingredients = {
        {name = 'box_of_12gauge', count = 1}
      }}, 
      {type = 'item', name = '9mm', count = 50, time = 7, ingredients = {
        {name = 'box_of_9mm', count = 1}		
      }}, 
      {type = 'item', name = '5ammo', count = 20, time = 5, ingredients = {
        {name = 'box_of_556', count = 1}
      }}, 
      {type = 'item', name = '762mm', count = 20, time = 5, ingredients = {
        {name = 'box_of_762', count = 1}
      }}
	  }	
	TriggerEvent("inventory:openCrafting", 'Workbench', items)	
end)
-- End of Work Benches --

-- Start of Shops --
Citizen.CreateThread(function()
	exports['qtarget']:AddBoxZone("SandyPDShop", vector3(1836.82, 3685.08, 34.19), 1.0, 0.4, {
	  name="SandyPDShop",
	  heading=30,
	  --debugPoly=true,
	  minZ=33.19,
	  maxZ=35.99
	}, {
		options = {
			{
			event = "sg-police-and-ems:PDShop",
			icon = "fas fas-hand-holding-droplet",
			label = "Open Lockers",
			},
		},
			distance = 1.5 
	})
	
	exports['qtarget']:AddBoxZone("PaletoPDShop", vector3(-446.24, 6019.11, 37.0), 3.0, 0.5, {
	  name="PaletoPDShop",
	  heading=315,
	  --debugPoly=true,
	  minZ=36.0,
	  maxZ=38.8
	}, {
		options = {
			{
			event = "sg-police-and-ems:PDShop",
			icon = "fas fas-hand-holding-droplet",
			label = "Open Lockers",
			},
		},
			distance = 1.5 
	})
	
	exports['qtarget']:AddBoxZone("DavisPDShop", vector3(360.69, -1600.0, 25.45), 4.15, 0.55, {
	  name="DavisPDShop",
	  heading=320,
	  --debugPoly=true,
	  minZ=24.45,
	  maxZ=27.25
	}, {
		options = {
			{
			event = "sg-police-and-ems:PDShop",
			icon = "fas fas-hand-holding-droplet",
			label = "Open Lockers",
			},
		},
			distance = 1.5 
	})
	
	exports['qtarget']:AddBoxZone("MRPDShop", vector3(481.48, -994.95, 30.69), 0.75, 3.15, {
	  name="MRPDShop",
	  heading=0,
	  --debugPoly=true,
	  minZ=29.69,
	  maxZ=32.49
	}, {
		options = {
			{
			event = "sg-police-and-ems:PDShop",
			icon = "fas fas-hand-holding-droplet",
			label = "Open Lockers",
			},
		},
			distance = 1.5 
	})	
end)

RegisterNetEvent('sg-police-and-ems:PDShop')
AddEventHandler('sg-police-and-ems:PDShop',function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	local shop = {
      {type = 'item', name = 'firearms_license', method = 'money', price = 250, sellPrice = false}, 
      {type = 'item', name = 'spikestrip', method = 'money', price = 123, sellPrice = false}, 	  
      {type = 'item', name = 'handcuffs', method = 'money', price = 153, sellPrice = false},
      {type = 'item', name = 'radio', method = 'money', price = 400, sellPrice = false},
      {type = 'item', name = 'fixkit', method = 'money', price = 500, sellPrice = false},	  
      {type = 'item', name = 'lightarmour', method = 'money', price = 3000, sellPrice = false},
      {type = 'item', name = 'mediumarmour', method = 'money', price = 9000, sellPrice = false},
      {type = 'item', name = 'heavyarmour', method = 'money', price = 15000, sellPrice = false},
      {type = 'item', name = 'box_of_9mm', method = 'money', price = 21, sellPrice = 0},
      {type = 'item', name = 'box_of_12gauge', method = 'money', price = 43, sellPrice = 0},
      {type = 'item', name = 'box_of_556', method = 'money', price = 67, sellPrice = 0},
      {type = 'item', name = 'box_of_762', method = 'money', price = 83, sellPrice = 0},	  
      {type = 'weapon', name = 'weapon_flashlight', method = 'money', price = 100, sellPrice = false},
      {type = 'weapon', name = 'weapon_nightstick', method = 'money', price = 100, sellPrice = false},
      {type = 'weapon', name = 'weapon_stungun', method = 'money', price = 200, sellPrice = false},
      {type = 'weapon', name = 'weapon_combatpistol', method = 'money', price = 200, sellPrice = false, ammo = 20},
      {type = 'weapon', name = 'weapon_carbinerifle', method = 'money', price = 1500, sellPrice = false, ammo = 360},
      {type = 'weapon', name = 'weapon_pumpshotgun', method = 'money', price = 3000, sellPrice = false, ammo = 12}  
	}	
	TriggerEvent("inventory:openShop", 'Shop', shop)	
end)
-- End of shops --

-- Start of Evidence Lockers
-- MRPD --
Citizen.CreateThread(function()
	exports['qtarget']:AddBoxZone("MRPDEvidence", vector3(474.07, -997.17, 26.27), 1.2, 4.2, {
	  name="MRPDEvidence",
	  heading=0,
	  --debugPoly=true,
	  minZ=23.67,
	  maxZ=27.67
	}, {
		options = {
			{
			event = "sg-police-and-ems:MRPDEvidence",
			icon = "fas fas-hand-holding-droplet",
			label = "Open Lockers",
			},
		},
			distance = 1.5 
	})	
end)	

RegisterNetEvent('sg-police-and-ems:MRPDEvidence')
AddEventHandler('sg-police-and-ems:MRPDEvidence',function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	TriggerEvent('inventory:openStorage', "Evidence Locker", "mrpd-evidence-1", 1000, 1000, {"police"})
end)

-- DavisPD --
Citizen.CreateThread(function()
	exports['qtarget']:AddBoxZone("DavisPDEvidence", vector3(364.9, -1592.98, 25.45), 1.3, 1.25, {
	  name="DavisPDEvidence",
	  heading=320,
	  --debugPoly=true,
	  minZ=24.45,
	  maxZ=26.45
	}, {
		options = {
			{
			event = "sg-police-and-ems:DavisPDEvidence",
			icon = "fas fas-hand-holding-droplet",
			label = "Open Lockers",
			},
		},
			distance = 1.5 
	})	
end)	

RegisterNetEvent('sg-police-and-ems:DavisPDEvidence')
AddEventHandler('sg-police-and-ems:DavisPDEvidence',function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	TriggerEvent('inventory:openStorage', "Evidence Locker", "davispd-evidence-1", 1000, 1000, {"police"})
end)

-- SandyPD --
Citizen.CreateThread(function()
	exports['qtarget']:AddBoxZone("SandyPDEvidence", vector3(1831.2, 3679.35, 38.87), 0.75, 3.55, {
	  name="SandyPDEvidence",
	  heading=30,
	  --debugPoly=true,
	  minZ=37.87,
	  maxZ=39.67
	}, {
		options = {
			{
			event = "sg-police-and-ems:SandyPDEvidence",
			icon = "fas fas-hand-holding-droplet",
			label = "Open Lockers",
			},
		},
			distance = 1.5 
	})	
end)	

RegisterNetEvent('sg-police-and-ems:SandyPDEvidence')
AddEventHandler('sg-police-and-ems:SandyPDEvidence',function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	TriggerEvent('inventory:openStorage', "Evidence Locker", "sandypd-evidence-1", 1000, 1000, {"police"})
end)

-- PaletoPD --
Citizen.CreateThread(function()
	exports['qtarget']:AddBoxZone("PaletoPDEvidence", vector3(-438.13, 6013.47, 27.58), 1.2, 0.65, {
	  name="PaletoPDEvidence",
	  heading=45,
	  --debugPoly=true,
	  minZ=26.58,
	  maxZ=28.33
	}, {
		options = {
			{
			event = "sg-police-and-ems:PaletoPDEvidence",
			icon = "fas fas-hand-holding-droplet",
			label = "Open Lockers",
			},
		},
			distance = 1.5 
	})	
end)	

RegisterNetEvent('sg-police-and-ems:PaletoPDEvidence')
AddEventHandler('sg-police-and-ems:PaletoPDEvidence',function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)	
	TriggerEvent('inventory:openStorage', "Evidence Locker", "paletopd-evidence-1", 1000, 1000, {"police"})
end)
-- End of Evidence Lockers

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

RegisterCommand('10-13A', function()
	if PlayerData.job.name == 'police' then
		TriggerEvent("tgiann-policeAlert:alert", "10-13A in progress, all units respond!", false, vector3, false)
	else
		exports['mythic_notify']:DoHudText('error', "You do not have access to that command!", 8000)	
	end
end)

Citizen.CreateThread(function()
	exports['qtarget']:AddBoxZone("PoliceOnOffDuty", vector3(441.82, -982.05, 30.69), 0.5, 0.35, {
	  name="PoliceOnOffDuty",
	  heading=12,
	  --debugPoly=true,
	  minZ=30.79,
	  maxZ=30.89
	}, {
		options = {
			{
			event = "sg-police-and-ems:onOrOffDuty",
			icon = "fas fas-clipboard-check",
			label = "Go On/Off Duny",
			job = "police",
			},
		},
			distance = 1.5 
	})
end)

RegisterNetEvent('sg-police-and-ems:onOrOffDuty')
AddEventHandler('sg-police-and-ems:onOrOffDuty',function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)
	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_CLIPBOARD', 0, true)
	exports['progressBars']:startUI(5000, "Going On/Off Duty")
		Citizen.CreateThread(function()
			Citizen.Wait(5000)
			ClearPedTasksImmediately(playerPed)
			exports['mythic_notify']:DoHudText('success', "You're now On/Off Duty", 8000)		
		end)
end)	
	
RegisterCommand('911', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)		
	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_TOURIST_MOBILE', 0, true)
	exports['progressBars']:startUI(5000, "Calling 911")
	Wait(5000)
	ClearPedTasks(GetPlayerPed(-1))	
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
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)		
	TaskStartScenarioInPlace(playerPed, 'WORLD_HUMAN_TOURIST_MOBILE', 0, true)
	exports['progressBars']:startUI(5000, "Calling 911")
	Wait(5000)
	ClearPedTasks(GetPlayerPed(-1))		
	exports['mythic_notify']:DoHudText('success', "311 Call send. Units will be dispatched soon!", 8000)	
	TriggerServerEvent('dispatch:send', 'ambulance', '311 Caller, Respond ASAP', GetEntityCoords(PlayerPedId()))	
end)

-- Police & EMS Stuff 