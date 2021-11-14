fx_version 'adamant'

game 'gta5'

description 'Vehicleshop from Dreaminfinity.de'

author 'EThunder, Grewo'

version 'v1.0.0-beta'

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',

	'locales/en.lua',

	'config.lua',
	'catalog_car_underclass.lua',
	'config_shops.lua', -- Always load at last

	'cl_sv_utils.lua',
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

	'client/client.lua',

	'cl_sv_utils.lua',
	'client/functions/setcam.lua',
	'client/functions/setvehicle.lua',
	'client/functions/buyvehicle.lua',
	'client/functions/utils.lua',

	'client/interactions.lua',
	'client/blips_npcs.lua',
	'client/vehicleshop_menu/open_dealermenu.lua',
	'client/vehicleshop_menu/menu_vehicle_list.lua',
}

dependencies {
	'es_extended',
	'NativeUILua',
	'dream_addon',
	'dream_garage',
	'mysql-async',
	--'zf_dialog',
}
