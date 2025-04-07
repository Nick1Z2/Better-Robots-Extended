data:extend(
  {
    {
      type = "recipe",
      name = "bre-roboport-mk2",
      enabled = false,
      allow_quality = true,
      energy_required = 10,
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 10},
        {type = "item", name = "roboport", amount = 2},
		{type = "item", name = "battery", amount = 45},
        {type = "item", name = "processing-unit", amount = 5}
      },
      results = {
        {type = "item", name = "bre-roboport-mk2", amount = 1}
      }
    },
    {
      type = "recipe",
      name = "bre-roboport-mk3",
      enabled = false,
      allow_quality = true,
      energy_required = 20,
      ingredients =
      {
        {type = "item", name = "steel-plate", amount = 25},
        {type = "item", name = "bre-roboport-mk2", amount = 2},
        {type = "item", name = "efficiency-module-2", amount = 5},
        {type = "item", name = "processing-unit", amount = 15}
      },
      results = {
        {type = "item", name = "bre-roboport-mk3", amount = 1}
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
			results = {{type="item", name="roboport", amount=1}}
        }
    })
end