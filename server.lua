ESX = exports["es_extended"]:getSharedObject()

RegisterServerEvent('ejj_elektriker:givereward')
AddEventHandler('ejj_elektriker:givereward', function()
    local src = source
    local xPlayer = ESX.GetPlayerFromId(src) 

    local kontanter = math.random(Config.RewardMin, Config.RewardMax)
    if Config.RewardType == 'item' then
        xPlayer.addInventoryItem('money', kontanter)
    elseif Config.RewardType == 'bank' then
        xPlayer.addAccountMoney('bank', kontanter)
    end
    Citizen.Wait(1000)
    TriggerClientEvent('ejj_elektriker:startnymission', src)
end)