local cam = nil
camindex = 1

function setCam(shop)
    local fov = GetGameplayCamFov()
    local camPos = shop.camPos[1]
    camindex = 1

    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", camPos.x,camPos.y,camPos.z, 300.00,0.00,0.00, fov, false, 0)
    PointCamAtCoord(cam,shop.showplace.coords.x,shop.showplace.coords.y,shop.showplace.coords.z)

    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, true)

    changeCam(shop)
    Citizen.Wait(1100)
end

function nextCam(shop)
    local fov = GetGameplayCamFov()
    if camindex >= #shop.camPos then
        camindex = 1
    else
        camindex = camindex + 1
    end
    local camPos = shop.camPos[camindex]

    DestroyCam(cam, true)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", camPos.x,camPos.y,camPos.z, 300.00,0.00,0.00, fov, false, 0)
    PointCamAtCoord(cam,shop.showplace.coords.x,shop.showplace.coords.y,shop.showplace.coords.z)

    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, true)
end

function previousCam(shop)
    local fov = GetGameplayCamFov()
    if camindex <= 1 then
        camindex = #shop.camPos
    else
        camindex = camindex - 1
    end
    local camPos = shop.camPos[camindex]

    DestroyCam(cam, true)
    cam = CreateCamWithParams("DEFAULT_SCRIPTED_CAMERA", camPos.x,camPos.y,camPos.z, 300.00,0.00,0.00, fov, false, 0)
    PointCamAtCoord(cam,shop.showplace.coords.x,shop.showplace.coords.y,shop.showplace.coords.z)

    SetCamActive(cam, true)
    RenderScriptCams(true, true, 1000, true, true)
end

function changeCam(shop)
    Citizen.CreateThread(function ()
        while isInInteractionArea and HasAlreadyEnteredInteractionArea do
            Citizen.Wait(0)

            if IsControlJustReleased(0, 189) then
                previousCam(shop)

            elseif IsControlJustReleased(0, 190) then
                nextCam(shop)

            end
        end
    end)
end


function clearCam()
    
    if cam then
        RenderScriptCams(false, true, 1000, true, true)
        DestroyCam(cam, true)
    end
end