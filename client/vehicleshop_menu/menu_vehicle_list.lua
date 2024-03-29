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

                if v2.price >= 0 then
                    vehiclemenu.ParentItem:RightLabel(_U('vehicleshop_item_pricesuffix', v2.price))
                elseif v2.price < 0 then
                    vehiclemenu.ParentItem:RightLabel(_U('vehicleshop_item_pricesuffix-', v2.price))
                end

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
                
                local buymenu = menuPool:AddSubMenu(vehiclemenu, _U('vehicleshop_item_paymenttitel'), _U('vehicleshop_item_buy_desc'))
                if v2.price >= 0 then
                    buymenu.ParentItem:RightLabel(_U('vehicleshop_item_pricesuffix', v2.price))
                elseif v2.price < 0 then
                    buymenu.ParentItem:RightLabel(_U('vehicleshop_item_pricesuffix-', v2.price))
                end

                for i3,v3 in ipairs(Config.AllowedPayments) do
                    buyoption = menuPool:AddSubMenu(buymenu, _U('vehicleshop_item_payment', v3.label), _U('vehicleshop_item_descprice', v2.price))
                    buyoption.ParentItem:RightLabel(_U('vehicleshop_item_pricesuffix', v2.price))
                    buyoption.paymentindex = i3

                    local transferspawn = nil
                    local transferin = nil

                    if Config.TransferPrice.spawn >= 0 then
                        transferspawn = NativeUI.CreateItem(_U('vehicleshop_item_spawn'), _U('vehicleshop_item_descprice', v2.price + Config.TransferPrice.spawn))
                        transferspawn:RightLabel(_U('vehicleshop_item_pricesuffix+', Config.TransferPrice.spawn))
                    elseif Config.TransferPrice.spawn < 0 then
                        transferspawn = NativeUI.CreateItem(_U('vehicleshop_item_spawn'), _U('vehicleshop_item_descprice', v2.price + Config.TransferPrice.spawn))
                        transferspawn:RightLabel(_U('vehicleshop_item_pricesuffix-', Config.TransferPrice.spawn))
                    end

                    if Config.TransferPrice.transfer >= 0 then
                        transferin = NativeUI.CreateItem(_U('vehicleshop_item_ingarage'), _U('vehicleshop_item_descprice', v2.price + Config.TransferPrice.transfer))
                        transferin:RightLabel(_U('vehicleshop_item_pricesuffix+', Config.TransferPrice.transfer))
                    elseif Config.TransferPrice.transfer < 0 then
                        transferin = NativeUI.CreateItem(_U('vehicleshop_item_ingarage'), _U('vehicleshop_item_descprice', v2.price + Config.TransferPrice.transfer))
                        transferin:RightLabel(_U('vehicleshop_item_pricesuffix-', Config.TransferPrice.transfer))
                    end

                    transferspawn.price = 'spawn'
                    transferin.price = 'transfer'

                    buyoption:AddItem(transferspawn)
                    buyoption:AddItem(transferin)

                    transferspawn.Activated = buyVehicle
                    transferin.Activated = buyVehicle
                end
            end
        end
    end
end

function buyVehicle(menu, item, panels)
    local buymenu = menu.ParentItem.ParentMenu
    local vehiclemenu = buymenu.ParentItem.ParentMenu
    found = false
    for i,v in ipairs(shop.buyspawnpoints) do
        if #ESX.Game.GetVehiclesInArea(v.coords, v.radius) <= 0 then
            found = true
            TriggerServerEvent('dream_vehicleshop:buyVehicle', interactionArea, vehiclemenu.vehicle.categoryIndex, vehiclemenu.vehicle.index, vehiclemenu.vehicle.maincolor, vehiclemenu.vehicle.secondcolor, i, menu.paymentindex, item.price)
            break
        end
    end

    if not found then
        TriggerEvent("swt_notifications:captionIcon",_U('notifications_titel'),_U('notifications_notfreespace'),Config.Notification.pos,Config.Notification.timeout,Config.Notification.color.negative,'white',true,Config.Notification.icons.default)
    end
end

