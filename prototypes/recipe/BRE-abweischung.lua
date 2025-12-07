local state = require("__Better_Robots_Extended__/scripts/state")
local mode = settings.startup["BRE-erzwinge-BRE-MK1-Bots"].value
local logistic_enable = false
local construction_enable = false

if mode == "Disable" then
    logistic_enable = false
    construction_enable = false

elseif mode == "Override" then
    logistic_enable = true
    construction_enable = true

elseif mode == "Auto" then
    logistic_enable = state.logistic_robot_is_modified
    construction_enable = state.construction_robot_is_modified
end

if logistic_enable then
	data:extend({
        {
            type = "recipe",
            name = "BRE-logistic-robotics-mk1",
            enabled = false,
            allow_quality = true,
            ingredients = {
                { type = "item", name = "flying-robot-frame", amount = 1 },
                { type = "item", name = "advanced-circuit", amount = 2 }
            },
            results = {{ type = "item", name = "BRE-logistic-robotics-mk1", amount = 1 }}
        },
		{
			type = "recipe",
			name = "BRE-logistic-robotics-mk2_2",
			enabled = false,
			allow_quality = true,
			ingredients =
			{
			  {type = "item", name = "BRE-logistic-robotics-mk1", amount = 1},
			  {type = "item", name = "electronic-circuit", amount = 3},
			  {type = "item", name = "electric-engine-unit", amount = 1},
			  {type = "item", name = "battery", amount = 2}
			},
			results = {{type = "item", name = "BRE-logistic-robotics-mk2", amount = 1}}
		}
    })
end

if construction_enable then
	data:extend({
        {
            type = "recipe",
            name = "BRE-construction-robotics-mk1",
            enabled = false,
            allow_quality = true,
            ingredients = {
                { type = "item", name = "flying-robot-frame", amount = 1 },
                { type = "item", name = "electronic-circuit", amount = 2 }
            },
            results = {{ type = "item", name = "BRE-construction-robotics-mk1", amount = 1 }}
        },
		{
			type = "recipe",
			name = "BRE-construction-robotics-mk2_2",
			enabled = false,
			allow_quality = true,
			ingredients =
			{
			  {type = "item", name = "BRE-construction-robotics-mk1", amount = 1},
			  {type = "item", name = "electronic-circuit", amount = 3},
			  {type = "item", name = "electric-engine-unit", amount = 1},
			  {type = "item", name = "battery", amount = 2}
			},
			results = {{type = "item", name = "BRE-construction-robotics-mk2", amount = 1}}
		}
    })
end