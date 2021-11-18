Config                  = {}
Config.Catalog          = {}

Config.Locale           = 'en'
Config.DebugMarker      = false

Config.NPCsDefaultType  = 4
Config.NPCsDefaultModel = "ig_mp_agent14"

Config.KeyControle      = 38 -- Default: 38 (E)

Config.Notification = {
    pos = 'top-left',
    timeout = 5000,
    color = {
        success = "green",
        negative = "red",
    },
    icons = {
        default = 'mdi-car-estate',
        database = 'mdi-database-alert',
    },
}

Config.AllowedPayments = {
    {name = 'money', label = _U('config_allowedpayments_'..'money')},
    {name = 'bank', label = _U('config_allowedpayments_'..'bank')},
    --{name = 'black_money', label = _U('config_allowedpayments_black_money')},
}

Config.Colors           = {
    {id = 0, name = "Metallic Black"},
    {id = 27, name = "Metallic Red"},
    {id = 88, name = "Metallic Taxi Yellow"},
    {id = 55, name = "Matte Lime Green"},
}
