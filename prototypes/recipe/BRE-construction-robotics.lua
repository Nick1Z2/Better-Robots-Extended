data:extend({

	{
		type = "recipe",
		name = "BRE-construction-robotics-mk2",
		enabled = false,
        allow_quality = true,
		ingredients =
		{
		  {type = "item", name = "construction-robot", amount = 1},
		  {type = "item", name = "electronic-circuit", amount = 3},
		  {type = "item", name = "electric-engine-unit", amount = 1},
		  {type = "item", name = "battery", amount = 2}
		},
		results = {{type = "item", name = "BRE-construction-robotics-mk2", amount = 1}}
	},
	{
		type = "recipe",
		name = "BRE-construction-robotics-mk3",
		enabled = false,
        allow_quality = true,
		ingredients =
		{
		  {type = "item", name = "BRE-construction-robotics-mk2", amount = 1},
		  {type = "item", name = "low-density-structure", amount = 1}
		},
		results = {{type = "item", name = "BRE-construction-robotics-mk3", amount = 1}}
	},
	{
		type = "recipe",
		name = "BRE-construction-robotics-mk4",
		enabled = false,
        allow_quality = true,
		ingredients =
		{
		  {type = "item", name = "BRE-construction-robotics-mk3", amount = 1},
		  {type = "item", name = "steel-plate", amount = 2},
		  {type = "item", name = "rocket-fuel", amount = 1}
		},
		results = {{type = "item", name = "BRE-construction-robotics-mk4", amount = 1}}
	},
	{
		type = "recipe",
		name = "BRE-construction-robotics-mk5",
		enabled = false,
        allow_quality = true,
		ingredients =
		{
		  {type = "item", name = "BRE-construction-robotics-mk4", amount = 1},
		  {type = "item", name = "uranium-fuel-cell", amount = 1}
		},
		results = {{type = "item", name = "BRE-construction-robotics-mk5", amount = 1}}
	}
})

if settings.startup["BRE-erzwinge-MK1-Bots"].value then
    data:extend({
        {
            type = "recipe",
            name = "BRE-construction-robotics",
            enabled = false,
            allow_quality = true,
            ingredients = {
                { type = "item", name = "flying-robot-frame", amount = 1 },
                { type = "item", name = "electronic-circuit", amount = 1 }
            },
            results = {{ type = "item", name = "construction-robot", amount = 1 }}
        }
    })
end