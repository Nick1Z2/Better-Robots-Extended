if settings.startup["BRE-disable-bobs-bots"].value then

    local recipes = {
        "bob-logistic-robot-2", "bob-logistic-robot-3", "bob-logistic-robot-4", "bob-logistic-robot-5",
        "bob-construction-robot-2", "bob-construction-robot-3", "bob-construction-robot-4", "bob-construction-robot-5",
        "bob-roboport-2", "bob-roboport-3", "bob-roboport-4"
    }
    
    local technologies = { "bob-infinite-worker-robots-storage-4" }

    for _, recipe in pairs(recipes) do
        if data.raw.recipe[recipe] then
            data.raw.recipe[recipe].enabled = false
            data.raw.recipe[recipe].hidden = true
        end
    end

    for _, tech in pairs(technologies) do
        if data.raw.technology[tech] then
            data.raw.technology[tech].enabled = false
            data.raw.technology[tech].hidden = true
        end
    end
end

if settings.startup["BRE-erzwinge-MK1-Bots"].value then
data.raw.item["logistic-robot"].order = "a[robot]-a[logistic-robot]"
data.raw.item["logistic-robot"].subgroup = "logistic-network"
data.raw.item["logistic-robot"].icon = "__base__/graphics/icons/logistic-robot.png"
data.raw.item["logistic-robot"].icon_size = 64

data.raw.item["construction-robot"].order = "ab[robot]-b[construction-robot]"
data.raw.item["construction-robot"].subgroup = "logistic-network"
data.raw.item["construction-robot"].icon = "__base__/graphics/icons/construction-robot.png"
data.raw.item["construction-robot"].icon_size = 64

data.raw.item["roboport"].order = "c[signal]-a[roboport]"
data.raw.item["roboport"].subgroup = "logistic-network"
data.raw.item["roboport"].icon = "__base__/graphics/icons/roboport.png"
data.raw.item["roboport"].icon_size = 64
end