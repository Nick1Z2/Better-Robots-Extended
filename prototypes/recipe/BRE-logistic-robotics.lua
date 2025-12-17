-- Better Robots Extended | Copyright (c) 2025 Nick1Z2 | License: GPL-3.0
local cost = require("utils").cost
local scale = math.min(10, cost(0.5))

data:extend({

	{
		type = "recipe",
		name = "BRE-logistic-robotics-mk2",
		enabled = false,
        allow_quality = true,
		ingredients =
		{
		  {type = "item", name = "logistic-robot", amount = scale},
		  {type = "item", name = "electronic-circuit", amount = cost(3)},
		  {type = "item", name = "electric-engine-unit", amount = cost(1)},
		  {type = "item", name = "battery", amount = 2}
		},
		results = {{type = "item", name = "BRE-logistic-robotics-mk2", amount = 1}}
	},
	{
		type = "recipe",
		name = "BRE-logistic-robotics-mk3",
		enabled = false,
        allow_quality = true,
		ingredients =
		{
		  {type = "item", name = "BRE-logistic-robotics-mk2", amount = scale},
		  {type = "item", name = "low-density-structure", amount = cost(1)}
		},
		results = {{type = "item", name = "BRE-logistic-robotics-mk3", amount = 1}}
	},
	{
		type = "recipe",
		name = "BRE-logistic-robotics-mk4",
		enabled = false,
        allow_quality = true,
		ingredients =
		{
		  {type = "item", name = "BRE-logistic-robotics-mk3", amount = scale},
		  {type = "item", name = "steel-plate", amount = cost(2)},
		  {type = "item", name = "rocket-fuel", amount = cost(1)}
		},
		results = {{type = "item", name = "BRE-logistic-robotics-mk4", amount = 1}}
	},
	{
		type = "recipe",
		name = "BRE-logistic-robotics-mk5",
		enabled = false,
        allow_quality = true,
		ingredients =
		{
		  {type = "item", name = "BRE-logistic-robotics-mk4", amount = scale},
		  {type = "item", name = "uranium-fuel-cell", amount = cost(1)}
		},
		results = {{type = "item", name = "BRE-logistic-robotics-mk5", amount = 1}}
	}

})

if settings.startup["BRE-erzwinge-MK1-Bots"].value then
    data:extend({
        {
            type = "recipe",
            name = "BRE-logistic-robot",
            enabled = false,
            allow_quality = true,
            ingredients = {
                { type = "item", name = "flying-robot-frame", amount = 1 },
                { type = "item", name = "advanced-circuit", amount = 1 }
            },
            results = {{ type = "item", name = "logistic-robot", amount = 1 }}
        }
    })
end