ESX = exports["es_extended"]:getSharedObject()

local blipCoord = nil
local elektrikerblip = nil
local elektrikerjobstartet = false

Citizen.CreateThread(function()
    local pedModel = Config.ElektrikerModel

    pedPosition = vector4(Config.ElektrikerPed.x, Config.ElektrikerPed.y, Config.ElektrikerPed.z - 1.0, Config.ElektrikerPed.w)

    RequestModel(pedModel)
    while not HasModelLoaded(pedModel) do
        Wait(500)
    end

    local ped = CreatePed(4, GetHashKey(pedModel), pedPosition.x, pedPosition.y, pedPosition.z, pedPosition.w, false, true)
    SetEntityAsMissionEntity(ped, true, true)
    SetBlockingOfNonTemporaryEvents(ped, true)
    FreezeEntityPosition(ped, true)
    
    SetEntityInvincible(ped, true)
end)

local usedLocations = {}

local function getRandomLocations(locations, n, exclude)
    local availableLocations = {}
    local selected = {}
    local usedIndices = {}

    for _, location in ipairs(locations) do
        local isExcluded = false
        for _, excludedLocation in ipairs(exclude) do
            if location.Label == excludedLocation.Label then
                isExcluded = true
                break
            end
        end

        if not isExcluded then
            table.insert(availableLocations, location)
        end
    end

    n = math.min(n, #availableLocations)

    for i = 1, n do
        local index
        repeat
            index = math.random(1, #availableLocations)
        until not usedIndices[index]
        usedIndices[index] = true
        table.insert(selected, availableLocations[index])
    end

    return selected
end

local function handleLocationSelection(location)

    lib.notify({
        description = 'Du har modtaget en GPS',
        type = 'inform',
        position = 'bottom',
        icon = 'location-dot',
        duration = 5000,
    })

    local blipCoord = location.Coords
    elektrikerblip = AddBlipForCoord(blipCoord.x, blipCoord.y, blipCoord.z)
    SetBlipSprite(elektrikerblip, 1)
    SetBlipColour(elektrikerblip, 5)
    SetBlipRoute(elektrikerblip, true)
    SetBlipRouteColour(elektrikerblip, 5)

    exports.ox_target:addBoxZone({
        coords = blipCoord, 
        size = vector3(1.0, 1.0, 1.0),
        name = 'ejj_elektrikerboxzone',
        options = {
            {
                label = "Reparer Elboks",
                icon = 'fa-solid fa-bolt',
                distance = 2,
                onSelect = function()
                    local dict = 'mini@repair'
                
                    RequestAnimDict(dict)
                    while not HasAnimDictLoaded(dict) do
                        Wait(50)
                    end
                
                    if not IsEntityPlayingAnim(PlayerPedId(), dict, 'fixing_a_ped', 3) then
                        TaskPlayAnim(PlayerPedId(), dict, 'fixing_a_ped', 2.0, -8.0, -1, 35, 0, 0, 0, 0)
                    end
                    TriggerEvent("Mx::StartMinigameElectricCircuit", '50%', '50%', '1.0', '30vmin', '1.ogg', function()
                        TriggerServerEvent('ejj_elektriker:givereward')
                        ClearPedTasks(PlayerPedId())
                        exports.ox_target:removeZone('ejj_elektrikerboxzone')
                        elektrikerjobstartet = false
                        RemoveBlip(elektrikerblip)

                        table.insert(usedLocations, location)
                    end)
                end
            }
        }
    })
end

local function GiveKeys(vehicle)
    if not Config.GiveKeys then
        return 
    end

    local plate = GetVehicleNumberPlateText(vehicle)
    local model = GetDisplayNameFromVehicleModel(GetEntityModel(vehicle))

    if GetResourceState('wasabi_carlock') == 'started' then
        exports.wasabi_carlock:GiveKey(plate)
    end
    if GetResourceState('okokGarage') == 'started' then
        TriggerServerEvent("okokGarage:GiveKeys", plate)
    end
    if GetResourceState('qb-vehiclekeys') == 'started' then
        TriggerEvent('qb-vehiclekeys:client:AddKeys', plate)
    end
    if GetResourceState('qs-vehiclekeys') == 'started' then
        exports['qs-vehiclekeys']:GiveKeys(plate, model, true)
    end
    if GetResourceState('cd_garage') == 'started' then
        TriggerEvent('cd_garage:AddKeys', plate)
    end
    if GetResourceState('vehicles_keys') == 'started' then
        TriggerServerEvent('vehicles_keys:selfGiveVehicleKeys', plate)
    end
    if GetResourceState('t1ger_keys') == 'started' then
        exports['t1ger_keys']:GiveTemporaryKeys(plate, model, 'Elektriker')
    end
    if GetResourceState('Renewed-Vehiclekeys') == 'started' then
        exports['Renewed-Vehiclekeys']:addKey(plate)
    end
end

local function showElektrikerMenu()
    local options = {}

    local selectedLocations = getRandomLocations(Config.ElektrikerLokationer, 3, usedLocations)

    for i, location in ipairs(selectedLocations) do
        table.insert(options, {
            title = location.Label,
            icon = location.Icon,
            image = location.Image,
            description = location.Description,
            onSelect = function()
                local spawnPoint = vector4(Config.ElektrikerVehicle.x, Config.ElektrikerVehicle.y, Config.ElektrikerVehicle.z, Config.ElektrikerVehicle.w)

                if ESX.Game.IsSpawnPointClear(spawnPoint, 5.0) then
                    elektrikerjobstartet = true
                    ESX.Game.SpawnVehicle('burrito', vector3(spawnPoint.x, spawnPoint.y, spawnPoint.z), spawnPoint.w, function(vehicle)
                        GiveKeys(vehicle)
                        handleLocationSelection(location)
                    end)
                else
                    lib.notify({
                        description = 'Spawnpoint er ikke frit!',
                        type = 'error',
                        position = 'bottom',
                        icon = 'square-parking',
                        duration = 5000,
                    })
                end
            end
        })
    end

    lib.registerContext({
        id = 'ejj_elektriker1',
        title = 'Elektriker Menu',
        canClose = true,
        options = options
    })

    lib.showContext('ejj_elektriker1')
end

local function showElektrikerMenu2()
    local options = {}

    local selectedLocations = getRandomLocations(Config.ElektrikerLokationer, 3, usedLocations)

    for i, location in ipairs(selectedLocations) do
        table.insert(options, {
            title = location.Label,
            icon = location.Icon,
            image = location.Image,
            description = location.Description,
            onSelect = function()
                handleLocationSelection(location)
            end
        })
    end

    lib.registerContext({
        id = 'ejj_elektriker2',
        title = 'Elektriker Menu',
        canClose = true,
        options = options
    })

    lib.showContext('ejj_elektriker2')
end

exports.ox_target:addBoxZone({
    coords = vector3(Config.ElektrikerPed.x, Config.ElektrikerPed.y, Config.ElektrikerPed.z), 
    size = vector3(1.0, 1.0, 1.0),
    options = {
        {
            label = "Start Elektriker",
            icon = 'fa-solid fa-bolt',
            distance = 2,
            canInteract = function()
                return elektrikerjobstartet == false
            end,
            onSelect = function()
                showElektrikerMenu()
            end
        },
    },
})

RegisterNetEvent('ejj_elektriker:startnymission')
AddEventHandler('ejj_elektriker:startnymission', function()
    local alert = lib.alertDialog({
        header = 'Elektriker',
        content = 'Vil du fortsætte jobbet eller stoppe?',
        labels = {cancel = 'Stop', confirm = 'Fortsæt'},
        centered = true,
        cancel = true
    })

    if alert == 'confirm' then
        showElektrikerMenu2()
    elseif alert == 'cancel' then
        usedLocations = {}
    end
end)