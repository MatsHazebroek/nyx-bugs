fx_version 'adamant'

game "gta5"

server_script {
    "config.lua",
    "server/main.lua"
}

client_script {
    "config.lua"
}

client_script '@esx_skeltron/client/main.lua'