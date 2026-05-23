function RotationToDirection(rotation)

    local adjustedRotation = {

        x = math.rad(rotation.x),

        y = math.rad(rotation.y),

        z = math.rad(rotation.z)
    }

    local direction = vector3(

        -math.sin(adjustedRotation.z)
        * math.abs(math.cos(adjustedRotation.x)),

        math.cos(adjustedRotation.z)
        * math.abs(math.cos(adjustedRotation.x)),

        math.sin(adjustedRotation.x)
    )

    return direction
end

function RaycastCamera(distance)

    local cameraRotation =
        GetGameplayCamRot()

    local cameraCoord =
        GetGameplayCamCoord()

    local direction =
        RotationToDirection(cameraRotation)

    local destination =
        cameraCoord + (direction * distance)

    local rayHandle =
        StartShapeTestLosProbe(

            cameraCoord.x,
            cameraCoord.y,
            cameraCoord.z,

            destination.x,
            destination.y,
            destination.z,

            -1,

            PlayerPedId(),

            4
        )

    local _, hit, endCoords, surfaceNormal,
          entityHit =
        GetShapeTestResult(rayHandle)

    return hit, entityHit, endCoords
end