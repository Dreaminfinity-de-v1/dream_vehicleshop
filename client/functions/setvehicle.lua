vehicle = nil
function setVehicle(_menu, vehicledata, coords, heading)
    menu = _menu
    menu.Controls.Back.Enabled = false
    menu.Controls.Select.Enabled = false
    menu.Controls.Left.Enabled = false
    menu.Controls.Right.Enabled = false
    menu.Controls.Up.Enabled = false
    menu.Controls.Down.Enabled = false

    clearVehicle()

    ESX.Game.SpawnLocalVehicle(vehicledata.model, coords, heading, function(_vehicle) --TODO: add Timer for Controls and show loadingtext
        clearVehicle()
        vehicle = _vehicle

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
    
    SetVehicleColours(vehicle, vehicledata.maincolor, vehicledata.secondcolor)
    SetVehicleExtraColours(vehicle, 0, 156) -- 156 = default alloy color.
end
