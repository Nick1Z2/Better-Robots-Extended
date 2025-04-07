local electromagnetic_science_pack = nil
local metallurgic_science_pack = nil
local agricultural_science_pack = nil
local space_science_pack = nil
local Anforderung = {
F1 = {"BRE-robot-battery-7"},
F2 = {"BRE-robot-battery-10"},
F3 = {"BRE-robot-battery-13"},
}

if mods["space-age"] and settings.startup["BRE-use-Space-age"].value == true then
  agricultural_science_pack = {"agricultural-science-pack", 1}
  metallurgic_science_pack = {"metallurgic-science-pack", 1}
  electromagnetic_science_pack = {"electromagnetic-science-pack", 1}
  table.insert(Anforderung["F2"], "electromagnetic-science-pack")
  table.insert(Anforderung["F3"], "electromagnetic-science-pack")
  table.insert(Anforderung["F3"], "metallurgic-science-pack")
  table.insert(Anforderung["F3"], "agricultural-science-pack")
end

if settings.startup["BRE-use-space-science"].value == true then
  space_science_pack = {"space-science-pack", 1}
  table.insert(Anforderung["F1"], "space-science-pack")
  table.insert(Anforderung["F2"], "space-science-pack")
  table.insert(Anforderung["F3"], "space-science-pack")
end

local function copy_table(tbl)
  local new = {}
  for i, v in ipairs(tbl) do
    new[i] = {v[1], v[2]}
  end
  return new
end

local ingredients = {
	Main = {
		{"automation-science-pack", 1},
		{"logistic-science-pack", 1},
		{"chemical-science-pack", 1},
		{"production-science-pack", 1},
		{"utility-science-pack", 1}
	} 
}
ingredients.F1 = copy_table(ingredients.Main)
ingredients.F2 = copy_table(ingredients.Main)
ingredients.F3 = copy_table(ingredients.Main)

if space_science_pack then table.insert(ingredients["F1"], space_science_pack) end
if space_science_pack then table.insert(ingredients["F2"], space_science_pack) end
if space_science_pack then table.insert(ingredients["F3"], space_science_pack) end
if agricultural_science_pack then table.insert(ingredients["F3"], agricultural_science_pack) end
if metallurgic_science_pack then table.insert(ingredients["F3"], metallurgic_science_pack) end
if electromagnetic_science_pack then table.insert(ingredients["F2"], electromagnetic_science_pack) end
if electromagnetic_science_pack then table.insert(ingredients["F3"], electromagnetic_science_pack) end

local kosten_multiplikator = settings.startup["BRE-Forschung-Kosten-Multiplikator"].value
local Kosten_formula = "200 * L * " .. kosten_multiplikator

data:extend
({
  {
    type = "technology",
    name = "BRE-robot-battery-1",
    icon = "__Better_Robots_Extended__/graphics/Forschung/worker-robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.2
      }
    },
    prerequisites = {"robotics"},
    unit =
    {
      count_formula = Kosten_formula,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
      },
      time = 30
    },
    upgrade = true,
    max_level = 3,
    order = "c-k-h-e"
  },
  {
    type = "technology",
    name = "BRE-robot-battery-4",
    icon = "__Better_Robots_Extended__/graphics/Forschung/worker-robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.2
      }
    },
    prerequisites = {"BRE-robot-battery-1"},
    unit =
    {
      count_formula = Kosten_formula,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
      },
      time = 45
    },
    upgrade = true,
    max_level = 6,
    order = "c-k-h-e"
  },
  {
    type = "technology",
    name = "BRE-robot-battery-7",
    icon = "__Better_Robots_Extended__/graphics/Forschung/worker-robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.2
      }
    },
    prerequisites = {"BRE-robot-battery-4"},
    unit =
    {
      count_formula = Kosten_formula,
      ingredients =
      {
        {"automation-science-pack", 1},
        {"logistic-science-pack", 1},
        {"chemical-science-pack", 1},
        {"production-science-pack", 1},
        {"utility-science-pack", 1},
      },
      time = 60
    },
    upgrade = true,
    max_level = 9,
    order = "c-k-h-e"
  },
  {
    type = "technology",
    name = "BRE-robot-battery-10",
    icon = "__Better_Robots_Extended__/graphics/Forschung/worker-robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.2
      }
    },
    prerequisites = Anforderung.F1,
    unit =
    {
      count_formula = Kosten_formula,
      ingredients = ingredients.F1,
      time = 60
    },
    upgrade = true,
    max_level = 12,
    order = "c-k-h-e"
  },
  {
    type = "technology",
    name = "BRE-robot-battery-13",
    icon = "__Better_Robots_Extended__/graphics/Forschung/worker-robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.2
      }
    },
    prerequisites = Anforderung.F2,
    unit =
    {
      count_formula = Kosten_formula,
      ingredients = ingredients.F2,
      time = 60
    },
    upgrade = true,
    max_level = 15,
    order = "c-k-h-e"
  },
  {
    type = "technology",
    name = "BRE-robot-battery-16",
    icon = "__Better_Robots_Extended__/graphics/Forschung/worker-robot-battery.png",
    icon_size = 128,
    effects =
    {
      {
        type = "worker-robot-battery",
        modifier = 0.2
      }
    },
    prerequisites = Anforderung.F3,
    unit =
    {
      count_formula = Kosten_formula,
      ingredients = ingredients.F3,
      time = 60
    },
    upgrade = true,
    max_level = 18,
    order = "c-k-h-e"
  },
})