ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterNetEvent('dream_vehicleshop:buyVehicle')
AddEventHandler('dream_vehicleshop:buyVehicle', function(shopId, categoryIndex, vehicleIndex, maincolorIndex, secondcolorIndex)
    
    local shop = getShopFromId(shopId)
    local category = shop.catalog[categoryIndex]
    local vehicle = category.vehicles[vehicleIndex]
    local maincolor = Config.Colors[maincolorIndex]
    local secondcolor = Config.Colors[secondcolorIndex]


end)