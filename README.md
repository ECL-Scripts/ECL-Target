# ECL-Target

Modern eye-target interaction system for FiveM.

> ECL-Target is a lightweight and optimized targeting resource designed with a modern and immersive interaction system built for performance, simplicity and clean visuals.

---

## Features

• Modern Eye Target UI  
• ALT Interaction System  
• Hover & Click Support  
• Box Zones  
• Event / Function Support  
• Smooth interaction menu  
• Lightweight & optimized  
• Clean & Modern Design  
• Standalone support  
• ESX / QBCore / ox_core compatibility  

---

# Installation

Add the resource to your `resources` folder and ensure it in your `server.cfg`.

```cfg
ensure ECL-Target
```

---

# Preview

<img width="1672" height="941" alt="ecl-target" src="https://github.com/user-attachments/assets/f4a941ea-313b-4af9-8b9b-c50a1a8b8436" />

---

# Usage

## AddBoxZone

Create interaction zones with customizable options.

```lua
exports['ECL-Target']:AddBoxZone(

    'garage',

    vector3(215.0, -810.0, 30.0),

    2.0,

    2.0,

    {

        distance = 3.0,

        options = {

            {
                label = 'Open Garage',
                icon = '🚗',

                event = 'garage:open'
            },

            {
                label = 'Open Stash',
                icon = '📦',

                serverEvent = 'stash:open'
            }
        }
    }
)
```

---

# Export

```lua
exports['ECL-Target']:AddBoxZone(
    name,
    coords,
    length,
    width,
    data
)
```

---

# Parameters

| Parameter | Type | Description |
|---|---|---|
| name | string | Unique zone name |
| coords | vector3 | Zone coordinates |
| length | number | Zone length |
| width | number | Zone width |
| data | table | Zone configuration |

---

# Data Table

```lua
{
    distance = 3.0,

    options = {

        {
            label = 'Example',
            icon = '⭐',

            event = 'example:event'
        }
    }
}
```

---

# Options

| Option | Type | Description |
|---|---|---|
| label | string | Option label |
| icon | string | Option icon |
| event | string | Client event |
| serverEvent | string | Server event |
| command | string | Execute command |
| onSelect | function | Lua callback function |

---

# Event Example

```lua
exports['ECL-Target']:AddBoxZone(

    'garage',

    vector3(215.0, -810.0, 30.0),

    2.0,

    2.0,

    {

        options = {

            {
                label = 'Repair Vehicle',
                icon = '🔧',

                event = 'garage:repair'
            }
        }
    }
)
```

---

# Server Event Example

```lua
exports['ECL-Target']:AddBoxZone(

    'stash',

    vector3(220.0, -805.0, 30.0),

    2.0,

    2.0,

    {

        options = {

            {
                label = 'Open Stash',
                icon = '📦',

                serverEvent = 'stash:open'
            }
        }
    }
)
```

---

# Command Example

```lua
exports['ECL-Target']:AddBoxZone(

    'vehicle',

    vector3(220.0, -805.0, 30.0),

    2.0,

    2.0,

    {

        options = {

            {
                label = 'Fix Vehicle',
                icon = '🚗',

                command = 'fix'
            }
        }
    }
)
```

---

# Function Example

```lua
exports['ECL-Target']:AddBoxZone(

    'test',

    vector3(220.0, -805.0, 30.0),

    2.0,

    2.0,

    {

        options = {

            {
                label = 'Print Test',
                icon = '⭐',

                onSelect = function()

                    print('Selected!')
                end
            }
        }
    }
)
```

---

# Controls

| Key        | Action |
|    ---     |   ---  |
| ALT        | Open Target |
| Left Click | Interaction Mode |
| ESC        | Close Interaction |

---

# Planned Features

• Global Entity Targeting  
• Vehicle Support  
• Player Support  
• Bone Targeting  
• Context Actions  
• Radial Integration  
• Improved Animations  

---

# Links

📦 **Download**  
https://github.com/ECL-Scripts/ECL-Target

🎥 **Preview**  
https://youtube.com/

🔗 **Discord**  
https://discord.gg/tBkbfATVrz

🛒 **Tebex**  
https://ecl-scripts.tebex.io/

---

# License

Developed by ECL Scripts.
