vehicle = nil
loading = true
error = false
function setVehicle(_menu, vehicledata, coords, heading)
    menu = _menu
    menu.Controls.Back.Enabled = false
    menu.Controls.Select.Enabled = false
    menu.Controls.Left.Enabled = false
    menu.Controls.Right.Enabled = false
    menu.Controls.Up.Enabled = false
    menu.Controls.Down.Enabled = false

    clearVehicle()

    loading = true
    error = false
    Citizen.CreateThread(function()
        while loading do
            Citizen.Wait(0)
            DrawTxt(_U('vehicleshop_item_loading'), 0.4, 0.5)
        end
        while error do
            Citizen.Wait(0)
            DrawTxt(_U('vehicleshop_item_loading_error'), 0.4, 0.5)
        end
    
    end)

    ESX.Game.SpawnLocalVehicle(vehicledata.model, coords, heading, function(_vehicle)
        clearVehicle()

        if _vehicle == 0 then
            error = true
        end

        vehicle = _vehicle
        loading = false

        FreezeEntityPosition(vehicle, true)
        SetEntityCollision(vehicle, false, false)
        SetVehicleLivery(vehicle, vehicledata.livery or 0)

        updateColor(vehicledata)
        
        menu.Controls.Back.Enabled = true
        menu.Controls.Select.Enabled = true
        menu.Controls.Left.Enabled = true
        menu.Controls.Right.Enabled = true
        menu.Controls.Up.Enabled = true
        menu.Controls.Down.Enabled = true
    end)
end

function clearVehicle()
    if vehicle ~= nil then
        ESX.Game.DeleteVehicle(vehicle)
        vehicle = nil
    end
end

function updateColor(vehicledata)

    SetVehicleColours(vehicle, Config.Colors[vehicledata.maincolor].id, Config.Colors[vehicledata.secondcolor].id)
    SetVehicleExtraColours(vehicle, 0, 156) -- 156 = default alloy color.
end
