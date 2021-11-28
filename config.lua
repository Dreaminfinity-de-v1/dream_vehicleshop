Config                  = {}
Config.Catalog          = {}

Config.Locale           = 'en'
Config.DebugMarker      = false

Config.NPCsDefaultType  = 4
Config.NPCsDefaultModel = "ig_mp_agent14"

Config.KeyControles = {
    menuopen = 38, -- Default: 38 (E)
    camnext = {id = 208, name = 'INPUT_FRONTEND_RT'},
    camprevious = {id = 207, name = 'INPUT_FRONTEND_LT'},
}

Config.TransferPrice    = {
    spawn    = 0,
    transfer = 75.0,
}

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
