function addVehicleList(menu, shop)
    local shop = getShopFromId(interactionArea)
    local colors = {}

    for i,v in ipairs(Config.Colors) do
        table.insert( colors, v.name)
    end

    for i, v in ipairs(shop.catalog) do
        
        if #v.vehicles > 0 then
            local submenu = menuPool:AddSubMenu(menu, v.titel)
            submenu.category = v
            submenu.category.vehicle = nil
            submenu.category.index = i

            submenu.OnIndexChange = OnIndexChange
            for i2,v2 in ipairs(v.vehicles) do
                local vehiclemenu = menuPool:AddSubMenu(submenu, v2.titel or 'model: '..v2.model)

                vehiclemenu.vehicle = v2
                vehiclemenu.vehicle.categoryIndex = i
                vehiclemenu.vehicle.index = i2

                if #colors > 0 then
                    vehiclemenu.vehicle.maincolor = 1
                    vehiclemenu.vehicle.secondcolor = 1
                    maincolor = NativeUI.CreateListItem(_U('vehicleshop_item_maincolor'), colors, 1, _U('vehicleshop_item_maincolor_desc'))
                    secondcolor = NativeUI.CreateListItem(_U('vehicleshop_item_secondcolor'), colors, 1, _U('vehicleshop_item_secondcolor_desc'))
                    vehiclemenu:AddItem(maincolor)
                    vehiclemenu:AddItem(secondcolor)

                    maincolor.OnListChanged = function(menu, item, index)
                        
                        menu.vehicle.maincolor = index
                        updateColor(menu.vehicle)
                    end
    
                    secondcolor.OnListChanged = function(menu, item, index)
                        
                        menu.vehicle.secondcolor = index
                        updateColor(menu.vehicle)
                    end
                end
                
                buy =  NativeUI.CreateItem(_U('vehicleshop_item_buy'), _U('vehicleshop_item_buy_desc'))
                buy:RightLabel(_U('vehicleshop_item_buy_label',v2.price))
                
                vehiclemenu:AddItem(buy)

                buy.Activated = buyVehicle


            end
        end
    end
end

function buyVehicle(menu, item, panels)
    found = false
    for i,v in ipairs(shop.buyspawnpoint) do
        if #ESX.Game.GetVehiclesInArea(v.coords, v.radius) <= 0 then
            found = true
            TriggerServerEvent('dream_vehicleshop:buyVehicle', interactionArea, menu.vehicle.categoryIndex, menu.vehicle.index, menu.vehicle.maincolor, menu.vehicle.secondcolor, i)
            break
        end
    end

    if not found then
        TriggerEvent("swt_notifications:captionIcon",_U('notifications_titel'),_U('notifications_notfreespace'),Config.Notification.pos,Config.Notification.timeout,Config.Notification.color.negative,'white',true,Config.Notification.icons.default)
    end
end

