local Forschung_Kosten_Multiplikator = settings.startup["BRE-Forschung-Kosten-Multiplikator"].value

local space_science_pack = nil
local additional_prerequisites = {"BRE-construction-robotics-3"}
if settings.startup["BRE-use-space-science"].value == true then
  space_science_pack = {"space-science-pack", 1}
  table.insert(additional_prerequisites, "space-science-pack")
end

local max_tier = settings.startup["BRE_Tier-Stufe"].value
local technologies = {}

local effects1 = {
    {
        type = "unlock-recipe",
        recipe = "BRE-construction-robotics-mk2"
    },
    {
        type = "unlock-recipe",
        recipe = "bre-roboport-mk2"
    }
}

if mods["boblogistics"] and settings.startup["BRE-erzwinge-MK1-Bots"].value then
    table.insert(effects1, {
        type = "unlock-recipe",
        recipe = "BRE-construction-robotics"
    })
    table.insert(effects1, {
        type = "unlock-recipe",
        recipe = "BRE-roboport"
    })
end

table.insert(technologies, {
		type = "technology",
		name = "BRE-construction-robotics-2",
		localised_description = { "technology-description.BRE-construction-robotics-mk2" },
		icon = "__base__/graphics/technology/construction-robotics.png",
		icon_size = 256,
		icon_mipmaps = 4,
		effects = effects1,
		prerequisites = {"construction-robotics","battery-equipment"},
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
		order = "c-k-d-a"
	})

if max_tier == "MK3" or max_tier == "MK4" or max_tier == "MK5" then
  table.insert(technologies, {
		type = "technology",
		name = "BRE-construction-robotics-3",
		localised_description = { "technology-description.BRE-construction-robotics-mk3" },
		icon = "__base__/graphics/technology/construction-robotics.png",
		icon_size = 256,
		icon_mipmaps = 4,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "BRE-construction-robotics-mk3"
			}
		},
		prerequisites = {"BRE-construction-robotics-2"},
		unit =
		{
			count = 1000 * Forschung_Kosten_Multiplikator,
			ingredients =
			{
				{"automation-science-pack", 1},
				{"logistic-science-pack", 1},
				{"chemical-science-pack", 1}
			},
			time = 45
		},
		order = "c-k-d-b"
    })
end

local ingredients_mk4 = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"production-science-pack", 1},
  {"utility-science-pack", 1}
}

if settings.startup["BRE-use-space-science"].value == true then
  table.insert(ingredients_mk4, {"space-science-pack", 1})
end

if max_tier == "MK4" or max_tier == "MK5" then
  local effects = {
    {
      type = "unlock-recipe",
      recipe = "BRE-construction-robotics-mk4"
    }
  }

  if settings.startup["BRE-Roboport-MK3"].value then
    table.insert(effects, {
      type = "unlock-recipe",
      recipe = "bre-roboport-mk3"
    })

  end
  table.insert(technologies, {
		type = "technology",
		name = "BRE-construction-robotics-4",
		localised_description = { "technology-description.BRE-construction-robotics-mk4" },
		icon = "__base__/graphics/technology/construction-robotics.png",
		icon_size = 256,
		icon_mipmaps = 4,
		effects = effects,
		prerequisites = additional_prerequisites,
		unit =
		{
			count = 1500 * Forschung_Kosten_Multiplikator,
			ingredients = ingredients_mk4,
			time = 45
		},
		order = "c-k-d-c"
    })
end

local ingredients_mk5 = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"production-science-pack", 1},
  {"utility-science-pack", 1}
}

if settings.startup["BRE-use-space-science"].value == true then
  table.insert(ingredients_mk5, {"space-science-pack", 1})
end

if max_tier == "MK5" then
  table.insert(technologies, {
		type = "technology",
		name = "BRE-construction-robotics-5",
		localised_description = { "technology-description.BRE-construction-robotics-mk5" },
		icon = "__base__/graphics/technology/construction-robotics.png",
		icon_size = 256,
		icon_mipmaps = 4,
		effects =
		{
			{
				type = "unlock-recipe",
				recipe = "BRE-construction-robotics-mk5"
			}
		},
		prerequisites = {"BRE-construction-robotics-4", unpack(additional_prerequisites)},
		unit =
		{
			count = 2000 * Forschung_Kosten_Multiplikator,
			ingredients = ingredients_mk5,
			time = 60
		},
		order = "c-k-d-d"
    })
end

data:extend(technologies)