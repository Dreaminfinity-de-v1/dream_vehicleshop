ESX = nil
DreamAddon = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('dream_addon:getSharedObject', function(obj) DreamAddon = obj end)

RegisterNetEvent('dream_vehicleshop:buyVehicle')
AddEventHandler('dream_vehicleshop:buyVehicle', function(shopId, categoryIndex, vehicleIndex, maincolorIndex, secondcolorIndex, buyspawnpointindex, paymentindex)
    local src = source
    local shop = getShopFromId(shopId)
    local category = shop.catalog[categoryIndex]
    local vehicle = category.vehicles[vehicleIndex]
    local vehicletype = vehicle.type or category.type or shop.type
    local maincolor = Config.Colors[maincolorIndex]
    local secondcolor = Config.Colors[secondcolorIndex]
    local xPlayer = ESX.GetPlayerFromId(src)
    local moneycheck = checkmoney(xPlayer, vehicle.price, Config.AllowedPayments[paymentindex].name)
    local plate = exports.dream_garage:getRandomPlateByVehicletype(vehicletype)

    if moneycheck == true then
        DreamAddon.TriggerClientCallback('dream_vehicleshop:getVehicleProps', src, function(vehicleprops)
            vehicleprops.model = GetHashKey(vehicle.model)
            xPlayer.removeAccountMoney(Config.AllowedPayments[paymentindex].name, vehicle.price)
            TriggerClientEvent("swt_notifications:captionIcon",src,_U('notifications_titel'),_U('notifications_successbuy', vehicle.price, Config.AllowedPayments[paymentindex].label),Config.Notification.pos,Config.Notification.timeout,Config.Notification.color.success,'white',true,Config.Notification.icons.default)
            exports.dream_garage:setVehicle(vehicletype, xPlayer.getIdentifier(), vehicleprops)
            exports.dream_garage:setVehicleGarage(vehicleprops.plate, nil)
            TriggerClientEvent('dream_vehicleshop:buySuccess', src, vehicleprops, shop, vehicle, buyspawnpointindex)
        end, vehicle, maincolor, secondcolor, plate)
    else
        TriggerClientEvent("swt_notifications:captionIcon",src,_U('notifications_titel'),_U('notifications_notenoughmoney'),Config.Notification.pos,Config.Notification.timeout,Config.Notification.color.negative,'white',true,Config.Notification.icons.default)
    end

end)

function checkmoney(xPlayer, price, account)
    if xPlayer.getAccount(account).money >= price then
        return true
    else
        return false
    end
end



