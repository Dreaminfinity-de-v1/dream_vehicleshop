function openCardealerMenu()
    
    mainMenu = NativeUI.CreateMenu(_U('cardealermenu_titel'),_U('cardealermenu_subtitel', getShopFromId(interactionArea).name))
    menuPool:Add(mainMenu)

    addVehicleList(mainMenu)
    --setCam()

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

    menuPool:Clear()
end