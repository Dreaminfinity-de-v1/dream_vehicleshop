DreamAddon.RegisterClientCallback('dream_vehicleshop:getVehicleProps', function(cb, vehicledata, maincolor, secondcolor, plate)
    local ped = GetPlayerPed(-1)
    local playerCoords = GetEntityCoords(ped)

    ESX.Game.SpawnLocalVehicle(vehicledata.model, playerCoords, 0, function(_vehicle)
        SetEntityVisible(_vehicle,true,0)
        FreezeEntityPosition(_vehicle, true)
        SetEntityCollision(_vehicle, false, false)

        setLivery(_vehicle, vehicledata.livery)

        SetVehicleColours(_vehicle, maincolor.id, secondcolor.id)
        SetVehicleExtraColours(_vehicle, 0, 156) -- 156 = default alloy color.

        ESX.Game.SetVehicleProperties(_vehicle, {
            bodyHealth = 1000,
            engineHealth = 1000,
            tankHealth = 1000,
            fuelLevel = 75,
            dirtLevel = 0,
            plate = plate
        })

        cb(ESX.Game.GetVehicleProperties(_vehicle))

        ESX.Game.DeleteVehicle(_vehicle)
    end)
end)

RegisterNetEvent('dream_vehicleshop:buySuccess', function(vehicleprops, shop, vehicledata)
    --TODO: check spawnpoint - free place
    ESX.Game.SpawnVehicle(vehicleprops.model, shop.buyspawnpoint, shop.buyspawnhead, function(_vehicle) 
        ESX.Game.SetVehicleProperties(_vehicle, vehicleprops)

        menuPool:CloseAllMenus()

        loading = true

        error = false

        clearCam()

        clearVehicle()

        menuPool:Clear()

    end)
end)
