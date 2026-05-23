ECLZones = {}

ECLZones.BoxZones = {}

function GetClosestZone()

    local playerCoords =
        GetEntityCoords(PlayerPedId())

    for name, zone in pairs(ECLZones.BoxZones) do

        local distance =
            #(playerCoords - zone.coords)

        if distance <= zone.distance then

            return zone
        end
    end

    return nil
end

--[[ CreateThread(function()

    Wait(1000)

    exports['ECL-Target']:AddBoxZone(  -- Example test

        'test_zone',

        vector3(-69.1705, -802.6713, 45.4932), 

        1.0,

        1.0,

        {

            distance = 1.5,

            options = {

                {

                    label = 'Open Garage',

                    icon = '🚗',

                    onSelect = function()

                        print('GARAGE')
                    end
                },

                {

                    icon = '📦',

                    label = 'Open Stash',

                    event = 'stash:event'
                }
            }
        }
    )
end) ]]