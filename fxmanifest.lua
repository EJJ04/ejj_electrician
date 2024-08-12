fx_version 'cerulean'
game 'gta5'

name 'ejj_elektriker'
description 'EJJ_04'
author 'EJJ_04'
version '1.0.0'
lua54 'yes'

client_scripts {
    'client.lua'
}

server_scripts {
    'server.lua',
    '@oxmysql/lib/MySQL.lua',
    '@mysql-async/lib/MySQL.lua',
}

shared_scripts {
    '@ox_lib/init.lua',
    '@es_extended/imports.lua',
    'config.lua',
}