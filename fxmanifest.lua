fx_version 'adamant'

game 'gta5'

description 'Vehicleshop von Dreaminfinity.de'

version '0.3.0-alpha'

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',

	'locales/en.lua',

	'config.lua',
	'config_vehicles.lua',

	'server/functions/*.lua',

	'server/server.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'@NativeUILua/NativeUI.lua',
	
	'locales/en.lua',

	'config.lua',
	'catalog_car_underclass.lua',
	'config_shops.lua', -- Always load at last

	'client/functions/setcam.lua',
	'client/functions/utils.lua',

	'client/client.lua',
	'client/interactions.lua',
	'client/blips_npcs.lua',
	'client/vehicleshop_menu/open_dealermenu.lua',
	'client/vehicleshop_menu/menu_vehicle_list.lua',
}

dependencies {
	'es_extended',
	'NativeUILua',
	'mysql-async',
	'dream_garage',
	--'zf_dialog',
}
