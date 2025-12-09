local Loading_Speed = settings.startup["BRE-loading-speed"].value
local hit_effects = require("__base__.prototypes.entity.hit-effects")
local sounds = require("__base__.prototypes.entity.sounds")

local BRE_roboportmk1 =
  {
    type = "roboport",
    name = "bre-roboport-mk1",
    icon = "__base__/graphics/icons/roboport.png",
    flags = {"placeable-player", "player-creation"},
    fast_replaceable_group = "roboport",
    minable = {mining_time = 0.1, result = "bre-roboport-mk1"},
	next_upgrade = "bre-roboport-mk2",
    max_health = 500,
    corpse = "roboport-remnants",
    dying_explosion = "roboport-explosion",
    collision_box = {{-1.7, -1.7}, {1.7, 1.7}},
    selection_box = {{-2, -2}, {2, 2}},
    damaged_trigger_effect = hit_effects.entity(),
    resistances =
    {
      {
        type = "fire",
        percent = 60
      },
      {
        type = "impact",
        percent = 30
      }
    },
    energy_source =
    {
      type = "electric",
      usage_priority = "secondary-input",
      input_flow_limit = "5MW",
      buffer_capacity = "100MJ"
    },
    recharge_minimum = "40MJ",
    energy_usage = "50kW",
    charging_energy = "500kW",
    logistics_radius = 25,
    construction_radius = 55,
    charge_approach_distance = 5,
    robot_slots_count = 7,
    material_slots_count = 7,
    stationing_offset = {0, 0},
    charging_offsets =
    {
      {-1.5, -1}, {1.5, -1}, {1.5, 1}, {-1.5, 1}
    },
    base =
    {
      layers =
      {
        {
          filename = "__base__/graphics/entity/roboport/roboport-base.png",
          width = 228,
          height = 277,
          shift = util.by_pixel(2, -2.25),
          scale = 0.5
        },
        {
          filename = "__base__/graphics/entity/roboport/roboport-shadow.png",
          width = 294,
          height = 201,
          draw_as_shadow = true,
          shift = util.by_pixel(28.5, 9.25),
          scale = 0.5
        }
      }
    },
    base_patch =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-patch.png",
      priority = "medium",
      width = 138,
      height = 100,
      shift = util.by_pixel(1.5, -5),
      scale = 0.5
    },
    base_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
      priority = "medium",
      width = 83,
      height = 59,
      frame_count = 8,
      animation_speed = 0.5,
      shift = util.by_pixel(-17.75, -71.25),
      scale = 0.5
    },
    door_animation_up =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-up.png",
      priority = "medium",
      width = 97,
      height = 38,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -39.5),
      scale = 0.5
    },
    door_animation_down =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-down.png",
      priority = "medium",
      width = 97,
      height = 41,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -19.75),
      scale = 0.5
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
    impact_category = "metal",
    open_sound = {filename = "__base__/sound/open-close/roboport-open.ogg", volume = 0.5},
    close_sound = {filename = "__base__/sound/open-close/roboport-close.ogg", volume = 0.4},
    working_sound =
    {
      sound = {filename = "__base__/sound/roboport-working.ogg", volume = 0.4, audible_distance_modifier = 0.75},
      max_sounds_per_prototype = 3,
    },
    recharging_light = {intensity = 0.2, size = 3, color = {0.5, 0.5, 1}},
    request_to_open_door_timeout = 15,
    spawn_and_station_height = 0.3,
    stationing_render_layer_swap_height = 0.87,
    radar_visualisation_color = {0.059, 0.092, 0.235, 0.275},

    draw_logistic_radius_visualization = true,
    draw_construction_radius_visualization = true,

    open_door_trigger_effect = sounds.roboport_door_open,
    close_door_trigger_effect = sounds.roboport_door_close,

    circuit_connector = circuit_connector_definitions["roboport"],
    circuit_wire_max_distance = default_circuit_wire_max_distance,

    default_available_logistic_output_signal = {type = "virtual", name = "signal-X"},
    default_total_logistic_output_signal = {type = "virtual", name = "signal-Y"},
    default_available_construction_output_signal = {type = "virtual", name = "signal-Z"},
    default_total_construction_output_signal = {type = "virtual", name = "signal-T"},
    default_roboport_count_output_signal = {type = "virtual", name = "signal-R"},

    water_reflection =
    {
      pictures =
      {
        filename = "__base__/graphics/entity/roboport/roboport-reflection.png",
        priority = "extra-high",
        width = 28,
        height = 28,
        shift = util.by_pixel(0, 65),
        variation_count = 1,
        scale = 5
      },
      rotate = false,
      orientation_to_variation = false
    }
  }

