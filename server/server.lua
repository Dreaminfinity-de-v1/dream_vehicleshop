ESX = nil
DreamAddon = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
TriggerEvent('dream_addon:getSharedObject', function(obj) DreamAddon = obj end)

RegisterNetEvent('dream_vehicleshop:buyVehicle')
AddEventHandler('dream_vehicleshop:buyVehicle', function(shopId, categoryIndex, vehicleIndex, maincolorIndex, secondcolorIndex, buyspawnpointindex)
    local src = source
    local shop = getShopFromId(shopId)
    local category = shop.catalog[categoryIndex]
    local vehicle = category.vehicles[vehicleIndex]
    local maincolor = Config.Colors[maincolorIndex]
    local secondcolor = Config.Colors[secondcolorIndex]
    local xPlayer = ESX.GetPlayerFromId(src)
    local moneycheck = checkmoney(xPlayer, vehicle.price)
    local plate = exports.dream_garage:getRandomPlate(Config.Transferplate.prefix, Config.Transferplate.scheme)

    if moneycheck.result == true then
        DreamAddon.TriggerClientCallback('dream_vehicleshop:getVehicleProps', src, function(vehicleprops)
            vehicleprops.model = GetHashKey(vehicle.model)
            xPlayer.removeAccountMoney(moneycheck.account, vehicle.price)
            TriggerClientEvent("swt_notifications:captionIcon",src,_U('notifications_titel'),_U('notifications_successbuy', vehicle.price, moneycheck.account),Config.Notification.pos,Config.Notification.timeout,Config.Notification.color.success,'white',true,Config.Notification.icons.default)
            exports.dream_garage:setVehicle(vehicle.type or category.type or shop.type, xPlayer.getIdentifier(), vehicleprops)
            exports.dream_garage:setVehicleGarage(vehicleprops.plate, nil)
            TriggerClientEvent('dream_vehicleshop:buySuccess', src, vehicleprops, shop, vehicle, buyspawnpointindex)
        end, vehicle, maincolor, secondcolor, plate)
    else
        TriggerClientEvent("swt_notifications:captionIcon",src,_U('notifications_titel'),_U('notifications_notenoughmoney'),Config.Notification.pos,Config.Notification.timeout,Config.Notification.color.negative,'white',true,Config.Notification.icons.default)
    end

end)

function checkmoney(xPlayer, price)
    if xPlayer.getAccount('money').money >= price then
        return {result = true, account = 'money'}
    elseif xPlayer.getAccount('bank').money >= price then
        return {result = true, account = 'bank'}
    else
        return {result = false, account = nil}
    end
end



