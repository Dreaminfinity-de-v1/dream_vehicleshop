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

            submenu.OnIndexChange = OnIndexChange
            for i2,v2 in ipairs(v.vehicles) do
                local vehiclemenu = menuPool:AddSubMenu(submenu, v2.titel or 'model: '..v2.model)

                vehiclemenu.vehicle = v2

                if #colors > 0 then
                    vehiclemenu.vehicle.maincolor = Config.Colors[1].id
                    vehiclemenu.vehicle.secondcolor = Config.Colors[1].id
                    maincolor = NativeUI.CreateListItem(_U('vehicleshop_item_maincolor'), colors, 1, _U('vehicleshop_item_maincolor_desc'))
                    secondcolor = NativeUI.CreateListItem(_U('vehicleshop_item_secondcolor'), colors, 1, _U('vehicleshop_item_secondcolor_desc'))
                    vehiclemenu:AddItem(maincolor)
                    vehiclemenu:AddItem(secondcolor)

                    maincolor.OnListChanged = function(menu, item, index)
                        
                        menu.vehicle.maincolor = Config.Colors[index].id
                        updateColor(menu.vehicle)
                    end
    
                    secondcolor.OnListChanged = function(menu, item, index)
                        
                        menu.vehicle.secondcolor = Config.Colors[index].id
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

function buyVehicle() -- TODO
end
