function openDealerMenu()
    shop = getShopFromId(interactionArea)

    local found = false

    for i,v in ipairs(shop.catalog) do
        if #v.vehicles > 0 then
            found = true
            break
        end
    end

    if shop.catalog == nil or #shop.catalog <= 0 or found == false then
    
        local shopIndex = getShopIndexFromId(shop.id)
        local mugshot, mugshotStr = ESX.Game.GetPedMugshot(npcs[shopIndex])

        ESX.ShowAdvancedNotification(shop.titel or _U('dealermenu_titel'), shop.name, _U('dealer_not-open'), mugshotStr, 7, false, false, 90)
        UnregisterPedheadshot(mugshot)
        HasAlreadyEnteredInteractionArea = false
        return
    end
    
    mainMenu = NativeUI.CreateMenu(getShopFromId(interactionArea).titel or _U('dealermenu_titel'),_U('dealermenu_subtitel', getShopFromId(shop.id).name))
    menuPool:Add(mainMenu)

    addVehicleList(mainMenu, getShopFromId(interactionArea))
    setCam(getShopFromId(interactionArea))
    setVehicle(mainMenu, mainMenu.Children[mainMenu.Items[1]].category.vehicles[1], shop.showplace.coords, shop.showplace.heading)

    
    
    menuPool:RefreshIndex()

    menuPool:ControlDisablingEnabled(false)
    menuPool:MouseControlsEnabled(false)

    mainMenu:Visible(true)
    
    
    mainMenu.OnIndexChange = OnIndexChange

    mainMenu.OnMenuClosed = function (menu)
        HasAlreadyEnteredInteractionArea = false
        menuPool:Clear()
    end



    while isInInteractionArea and HasAlreadyEnteredInteractionArea do

        scaleform(shop)

        Citizen.Wait(0)
        menuPool:ProcessMenus()
    end

    
    loading = true
    error = false
    clearCam()
    clearVehicle()
    menuPool:Clear()
end


function OnIndexChange(menu, index)
    shop = getShopFromId(interactionArea)
    local submenu = menu.Children[menu.Items[index]]
    
    if submenu.category ~= nil then
        setVehicle(menu, submenu.Children[submenu.Items[submenu:CurrentSelection()]].vehicle, shop.showplace.coords, shop.showplace.heading)
    end
    
    if submenu.vehicle ~= nil then
        setVehicle(menu, submenu.vehicle, shop.showplace.coords, shop.showplace.heading)
    end
end

function scaleform()
    
    local scale = RequestScaleformMovie("INSTRUCTIONAL_BUTTONS")

    BeginScaleformMovieMethod(scale, "CLEAR_ALL")
    EndScaleformMovieMethod()
    
    BeginScaleformMovieMethod(scale, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(0)
    PushScaleformMovieMethodParameterString("~INPUT_FRONTEND_RIGHT~")
    PushScaleformMovieMethodParameterString(_U('next_cam'))
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scale, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(1)
    PushScaleformMovieMethodParameterString("~INPUT_FRONTEND_LEFT~")
    PushScaleformMovieMethodParameterString(_U('previuos_cam'))
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scale, "SET_DATA_SLOT")
    ScaleformMovieMethodAddParamInt(2)
    PushScaleformMovieMethodParameterString(_('selected_cam', camindex, #shop.camPos))
    EndScaleformMovieMethod()

    BeginScaleformMovieMethod(scale, "DRAW_INSTRUCTIONAL_BUTTONS")
    ScaleformMovieMethodAddParamInt(0)
    EndScaleformMovieMethod()

    DrawScaleformMovieFullscreen(scale, 255, 255, 255, 255, 0)

end