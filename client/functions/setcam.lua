local cam = nil

function setCam(shop)
    local fov = GetGameplayCamFov()
    local camPos = shop.camPos

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", camPos.x,camPos.y,camPos.z, 300.00,0.00,0.00, fov, false, 0)
    PointCamAtCoord(cam,shop.spawnpoint.x,shop.spawnpoint.y,shop.spawnpoint.z)

    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, true)

    Citizen.Wait(1100)
end


function clearCam()
    
    RenderScriptCams(false, true, 1000, true, true)
    DestroyCam(cam, true)
end

