-- Better Robots Extended | Copyright (c) 2025 Nick1Z2 | License: GPL-3.0
local Forschung_Kosten_Multiplikator = settings.startup["BRE-Forschung-Kosten-Multiplikator"].value

local space_science_pack = nil
local additional_prerequisites = {"construction-robotics","logistic-robotics"}
if settings.startup["BRE-use-space-science"].value == true then
  space_science_pack = {"space-science-pack", 1}
  table.insert(additional_prerequisites, "space-science-pack")
end

local max_tier = settings.startup["BRE_Tier-Stufe"].value

local ingredients = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"production-science-pack", 1},
  {"utility-science-pack", 1}
}

if settings.startup["BRE-use-space-science"].value == true then
  table.insert(ingredients, {"space-science-pack", 1})
end

if settings.startup["BRE-Roboport-MK3"].value and (max_tier == "MK2" or max_tier == "MK3") then

data:extend({
  {
		type = "technology",
		name = "BRE-roboport-mk3",
		localised_description = { "technology-description.BRE-construction-robotics-mk4" },
		icon = "__base__/graphics/technology/construction-robotics.png",
		icon_size = 256,
		icon_mipmaps = 4,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "BRE-roboport-mk3"
			}
		},
		prerequisites = additional_prerequisites,
		unit =
		{
			count = 1500 * Forschung_Kosten_Multiplikator,
			ingredients = ingredients,
			time = 45
		},
		order = "c-k-d-c"
  }
})
end
