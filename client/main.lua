ECLTarget = {}

ECLTarget.Active = false
ECLTarget.Focus = false
ECLTarget.Hovering = false

ECLTarget.Entity = nil
ECLTarget.Zone = nil

CreateThread(function()

    while true do

        local sleep = 200

        DisableControlAction(0, Config.TargetKey, true)

        local holdingAlt = IsDisabledControlPressed(0, Config.TargetKey)

        if holdingAlt or ECLTarget.Focus then

            sleep = 0

            if not ECLTarget.Active then

                ECLTarget.Active = true

                ShowTarget()
            end

            local found = false

            local zone = GetClosestZone()

            if zone then

                found = true

                ECLTarget.Zone = zone

                ECLTarget.Entity = nil

                if not ECLTarget.Hovering then

                    ECLTarget.Hovering = true

                    HoverTarget(true)

                    SendOptions(zone.options)
                end
            else

                local hit, entity =
                    RaycastCamera(5.0)

                if hit == 1 and
                   IsValidTarget(entity) then

                    found = true

                    ECLTarget.Entity = entity

                    ECLTarget.Zone = nil

                    if not ECLTarget.Hovering then

                        ECLTarget.Hovering = true

                        HoverTarget(true)
                    end
                end
            end

            if not found then

                ECLTarget.Entity = nil
                ECLTarget.Zone = nil

                if ECLTarget.Hovering then

                    ECLTarget.Hovering = false

                    HoverTarget(false)
                end
            end

            if ECLTarget.Hovering and
                not ECLTarget.Focus then

                if IsDisabledControlJustPressed(0, 24) then

                    ECLTarget.Focus = true

                    SetNuiFocus(true, true)
                end
            end

        elseif not ECLTarget.Focus then

            if ECLTarget.Active then

                ECLTarget.Active = false

                ECLTarget.Focus = false

                ECLTarget.Hovering = false

                ECLTarget.Entity = nil
                ECLTarget.Zone = nil

                SetNuiFocus(false, false)

                HideTarget()
            end
        end

        Wait(sleep)
    end
end)

RegisterNUICallback('selectOption', function(data, cb)

    local index =
        tonumber(data.index)

    local option = nil

    if ECLTarget.Zone then

        option =
            ECLTarget.Zone.options[index + 1]
    end

    if ECLTarget.Entity then

        -- entity options later
    end

    if option then

        if option.event then

            TriggerEvent(option.event)
        end

        if option.serverEvent then

            TriggerServerEvent(
                option.serverEvent
            )
        end

        if option.command then

            ExecuteCommand(option.command)
        end

        if option.onSelect then

            option.onSelect(
                ECLTarget.Entity,
                ECLTarget.Zone
            )
        end
    end

    ECLTarget.Focus = false

    SetNuiFocus(false, false)

    cb('ok')
end)

CreateThread(function()

    Wait(500)

    HideTarget()

    HoverTarget(false)
end)

AddEventHandler('onResourceStop', function(resource)

    if resource ~= GetCurrentResourceName() then

        return
    end

    SetNuiFocus(false, false)

    HideTarget()
end)

RegisterNUICallback('closeTarget', function(_, cb)

    ECLTarget.Focus = false

    SetNuiFocus(false, false)

    cb('ok')
end)

CreateThread(function()

    while true do

        if ECLTarget.Focus then

            DisablePlayerFiring(
                PlayerPedId(),
                true
            )

            DisableControlAction(0, 1, true)
            DisableControlAction(0, 2, true)

            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)

            DisableControlAction(0, 37, true)

            DisableControlAction(0, 44, true)
            DisableControlAction(0, 45, true)

            DisableControlAction(0, 68, true)
            DisableControlAction(0, 69, true)
            DisableControlAction(0, 70, true)

            DisableControlAction(0, 91, true)
            DisableControlAction(0, 92, true)

            DisableControlAction(0, 114, true)

            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)

            DisableControlAction(0, 257, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 264, true)

            DisableControlAction(0, 12, true)
            DisableControlAction(0, 13, true)
            DisableControlAction(0, 14, true)
            DisableControlAction(0, 15, true)

            Wait(0)
        else

            Wait(500)
        end
    end
end)

CreateThread(function()

    while true do

        if ECLTarget.Active then

            DisablePlayerFiring(
                PlayerPedId(),
                true
            )

            DisableControlAction(0, 24, true)
            DisableControlAction(0, 25, true)

            DisableControlAction(0, 37, true)

            DisableControlAction(0, 44, true)
            DisableControlAction(0, 45, true)

            DisableControlAction(0, 68, true)
            DisableControlAction(0, 69, true)
            DisableControlAction(0, 70, true)

            DisableControlAction(0, 91, true)
            DisableControlAction(0, 92, true)

            DisableControlAction(0, 114, true)

            DisableControlAction(0, 140, true)
            DisableControlAction(0, 141, true)
            DisableControlAction(0, 142, true)

            DisableControlAction(0, 257, true)
            DisableControlAction(0, 263, true)
            DisableControlAction(0, 264, true)

            Wait(0)
        else

            Wait(500)
        end
    end
end)

CreateThread(function()

    while true do

        if ECLTarget.Focus then

            if IsControlJustPressed(0, 322) then -- ESC

                ECLTarget.Focus = false

                SetNuiFocus(false, false)
            end

            Wait(0)
        else

            Wait(500)
        end
    end
end)
