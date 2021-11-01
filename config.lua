Config                  = {}

Config.Locale           = 'en'
Config.EnableBlips      = true

Config.NPCsDefaultType  = 4
Config.NPCsDefaultModel = "ig_mp_agent14"

Config.KeyControle      = 38 -- Default: 38 (E)

Config.Cardealer        = {
    {
        id = 'premium_deluxe_motorsport',
        name = "Premium Deluxe Motorsport",
        blip = {
            pos     = vector3(-56.7403, -1098.9110, 25.4224),
            titel   = "Premium Deluxe Motorsport",
            color   = 56,
            sprite  = 225, -- Icontype
            scale   = 1.25,
            display = 2,
        },
        cardealer = {
            pos = vector3(-56.7403, -1098.9110, 25.4224),
            heading = 19.7531,
            type = 4,
            model = "a_m_y_bevhills_02",
            radius = 3,
        },
    },
}

Config.Colors           = {
    {id = 27, name = "Metallic Red"},
    {id = 0, name = "Metallic Black"},
    {id = 88, name = "Metallic Taxi Yellow"},
    {id = 55, name = "Matte Lime Green"},
}

