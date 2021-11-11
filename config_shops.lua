Config.Shops        = {
    {
        id = 'premium_deluxe_motorsport',
        --titel = "",
        type = "car",
        name = "Premium Deluxe Motorsport",
        blip = {
            pos     = vector3(-56.7403, -1098.9110, 25.4224),
            titel   = "Premium Deluxe Motorsport",
            color   = 56,
            sprite  = 225, -- Icontype
            scale   = 1.25,
            display = 2,
        },
        dealer = {
            pos = vector3(-56.7403, -1098.9110, 25.4224),
            heading = 19.7531,
            type = 4,
            model = "a_m_y_bevhills_02",
            radius = 3,
        },
        catalog = Config.Catalog.car_underclass,
        camPos = vector3(-53.25, -1091.90, 28.20),
        showplace = { coords = vector3(-48.50, -1096.50, 26.00), heading = 343.20 },
        buyspawnpoints = {
            { coords = vector3(-17.77, -1079.75, 26.12), heading = 124.65, radius = 5.0 },
            { coords = vector3(-8.35, -1081.97, 26.26), heading = 127.40, radius = 5.0 },
            { coords = vector3(-45.28, -1082.97, 26.30), heading = 70.45, radius = 3.0 },
        },
    },
}
