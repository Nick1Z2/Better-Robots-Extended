-- Better Robots Extended | Copyright (c) 2025 Nick1Z2 | License: GPL-3.0
local cost = require("utils").cost
local scale = math.min(10, 1 + cost(0.5))

data:extend(
{
    {
      type = "recipe",
      name = "BRE-robo-erweiterung-mk1",
      enabled = false,
      allow_quality = true,
      energy_required = 10,
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = cost(10)},
        {type = "item", name = "iron-gear-wheel", amount = cost(10)},
		{type = "item", name = "electronic-circuit", amount = cost(20)},
        {type = "item", name = "radar", amount = cost(2)}
      },
      results = {
        {type = "item", name = "BRE-robo-erweiterung-mk1", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "BRE-robo-erweiterung-mk2",
      enabled = false,
      allow_quality = true,
      energy_required = 20,
      ingredients =
      {
        {type = "item", name = "BRE-robo-erweiterung-mk1", amount = scale},
        {type = "item", name = "steel-plate", amount = cost(10)},
		{type = "item", name = "advanced-circuit", amount = cost(10)},
        {type = "item", name = "electric-engine-unit", amount = cost(5)}
      },
      results = {
        {type = "item", name = "BRE-robo-erweiterung-mk2", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "BRE-robo-erweiterung-mk3",
      enabled = false,
      allow_quality = true,
      energy_required = 20,
      ingredients =
      {
        {type = "item", name = "BRE-robo-erweiterung-mk2", amount = scale},
        {type = "item", name = "substation", amount = cost(2)},
		{type = "item", name = "processing-unit", amount = cost(10)},
        {type = "item", name = "low-density-structure", amount = cost(5)}
      },
      results = {
        {type = "item", name = "BRE-robo-erweiterung-mk3", amount = 1}
      }
    },
})