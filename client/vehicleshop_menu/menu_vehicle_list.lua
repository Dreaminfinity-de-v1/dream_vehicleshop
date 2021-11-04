function addVehicleList(menu, shop)
    local shop = getShopFromId(interactionArea)
    local colors = {}

    for i,v in ipairs(Config.Colors) do
        table.insert( colors, v.name)
    end

    for i, v in ipairs(shop.catalog) do
        
        if #v.vehicles > 0 then
            local submenu = menuPool:AddSubMenu(menu, v.titel)
            for i2,v2 in ipairs(v.vehicles) do
                local vehiclemenu = menuPool:AddSubMenu(submenu, v2.titel or 'model: '..v2.model)
    
                if #colors > 0 then
                    maincolor = NativeUI.CreateListItem(_U('vehicleshop_item_maincolor'), colors, 1, _U('vehicleshop_item_maincolor_desc'))
                    secondcolor = NativeUI.CreateListItem(_U('vehicleshop_item_secondcolor'), colors, 1, _U('vehicleshop_item_secondcolor_desc'))
                    vehiclemenu:AddItem(maincolor)
                    vehiclemenu:AddItem(secondcolor)

                    --[[ -- TODO: set vehicle color on ListItem change
                    maincolor.OnListChanged = function(menu, item, index)
    
                        dish = item:IndexToItem(index)
                        ESX.ShowNotification("Main: Preparing ~b~" .. dish .. "~w~...")
                    end
    
                    secondcolor.OnListChanged = function(menu, item, index)
    
                        dish = item:IndexToItem(index)
                        ESX.ShowNotification("Second ~b~" .. dish .. "~w~...")
                    end
                    --]]
                end
                
                buy =  NativeUI.CreateItem(_U('vehicleshop_item_buy'), _U('vehicleshop_item_buy_desc'))
                buy:RightLabel(_U('vehicleshop_item_buy_label',v2.price))
                
                vehiclemenu:AddItem(buy)


            end
        end
    end
end
