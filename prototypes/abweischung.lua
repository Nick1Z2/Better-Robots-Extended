local state = require("__Better_Robots_Extended__/scripts/state")

local vanilla_logistic_ingredients = {
    {"flying-robot-frame", 1},
    {"advanced-circuit", 2}
}
local vanilla_construction_ingredients = {
    {"flying-robot-frame", 1},
    {"electronic-circuit", 2}
}
local function recipe_changed(recipe_name, vanilla)
    local r = data.raw.recipe[recipe_name]
    if not r then 
        return true -- Rezept existiert nicht → wurde verändert
    end

    -- Zutaten holen (normal/expensive oder einfachen ingredients)
    local ingredients = r.ingredients
        or (r.normal and r.normal.ingredients)
        or nil

    if not ingredients then
        return true
    end

    -- Prüfen: Anzahl gleich?
    if #ingredients ~= #vanilla then
        return true
    end

    -- Prüfen: Alle Vanilla-Zutaten vorhanden?
    for _, v in pairs(vanilla) do
        local found = false
        for _, ing in pairs(ingredients) do
            local name = ing.name or ing[1]
            local amount = ing.amount or ing[2]

            if name == v[1] and amount == v[2] then
                found = true
                break
            end
        end
        if not found then
            return true
        end
    end

    return false -- Alles gleich → Rezept ist Vanilla
end

state.logistic_robot_is_modified =
    recipe_changed("logistic-robot", vanilla_logistic_ingredients)

state.construction_robot_is_modified =
    recipe_changed("construction-robot", vanilla_construction_ingredients)

local load_mk1 = false

if state.logistic_robot_is_modified then
    log("BRE: logistic-robot recipe modified!")
	load_mk1 = true
	table.insert(data.raw["technology"]["logistic-robotics"].effects, {
	type = "unlock-recipe",
	recipe = "BRE-logistic-robotics-mk1"
	})
	table.insert(data.raw["technology"]["BRE-logistic-robotics-2"].effects, {
	type = "unlock-recipe",
	recipe = "BRE-logistic-robotics-mk2_2"
	})
end

if state.construction_robot_is_modified then
    log("BRE: construction-robot recipe modified!")
	load_mk1 = true
	table.insert(data.raw["technology"]["construction-robotics"].effects, {
	type = "unlock-recipe",
	recipe = "BRE-construction-robotics-mk1"
	})
	table.insert(data.raw["technology"]["BRE-construction-robotics-2"].effects, {
	type = "unlock-recipe",
	recipe = "BRE-construction-robotics-mk2_2"
	})
end

if load_mk1 then
    require("recipe.BRE-abweischung")
end