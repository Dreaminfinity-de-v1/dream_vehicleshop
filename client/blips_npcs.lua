blips = {}
npcs  = {}



Citizen.CreateThread(function()

	if not Config.EnableBlips then return end

    blips['dealer'] = {}
	for i, v in ipairs(Config.Shops) do

        -- Blips
        if v.blip ~= nil then
            blips['dealer'][v.id] = createBlip(v.blip.pos, v.blip.sprite or 524, v.blip.display or 2, v.blip.color or 3, (v.blip.scale or 1) + 0.0, v.blip.titel or _U('dealer_blip_name'))
        end

        -- NPCs
        spawnNPC(v.dealer.type, v.dealer.model, v.dealer.pos, v.dealer.heading)

	end
end)


function removeNPCs()

    for i, v in ipairs(npcs) do
        DeleteEntity(v)
    end

end

function spawnNPC(type, model, pos, heading)

    if type == nil then
        type = Config.NPCsDefaultType
    end

    if model ~= nil then
        model = GetHashKey(model)
        RequestModel(model)
        while not HasModelLoaded(model) do
            Wait(1)
        end
    else
        RequestModel(GetHashKey(Config.NPCsDefaultModel))
        while not HasModelLoaded(GetHashKey(Config.NPCsDefaultModel)) do
            Wait(1)
        end
        model = GetHashKey(Config.NPCsDefaultModel)
    end

    ped = CreatePed(type, model, pos.x, pos.y, pos.z, heading, false, true)
    FreezeEntityPosition(ped, true)
    SetEntityInvincible(ped, true)
    SetBlockingOfNonTemporaryEvents(ped, true)

    RequestAnimDict("mini@strip_club@idles@bouncer@base")
    while not HasAnimDictLoaded("mini@strip_club@idles@bouncer@base") do
        Wait(1)
    end
    TaskPlayAnim(ped,"mini@strip_club@idles@bouncer@base","base", 8.0, 0.0, -1, 1, 0, 0, 0, 0)

    table.insert( npcs, ped )
end

function createBlip(pos, sprite, display, color, scale, titel)
    local blip = AddBlipForCoord(pos.x, pos.y, pos.z)
    SetBlipSprite(blip, sprite)
    SetBlipDisplay(blip, display or 2)
    SetBlipColour(blip, color)
    SetBlipScale(blip, scale or 1.0)
    SetBlipAsShortRange(blip, true)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString(titel)
    EndTextCommandSetBlipName(blip)
    return blip
end