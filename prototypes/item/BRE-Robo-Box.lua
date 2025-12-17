-- Better Robots Extended | Copyright (c) 2025 Nick1Z2 | License: GPL-3.0
local item_sounds = require("__base__.prototypes.item_sounds")
data:extend({
  {
    type = "item",
    name = "BRE-robo-box-mk1",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-robo-box-mk1.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "c[signal]-ag[roboport]",
    inventory_move_sound = item_sounds.roboport_inventory_move,
    pick_sound = item_sounds.roboport_inventory_pickup,
    drop_sound = item_sounds.roboport_inventory_move,
    place_result = "BRE-robo-box-mk1",
    stack_size = 10,
    weight = 100*kg,
  },
  {
    type = "item",
    name = "BRE-robo-box-mk2",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-robo-box-mk2.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "c[signal]-ah[roboport]",
    inventory_move_sound = item_sounds.roboport_inventory_move,
    pick_sound = item_sounds.roboport_inventory_pickup,
    drop_sound = item_sounds.roboport_inventory_move,
    place_result = "BRE-robo-box-mk2",
    stack_size = 10,
    weight = 100*kg,
  },
  {
    type = "item",
    name = "BRE-robo-box-mk3",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-robo-box-mk3.png",
    icon_size = 64, icon_mipmaps = 4,
    subgroup = "logistic-network",
    order = "c[signal]-ai[roboport]",
    inventory_move_sound = item_sounds.roboport_inventory_move,
    pick_sound = item_sounds.roboport_inventory_pickup,
    drop_sound = item_sounds.roboport_inventory_move,
    place_result = "BRE-robo-box-mk3",
    stack_size = 10,
    weight = 100*kg,
  }
})

