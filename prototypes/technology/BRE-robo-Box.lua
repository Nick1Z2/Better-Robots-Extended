-- Better Robots Extended | Copyright (c) 2025 Nick1Z2 | License: GPL-3.0
local Forschung_Kosten_Multiplikator = settings.startup["BRE-Forschung-Kosten-Multiplikator"].value
local technologies = {}
local max_tier = settings.startup["BRE_Tier-Stufe-Extra"].value

local prerequisites_mk2 = {"BRE-robo-box-mk1"}
local prerequisites_mk3 = {"BRE-robo-box-mk2"}

local ingredients_mk2 = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"production-science-pack", 1},
  {"utility-science-pack", 1}
}
local ingredients_mk3 = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"production-science-pack", 1},
  {"utility-science-pack", 1}
}

if settings.startup["BRE-use-space-science"].value == true then
  table.insert(ingredients_mk2, {"space-science-pack", 1})
  table.insert(prerequisites_mk2, "space-science-pack")
  table.insert(ingredients_mk3, {"space-science-pack", 1})
  table.insert(prerequisites_mk3, "space-science-pack")
end

if mods["space-age"] and settings.startup["BRE-use-Space-age"].value == true then
  table.insert(ingredients_mk3, {"electromagnetic-science-pack", 1})
  table.insert(prerequisites_mk3, "electromagnetic-science-pack")
end


if max_tier == "MK1" or max_tier == "MK2" or max_tier == "MK3" then
  table.insert(technologies, {
		type = "technology",
		name = "BRE-robo-box-mk1",
		localised_description = { "technology-description.BRE-robo-box-mk1" },
		icon = "__Better_Robots_Extended__/graphics/Forschung/bre-robo-box-mk1.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "BRE-robo-box-mk1"
			}
		},
		prerequisites = {"logistic-robotics", "construction-robotics"},
		unit =
		{
			count = 500 * Forschung_Kosten_Multiplikator,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1}
			},
			time = 45
		},
		order = "c-k-g-a"
    })
end
  
if max_tier == "MK2" or max_tier == "MK3" then
  table.insert(technologies, {
		type = "technology",
		name = "BRE-robo-box-mk2",
		localised_description = { "technology-description.BRE-robo-box-mk2" },
		icon = "__Better_Robots_Extended__/graphics/Forschung/bre-robo-box-mk2.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "BRE-robo-box-mk2"
			}
		},
		prerequisites = prerequisites_mk2,
		unit =
		{
			count = 1500 * Forschung_Kosten_Multiplikator,
			ingredients = ingredients_mk2,
			time = 45
		},
		order = "c-k-g-b"
	})
end

if max_tier == "MK3" then
  table.insert(technologies, {
		type = "technology",
		name = "BRE-robo-box-mk3",
		localised_description = { "technology-description.BRE-robo-box-mk3" },
		icon = "__Better_Robots_Extended__/graphics/Forschung/bre-robo-box-mk3.png",
		icon_size = 256,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "BRE-robo-box-mk3"
			}
		},
		prerequisites = prerequisites_mk3,
		unit =
		{
			count = 2500 * Forschung_Kosten_Multiplikator,
			ingredients = ingredients_mk3,
			time = 45
		},
		order = "c-k-g-c"
	})
end
  
data:extend(technologies)