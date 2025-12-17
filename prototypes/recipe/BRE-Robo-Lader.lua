-- Better Robots Extended | Copyright (c) 2025 Nick1Z2 | License: GPL-3.0
local cost = require("utils").cost
local scale = math.min(10, 1 + cost(0.5))

data:extend(
{
    {
      type = "recipe",
      name = "BRE-robo-lader-mk1",
      enabled = false,
      allow_quality = true,
      energy_required = 10,
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = cost(10)},
        {type = "item", name = "copper-cable", amount = cost(20)},
		{type = "item", name = "electronic-circuit", amount = cost(20)},
        {type = "item", name = "battery", amount = cost(10)}
      },
      results = {
        {type = "item", name = "BRE-robo-lader-mk1", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "BRE-robo-lader-mk2",
      enabled = false,
      allow_quality = true,
      energy_required = 20,
      ingredients =
      {
        {type = "item", name = "BRE-robo-lader-mk1", amount = scale},
        {type = "item", name = "copper-cable", amount = cost(20)},
		{type = "item", name = "advanced-circuit", amount = cost(10)},
        {type = "item", name = "electric-engine-unit", amount = cost(5)}
      },
      results = {
        {type = "item", name = "BRE-robo-lader-mk2", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "BRE-robo-lader-mk3",
      enabled = false,
      allow_quality = true,
      energy_required = 20,
      ingredients =
      {
        {type = "item", name = "BRE-robo-lader-mk2", amount = scale},
        {type = "item", name = "steel-plate", amount = cost(10)},
		{type = "item", name = "processing-unit", amount = cost(10)},
        {type = "item", name = "low-density-structure", amount = cost(5)}
      },
      results = {
        {type = "item", name = "BRE-robo-lader-mk3", amount = 1}
      }
    },
})