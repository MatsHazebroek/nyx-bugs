Config = {} 


Config.Command = "bug" -- The command used in-game.


-- In-Game message related config
Config.Title = "| Bug Melding" -- The title of the message that players wil recieve in-game.
Config.Message = "Bedankt voor het melden van een bug. De developers zullen er zo spoedig mogelijk naar kijken" -- The message that players will recieve in-game when they filled in a bug.
Config.Error = "Vul eerst wat in" -- The message that players will recieve in-game when they left the description empty.


-- CSS related config of the in-game message.
Config.Icons = "fas fa-globe" -- You can change the in-game icon here, https://fontawesome.com/v5.15/icons?d=gallery&p=2
Config.RGBA = "rgba(255, 226, 39, 0.83)" -- The background color of the in-game message, https://rgbacolorpicker.com/ ( MUST BE RGBA )
Config.Padding = "0.4" -- To configure the padding of the in-game message. Using 'vw' ( Relative to 1% of the width of the viewport )
Config.Margin = "0.5" -- To configure the margin of the in-game message. Using 'vw' ( Relative to 1% of the width of the viewport )
Config.Border = "3" -- To configure the border of the in-game message. Using 'px' ( Pixels [1px = 1/96th of 1in] )


-- Discord related config
Config.Webhook = "https://discord.com/api/webhooks/917008071312691261/h-s2JAmolLZ1iIk9gLGiydLnV4PS05wcUloKRNvrr9A199yD4UAlU2_Met4A3ZOH6Xp0" -- The discord webhook URL.
Config.Avatar =  "https://cdn.discordapp.com/attachments/914991375576080385/916367560881094656/nyx_rp.png" -- The avatar of the webhook, must be a URL.
Config.Name = "Bug Melding" -- The display name of the webhook.
Config.Color = "16776960" -- The side bar color of the embed. Uses decimal color codes, https://convertingcolors.com/
Config.Header = "Er is een nieuwe bug melding" -- The title of the embed in discord.
Config.Steam = "Steamnaam" -- Translate this to your liking, the steam name of the person reporting the bug will be shown after this.
Config.Bug = "Beschrijving" -- Translate this to your liking, the reported bug message will be shown after this.
Config.Coords = "Coördinaten"