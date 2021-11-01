function getShopFromId(id)
    for i, v in ipairs(Config.Cardealer) do
        if v.id == id then
            return v
        end
    end
end