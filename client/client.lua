ESX = nil
menuPool = NativeUI.CreatePool()
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end

    removeNPCs()

end)

