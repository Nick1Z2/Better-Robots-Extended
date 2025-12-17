-- Better Robots Extended | Copyright (c) 2025 Nick1Z2 | License: GPL-3.0
local cost = require("utils").cost
local scale = math.min(10, 1 + cost(0.5))

data:extend(
  {
    {
      type = "recipe",
      name = "BRE-roboport-mk2",
      enabled = false,
      allow_quality = true,
      energy_required = 10,
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = cost(10)},
        {type = "item", name = "roboport", amount = scale},
		{type = "item", name = "battery", amount = cost(45)},
        {type = "item", name = "processing-unit", amount = cost(5)}
      },
      results = {
        {type = "item", name = "BRE-roboport-mk2", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "BRE-roboport-mk3",
      enabled = false,
      allow_quality = true,
      energy_required = 20,
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = cost(25)},
        {type = "item", name = "BRE-roboport-mk2", amount = scale},
        {type = "item", name = "efficiency-module-2", amount = cost(5)},
        {type = "item", name = "processing-unit", amount = cost(15)}
      },
      results = {
        {type = "item", name = "BRE-roboport-mk3", amount = 1}
      }
    },
})

if settings.startup["BRE-erzwinge-MK1-Bots"].value then
    data:extend({
        {
            type = "recipe",
            name = "BRE-roboport",
            enabled = false,
            allow_quality = true,
			energy_required = 5,
			ingredients =
			{
			  {type = "item", name = "steel-plate", amount = 45},
			  {type = "item", name = "iron-gear-wheel", amount = 45},
			  {type = "item", name = "advanced-circuit", amount = 45}
			},
			results = {{type="item", name="BRE-roboport-mk1", amount=1}}
        }
    })
end