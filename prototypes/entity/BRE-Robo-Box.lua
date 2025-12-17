-- Better Robots Extended | Copyright (c) 2025 Nick1Z2 | License: GPL-3.0
local Loading_Speed = settings.startup["BRE-loading-speed"].value
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local BRE_robo_box_mk1 =
  {
    type = "roboport",
    name = "BRE-robo-box-mk1",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-robo-box-mk1.png",
    flags = { "placeable-player", "player-creation" },
    minable = { mining_time = 0.5, result = "BRE-robo-box-mk1" },
	next_upgrade = "BRE-robo-box-mk2",
    fast_replaceable_group = "bre-robo-box-roboport",
    max_health = 500,
    corpse = "small-remnants",
    collision_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    drawing_box_vertical_extension = 1.0,
    dying_explosion = "medium-explosion",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = 1 * Loading_Speed .. "MW",
      buffer_capacity = 100 * Loading_Speed .. "MJ",
    },
    recharge_minimum = "5MJ",
    energy_usage = "50kW",
    charging_energy = 5 * Loading_Speed .. "MW",
    logistics_radius = 1,
    construction_radius = 1,
    charge_approach_distance = 5,
    robot_slots_count = 10,
    material_slots_count = 5,
    stationing_offset = { 0, 0 },
    charging_offsets = {
      { 0, 0 },
	},
    base = {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-robo-box-mk1.png",
      width = 256,
      height = 256,
	  scale = 0.4,
      shift = { 0, 0 },
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
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-robo-box-door-up.png",
      width = 1,
      height = 1,
    },
    door_animation_down = {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-robo-box-door-down.png",
      width = 1,
      height = 1,
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
    open_sound = {filename = "__base__/sound/open-close/roboport-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/open-close/roboport-close.ogg", volume = 0.4},
    working_sound =
    {
      sound = {filename = "__base__/sound/roboport-working.ogg", volume = 0.4, audible_distance_modifier = 0.75},
      max_sounds_per_prototype = 3,
    },
	request_to_open_door_timeout = 15,
    open_door_trigger_effect = sounds.roboport_door_open,
    close_door_trigger_effect = sounds.roboport_door_close,
	
	circuit_connector = circuit_connector_definitions["roboport"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
    default_roboport_count_output_signal = {type = "virtual", name = "signal-R"}
  }

local BRE_robo_box_MK2 = table.deepcopy(BRE_robo_box_mk1)
BRE_robo_box_MK2.name = "BRE-robo-box-mk2"
BRE_robo_box_MK2.icon = "__Better_Robots_Extended__/graphics/icons/bre-robo-box-mk2.png"
BRE_robo_box_MK2.fast_replaceable_group = "bre-robo-box-roboport"
BRE_robo_box_MK2.next_upgrade = "BRE-robo-box-mk3"
BRE_robo_box_MK2.robot_slots_count = 25
BRE_robo_box_MK2.material_slots_count = 10
BRE_robo_box_MK2.minable = {mining_time = 0.5, result = "BRE-robo-box-mk2"}
BRE_robo_box_MK2.energy_source.input_flow_limit = 10 * Loading_Speed .. "MW"
BRE_robo_box_MK2.energy_source.buffer_capacity = 500 * Loading_Speed .. "MJ"
BRE_robo_box_MK2.recharge_minimum = "10MJ"
BRE_robo_box_MK2.energy_usage = "100kW"
BRE_robo_box_MK2.charging_energy = 10 * Loading_Speed .. "MW"
BRE_robo_box_MK2.base =
  {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-robo-box-mk2.png",
      width = 256,
      height = 256,
	  scale = 0.4,
      shift = { 0, 0 },
  }

local BRE_robo_box_MK3 = table.deepcopy(BRE_robo_box_mk1)
BRE_robo_box_MK3.name = "BRE-robo-box-mk3"
BRE_robo_box_MK3.icon = "__Better_Robots_Extended__/graphics/icons/bre-robo-box-mk3.png"
BRE_robo_box_MK3.fast_replaceable_group = "bre-robo-box-roboport"
BRE_robo_box_MK3.next_upgrade = nil
BRE_robo_box_MK3.robot_slots_count = 40
BRE_robo_box_MK3.material_slots_count = 20
BRE_robo_box_MK3.minable = {mining_time = 1, result = "BRE-robo-box-mk3"}
BRE_robo_box_MK3.energy_source.input_flow_limit = 15 * Loading_Speed .. "MW"
BRE_robo_box_MK3.energy_source.buffer_capacity = 1000 * Loading_Speed .. "MJ"
BRE_robo_box_MK3.recharge_minimum = "15MJ"
BRE_robo_box_MK3.energy_usage = "200kW"
BRE_robo_box_MK3.charging_energy = 15 * Loading_Speed .. "MW"
BRE_robo_box_MK3.base =
  {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-robo-box-mk3.png",
      width = 256,
      height = 256,
	  scale = 0.4,
      shift = { 0, 0 },
  }
  

data:extend(
  {
    BRE_robo_box_mk1,
    BRE_robo_box_MK2,
    BRE_robo_box_MK3,
  })