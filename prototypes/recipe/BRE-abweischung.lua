-- Better Robots Extended | Copyright (c) 2025 Nick1Z2 | License: GPL-3.0
local state = require("__Better_Robots_Extended__/scripts/state")
local mode = settings.startup["BRE-erzwinge-BRE-MK1-Bots"].value
local logistic_enable = false
local construction_enable = false
local roboport_enable = false
local cost = require("utils").cost
local scale = math.min(10, cost(0.5))
local scale_2 = math.min(10, 1 + cost(0.5))

if mode == "Disable" then
    logistic_enable = false
    construction_enable = false
	roboport_enable = false

elseif mode == "Override" then
    logistic_enable = true
    construction_enable = true
	roboport_enable = true

elseif mode == "Auto" then
    logistic_enable = state.logistic_robot_is_modified
    construction_enable = state.construction_robot_is_modified
	roboport_enable = state.roboport_is_modified
end

if logistic_enable then
	data:extend({
        {
            type = "recipe",
            name = "BRE-logistic-robotics-mk1",
            enabled = false,
            allow_quality = true,
            ingredients = {
                {type = "item", name = "flying-robot-frame", amount = 1 },
                {type = "item", name = "advanced-circuit", amount = 2 }
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
			  {type = "item", name = "BRE-logistic-robotics-mk1", amount = scale},
			  {type = "item", name = "electronic-circuit", amount = cost(3)},
			  {type = "item", name = "electric-engine-unit", amount = cost(1)},
			  {type = "item", name = "battery", amount = cost(2)}
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
                {type = "item", name = "flying-robot-frame", amount = 1 },
                {type = "item", name = "electronic-circuit", amount = 2 }
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
			  {type = "item", name = "BRE-construction-robotics-mk1", amount = scale},
			  {type = "item", name = "electronic-circuit", amount = cost(3)},
			  {type = "item", name = "electric-engine-unit", amount = cost(1)},
			  {type = "item", name = "battery", amount = cost(2)}
			},
			results = {{type = "item", name = "BRE-construction-robotics-mk2", amount = 1}}
		}
    })
end

if roboport_enable then
	data:extend({
        {
            type = "recipe",
            name = "BRE-roboport-mk1",
            enabled = false,
            allow_quality = true,
            ingredients = {
                {type = "item", name = "steel-plate", amount = 45 },
                {type = "item", name = "iron-gear-wheel", amount = 45 },
                {type = "item", name = "advanced-circuit", amount = 45 }
            },
            results = {{ type = "item", name = "BRE-roboport-mk1", amount = 1 }}
        },
		{
			  type = "recipe",
			  name = "BRE-roboport-mk2_2",
			  enabled = false,
			  allow_quality = true,
			  energy_required = 10,
			  ingredients =
			  {
				{type = "item", name = "steel-plate", amount = cost(10)},
				{type = "item", name = "BRE-roboport-mk1", amount = scale_2},
				{type = "item", name = "battery", amount = cost(45)},
				{type = "item", name = "processing-unit", amount = cost(5)}
			  },
			  results = {
				{type = "item", name = "BRE-roboport-mk2", amount = 1}}
		},
    })
end