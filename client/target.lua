function IsValidTarget(entity)

    if not entity or entity == 0 then

        return false
    end

    if not DoesEntityExist(entity) then

        return false
    end

    if entity == PlayerPedId() then

        return false
    end

    return true
end

function GetEntityType(entity)

    if IsEntityAPed(entity) then

        if IsPedAPlayer(entity) then

            return 'player'
        end

        return 'ped'
    end

    if IsEntityAVehicle(entity) then

        return 'vehicle'
    end

    if IsEntityAnObject(entity) then

        return 'object'
    end

    return 'unknown'
end