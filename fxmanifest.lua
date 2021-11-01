fx_version 'adamant'

game 'gta5'

description 'Vehicleshop von Dreaminfinity.de'

version '0.1.0-alpha'

server_scripts {
	'@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',

	'locales/en.lua',

	'config.lua',

	'server/functions/*.lua',

	'server/server.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'@NativeUILua/NativeUI.lua',
	
	'locales/en.lua',

	'config.lua',

	'client/functions/*.lua',

	'client/client.lua',
	'client/interactions.lua',
	'client/blips_npcs.lua',
}

dependencies {
	'es_extended',
	'NativeUILua',
	'mysql-async',
	--'zf_dialog',
}
