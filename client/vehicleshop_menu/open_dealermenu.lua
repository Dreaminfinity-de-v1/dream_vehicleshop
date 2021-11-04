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
    
        local shopid = getShopId(shop.id)
        local mugshot, mugshotStr = ESX.Game.GetPedMugshot(npcs[shopid])

        ESX.ShowAdvancedNotification(shop.titel or _U('dealermenu_titel'), shop.name, _U('dealer_not-open'), mugshotStr, 7, false, false, 90)
        UnregisterPedheadshot(mugshot)
        HasAlreadyEnteredInteractionArea = false
        return
    end
    
    mainMenu = NativeUI.CreateMenu(getShopFromId(interactionArea).titel or _U('dealermenu_titel'),_U('dealermenu_subtitel', getShopFromId(shop.id).name))
    menuPool:Add(mainMenu)

    addVehicleList(mainMenu, getShopFromId(interactionArea))
    setCam(getShopFromId(interactionArea))
    --setVehicle() -- TODO: set first vehicle in category

    menuPool:RefreshIndex()

    menuPool:ControlDisablingEnabled(false)
    menuPool:MouseControlsEnabled(false)

    mainMenu:Visible(true)

    mainMenu.OnMenuClosed = function (menu)
        HasAlreadyEnteredInteractionArea = false
        menuPool:Clear()
    end

    while isInInteractionArea and HasAlreadyEnteredInteractionArea do
        Citizen.Wait(0)
        menuPool:ProcessMenus()
    end

    clearCam()
    menuPool:Clear()
end
