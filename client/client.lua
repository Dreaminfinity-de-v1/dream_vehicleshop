ESX = nil
DreamAddon = nil
menuPool = NativeUI.CreatePool()

Citizen.CreateThread(function()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
  end
end)

TriggerEvent('dream_addon:getSharedObject', function(obj) DreamAddon = obj end)

AddEventHandler('onResourceStop', function(resourceName)
    if (GetCurrentResourceName() ~= resourceName) then
      return
    end

    removeNPCs()
    clearCam()
    clearVehicle()
end)
