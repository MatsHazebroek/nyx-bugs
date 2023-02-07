-- Code
RegisterCommand(Config.Command, function(source, args, rawCommand)

    -- Layout van het Bericht
    local rgba = Config.RGBA
    local title = Config.Title
    local message = Config.Message
    local html_icons = Config.Icons
    local steam = Config.Steam
    local bug = Config.Bug
    local padding = Config.Padding
    local margin = Config.Margin
    local border = Config.Border
    local error = Config.Error
    local coords = Config.Coords

    -- Player
    local player = source
    local ped = GetPlayerPed(source)
    local playerCoords = GetEntityCoords(ped)


    if (source > 0) and (args[1] ~= nil) then
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="padding: '.. padding ..'vw; margin: '.. margin ..'vw; background-color: ' .. rgba .. ';border-radius:'.. border ..'px;"><i class=" ' .. html_icons .. ' "></i> ' .. title .. '<br> '.. message ..'</div>',
            args = table.concat(args, " ")
        })
        sendToDiscord( header, "".. steam ..": **" .. GetPlayerName(source) .. "** \n " .. coords .. ": **" .. playerCoords .. "** \n" .. bug .. ": **" .. table.concat(args, " ") .. "**", 65280)
    else
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="padding: '.. padding ..'vw; margin: '.. margin ..'vw; background-color: rgba(255, 0, 0, 202);border-radius:'.. border ..'px;"><i class="fas fa-exclamation"></i> ' .. title .. '<br> '.. error ..'</div>',
            args = table.concat(args, " ")
        })
    end
end, false)

-- Discord Webhook
function sendToDiscord(header, message)
    local webhook = Config.Webhook
    local avatar = Config.Avatar
    local name = Config.Name
    local color = Config.Color
    local header = Config.Header
    local connect = {
          {
              ["color"] = color,
              ["title"] = header,
              ["description"] = message,
              ["footer"] = {
              ["text"] = "Gemaakt door Mats/Joost",
              ["icon_url"] = "https://cdn.discordapp.com/attachments/914991375576080385/916367560881094656/nyx_rp.png",
              },
          }
      }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({username = name, embeds = connect, avatar_url = avatar}), { ['Content-Type'] = 'application/json' })
  end