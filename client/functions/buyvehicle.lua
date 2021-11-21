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

RegisterNetEvent('dream_vehicleshop:buySuccess', function(shop, vehicledata, buyspawnpointindex, vehicleprops)

    local spawnpoint = shop.buyspawnpoints[buyspawnpointindex]
    if vehicleprops ~= nil then
        ESX.Game.SpawnVehicle(vehicleprops.model, spawnpoint.coords, spawnpoint.heading, function(_vehicle) 
            ESX.Game.SetVehicleProperties(_vehicle, vehicleprops)
    
            Citizen.CreateThread(function ()
                local blip = AddBlipForCoord(spawnpoint.coords.x, spawnpoint.coords.y, spawnpoint.coords.z)
                SetBlipSprite(blip, 1)
                SetBlipDisplay(blip, 8)
                SetBlipColour(blip, 61)
                SetBlipScale(blip, 1.0)
                SetBlipAsShortRange(blip, true)
                SetBlipRoute(blip, true)
    
                while true do
                    Citizen.Wait(500)
                    if DoesEntityExist(_vehicle) == false or GetPedInVehicleSeat(_vehicle, -1) ~= 0 then
                        RemoveBlip(blip)
                        break
                    end
                end
            end)
            HasAlreadyEnteredInteractionArea = false
        end)
    else
        HasAlreadyEnteredInteractionArea = false
    end
end)
