fx_version 'cerulean'
game 'gta5'

lua54 'yes'

name 'ECL-Target'

author 'ECL Scripts'

description 'Modern and minimal target system for FiveM'

shared_scripts {
    'shared/config.lua'
}

server_scripts {
    'server/main.lua'
}

ui_page 'html/index.html'

files {

    'html/index.html',

    'html/style.css',

    'html/script.js'
}

client_scripts {
    'client/raycast.lua',
    'client/target.lua',
    'client/ui.lua',
    'client/exports.lua',
    'client/zones.lua',
    'client/main.lua'
}

escrow_ignore {
    'shared/config.lua'
}