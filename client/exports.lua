ECLZones = ECLZones or {}

ECLZones.BoxZones = ECLZones.BoxZones or {}

exports('AddBoxZone', function(name, coords, length, width, data)

    ECLZones.BoxZones[name] = {

        coords = coords,

        length = length,

        width = width,

        options = data.options or {},

        distance = data.distance or 2.0,

        debug = data.debug or false
    }

    --print('[ECL-Target] BoxZone Created:', name)
end)