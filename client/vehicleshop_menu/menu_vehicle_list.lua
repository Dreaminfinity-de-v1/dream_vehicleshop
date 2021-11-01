function addVehicleList(menu)

    local shop = getShopFromId(interactionArea)
    local colors = {}
    for i,v in ipairs(Config.Colors) do
        table.insert( colors, v.name)
    end


    for i, v in ipairs(Config.Vehicles) do
        local submenu = menuPool:AddSubMenu(menu, v.titel)
        for i2,v2 in ipairs(v.vehicles) do
            local vehiclemenu = menuPool:AddSubMenu(submenu, v2.titel or 'model: '..v2.model)
            maincolor =  NativeUI.CreateListItem(_U('vehicleshop_item_maincolor'), colors, 1, _U('vehicleshop_item_maincolor_desc'))
            secondcolor =  NativeUI.CreateListItem(_U('vehicleshop_item_secondcolor'), colors, 1, _U('vehicleshop_item_secondcolor_desc'))
            
            buy =  NativeUI.CreateItem(_U('vehicleshop_item_buy'), _U('vehicleshop_item_buy_desc'))
            buy:RightLabel(_U('vehicleshop_item_buy_label',v2.price))
            
            vehiclemenu:AddItem(maincolor)
            vehiclemenu:AddItem(secondcolor)
            vehiclemenu:AddItem(buy)

        end
    end

    

    
    --- GET_GAMEPLAY_CAM


end