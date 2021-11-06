function getShopFromId(id)
    for i, v in ipairs(Config.Shops) do
        if v.id == id then
            return v
        end
    end
end

function getShopIndexFromId(id)
    for i, v in ipairs(Config.Shops) do
        if v.id == id then
            return i
        end
    end
end