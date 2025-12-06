local state = require("__Better_Robots_Extended__/scripts/state")

if state.logistic_robot_is_modified or settings.startup["BRE-erzwinge-BRE-MK1-Bots"].value then
	data:extend({
        {
            type = "recipe",
            name = "BRE-logistic-robotics-mk1",
            enabled = false,
            allow_quality = true,
            ingredients = {
                { type = "item", name = "flying-robot-frame", amount = 1 },
                { type = "item", name = "advanced-circuit", amount = 1 }
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

if state.construction_robot_is_modified or settings.startup["BRE-erzwinge-BRE-MK1-Bots"].value then
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