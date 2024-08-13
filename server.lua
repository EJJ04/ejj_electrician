ESX = exports["es_extended"]:getSharedObject()

local function isNearElektrikerLocation(playerCoords)
    for _, location in ipairs(Config.ElektrikerLokationer) do
        local distance = #(playerCoords - location.Coords)
        if distance <= Config.AllowedDistance then
            return true, location.Label
        end
    end
    return false, nil
end

local function sendToDiscord(title, description, color)
    local embed = {
        {
            ["title"] = title,
            ["description"] = description,
            ["color"] = color,
            ["footer"] = {
                ["text"] = os.date("%Y-%m-%d %H:%M:%S"),
            },
        }
    }

    PerformHttpRequest(Config.DiscordWebhookUrl, function(err, text, headers) end, 'POST', json.encode({username = "Elektriker Logger", embeds = embed}), { ['Content-Type'] = 'application/json' })
end

RegisterServerEvent('ejj_elektriker:givereward')
AddEventHandler('ejj_elektriker:givereward', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src)

    if xPlayer then
        local playerCoords = xPlayer.getCoords(true)
        local isNear, locationLabel = isNearElektrikerLocation(playerCoords)

        if isNear then
            local kontanter = math.random(Config.RewardMin, Config.RewardMax)

            if Config.RewardType == 'item' then
                xPlayer.addInventoryItem('money', kontanter)
            elseif Config.RewardType == 'bank' then
                xPlayer.addAccountMoney('bank', kontanter)
            end

            TriggerClientEvent('ox_lib:notify', src, {
                title = "Mission Fuldført",
                description = "Du har gennemført missionen ved " .. locationLabel .. " og modtaget " .. kontanter .. " DKK!",
                duration = 5000,
                position = 'bottom',
                type = 'success',
                icon = 'fa-solid fa-check-circle',
                iconColor = '#00FF00'
            })

            sendToDiscord(
                "Mission Fuldført",
                "Spilleren `" .. xPlayer.getName() .. "` (ID: `" .. xPlayer.getIdentifier() .. "`) har gennemført en mission ved " .. locationLabel .. " og modtaget " .. kontanter .. " DKK.",
                3066993 
            )

            Citizen.Wait(1000)
            TriggerClientEvent('ejj_elektriker:startnymission', src)
        else
            local playerName = xPlayer.getName()
            local playerIdentifier = xPlayer.getIdentifier()

            sendToDiscord(
                "Forsøg på snyd",
                "Spilleren `" .. playerName .. "` (ID: `" .. playerIdentifier .. "`) forsøgte at få belønning uden for en gyldig mission lokation.",
                16711680 
            )

            if Config.DropPlayer then
                DropPlayer(src, "Du er blevet kicket fra serveren for snyd.")
            end
        end
    else
        sendToDiscord(
            "Ugyldigt ID forsøg",
            "Der blev forsøgt at få belønning med en ugyldig spiller ID `" .. src .. "`.",
            16711680 
        )
    end
end)