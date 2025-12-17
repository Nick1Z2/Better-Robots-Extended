-- Better Robots Extended | Copyright (c) 2025 Nick1Z2 | License: GPL-3.0
local Loading_Speed = settings.startup["BRE-loading-speed"].value
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local BRE_robo_lader_MK1 =
  {
    type = "roboport",
    name = "BRE-robo-lader-mk1",
    icon = "__Better_Robots_Extended__/graphics/icons/bre-robo-lader-mk1.png",
    flags = { "placeable-player", "player-creation" },
    minable = { mining_time = 0.5, result = "BRE-robo-lader-mk1" },
	next_upgrade = "BRE-robo-lader-mk2",
    fast_replaceable_group = "bre-robo-lader-roboport",
    max_health = 500,
    corpse = "small-remnants",
    collision_box = { { -0.7, -0.7 }, { 0.7, 0.7 } },
    selection_box = { { -1, -1 }, { 1, 1 } },
    drawing_box_vertical_extension = 1.0,
    dying_explosion = "medium-explosion",
    energy_source = {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = 8 * Loading_Speed .. "MW",
      buffer_capacity = 100 * Loading_Speed .. "MJ",
    },
    recharge_minimum = "5MJ",
    energy_usage = "500kW",
    charging_energy = 1 * Loading_Speed .. "MW",
    logistics_radius = 1,
    construction_radius = 1,
    charge_approach_distance = 5,
    robot_slots_count = 0,
    material_slots_count = 0,
    charging_offsets =
    {
        {-0.5, -0.5}, { 0.5, -0.5}, {-0.5,  0.0}, { 0.5,  0.0}, {-0.5,  0.5}, { 0.5,  0.5}, { 0.0, -0.5}, { 0.0,  0.5},
    },
    base = {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-robo-lader-mk1.png",
      width = 256,
      height = 256,
	  scale = 0.25,
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
    request_to_open_door_timeout = 15,
    spawn_and_station_height = 1.75,
    impact_category = "metal",
    working_sound = {
      sound = { filename = "__base__/sound/roboport-working.ogg", volume = 0.4 },
      max_sounds_per_prototype = 3,
    },
	recharging_light = {intensity = 0.2, size = 3, color = {0.5, 0.5, 1}},
	
	circuit_connector = circuit_connector_definitions["roboport"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
    default_roboport_count_output_signal = {type = "virtual", name = "signal-R"}
  }

local BRE_robo_lader_MK2 = table.deepcopy(BRE_robo_lader_MK1)
BRE_robo_lader_MK2.name = "BRE-robo-lader-mk2"
BRE_robo_lader_MK2.icon = "__Better_Robots_Extended__/graphics/icons/bre-robo-lader-mk2.png"
BRE_robo_lader_MK2.fast_replaceable_group = "bre-robo-lader-roboport"
BRE_robo_lader_MK2.next_upgrade = "BRE-robo-lader-mk3"
BRE_robo_lader_MK2.minable = {mining_time = 0.5, result = "BRE-robo-lader-mk2"}
BRE_robo_lader_MK2.energy_source.input_flow_limit = 20 * Loading_Speed .. "MW"
BRE_robo_lader_MK2.energy_source.buffer_capacity = 1000 * Loading_Speed .. "MJ"
BRE_robo_lader_MK2.recharge_minimum = "100MJ"
BRE_robo_lader_MK2.energy_usage = "1MW"
BRE_robo_lader_MK2.charging_energy = 2.5 * Loading_Speed .. "MW"
BRE_robo_lader_MK2.base =
  {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-robo-lader-mk2.png",
      width = 256,
      height = 256,
	  scale = 0.25,
      shift = { 0, 0 },
  }

local BRE_robo_lader_MK3 = table.deepcopy(BRE_robo_lader_MK1)
BRE_robo_lader_MK3.name = "BRE-robo-lader-mk3"
BRE_robo_lader_MK3.icon = "__Better_Robots_Extended__/graphics/icons/bre-robo-lader-mk3.png"
BRE_robo_lader_MK3.fast_replaceable_group = "bre-robo-lader-roboport"
BRE_robo_lader_MK3.next_upgrade = nil
BRE_robo_lader_MK3.minable = {mining_time = 1, result = "BRE-robo-lader-mk3"}
BRE_robo_lader_MK3.energy_source.input_flow_limit = 80 * Loading_Speed .. "MW"
BRE_robo_lader_MK3.energy_source.buffer_capacity = 2000 * Loading_Speed .. "MJ"
BRE_robo_lader_MK3.recharge_minimum = "200MJ"
BRE_robo_lader_MK3.energy_usage = "2MW"
BRE_robo_lader_MK3.charging_energy = 5 * Loading_Speed .. "MW"
BRE_robo_lader_MK3.charging_offsets =
    {
		{-0.5,  0.1}, {-0.5, -0.1},
		{ 0.5,  0.1}, { 0.5, -0.1},
		{ 0.1, -0.5}, {-0.1, -0.5},
		{ 0.1,  0.5}, {-0.1,  0.5},
		{-0.35, -0.35}, {-0.25, -0.45},
		{ 0.35, -0.35}, { 0.45, -0.25},
		{ 0.35,  0.35}, { 0.25,  0.45},
		{-0.35,  0.35}, {-0.45,  0.25},
    }
BRE_robo_lader_MK3.base =
  {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-robo-lader-mk3.png",
      width = 256,
      height = 256,
	  scale = 0.25,
      shift = { 0, 0 },
  }
  

data:extend(
  {
    BRE_robo_lader_MK1,
    BRE_robo_lader_MK2,
    BRE_robo_lader_MK3,
  })