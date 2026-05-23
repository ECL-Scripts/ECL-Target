function ShowTarget()

    SendNUIMessage({

        action = 'show'
    })
end

function HideTarget()

    SendNUIMessage({

        action = 'hide'
    })
end

function HoverTarget(state)

    SendNUIMessage({

        action = 'hover',

        state = state
    })

    if not state then

        SendNUIMessage({

            action = 'options',

            options = {}
        })
    end
end

function SendOptions(options)

    SendNUIMessage({

        action = 'options',

        options = options
    })
end

AddEventHandler('onResourceStop', function(resource)

    if resource ~= GetCurrentResourceName() then

        return
    end

    SendNUIMessage({

        action = 'hide'
    })
end)