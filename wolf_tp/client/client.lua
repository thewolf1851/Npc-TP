ESX = nil 
Citizen.CreateThread(function() 
    while ESX == nil do 
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end) 
        Citizen.Wait(0) 
    end 
end)

menutp = function()
	ESX.UI.Menu.CloseAll()
	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'interaccions',{
        title = 'A donde quieres ir?',
		align = 'center',
		elements = {
			{label = 'Los Ballas', value = '1'},
            {label = 'Los Mochas', value = '2'},
            {label = 'Tropa Do Croacia', value = '3'},
            {label = 'MDLR', value = '4'},
            {label = 'PARE', value = '5'},
            {label = 'Merryweather', value = '6'},
            {label = 'Policia', value = '7'},
            {label = 'Black', value = '8'},
            {label = 'LacosteGang', value = '9'},
            {label = '720Gang', value = '10'},
		}
	},
	function(data, menu)
		local val = data.current.value
		
        if val == '1' then
            local ped = PlayerPedId()
            SetEntityCoords(ped, 97.64, -1935.76, 20.8, true, true, false, false)    
            ESX.UI.Menu.CloseAll()
            elseif val == '2' then
                local ped = PlayerPedId()
                SetEntityCoords(ped, 288.5398,-609.855,43.364, true, true, false, false) 
                ESX.UI.Menu.CloseAll()
            elseif val == '3' then
                local ped = PlayerPedId()
                SetEntityCoords(ped, -145.630, -1161.17, 25.307, true, true, false, false) 
                ESX.UI.Menu.CloseAll()
            elseif val == '4' then
                local ped = PlayerPedId()
                SetEntityCoords(ped, 1379.850, -1528.11, 56.602, true, true, false, false) 
                ESX.UI.Menu.CloseAll()
            elseif val == '5' then
                local ped = PlayerPedId()
                SetEntityCoords(ped, 134.6112, -1075.29, 29.192, true, true, false, false) 
                ESX.UI.Menu.CloseAll()
            elseif val == '6' then
                local ped = PlayerPedId()
                SetEntityCoords(ped, 393.9210, -751.017, 29.275, true, true, false, false) 
                ESX.UI.Menu.CloseAll()
            elseif val == '7' then
                local ped = PlayerPedId()
                SetEntityCoords(ped, 425.1405, -979.610, 30.710, true, true, false, false)
                ESX.UI.Menu.CloseAll()
            elseif val == '8' then
                local ped = PlayerPedId()
                SetEntityCoords(ped, 34.34808, -1176.21, 29.287, true, true, false, false) 
                ESX.UI.Menu.CloseAll()
            elseif val == '9' then
                local ped = PlayerPedId()
                SetEntityCoords(ped, 333.7143, -1007.72, 29.287, true, true, false, false)
                ESX.UI.Menu.CloseAll()
            elseif val == '10' then
                local ped = PlayerPedId()
                SetEntityCoords(ped, 313.7593, -233.162, 53.985, true, true, false, false)
                ESX.UI.Menu.CloseAll()

		end
	end,
	function(data, menu)
		menu.close()
	end)
end

Citizen.CreateThread(function()                     
    SpawnNPC('g_m_y_lost_03', vector3(134.0558, -1074.33, 28.192))
    while true do
    local _espera = 1000
    local ped = PlayerPedId()
    local _charPos = GetEntityCoords(ped)
    if #(_charPos - vector3(134.0558, -1074.33, 28.192)) < 2 then
        _espera = 0
        ESX.ShowFloatingHelpNotification("[~r~E~w~] TP BARRIOS", vector3(134.0558, -1074.33, 28.192))
        if IsControlJustPressed(0, 38) then
            menutp()
        end
    end
        Citizen.Wait(_espera)
    end
end)






SpawnNPC = function(modelo, x,y,z,h) 
    hash = GetHashKey(modelo)
    RequestModel(hash)
    while not HasModelLoaded(hash) do
        Wait(1)
    end
    crearNPC = CreatePed(5, hash, x,y,z,h, false, true)
    FreezeEntityPosition(crearNPC, true)
    SetEntityInvincible(crearNPC, true)
    SetBlockingOfNonTemporaryEvents(crearNPC, true)
    TaskStartScenarioInPlace(crearNPC, "WORLD_HUMAN_DRINKING", 0, false)    
end