-- Better Robots Extended | Copyright (c) 2025 Nick1Z2 | License: GPL-3.0
local Loading_Speed = settings.startup["BRE-loading-speed"].value
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local BRE_robo_erweiterung_MK1 =
  {
    type = "roboport",
    name = "BRE-robo-erweiterung-mk1",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-robo-erweiterung-mk1.png",
    flags = { "placeable-player", "player-creation" },
    minable = { mining_time = 0.5, result = "BRE-robo-erweiterung-mk1" },
	next_upgrade = "BRE-robo-erweiterung-mk2",
    fast_replaceable_group = "bre-robo-roboport",
    max_health = 500,
    corpse = "small-remnants",
    collision_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    drawing_box_vertical_extension = 1.4,
    dying_explosion = "medium-explosion",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "1MW",
      buffer_capacity = "10MJ",
    },
    recharge_minimum = "5MJ",
    energy_usage = "50kW",
    charging_energy = "500kW",
    logistics_radius = 30,
    construction_radius = 55,
    charge_approach_distance = 5,
    robot_slots_count = 0,
    material_slots_count = 0,
    base = {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-robo-erweiterung-mk1.png",
      width = 136,
      height = 132,
      shift = { 1, -0.75 },
    },
    base_animation = {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/blank.png",
      width = 1,
      height = 1,
    },
    base_patch = {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/blank.png",
      width = 1,
      height = 1,
    },
    door_animation_up = {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/blank.png",
      width = 1,
      height = 1,
      frame_count = 1,
    },
    door_animation_down = {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/blank.png",
      width = 1,
      height = 1,
      frame_count = 1,
    },
    recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      draw_as_glow = true,
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5,
    },
    recharging_light = { intensity = 0.4, size = 5 },
    request_to_open_door_timeout = 15,
    spawn_and_station_height = 1.75,
    impact_category = "metal",
    working_sound = {
      sound = { filename = "__base__/sound/roboport-working.ogg", volume = 0.4 },
      max_sounds_per_prototype = 3,
    },
	
	circuit_connector = circuit_connector_definitions["roboport"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
    default_roboport_count_output_signal = {type = "virtual", name = "signal-R"}
  }

local BRE_robo_erweiterung_MK2 = table.deepcopy(BRE_robo_erweiterung_MK1)
BRE_robo_erweiterung_MK2.name = "BRE-robo-erweiterung-mk2"
BRE_robo_erweiterung_MK2.icon = "__Better_Robots_Extended__/graphics/icons/bre-robo-erweiterung-mk2.png"
BRE_robo_erweiterung_MK2.fast_replaceable_group = "bre-robo-roboport"
BRE_robo_erweiterung_MK2.next_upgrade = "BRE-robo-erweiterung-mk3"
BRE_robo_erweiterung_MK2.logistics_radius = 50 + settings.startup["BRE-logistic-radius-mk2"].value
BRE_robo_erweiterung_MK2.construction_radius = 100 + settings.startup["BRE-construction-radius-mk2"].value
BRE_robo_erweiterung_MK2.minable = {mining_time = 0.5, result = "BRE-robo-erweiterung-mk2"}
BRE_robo_erweiterung_MK2.energy_source.input_flow_limit = "2MW"
BRE_robo_erweiterung_MK2.energy_source.buffer_capacity = "20MJ"
BRE_robo_erweiterung_MK2.recharge_minimum = "10MJ"
BRE_robo_erweiterung_MK2.energy_usage = "100kW"
BRE_robo_erweiterung_MK2.charging_energy = "1000kW"
BRE_robo_erweiterung_MK2.base =
  {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-robo-erweiterung-mk2.png",
      width = 136,
      height = 132,
      shift = { 1, -0.75 },
  }

local BRE_robo_erweiterung_MK3 = table.deepcopy(BRE_robo_erweiterung_MK1)
BRE_robo_erweiterung_MK3.name = "BRE-robo-erweiterung-mk3"
BRE_robo_erweiterung_MK3.icon = "__Better_Robots_Extended__/graphics/icons/bre-robo-erweiterung-mk3.png"
BRE_robo_erweiterung_MK3.fast_replaceable_group = "bre-robo-roboport"
BRE_robo_erweiterung_MK3.next_upgrade = nil
BRE_robo_erweiterung_MK3.logistics_radius = 100 + settings.startup["BRE-logistic-radius-mk3"].value
BRE_robo_erweiterung_MK3.construction_radius = 200 + settings.startup["BRE-construction-radius-mk3"].value
BRE_robo_erweiterung_MK3.minable = {mining_time = 1, result = "BRE-robo-erweiterung-mk3"}
BRE_robo_erweiterung_MK3.energy_source.input_flow_limit = "3MW"
BRE_robo_erweiterung_MK3.energy_source.buffer_capacity = "30MJ"
BRE_robo_erweiterung_MK3.recharge_minimum = "15MJ"
BRE_robo_erweiterung_MK3.energy_usage = "200kW"
BRE_robo_erweiterung_MK3.charging_energy = "1500kW"
BRE_robo_erweiterung_MK3.base =
  {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-robo-erweiterung-mk3.png",
      width = 136,
      height = 132,
      shift = { 1, -0.75 },
  }
  

data:extend(
  {
    BRE_robo_erweiterung_MK1,
    BRE_robo_erweiterung_MK2,
    BRE_robo_erweiterung_MK3,
  })