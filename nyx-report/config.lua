Nyx = {}

-- Important settings.
Nyx.getSharedObject = "esx:getSharedObject" -- The esx:getSharedObject that your server uses.
Nyx.Report = "report" -- The command used in-game to report.
Nyx.Reply = "reply" -- The command used in-game to reply.

Nyx.AlwaysLogToDiscord = true -- Reports are logged when there is no staff online. If you enable this option, reports will always be logged.
Nyx.ReplyLogToDiscord = true -- If you want to log every reply, set this option to true.

Nyx.AdminRanks = { -- The group that the player needs to see and reply to reports.
    "admin",
    "superadmin",
}

-- Discord related settings.
Nyx.Webhook = "https://discord.com/api/webhooks/874290352318730250/bT8ZGL3FrLHdj9nVUAg_Pyayo5gKsfYo3J1bIUxXh6PhJGIyjAlTUIcEh1pvghtWU0J8" -- The discord webhook URL.
Nyx.Avatar = "https://cdn.discordapp.com/attachments/869670166101905448/870333428149678150/Transparant_7_2D.png" -- The avatar of the webhook, must be a URL.

Nyx.ReportColor = "16711680" -- The side bar color of the report embed. Uses decimal color codes, https://convertingcolors.com/
Nyx.ReportHeader = "Incoming Report" -- The header of the report embed in discord.

Nyx.ReplyColor = "7576951" -- The side bar color of the reply embed. Uses decimal color codes, https://convertingcolors.com/
Nyx.ReplyHeader = "has replied to" -- The header of the reply embed in discord.


-- CSS related config of the in-game message.
Nyx.Title = "Nyx-Reports" -- The title of the message that players wil recieve in-game.

Nyx.Padding = "0.4" -- To Nyxure the padding of the in-game message. Using 'vw' ( Relative to 1% of the width of the viewport )
Nyx.Margin = "0.5" -- To Nyxure the margin of the in-game message. Using 'vw' ( Relative to 1% of the width of the viewport )
Nyx.Border = "3" -- To Nyxure the border of the in-game message. Using 'px' ( Pixels [1px = 1/96th of 1in] )


Nyx.AdminIcon = "fas fa-globe" -- You can change the in-game icon here, https://fontawesome.com/v5.15/icons?d=gallery&p=2
Nyx.AdminRGBA = "rgba(24,250,60, 0.6)" -- The background color of the in-game message, https://rgbacolorpicker.com/ ( MUST BE RGBA )

Nyx.ReportIcon = "fas fa-globe" -- You can change the in-game icon here, https://fontawesome.com/v5.15/icons?d=gallery&p=2
Nyx.ReportRGBA = "rgba(220,20,60, 0.6)" -- The background color of the in-game message, https://rgbacolorpicker.com/ ( MUST BE RGBA )

Nyx.ReplyIcon = "fas fa-globe" -- You can change the in-game icon here, https://fontawesome.com/v5.15/icons?d=gallery&p=2
Nyx.ReplyRGBA = "rgba(29,29,270, 0.6)" -- The background color of the in-game message, https://rgbacolorpicker.com/ ( MUST BE RGBA )

Nyx.ErrorIcon = "fas fa-exclamation" -- You can change the in-game icon here, https://fontawesome.com/v5.15/icons?d=gallery&p=2
Nyx.ErrorRGBA = "rgba(255, 0, 0, 0.7)" -- The background color of the in-game message, https://rgbacolorpicker.com/ ( MUST BE RGBA )

-- In-game message translations.
Nyx.Error = "Vul aub iets in." -- Translate this to your liking, this is the error that a player will get when he leaves his report empty.
Nyx.ReportSent = "Je report is verzonden naar ons team!" -- Translate this to your liking, this is the message that a player will get when he sends his report.
Nyx.NoStaffOnline = "Er is helaas geen staff online, je report is gelogged in de discord!" -- Translate this to your liking, this is the message that a player will get when he sends his report, but there isn't any staff online.
Nyx.Incoming = "Inkomend bericht van" -- Translate this to your liking, this is the message that a player will get when he recieves a reply.
Nyx.Replied = "Bericht succesvol verzonden" -- Translate this to your liking, this is the message that a staff member will get when he sends his reply.
Nyx.InvalidID = "Ongeldig ID" -- Translate this to your liking, this is the message that a staff member will get when he fills in an invalid player id.
Nyx.SelfReply = "Je kan niet op jezelf reageren" -- Translate this to your liking, this is the message that a staff member will get when he tries to reply to himself.
Nyx.NoPermission = "Je hebt geen toegang tot dit command" -- Translate this to your liking, this is the message that a player will get when he tries to use the reply command.