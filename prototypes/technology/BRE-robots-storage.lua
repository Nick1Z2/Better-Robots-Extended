local electromagnetic_science_pack = nil
local metallurgic_science_pack = nil
local agricultural_science_pack = nil
local additional_prerequisites = {"worker-robots-storage-3"}  -- Grundvoraussetzung
local space_science_pack = nil

if mods["space-age"] and settings.startup["BRE-use-Space-age"].value == true then
  agricultural_science_pack = {"agricultural-science-pack", 1}
  metallurgic_science_pack = {"metallurgic-science-pack", 1}
  electromagnetic_science_pack = {"electromagnetic-science-pack", 1}
  table.insert(additional_prerequisites, "electromagnetic-science-pack")
  table.insert(additional_prerequisites, "metallurgic-science-pack")
  table.insert(additional_prerequisites, "agricultural-science-pack")
end

if settings.startup["BRE-use-space-science"].value == true then
  space_science_pack = {"space-science-pack", 1}
  table.insert(additional_prerequisites, "space-science-pack")
end

local ingredients = {
  {"automation-science-pack", 1},
  {"logistic-science-pack", 1},
  {"chemical-science-pack", 1},
  {"production-science-pack", 1},
  {"utility-science-pack", 1}
}
if space_science_pack then table.insert(ingredients, space_science_pack) end
if agricultural_science_pack then table.insert(ingredients, agricultural_science_pack) end
if metallurgic_science_pack then table.insert(ingredients, metallurgic_science_pack) end
if electromagnetic_science_pack then table.insert(ingredients, electromagnetic_science_pack) end

local kosten_multiplikator = settings.startup["BRE-Forschung-Kosten-Multiplikator"].value
local Kosten_formula = "(L - 3) * 10000 * " .. kosten_multiplikator

data:extend({
  {
    type = "technology",
    name = "BRE-worker-robots-storage-4",
    icon_size = 256,
    icon_mipmaps = 4, 
    icons = util.technology_icon_constant_capacity("__base__/graphics/technology/worker-robots-storage.png"),
    prerequisites = additional_prerequisites,
	effects =
    {
		{
			type = "worker-robot-storage",
			modifier = 1
		}
    },    
    unit =
    {
		count_formula = Kosten_formula,
		ingredients = ingredients,
		time = 60
    },
    max_level = "infinite",
    upgrade = true,
    order = "c-k-g-d"
  }
})