local BRE_roboportmk2 = table.deepcopy(BRE_roboportmk1)
BRE_roboportmk2.name = "bre-roboport-mk2"
BRE_roboportmk2.fast_replaceable_group = "roboport"
BRE_roboportmk2.next_upgrade = "bre-roboport-mk3"
BRE_roboportmk2.logistics_radius = settings.startup["BRE-logistic-radius-mk2"].value
BRE_roboportmk2.construction_radius = settings.startup["BRE-construction-radius-mk2"].value
BRE_roboportmk2.minable = {mining_time = 0.5, result = "bre-roboport-mk2"}
BRE_roboportmk2.energy_source.input_flow_limit = 16 * Loading_Speed .. "MW"
BRE_roboportmk2.energy_source.buffer_capacity = 600 * Loading_Speed .. "MJ"
BRE_roboportmk2.recharge_minimum = "160MJ"
BRE_roboportmk2.energy_usage = "500kW"
BRE_roboportmk2.charging_energy = 1 * Loading_Speed .. "MW"
BRE_roboportmk2.robot_slots_count = 16
BRE_roboportmk2.material_slots_count = 10
BRE_roboportmk2.charging_offsets = {
{-1.5,1.5},	{-0.5,1.5},	{0.0,1.5},	{0.5,1.5},	{1.5,1.5},
{-1.5,0.5},										{1.5,0.5},
{-1.5,-0.5},									{1.5,0.0},
{-1.5,-1.0},									{1.5,-0.5},
{-1.5,-1.5},{-0.5,-1.5},{0.0,-1.5},	{0.5,-1.5},	{1.5,-1.5}
}
BRE_roboportmk2.charging_station_count_affected_by_quality = true
BRE_roboportmk2.base.layers =
  {
    {
        filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-roboport-mk2-base.png",
        width = 228,
        height = 277,
        shift = util.by_pixel(2, -2.25),
        scale = 0.5
    },
    {
		filename = "__base__/graphics/entity/roboport/roboport-shadow.png",
		width = 294,
        height = 201,
        draw_as_shadow = true,
        shift = util.by_pixel(28.5, 9.25),
        scale = 0.5
    }
  }
BRE_roboportmk2.base_patch =
    {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-roboport-mk2-base-patch.png",
      priority = "medium",
      width = 138,
      height = 100,
      shift = util.by_pixel(1.5, -5),
      scale = 0.5
    }
BRE_roboportmk2.base_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
      priority = "medium",
      width = 83,
      height = 59,
      frame_count = 8,
      animation_speed = 0.5,
      shift = util.by_pixel(-17.75, -71.25),
      scale = 0.5
    }
BRE_roboportmk2.door_animation_up =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-up.png",
      priority = "medium",
      width = 97,
      height = 38,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -39.5),
      scale = 0.5
    }
BRE_roboportmk2.door_animation_down =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-down.png",
      priority = "medium",
      width = 97,
      height = 41,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -19.75),
      scale = 0.5
    }
BRE_roboportmk2.recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      draw_as_glow = true,
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5,
    }

local BRE_roboportmk3 = table.deepcopy(BRE_roboportmk1)
BRE_roboportmk3.name = "bre-roboport-mk3"
BRE_roboportmk3.fast_replaceable_group = "roboport"
BRE_roboportmk3.logistics_radius = settings.startup["BRE-logistic-radius-mk3"].value
BRE_roboportmk3.construction_radius = settings.startup["BRE-construction-radius-mk3"].value
BRE_roboportmk3.minable = {mining_time = 1, result = "bre-roboport-mk3"}
BRE_roboportmk3.energy_source.input_flow_limit = 48 * Loading_Speed .. "MW"
BRE_roboportmk3.energy_source.buffer_capacity = 1200 * Loading_Speed .. "MJ"
BRE_roboportmk3.recharge_minimum = "240MJ"
BRE_roboportmk3.energy_usage = "1MW"
BRE_roboportmk3.charging_energy = 2 * Loading_Speed .. "MW"
BRE_roboportmk3.robot_slots_count = 24
BRE_roboportmk3.material_slots_count = 10
BRE_roboportmk3.charging_offsets = {
{-1.5,1.5},	{-1.0,1.5},	{-0.5,1.5},	{0.0,1.5},	{0.5,1.5},	{1.0,1.5},	{1.5,1.5},
{-1.5,1.0},																{1.5,1.0},
{-1.5,0.5},																{1.5,0.5},
{-1.5,-0.5},															{1.5,0.0},
{-1.5,-1.0},															{1.5,-0.5},
{-1.5,-1.5},															{1.5,-1.5},
{-1.5,-1.5},{-1.0,-1.5},{-0.5,-1.5},{0.0,-1.5},	{0.5,-1.5},	{1.0,-1.5},	{1.5,-1.5}
}
BRE_roboportmk3.base.layers =
  {
    {
		filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-roboport-mk3-base.png",
		width = 228,
        height = 277,
        shift = util.by_pixel(2, -2.25),
        scale = 0.5
    },
    {
		filename = "__base__/graphics/entity/roboport/roboport-shadow.png",
		width = 294,
        height = 201,
        draw_as_shadow = true,
        shift = util.by_pixel(28.5, 9.25),
        scale = 0.5
    }
  }
  BRE_roboportmk3.base_patch =
    {
      filename = "__Better_Robots_Extended__/graphics/entity/roboport/bre-roboport-mk3-base-patch.png",
      priority = "medium",
      width = 138,
      height = 100,
      shift = util.by_pixel(1.5, -5),
      scale = 0.5
    }
BRE_roboportmk3.base_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-base-animation.png",
      priority = "medium",
      width = 83,
      height = 59,
      frame_count = 8,
      animation_speed = 0.5,
      shift = util.by_pixel(-17.75, -71.25),
      scale = 0.5
    }
BRE_roboportmk3.door_animation_up =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-up.png",
      priority = "medium",
      width = 97,
      height = 38,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -39.5),
      scale = 0.5
    }
BRE_roboportmk3.door_animation_down =
    {
      filename = "__base__/graphics/entity/roboport/roboport-door-down.png",
      priority = "medium",
      width = 97,
      height = 41,
      frame_count = 16,
      shift = util.by_pixel(-0.25, -19.75),
      scale = 0.5
    }
BRE_roboportmk3.recharging_animation =
    {
      filename = "__base__/graphics/entity/roboport/roboport-recharging.png",
      draw_as_glow = true,
      priority = "high",
      width = 37,
      height = 35,
      frame_count = 16,
      scale = 1.5,
      animation_speed = 0.5,
    }
  

data:extend(
  {
    BRE_roboportmk1,
    BRE_roboportmk2,
    BRE_roboportmk3,
  })